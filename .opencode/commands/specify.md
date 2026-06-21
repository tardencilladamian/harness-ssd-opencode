---
description: Create or update a feature specification
agent: spec-author
---

# Create or update the specification for

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/spec-author.md`
- `docs/workflow.md`
- Relevant project docs

Before writing, confirm explicit authorization exists for the exact feature spec scope.

Required output files:

```text
features/<FEATURE_ID_SLUG>/requirements.md
features/<FEATURE_ID_SLUG>/design.md
features/<FEATURE_ID_SLUG>/tasks.md
```

Optional output files:

```text
features/<FEATURE_ID_SLUG>/test-plan.md
features/<FEATURE_ID_SLUG>/notes.md
progress/features/<FEATURE_ID_SLUG>.md
```

Do not write application code.
Do not write tests.
Do not mark the feature `in_progress` or `done`.
