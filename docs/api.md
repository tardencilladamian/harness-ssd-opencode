# API

This file defines API conventions and contracts.

## Conventions

- Base path:
- Versioning:
- Authentication:
- Authorization:
- Pagination:
- Filtering:
- Sorting:

## Request Rules

- Validate all external input.
- Reject unknown or unsafe fields where applicable.
- Do not trust client-provided authorization or ownership data.

## Response Rules

Successful response shape:

```json
{
  "data": {}
}
```

Error response shape:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable message"
  }
}
```

Replace these shapes if the project uses another standard.

## Endpoint Inventory

| Method | Path | Purpose | Auth |
|---|---|---|---|
| GET | /example | Replace with purpose | Required |

## Security

- Never expose private data by default.
- Permission checks belong on the server.
- Sensitive upload and payment rules belong in `docs/security.md`.

## Open Questions

- Replace with unresolved API questions.
