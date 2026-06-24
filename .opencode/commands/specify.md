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
- `.opencode/agents/spec-author.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`
- Relevant granular docs for the affected slices
- `harness.config.json` when it exists
- `features/index.json`
- `progress/STATUS.md`

Before writing, confirm explicit authorization exists for the exact feature spec scope.

Required output:

```text
features/<FEATURE_ID_SLUG>.md
```

Required sections:

```text
## Requirements
## Design
## Tasks
```

Optional approved output:

```text
progress/<FEATURE_ID_SLUG>-log.md
```

Use `features/_template.md` as the expected structure for new features.

The spec must recommend:

- Quality gate: `light`, `standard`, or `critical`.
- Feature dependencies in `depends_on`.
- Affected slices: database, API, UI, security, tests, documentation, configuration.
- Which granular docs must be completed or updated before implementation.

Do not write application code.

Do not write tests.

Do not mark the feature `in_progress` or `done`.
