# API Contracts

## Purpose

Define API design rules and endpoint contracts.

## General Rules

- Use consistent naming.
- Validate input at the boundary.
- Return predictable error shapes.
- Do not expose internal IDs unless approved.
- Enforce authorization server-side.
- Keep API behavior traceable to requirements.

## Error Format

Replace with project-specific format:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable message",
    "details": []
  }
}
```

## Versioning

Document API versioning rules here.

## Endpoint Template

```text
METHOD /path
Purpose:
Auth:
Request:
Response:
Errors:
Requirements:
Tests:
```
