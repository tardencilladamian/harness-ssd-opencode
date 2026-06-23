# Test Plan - F-00 Project Foundation

## Status

Pending project adaptation.

## Verification Commands

```bash
bash scripts/verify.sh
```

When project-specific commands are configured:

```bash
bash scripts/verify-project.sh
```

## Manual Checks

- Confirm `harness.config.json` exists and contains real project values.
- Confirm placeholders in project-owned docs were replaced or explicitly deferred.
- Confirm selected stack and verification commands are documented.
- Confirm app scaffolding matches the approved F-00 scope.
- Confirm protected files were changed only after explicit approval.
- Confirm progress files record the final F-00 state.
- Confirm Git status and diff summary were reviewed before closure when Git is available.

## Requirement Traceability

| Requirement | Verification |
|---|---|
| R1 | `harness.config.json` exists and validates through `bash scripts/verify.sh` |
| R2 | Template-token scan and documentation review |
| R3 | `scripts/verify-project.sh` exists or limitation is documented |
| R4 | Approved scaffold exists when applicable |
| R5 | Harness and project verification evidence recorded |
| R6 | Progress and evidence files updated |
