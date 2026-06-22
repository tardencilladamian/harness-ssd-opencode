# Testing

## Purpose

Define how agents prove work is correct.

## Verification Principle

Agents must not say "it works" without evidence.

## Test Levels

Use the levels that apply to this project:

- Unit tests.
- Integration tests.
- API tests.
- Component tests.
- End-to-end tests.
- Browser tests.
- Migration tests.
- Security/permission tests.

## Auto Test Agent

The `auto-test` agent is responsible for exhaustive feature verification after implementation and before review.

It should test:

- Project verification command.
- Feature-specific tests.
- Affected regression tests.
- Happy paths.
- Validation errors.
- Permission and visibility rules.
- Persistence behavior.
- Browser/UI behavior when applicable.
- Basic accessibility behavior when UI is involved.

It must record:

- Commands executed.
- Results.
- Evidence.
- Failures.
- Reproduction steps.
- Limitations, such as unavailable browser tooling.

It must not:

- Fix code.
- Approve the feature.
- Mark the feature `done`.

## Browser Testing With Playwright

When a feature includes UI behavior and Playwright is available, `auto-test` must run browser tests in headed mode.

Preferred commands:

```bash
pnpm exec playwright test --headed
npx playwright test --headed
npm exec playwright test -- --headed
```

Use the package manager and script conventions of the project. If the project defines a custom Playwright script, append `--headed` or document the equivalent headed-mode command.

Headed mode is required for `auto-test` because the agent should observe real browser behavior and catch visual/runtime issues that are easy to miss in headless-only runs.

## Default Verification Command

```bash
bash scripts/verify.sh
```

## Project-Specific Verification

Keep reusable Harness checks in:

```text
scripts/verify.sh
```

Put stack-specific checks in:

```text
scripts/verify-project.sh
```

Start by copying:

```bash
cp scripts/verify-project.sh.example scripts/verify-project.sh
```

Then add commands such as:

```bash
pnpm lint
pnpm test
pnpm build
pnpm exec playwright test
```

## Requirement Traceability

Each SDD requirement must map to at least one test or explicit verification step.

Example:

| Requirement | Test / Verification |
|---|---|
| R1 | `test_user_can_create_record` |
| R2 | `test_rejects_invalid_payload` |

## Feature Completion Rule

A feature is not complete unless:

- Tests pass.
- Verification output is recorded.
- Requirement traceability exists.
- Review is complete.
