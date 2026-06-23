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
- `.agents/roles/leader.md`
- `docs/workflow.md`
- `docs/quality-gates.md`

Rules:

- Confirm the user explicitly approved the spec.
- Confirm `requirements.md`, `design.md`, and `tasks.md` exist.
- Confirm the feature is currently `spec_ready`.
- Confirm the selected quality gate is documented or propose one.
- Confirm dependencies are declared in `features/index.json`.
- If approved, propose changing status to `approved`.
- Do not implement.
- If a write is required, confirm the approved write scope before editing.

Model recommendation:

- Use a high-capability model when the spec is complex or critical.
