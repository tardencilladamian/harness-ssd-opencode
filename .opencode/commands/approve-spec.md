---
description: Approve a reviewed feature specification
agent: leader
---

# Process human approval for this feature specification

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.opencode/agents/leader.md`
- `docs/workflow.md`
- `features/index.json`
- `progress/STATUS.md`

Rules:

- Confirm the user explicitly approved the spec.
- Confirm `features/<FEATURE_ID_SLUG>.md` exists.
- Confirm the file has `## Requirements`, `## Design`, and `## Tasks`.
- Confirm the feature is currently `spec_ready`.
- Confirm the selected quality gate is documented or propose one.
- Confirm dependencies are declared in `features/index.json`.
- If approved, propose changing status to `approved`.
- Do not implement.
- If a write is required, confirm the approved write scope before editing.
