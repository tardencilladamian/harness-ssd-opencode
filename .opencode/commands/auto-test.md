---
description: Exhaustively test an implemented feature with real verification
agent: auto-test
---

# Exhaustively test this feature

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/auto-test.md`
- `docs/testing.md`
- `docs/quality-gates.md`
- `docs/environment.md`
- `harness.config.json` when it exists
- Relevant feature spec files
- Relevant feature progress file

Rules:

- Do not implement fixes.
- Do not edit application code.
- Do not approve the feature.
- Run project verification commands.
- Run feature-specific tests.
- Run affected regression tests.
- Open the browser and perform real UI checks when applicable and tooling is available.
- When Playwright is available, browser tests must run in headed mode using `--headed`.
- Prefer the project command and add `--headed` when needed, for example `pnpm exec playwright test --headed`.
- Test happy paths, validation errors, permissions, persistence, and public/private visibility when applicable.
- Record exact commands, outcomes, evidence, failures, and reproduction steps.
- Store evidence in the feature progress file or `features/<FEATURE_ID_SLUG>/evidence/`.

Return:

```text
auto_test_passed -> progress/features/<FEATURE_ID_SLUG>.md
```

or:

```text
auto_test_failed -> progress/features/<FEATURE_ID_SLUG>.md
```

Model recommendation:

- Use a cost-efficient model for normal Auto Test runs. Escalate only when failures are ambiguous or repeatedly unexplained.
