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
