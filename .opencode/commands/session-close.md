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
- `.opencode/agents/leader.md`
- `docs/workflow.md`
- `CHECKPOINTS.md`
- `progress/STATUS.md`

Rules:

- Do not commit automatically.
- Do not edit files unless progress updates are explicitly approved.
- Summarize current feature status.
- Summarize completed work and pending work.
- Summarize verification commands and results.
- Show `git status` when Git is available.
- Show a diff summary when Git is available.
- Prepare a recommended commit message only if useful.
- Ask for explicit commit approval before any commit.

Optional approved outputs:

```text
progress/STATUS.md
progress/<FEATURE_ID_SLUG>-log.md
```
