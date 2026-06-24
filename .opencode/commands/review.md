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
- `.opencode/agents/reviewer.md`
- `CHECKPOINTS.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`
- Relevant granular docs for the affected slices
- `features/<FEATURE_ID_SLUG>.md`
- `progress/<FEATURE_ID_SLUG>-log.md`

Rules:

- Do not edit code.
- Do not fix issues.
- Inspect Auto Test evidence when applicable.
- Inspect Completion Checker evidence when applicable.
- Inspect Code Refiner evidence when applicable.
- If code was refined, verify Auto Test and Completion Checker passed again after refinement.
- Verify the selected quality gate was followed or explicitly waived.
- Verify requirement-to-test traceability.
- Verify tasks are complete.
- Verify architecture compliance.
- Verify new dependencies were approved and installed as latest stable compatible versions unless an exception was approved.
- Verify external package APIs/configuration were not guessed.
- Verify security/privacy behavior.
- Run or inspect verification output.
- Return `APPROVED` or `CHANGES_REQUESTED`.
