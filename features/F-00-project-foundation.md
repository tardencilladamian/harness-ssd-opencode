# F-00 - Project Foundation

> Status: pending
> Quality gate: critical
> Next gate: project foundation spec approval
> Owner role: spec-author

## Purpose

Adapt the reusable Harness template into the real project foundation before product features begin.

This is not a demo feature. It is the first real feature of a new project.

## Requirements

### R1

WHEN the project starts from this template, THE SYSTEM SHALL create or configure `harness.config.json` with the real project name, stack, verification commands, model strategy, and default quality gate.

### R2

WHEN setup is performed, THE SYSTEM SHALL replace project placeholders in the required documentation with real project-specific information.

### R3

WHEN the project has a selected stack, THE SYSTEM SHALL configure `scripts/verify.sh --project` with real project verification commands or document why they are not available yet.

### R4

WHEN the project requires application code scaffolding, THE SYSTEM SHALL create the approved initial repository/app structure for the selected stack.

### R5

WHEN F-00 is completed, THE SYSTEM SHALL prove that reusable Harness checks and project-specific checks pass or record approved limitations.

### R6

WHEN the project foundation is complete, THE SYSTEM SHALL update progress and evidence so future agents can continue from repository truth instead of chat memory.

## Out of Scope

- Product business features beyond project foundation.
- Production deployment automation unless explicitly approved.
- Payment, authentication, or domain behavior unless they are part of the approved foundation scope.

## Design

This feature converts the reusable Harness template into the real foundation of the target project.

The exact implementation depends on the selected project stack. For example, a web app may scaffold frontend/backend apps, while a CLI or library may scaffold a different structure.

### Files

| File | Purpose |
|---|---|
| `harness.config.json` | Project-specific Harness configuration created from `harness.config.example.json` |
| `CONTEXT.md` | Short project summary and documentation map |
| `docs/project.md` | Real product objective, users, scope, and feature areas |
| `docs/domain.md` | Real domain terms, statuses, workflows, and business rules |
| `docs/data.md` | Real data model, constraints, migrations, seeds, and imports |
| `docs/architecture.md` | Real stack, module boundaries, repository layout, and dependency rules |
| `docs/api.md` | Real API conventions, contracts, errors, auth, and endpoint inventory |
| `docs/ui.md` | Real UI system, accessibility, responsive behavior, forms, and states |
| `docs/security.md` | Real security, privacy, permission, upload, secret, and logging rules |
| `docs/environment.md` | Real local setup, services, variables, runtime versions, and commands |
| `docs/testing.md` | Real test strategy, verification commands, browser testing, and evidence rules |
| `docs/decisions.md` | Real technical and product decisions |
| `scripts/verify.sh` | Reusable and project-specific verification entrypoint |
| project app folders | Initial code/application structure when explicitly approved |
| `progress/STATUS.md` | Updated global state after foundation work |
| `progress/F-00-project-foundation-log.md` | Updated F-00 progress and evidence |

### Decisions

- Keep the reusable Harness core stack-agnostic.
- Keep `CONTEXT.md` short and put detailed project truth in granular docs under `docs/`.
- Use F-00 as the real project foundation feature.
- Use `features/_template.md` as the reusable reference structure for future features.
- Treat stack scaffolding as implementation work that requires explicit user approval.

### Verification

F-00 must verify:

- Harness structure with `bash scripts/verify.sh --harness`.
- Project-specific checks with `bash scripts/verify.sh --project` when configured.
- Template-token replacement for project-owned docs.
- Completion or explicit deferral of granular docs.
- Correct progress state.
- Git status and diff summary before closure when Git is available.

### Risks

- The project stack may not be fully decided during setup.
- Verification commands may not exist until scaffolded code exists.
- Over-scaffolding too early may create unnecessary complexity.
- Agents must not implement app code before the user approves the exact F-00 implementation scope.

## Tasks

- [ ] T01 - Create `harness.config.json` from `harness.config.example.json` with real project values. Covers: R1.
- [ ] T02 - Replace placeholders in `CONTEXT.md` and `docs/project.md`. Covers: R2.
- [ ] T03 - Complete or explicitly defer `docs/domain.md`, `docs/data.md`, `docs/architecture.md`, `docs/api.md`, `docs/ui.md`, `docs/security.md`, `docs/environment.md`, and `docs/testing.md`. Covers: R2, R3, R5.
- [ ] T04 - Configure `scripts/verify.sh --project` with real commands or documented setup limitations. Covers: R3, R5.
- [ ] T05 - Create the approved initial project/app structure for the selected stack when applicable. Covers: R4.
- [ ] T06 - Configure environment examples and local setup documentation. Covers: R2, R3.
- [ ] T07 - Run Harness and project verification. Covers: R5.
- [ ] T08 - Record evidence, progress, blockers, and next action. Covers: R6.
- [ ] T09 - Prepare review and closure evidence without committing until the user approves. Covers: R5, R6.
