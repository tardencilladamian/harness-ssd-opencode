# Architecture

## Purpose

Define the technical boundaries agents must respect when implementing features.

## Main Stack

Replace with the project stack:

- Frontend:
- Backend:
- Database:
- Storage:
- Queue:
- Testing:
- Deployment:

## Architecture Principles

- Prefer vertical slices over layer-only work.
- Keep changes scoped to the active feature.
- Use existing patterns before adding abstractions.
- Add dependencies only with explicit approval.
- Keep business logic testable.
- Keep user-facing behavior traceable to requirements.

## Boundaries

Document project-specific boundaries here:

- Where API code lives.
- Where UI code lives.
- Where database migrations live.
- Where domain logic lives.
- Where shared packages live.
- Where tests live.

## Dependency Policy

Do not add, remove, or upgrade core dependencies without approval.

If a dependency is needed, document:

- Why it is needed.
- Alternatives considered.
- Impact on bundle/runtime/security.
- Validation plan.

## Anti-Patterns

- Broad refactors during feature work.
- Hidden architecture changes.
- Business rules embedded only in UI.
- Database changes without migration and rollback notes.
- Features marked complete without tests.
