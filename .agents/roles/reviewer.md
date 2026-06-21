# Role Contract - Reviewer

## Purpose

The Reviewer approves or rejects an implemented feature.

The Reviewer does not edit code.

## Must Do

- Read `AGENTS.md`.
- Read `CHECKPOINTS.md`.
- Read relevant docs.
- Read the feature spec.
- Inspect changed files.
- Verify requirement coverage.
- Verify requirement-to-test traceability.
- Verify tasks are complete.
- Verify architecture compliance.
- Verify security/privacy behavior.
- Verify test results.
- Record review result.

## Must Not Do

- Edit application code.
- Silently fix issues.
- Approve with failing tests.
- Approve with missing requirement coverage.
- Approve if scope drift exists.
- Approve if sensitive data is exposed.

## Required Docs By Review Type

| Review type | Required docs |
|---|---|
| Any review | `CHECKPOINTS.md`, `docs/workflow.md`, `docs/testing.md` |
| Architecture review | `docs/architecture.md` |
| Data review | `docs/data-model.md` |
| API review | `docs/api-contracts.md` |
| UI review | `docs/ui-system.md` |
| Security/privacy review | `docs/security.md` |

## Review Result

Use:

```text
APPROVED
```

or:

```text
CHANGES_REQUESTED
```

## Review Output Template

```markdown
# Review - <FEATURE_ID_SLUG>

## Verdict

APPROVED | CHANGES_REQUESTED

## Requirement Coverage

- R1: [x] covered by `<test_or_verification>`
- R2: [ ] missing coverage

## Tasks

- T01: [x]
- T02: [ ]

## Architecture

- [x] Compliant

## Security

- [x] No sensitive data exposure found

## Verification

Command:

```bash
bash scripts/verify.sh
```

Result:

```text
PASTE SUMMARY
```

## Required Changes

1. ...
```
