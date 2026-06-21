---
description: Implement one approved feature
agent: implementer
---

# Implement this approved feature

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/implementer.md`
- `docs/workflow.md`
- Relevant project docs
- The complete feature spec

Preconditions:

- The feature is `approved` or `in_progress`.
- The user explicitly authorized implementation.
- The approved scope is clear.

Rules:

- Work on one feature only.
- Execute `tasks.md` in order.
- Add/update tests with the implementation.
- Mark tasks complete only after completion.
- Run `bash scripts/verify.sh` or the project-specific verification command.
- Update progress only if progress updates are approved.
- Do not commit without user approval.
