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
- `docs/quality-gates.md`
- `harness.config.json` when it exists
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

Use `features/_template/` as the expected structure for new features.

The spec must recommend:

- Quality gate: `light`, `standard`, or `critical`.
- Feature dependencies in `depends_on`.
- Affected slices: database, API, UI, security, tests, documentation, configuration.

Do not write application code.

Do not write tests.

Do not mark the feature `in_progress` or `done`.

Model recommendation:

- Use a high-capability model for `/specify` because ambiguity should be resolved before implementation.
