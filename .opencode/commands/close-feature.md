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
- `.opencode/agents/leader.md`
- `docs/workflow.md`
- `CHECKPOINTS.md`
- `progress/STATUS.md`
- `progress/<FEATURE_ID_SLUG>-log.md`

Preconditions:

- Feature is `reviewed`.
- Reviewer approved the feature.
- Verification passed.
- User approved closure.

Rules:

- Update progress only if approved.
- Add closure history to `progress/STATUS.md` when approved.
- Show `git status` when Git is available.
- Show diff summary when Git is available.
- Prepare final commit message.
- Do not commit until the user explicitly approves the commit.

Recommended commit format:

```text
feat(F-XX): complete feature-slug
```
