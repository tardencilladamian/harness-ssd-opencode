#!/usr/bin/env bash
set -euo pipefail

echo "== Harness verification =="

if [ ! -f "AGENTS.md" ]; then
  echo "[FAIL] Missing AGENTS.md"
  exit 1
fi

if [ ! -f "features/index.json" ]; then
  echo "[FAIL] Missing features/index.json"
  exit 1
fi

if [ ! -f "progress/current.md" ]; then
  echo "[FAIL] Missing progress/current.md"
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
import json
from pathlib import Path

path = Path("features/index.json")
data = json.loads(path.read_text(encoding="utf-8"))
valid = {"pending", "spec_ready", "approved", "in_progress", "implemented", "reviewed", "done", "blocked"}
features = data.get("features", [])
in_progress = [f for f in features if f.get("status") == "in_progress"]

if len(in_progress) > 1:
    raise SystemExit("[FAIL] More than one feature is in_progress")

for feature in features:
    status = feature.get("status")
    if status not in valid:
        raise SystemExit(f"[FAIL] Invalid status for {feature.get('id')}: {status}")
    if feature.get("sdd") and status in {"spec_ready", "approved", "in_progress", "implemented", "reviewed", "done"}:
        slug = feature.get("slug") or feature.get("name")
        folder = Path("features") / f"{feature.get('id')}-{slug}" if not str(slug).startswith(str(feature.get("id"))) else Path("features") / str(slug)
        required = ["requirements.md", "design.md", "tasks.md"]
        missing = [name for name in required if not (folder / name).is_file()]
        if missing:
            raise SystemExit(f"[FAIL] Missing spec files for {feature.get('id')}: {missing}")

print("[OK] features/index.json is valid")
PY
else
  echo "[WARN] python3 not found; skipping JSON validation"
fi

echo "[INFO] Add your project-specific checks below."
echo "[INFO] Examples: npm test, pnpm test, pytest, go test ./..., composer test"

echo "[OK] Harness verification completed"

