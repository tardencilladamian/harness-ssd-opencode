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
- `.opencode/agents/implementer.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`
- Relevant granular docs for the affected slices
- `harness.config.json` when it exists
- `features/<FEATURE_ID_SLUG>.md`
- `progress/<FEATURE_ID_SLUG>-log.md`

Preconditions:

- The feature is `approved` or `in_progress`.
- The user explicitly authorized implementation.
- The approved scope is clear.
- Every feature listed in `depends_on` is `done`.

Rules:

- Work on one feature only.
- Respect the granular docs for product, domain, data, API, UI, security, environment, and testing.
- Use latest stable compatible dependencies by default when new packages are approved.
- Verify package name, latest stable version, install command, API/import syntax, CLI flags, and configuration before using a dependency.
- If verification is not possible, stop and ask instead of guessing.
- Execute tasks in order.
- Add or update tests with the implementation.
- Mark tasks complete only after completion.
- Run `bash scripts/verify.sh --all` or the relevant project-specific verification command.
- Update progress only if progress updates are approved.
- Do not commit without user approval.
- If the spec is ambiguous, stop and request clarification instead of inventing a decision.
- If package behavior or API is uncertain, inspect installed metadata/types/docs or stop.
