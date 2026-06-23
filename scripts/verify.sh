#!/usr/bin/env bash
set -euo pipefail

STRICT_PLACEHOLDERS="${HARNESS_STRICT_PLACEHOLDERS:-0}"
EXIT_CODE=0

ok() {
  printf "[OK] %s\n" "$1"
}

warn() {
  printf "[WARN] %s\n" "$1"
}

fail() {
  printf "[FAIL] %s\n" "$1"
  EXIT_CODE=1
}

require_file() {
  if [ -f "$1" ]; then
    ok "Exists $1"
  else
    fail "Missing required file: $1"
  fi
}

require_dir_with_md() {
  if [ ! -d "$1" ]; then
    fail "Missing required directory: $1"
    return
  fi

  if find "$1" -maxdepth 1 -type f -name "*.md" | grep -q .; then
    ok "Directory $1 contains markdown files"
  else
    fail "Directory $1 has no markdown files"
  fi
}

echo "== Harness verification =="

echo ""
echo "== C1: Harness structure =="

require_file "AGENTS.md"
require_file "CHECKPOINTS.md"
require_file "features/index.json"
require_file "progress/current.md"
require_file "progress/history.md"
require_file "docs/index.md"
require_file "docs/workflow.md"
require_file "docs/adaptation.md"
require_file "docs/quality-gates.md"
require_file "docs/testing.md"
require_file "docs/security.md"
require_file "harness.config.example.json"
require_file "scripts/verify.sh"
require_file "scripts/new-feature.sh"
require_dir_with_md ".agents/roles"
require_dir_with_md ".opencode/agents"
require_dir_with_md ".opencode/commands"
require_dir_with_md "features/_template"
require_dir_with_md "progress/sessions"

echo ""
echo "== Template placeholder detection =="

PLACEHOLDERS=(
  "PROJECT_NAME"
  "YYYY-MM-DD"
  "Replace with"
  "ExampleEntity"
  "Placeholder"
  "User type 1"
  "Core feature area"
  "Out-of-scope item"
  "Short project description"
)

PLACEHOLDER_FOUND=0
for placeholder in "${PLACEHOLDERS[@]}"; do
  matches="$(
    grep -RIl \
      --exclude-dir=.git \
      --exclude-dir=_template \
      --exclude='*.zip' \
      --exclude='README.md' \
      --exclude='harness.config.example.json' \
      "$placeholder" docs features progress 2>/dev/null \
      | grep -v '^docs/decisions/README.md$' \
      || true
  )"
  if [ -n "$matches" ]; then
    PLACEHOLDER_FOUND=1
    warn "Unreplaced placeholder found: '$placeholder'"
    printf "%s\n" "$matches" | sed 's/^/  - /'
  fi
done

if [ "$PLACEHOLDER_FOUND" -eq 0 ]; then
  ok "No common template placeholders found"
elif [ "$STRICT_PLACEHOLDERS" = "1" ]; then
  fail "Template placeholders remain and HARNESS_STRICT_PLACEHOLDERS=1"
else
  warn "Template placeholders remain. This is allowed unless HARNESS_STRICT_PLACEHOLDERS=1"
fi

echo ""
echo "== C2: Feature state coherence =="

if command -v python3 >/dev/null 2>&1; then
  if python3 - <<'PY'
import json
import re
from pathlib import Path

root = Path(".")
index_path = root / "features" / "index.json"
current_path = root / "progress" / "current.md"

data = json.loads(index_path.read_text(encoding="utf-8"))
valid = set(data.get("rules", {}).get("valid_status", [])) or {
    "pending",
    "spec_ready",
    "approved",
    "in_progress",
    "implemented",
    "tested",
    "completion_checked",
    "code_refined",
    "reviewed",
    "done",
    "blocked",
    "cancelled",
}

features = data.get("features", [])
if not isinstance(features, list):
    raise SystemExit("[FAIL] features/index.json must contain a features array")

by_id = {}
for feature in features:
    feature_id = feature.get("id")
    if feature_id in by_id:
        raise SystemExit(f"[FAIL] Duplicate feature id: {feature_id}")
    if feature_id:
        by_id[feature_id] = feature

in_progress = [f for f in features if f.get("status") == "in_progress"]
if len(in_progress) > 1:
    raise SystemExit("[FAIL] More than one feature is in_progress")

requires_spec = {"spec_ready", "approved", "in_progress", "implemented", "tested", "completion_checked", "code_refined", "reviewed", "done"}
requires_progress = {"spec_ready", "approved", "in_progress", "implemented", "tested", "completion_checked", "code_refined", "reviewed", "done", "blocked"}
requires_review = {"reviewed", "done"}

task_pattern = re.compile(r"^- \[( |x|X)\] T\d+", re.MULTILINE)
requirement_pattern = re.compile(r"^## R\d+", re.MULTILINE)

for feature in features:
    feature_id = feature.get("id")
    slug = feature.get("slug") or feature.get("name")
    status = feature.get("status")
    sdd = bool(feature.get("sdd"))

    if not feature_id:
        raise SystemExit("[FAIL] Feature missing id")
    if not slug:
        raise SystemExit(f"[FAIL] Feature {feature_id} missing slug or name")
    if status not in valid:
        raise SystemExit(f"[FAIL] Invalid status for {feature_id}: {status}")

    depends_on = feature.get("depends_on", [])
    if depends_on is None:
        depends_on = []
    if not isinstance(depends_on, list):
        raise SystemExit(f"[FAIL] {feature_id} depends_on must be an array")
    for dependency_id in depends_on:
        dependency = by_id.get(dependency_id)
        if dependency is None:
            raise SystemExit(f"[FAIL] {feature_id} depends on unknown feature {dependency_id}")
        if status in {"approved", "in_progress", "implemented", "tested", "completion_checked", "code_refined", "reviewed", "done"} and dependency.get("status") != "done":
            raise SystemExit(f"[FAIL] {feature_id} depends on {dependency_id}, but dependency status is {dependency.get('status')}")

    slice_data = feature.get("slice", {})
    if slice_data and not isinstance(slice_data, dict):
        raise SystemExit(f"[FAIL] {feature_id} slice must be an object")

    feature_dir = root / "features" / f"{feature_id}-{slug}"
    progress_file = root / "progress" / "features" / f"{feature_id}-{slug}.md"

    if sdd and status in requires_spec:
        required = ["requirements.md", "design.md", "tasks.md"]
        missing = [name for name in required if not (feature_dir / name).is_file()]
        if missing:
            raise SystemExit(f"[FAIL] Missing spec files for {feature_id}: {missing}")

        requirements = (feature_dir / "requirements.md").read_text(encoding="utf-8")
        tasks = (feature_dir / "tasks.md").read_text(encoding="utf-8")
        if not requirement_pattern.search(requirements):
            raise SystemExit(f"[FAIL] {feature_id} requirements.md has no R<n> headings")
        if not task_pattern.search(tasks):
            raise SystemExit(f"[FAIL] {feature_id} tasks.md has no T<n> checklist items")

    if status in requires_progress and not progress_file.is_file():
        raise SystemExit(f"[FAIL] Missing progress file for {feature_id}: {progress_file}")

    if status in requires_review:
        review_file = feature_dir / "review.md"
        if not review_file.is_file():
            raise SystemExit(f"[FAIL] Missing review.md for {feature_id} in {status}")

if in_progress:
    current = current_path.read_text(encoding="utf-8")
    active = in_progress[0]
    expected_tokens = [active.get("id", ""), active.get("slug", "")]
    if not any(token and token in current for token in expected_tokens):
        raise SystemExit("[FAIL] progress/current.md does not mention the in_progress feature")

print("[OK] features/index.json and progress state are coherent")
PY
  then
    ok "Feature state coherence passed"
  else
    EXIT_CODE=1
  fi
else
  warn "python3 not found; skipping JSON and feature coherence validation"
fi

echo ""
echo "== C3: Adaptive config =="

if [ -f "harness.config.json" ]; then
  if command -v python3 >/dev/null 2>&1; then
    if python3 - <<'PY'
import json
from pathlib import Path

path = Path("harness.config.json")
data = json.loads(path.read_text(encoding="utf-8"))

for key in ["project", "models", "stack", "verification", "quality_gates"]:
    if key not in data:
        raise SystemExit(f"[FAIL] harness.config.json missing key: {key}")

print("[OK] harness.config.json has required top-level keys")
PY
    then
      ok "Adaptive config validation passed"
    else
      EXIT_CODE=1
    fi
  else
    warn "python3 not found; skipping harness.config.json validation"
  fi
else
  warn "harness.config.json not found; copy harness.config.example.json during project setup"
fi

echo ""
echo "== Project-specific verification =="

if [ -f "scripts/verify-project.sh" ]; then
  if bash scripts/verify-project.sh; then
    ok "Project-specific verification passed"
  else
    fail "Project-specific verification failed"
  fi
else
  warn "scripts/verify-project.sh not found; skipping project-specific checks"
  warn "Copy scripts/verify-project.sh.example to scripts/verify-project.sh when your project has real commands"
fi

echo ""
echo "== Summary =="

if [ "$EXIT_CODE" -eq 0 ]; then
  ok "Harness verification completed"
else
  fail "Harness verification failed"
fi

exit "$EXIT_CODE"
