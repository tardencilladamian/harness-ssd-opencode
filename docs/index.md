# Documentation Index

Use this file to decide which project documents to read. Do not load every document by default; use progressive disclosure.

## Always Read

| File | Purpose |
|---|---|
| `AGENTS.md` | Agent operating rules and repository map |
| `progress/STATUS.md` | Current global state |
| `features/index.json` | Feature list and lifecycle state |
| `docs/workflow.md` | SDD workflow, quality gates, and lifecycle rules |

## Project Truth

| File | Purpose | Read when |
|---|---|---|
| `CONTEXT.md` | Executive project summary and documentation map | Starting, onboarding, or checking whether setup is complete |
| `docs/project.md` | Product objective, users, scope, and feature areas | Product behavior, scope, UX intent, or roadmap |
| `docs/domain.md` | Domain concepts, terminology, and business rules | Business rules or domain-sensitive implementation |
| `docs/data.md` | Data model, relationships, constraints, and migrations | Database, persistence, imports, seeds, or reports |
| `docs/architecture.md` | Technical boundaries, modules, dependency rules, and stack contracts | Implementation, refactors, shared modules, or architecture decisions |
| `docs/api.md` | API conventions, request/response contracts, errors, auth, and versioning | Endpoints, clients, integrations, or API tests |
| `docs/ui.md` | UI system, accessibility, responsive behavior, states, and forms | Frontend, design system, forms, or browser testing |
| `docs/security.md` | Security, privacy, permissions, secrets, uploads, and logging rules | Authentication, authorization, private data, payments, uploads, or audit |
| `docs/environment.md` | Local setup, services, variables, runtime versions, and commands | Setup, CI, failing commands, or onboarding |
| `docs/testing.md` | Test strategy, evidence, verification commands, and browser testing | Before marking implemented, tested, reviewed, or done |
| `docs/decisions.md` | Approved product and technical decisions | Ambiguity, change of direction, or conflict resolution |

## Feature Truth

| File | Purpose |
|---|---|
| `features/<FEATURE_ID_SLUG>.md` | Requirements, design, and tasks for one feature |
| `progress/<FEATURE_ID_SLUG>-log.md` | Progress, evidence, blocker, testing, and review log for one feature |

## Rule

If documentation is missing or ambiguous for business rules, security, data, payments, migration, or permissions, stop and ask for clarification before implementation.
