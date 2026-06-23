---
description: Read-only repository truth analysis
agent: leader
---

# Run a read-only truth analysis for this repository

Follow `AGENTS.md` and `.agents/roles/leader.md`.

Rules:

- Do not edit files.
- Do not change feature status.
- Do not commit.
- Read `progress/current.md`.
- Read `features/index.json`.
- Read `docs/index.md`.
- Read `docs/adaptation.md` when the project still has placeholders or no `harness.config.json`.
- Read `docs/quality-gates.md` when evaluating the next feature path.
- Read only additional docs needed for the current task.
- Report the active feature, current state, blockers, risks, and next valid action.
- Report whether the project is still in template mode.
- Report whether feature dependencies or quality-gate metadata are missing.

If arguments are provided, focus the analysis on:

```text
$ARGUMENTS
```

Model recommendation:

- Use a high-capability model for `/truth` when project state or next steps are ambiguous.
