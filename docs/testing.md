# Testing

This file defines test strategy, verification evidence, and completion rules.

## Verification Entry Point

Use:

```bash
bash scripts/verify.sh --harness
bash scripts/verify.sh --project
bash scripts/verify.sh --all
```

## Test Levels

Use the levels that apply:

- Unit tests.
- Integration tests.
- API tests.
- Component tests.
- End-to-end tests.
- Browser tests.
- Migration tests.
- Security and permission tests.

## Requirement Traceability

Every approved requirement should map to at least one test or explicit verification step.

Record evidence in:

```text
progress/<FEATURE_ID_SLUG>-log.md
```

## Browser Testing

When a feature includes UI behavior and Playwright is available, Auto Test must run browser tests in headed mode:

```bash
pnpm exec playwright test --headed
```

Use the project package manager and equivalent command, but keep headed mode.

## Evidence

Each completed feature should record:

- Commands executed.
- Test results.
- Browser evidence when UI is involved.
- Requirement-to-test or requirement-to-verification mapping.
- Auto Test verdict when applicable.
- Completion Checker verdict when applicable.
- Code Refiner evidence when applicable.
- Reviewer verdict.
- Known limitations or waived checks.

## Completion Rule

A feature is not complete unless:

- Requirements are implemented.
- Tests or explicit verification steps cover requirements.
- Verification passes or limitations are approved.
- Auto Test passes when applicable.
- Completion Checker passes when applicable.
- If Code Refiner ran, post-refactor Auto Test and Completion Checker pass again.
- Reviewer approves before closure.

## Open Questions

- Replace with unresolved testing questions.
