# Test Plan - F-00 Project Foundation

## Verification Commands

```bash
bash scripts/verify.sh
```

## Manual Checks

- Confirm only one feature can be `in_progress`.
- Confirm each non-pending SDD feature has `requirements.md`, `design.md`, and `tasks.md`.
- Confirm protected files require explicit approval before modification.
- Confirm OpenCode commands point agents to the neutral role contracts.
