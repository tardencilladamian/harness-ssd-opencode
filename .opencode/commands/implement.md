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
- `docs/quality-gates.md`
- `harness.config.json` when it exists
- Relevant project docs
- The complete feature spec

Preconditions:

- The feature is `approved` or `in_progress`.
- The user explicitly authorized implementation.
- The approved scope is clear.
- Every feature listed in `depends_on` is `done`.

Rules:

- Work on one feature only.
- Execute `tasks.md` in order.
- Add/update tests with the implementation.
- Mark tasks complete only after completion.
- Run `bash scripts/verify.sh` or the project-specific verification command.
- Update progress only if progress updates are approved.
- Do not commit without user approval.
- If the spec is ambiguous, stop and request clarification instead of inventing a design decision.

Model recommendation:

- Use a cost-efficient model only when the spec is complete and implementation tasks are mechanical.
