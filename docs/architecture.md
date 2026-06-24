# Architecture

This file defines technical boundaries and implementation rules.

## Stack

- Frontend: Replace with frontend stack.
- Backend: Replace with backend stack.
- Database: Replace with database.
- Package manager: Replace with package manager.
- Test tools: Replace with test tools.

## Repository Layout

Describe the approved structure after F-00 adapts the template.

```text
apps/
packages/
database/
tests/
```

Adjust this layout only with approval.

## Boundaries

- Replace with module boundaries.
- Define what can import what.
- Define shared package ownership.
- Define forbidden shortcuts.

## Vertical Slice Rule

Features should be implemented end to end across the needed layers: data, API, UI, tests, security, and docs.

Do not build large horizontal layers without a feature that proves them.

## Dependency Rules

- Do not add dependencies without approval.
- Prefer existing stack tools.
- Use the latest stable compatible package version by default.
- Verify package names, versions, APIs, imports, CLI flags, and configuration keys through the package manager registry, official docs, installed package metadata, or generated types before coding against them.
- Do not use prerelease, deprecated, unmaintained, or incompatible packages unless explicitly approved.
- If the latest stable version conflicts with the approved stack, stop and propose options.
- Record architecture-impacting dependencies in `docs/decisions.md`.
- Record major technical decisions in `docs/decisions.md`.

## Error Handling

- Define user-facing errors.
- Define API error format in `docs/api.md`.
- Define logging and sensitive data rules in `docs/security.md`.

## Open Questions

- Replace with unresolved architecture questions.
