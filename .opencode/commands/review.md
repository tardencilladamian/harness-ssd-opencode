---
description: Review an implemented feature without editing
agent: reviewer
---

# Review this implemented feature

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/reviewer.md`
- `CHECKPOINTS.md`
- `docs/workflow.md`
- `docs/testing.md`
- `docs/security.md`
- Relevant project docs
- The complete feature spec

Rules:

- Do not edit code.
- Do not fix issues.
- Verify requirement-to-test traceability.
- Verify tasks are complete.
- Verify architecture compliance.
- Verify security/privacy behavior.
- Run or inspect verification output.
- Return `APPROVED` or `CHANGES_REQUESTED`.
