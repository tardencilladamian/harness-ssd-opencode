---
description: Close the current work session without committing automatically
agent: leader
---

# Close the current Harness session

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/leader.md`
- `docs/workflow.md`
- `docs/quality-gates.md`
- `CHECKPOINTS.md`

Rules:

- Do not commit automatically.
- Do not edit files unless progress/session-log updates are explicitly approved.
- Summarize current feature status.
- Summarize completed work and pending work.
- Summarize verification commands and results.
- Show `git status` when Git is available.
- Show a diff summary when Git is available.
- Prepare a recommended commit message only if useful.
- Ask for explicit commit approval before any commit.

Optional approved outputs:

```text
progress/current.md
progress/features/<FEATURE_ID_SLUG>.md
progress/history.md
progress/sessions/<DATE>-<FEATURE_ID>.md
```

Model recommendation:

- Use a cost-efficient model for routine session closure.
