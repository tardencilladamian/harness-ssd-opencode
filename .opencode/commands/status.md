---
description: Report current Harness SDD status
agent: leader
---

# Report the current Harness SDD status

Read:

- `progress/current.md`
- `features/index.json`
- `harness.config.json` when it exists
- Active feature progress file if any

Return:

- Active feature.
- Lifecycle status.
- Last completed action.
- Next valid action.
- Blockers.
- Risks.
- Quality gate when known.
- Feature dependencies when known.
- Whether writes are currently authorized.

Do not edit files.
