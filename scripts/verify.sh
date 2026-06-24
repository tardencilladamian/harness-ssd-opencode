#!/usr/bin/env bash
set -euo pipefail

MODE="${1:---all}"
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

check_placeholders() {
  echo ""
  echo "== Template placeholder detection =="

  local placeholders=(
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

  local found=0
  for placeholder in "${placeholders[@]}"; do
    matches="$(
      grep -RIl \
        --exclude-dir=.git \
        --exclude='*.zip' \
        --exclude='README.md' \
        --exclude='harness.config.example.json' \
        --exclude='features/_template.md' \
        "$placeholder" CONTEXT.md docs features progress 2>/dev/null \
        || true
    )"
    if [ -n "$matches" ]; then
      found=1
      warn "Unreplaced placeholder found: '$placeholder'"
      printf "%s\n" "$matches" | sed 's/^/  - /'
    fi
  done

  if [ "$found" -eq 0 ]; then
    ok "No common template placeholders found"
  elif [ "$STRICT_PLACEHOLDERS" = "1" ]; then
    fail "Template placeholders remain and HARNESS_STRICT_PLACEHOLDERS=1"
  else
    warn "Template placeholders remain. This is allowed unless HARNESS_STRICT_PLACEHOLDERS=1"
  fi
}

verify_harness() {
  echo "== Harness verification =="

  echo ""
  echo "== C1: Harness structure =="

  require_file "AGENTS.md"
  require_file "CHECKPOINTS.md"
  require_file "CONTEXT.md"
  require_file "features/index.json"
  require_file "features/_template.md"
  require_file "progress/STATUS.md"
  require_file "docs/index.md"
  require_file "docs/workflow.md"
  require_file "docs/project.md"
  require_file "docs/domain.md"
  require_file "docs/data.md"
  require_file "docs/architecture.md"
  require_file "docs/api.md"
  require_file "docs/ui.md"
  require_file "docs/security.md"
  require_file "docs/environment.md"
  require_file "docs/testing.md"
  require_file "docs/decisions.md"
  require_file "harness.config.example.json"
  require_file "scripts/verify.sh"
  require_file "scripts/new-feature.sh"
  require_dir_with_md ".opencode/agents"
  require_dir_with_md ".opencode/commands"

  check_placeholders

  echo ""
  echo "== C2: Feature state coherence =="

  if command -v python3 >/dev/null 2>&1; then
    if python3 - <<'PY'
import json
import re
from pathlib import Path

root = Path(".")
index_path = root / "features" / "index.json"
status_path = root / "progress" / "STATUS.md"

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
requires_log = {"spec_ready", "approved", "in_progress", "implemented", "tested", "completion_checked", "code_refined", "reviewed", "done", "blocked"}
task_pattern = re.compile(r"^- \[( |x|X)\] T\d+", re.MULTILINE)
requirement_pattern = re.compile(r"^### R\d+", re.MULTILINE)

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

    default_feature_file = root / "features" / f"{feature_id}-{slug}.md"
    feature_file = root / feature.get("file", str(default_feature_file))
    default_log_file = root / "progress" / f"{feature_id}-{slug}-log.md"
    log_file = root / feature.get("log", str(default_log_file))

    if sdd and status in requires_spec:
        if not feature_file.is_file():
            raise SystemExit(f"[FAIL] Missing spec file for {feature_id}: {feature_file}")
        spec = feature_file.read_text(encoding="utf-8")
        for heading in ["## Requirements", "## Design", "## Tasks"]:
            if heading not in spec:
                raise SystemExit(f"[FAIL] {feature_id} missing section: {heading}")
        if not requirement_pattern.search(spec):
            raise SystemExit(f"[FAIL] {feature_id} has no R<n> requirement headings")
        if not task_pattern.search(spec):
            raise SystemExit(f"[FAIL] {feature_id} has no T<n> checklist items")

    if status in requires_log and not log_file.is_file():
        raise SystemExit(f"[FAIL] Missing feature log for {feature_id}: {log_file}")

if in_progress:
    current = status_path.read_text(encoding="utf-8")
    active = in_progress[0]
    expected_tokens = [active.get("id", ""), active.get("slug", "")]
    if not any(token and token in current for token in expected_tokens):
        raise SystemExit("[FAIL] progress/STATUS.md does not mention the in_progress feature")

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
}

verify_project() {
  echo "== Project-specific verification =="

  if [ -f "harness.config.json" ]; then
    ok "Found harness.config.json"
  else
    warn "harness.config.json not found; project checks are not configured yet"
  fi

  warn "Edit verify_project() in scripts/verify.sh with real stack commands for this project"
  warn "Examples: pnpm lint, pnpm test, pnpm exec playwright test --headed, pytest, go test ./..."
}

case "$MODE" in
  --harness)
    verify_harness
    ;;
  --project)
    verify_project
    ;;
  --all|"")
    verify_harness
    echo ""
    verify_project
    ;;
  *)
    fail "Unknown mode: $MODE"
    printf "Usage: bash scripts/verify.sh [--harness|--project|--all]\n"
    ;;
esac

echo ""
echo "== Summary =="

if [ "$EXIT_CODE" -eq 0 ]; then
  ok "Verification completed"
else
  fail "Verification failed"
fi

exit "$EXIT_CODE"
