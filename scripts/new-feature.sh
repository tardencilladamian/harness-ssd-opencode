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

if [ ! -f "features/_template.md" ]; then
  printf "[FAIL] Missing features/_template.md\n"
  exit 1
fi

SLUG="$(slugify "$FEATURE_TITLE")"
FEATURE_SLUG="${FEATURE_ID}-${SLUG}"
FEATURE_FILE="features/${FEATURE_SLUG}.md"
LOG_FILE="progress/${FEATURE_SLUG}-log.md"
TODAY="$(date +%F)"

if [ -e "$FEATURE_FILE" ] || [ -e "$LOG_FILE" ]; then
  printf "[FAIL] Target already exists: %s or %s\n" "$FEATURE_FILE" "$LOG_FILE"
  exit 1
fi

cp features/_template.md "$FEATURE_FILE"
sed -i.bak "s/F-XX/${FEATURE_ID}/g; s/FEATURE_NAME/${FEATURE_TITLE}/g" "$FEATURE_FILE"
rm -f "$FEATURE_FILE.bak"

{
  printf "# Feature Log - %s %s\n\n" "$FEATURE_ID" "$FEATURE_TITLE"
  printf "## Current Status\n\npending\n\n"
  printf "## Last Updated\n\n%s\n\n" "$TODAY"
  printf "## Associated Spec\n\n\`%s\`\n\n" "$FEATURE_FILE"
  printf "## Completed Tasks\n\nNone.\n\n"
  printf "## Pending Tasks\n\n- Define tasks after specification.\n\n"
  printf "## Blockers\n\nNone.\n\n"
  printf "## Risks\n\nNone recorded.\n\n"
  printf "## Changes Made\n\nNone.\n\n"
  printf "## Tests Executed\n\nNone.\n\n"
  printf "## Verification Result\n\nPending.\n\n"
  printf "## Auto Test Result\n\nPending.\n\n"
  printf "## Completion Checker Result\n\nPending.\n\n"
  printf "## Code Refiner Result\n\nPending.\n\n"
  printf "## Review Result\n\nPending.\n\n"
  printf "## Notes To Continue\n\nAdd the feature to \`features/index.json\`, then run \`/specify %s\`.\n" "$FEATURE_ID"
} > "$LOG_FILE"

printf "[OK] Created %s\n" "$FEATURE_FILE"
printf "[OK] Created %s\n" "$LOG_FILE"
printf "Next step: add the feature to features/index.json, then run /specify %s\n" "$FEATURE_ID"
