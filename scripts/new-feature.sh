#!/usr/bin/env bash
set -euo pipefail

FEATURE_ID="${1:-}"
FEATURE_TITLE="${2:-}"

usage() {
  printf "Usage: bash scripts/new-feature.sh F-XX \"Feature title\"\n"
}

slugify() {
  printf "%s" "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}

if [ -z "$FEATURE_ID" ] || [ -z "$FEATURE_TITLE" ]; then
  usage
  exit 1
fi

if [ ! -d "features/_template" ]; then
  printf "[FAIL] Missing features/_template\n"
  exit 1
fi

SLUG="$(slugify "$FEATURE_TITLE")"
TARGET="features/${FEATURE_ID}-${SLUG}"

if [ -e "$TARGET" ]; then
  printf "[FAIL] Target already exists: %s\n" "$TARGET"
  exit 1
fi

mkdir -p "$TARGET"
cp features/_template/*.md "$TARGET/"

for file in "$TARGET"/*.md; do
  sed -i.bak "s/F-XX/${FEATURE_ID}/g; s/FEATURE_NAME/${FEATURE_TITLE}/g" "$file"
  rm -f "$file.bak"
done

mkdir -p "$TARGET/evidence/screenshots"

printf "[OK] Created %s\n" "$TARGET"
printf "Next step: add the feature to features/index.json, then run /specify %s\n" "$FEATURE_ID"
