# Data Model

## Purpose

Define persistence, relationships, constraints, and migration rules.

## Database Engine

Replace with project-specific engine:

```text
PostgreSQL / MySQL / SQLite / MongoDB / Supabase / Other
```

## Entity Rules

- Primary keys:
- Public identifiers:
- Slug rules:
- Timestamp rules:
- Soft delete rules:
- Audit rules:

## Tables / Collections

| Name | Purpose | Public | Notes |
|---|---|---:|---|
| example_entities | Replace with real table | No | Placeholder |

## Migration Rules

- Every schema change requires a migration.
- Migrations must be repeatable in local development.
- Destructive migrations require explicit approval.
- Data backfills must be scripted and verifiable.

## Sensitive Data

Do not store secrets, credentials, payment card data, or private documents without approved security design.
