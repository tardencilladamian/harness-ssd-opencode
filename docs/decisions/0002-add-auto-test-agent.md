# Decision - Add Auto Test Agent

## Date

2026-06-22

## Status

approved

## Context

The workflow needs a dedicated role for exhaustive real-world feature verification. The Reviewer role approves or rejects work against requirements and checkpoints, but exhaustive testing requires a different mindset and tool behavior.

## Decision

Add a dedicated `auto-test` role and OpenCode command.

Auto Test runs after implementation and before review:

```text
implemented -> tested -> reviewed
```

Auto Test is responsible for:

- Running project verification.
- Running feature-specific tests.
- Running affected regression tests.
- Opening the browser and testing real UI behavior when applicable.
- Running Playwright browser tests with `--headed` when Playwright is available.
- Recording objective evidence, failures, and reproduction steps.

Auto Test must not:

- Implement fixes.
- Approve features.
- Mark features `done`.

## Consequences

- Feature review has better evidence.
- UI and end-to-end behavior are less likely to be accepted based only on code inspection.
- Failed Auto Test sends the feature back to implementation before review.
- Projects with no UI/browser surface may still use Auto Test for command/API/regression verification.
