---
description: Close a reviewed feature and prepare final commit summary
agent: leader
---

# Close this reviewed feature

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/leader.md`
- `docs/workflow.md`
- `docs/quality-gates.md`
- `CHECKPOINTS.md`

Preconditions:

- Feature is `reviewed`.
- Reviewer approved the feature.
- Verification passed.
- User approved closure.

Rules:

- Update progress only if approved.
- Append to `progress/history.md` only if approved.
- Add a session log in `progress/sessions/` when useful and approved.
- Show `git status`.
- Show diff summary.
- Prepare final commit message.
- Do not commit until the user explicitly approves the commit.

Recommended commit format:

```text
feat(F-XX): complete feature-slug
```
