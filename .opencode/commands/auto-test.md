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
- `.opencode/agents/auto-test.md`
- `docs/workflow.md`
- `docs/index.md`
- `docs/testing.md`
- `CONTEXT.md`
- `harness.config.json` when it exists
- `features/<FEATURE_ID_SLUG>.md`
- `progress/<FEATURE_ID_SLUG>-log.md`

Rules:

- Do not implement fixes.
- Do not edit application code.
- Do not approve the feature.
- Run `bash scripts/verify.sh --project`.
- Run feature-specific tests.
- Run affected regression tests.
- Open the browser and perform real UI checks when applicable and tooling is available.
- When Playwright is available, browser tests must run in headed mode using `--headed`.
- Prefer the project command and add `--headed` when needed, for example `pnpm exec playwright test --headed`.
- Test happy paths, validation errors, permissions, persistence, and public/private visibility when applicable.
- Record exact commands, outcomes, evidence, failures, and reproduction steps in the feature log when writes are approved.

Return one of:

```text
auto_test_passed -> progress/<FEATURE_ID_SLUG>-log.md
auto_test_failed -> progress/<FEATURE_ID_SLUG>-log.md
```
