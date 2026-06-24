# Project Context

This file is the executive project summary and documentation map.

Use granular documents in `docs/` as the detailed source of truth. Keep this file short enough that agents can read it at the start of a session.

## Product

- Name: PROJECT_NAME
- Description: Short project description.
- Primary users:
  - User type 1
- Core feature areas:
  - Core feature area

Detailed product truth lives in `docs/project.md`.

## Scope Summary

In scope:

- Replace with real product scope.

Out of scope:

- Out-of-scope item.

Detailed scope belongs in `docs/project.md`.

## Domain Summary

Use this section for domain concepts, business rules, terminology, and forbidden assumptions.

| Term | Meaning |
|---|---|
| ExampleEntity | Replace with a real concept |

## Business Rules

- Replace with project-specific rules.
- If a rule is unknown, stop and ask before implementation.

Detailed domain rules live in `docs/domain.md`.

## Technical Summary

- Frontend: Replace with project-specific frontend stack.
- Backend: Replace with project-specific backend stack.
- Database: Replace with project-specific database engine.
- Package manager: Replace with package manager.
- Browser testing: Playwright when applicable.

Detailed technical truth lives in:

- `docs/architecture.md`
- `docs/data.md`
- `docs/api.md`
- `docs/ui.md`
- `docs/security.md`
- `docs/environment.md`

## Verification Summary

Agents must not claim work is complete without evidence.

Reusable Harness checks:

```bash
bash scripts/verify.sh --harness
```

Project-specific checks:

```bash
bash scripts/verify.sh --project
```

Full verification:

```bash
bash scripts/verify.sh --all
```

Configure real stack commands inside the `verify_project()` section of `scripts/verify.sh` or document why they are not available yet.

Detailed verification truth lives in `docs/testing.md`.

Feature evidence belongs in:

```text
progress/<FEATURE_ID_SLUG>-log.md
```

## Documentation Map

Read `docs/index.md` to decide which detailed documents apply to a task.

Core docs:

- `docs/project.md`
- `docs/domain.md`
- `docs/data.md`
- `docs/architecture.md`
- `docs/api.md`
- `docs/ui.md`
- `docs/security.md`
- `docs/environment.md`
- `docs/testing.md`
- `docs/decisions.md`

## Open Questions

- Replace with unresolved product, technical, or verification questions.

## Decisions

Record permanent decisions in `docs/decisions.md`.
