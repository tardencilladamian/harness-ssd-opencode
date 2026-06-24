---
description: Read-only repository truth analysis
agent: leader
---

# Run a read-only truth analysis for this repository

Follow:

- `AGENTS.md`
- `.opencode/agents/leader.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`
- `docs/decisions.md`

Rules:

- Do not edit files.
- Do not change feature status.
- Do not commit.
- Read `progress/STATUS.md`.
- Read `features/index.json`.
- Read `docs/index.md`.
- Read `harness.config.json` when it exists.
- Read active feature spec and log when a feature is active.
- Read only additional docs needed for the current task.
- Report active feature, current state, blockers, risks, and next valid action.
- Report whether the project is still in template mode.
- Report whether feature dependencies or quality-gate metadata are missing.
- If F-00 is still `pending`, recommend completing F-00 before product features.

If arguments are provided, focus the analysis on:

```text
$ARGUMENTS
```
