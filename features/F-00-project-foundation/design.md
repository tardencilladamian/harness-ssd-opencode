# Design - F-00 Project Foundation

## Status

Pending project adaptation.

## Scope

This feature converts the reusable Harness template into the real foundation of the target project.

The exact implementation depends on the selected project stack. For example, a web app may scaffold frontend/backend apps, while a CLI or library may scaffold a different structure.

## Files

| File | Purpose |
|---|---|
| `harness.config.json` | Project-specific Harness configuration created from `harness.config.example.json` |
| `docs/project-overview.md` | Real product objective, users, scope, and non-goals |
| `docs/architecture.md` | Real stack and architecture boundaries |
| `docs/domain-model.md` | Real domain concepts and business rules |
| `docs/data-model.md` | Real persistence model and migration rules |
| `docs/api-contracts.md` | Real API conventions when applicable |
| `docs/ui-system.md` | Real UI/UX conventions when applicable |
| `docs/security.md` | Real security, privacy, and permission rules |
| `docs/environment.md` | Real setup, environment variables, and commands |
| `docs/testing.md` | Real test strategy and verification expectations |
| `scripts/verify-project.sh` | Project-specific verification commands |
| project app folders | Initial code/application structure when explicitly approved |
| `progress/current.md` | Updated global state after foundation work |
| `progress/features/F-00-project-foundation.md` | Updated F-00 progress and evidence |

## Decisions

- Keep the reusable Harness core stack-agnostic.
- Put project-specific truth in `harness.config.json` and project docs.
- Use F-00 as the real project foundation feature.
- Use `features/_template/` as the reusable reference structure for future features.
- Treat stack scaffolding as implementation work that requires explicit user approval.

## Verification

F-00 must verify:

- Harness structure with `bash scripts/verify.sh`.
- Project-specific checks through `scripts/verify-project.sh` when configured.
- Template-token replacement for project-owned docs.
- Correct progress state.
- Git status and diff summary before closure when Git is available.

## Risks

- The project stack may not be fully decided during setup.
- Verification commands may not exist until scaffolded code exists.
- Over-scaffolding too early may create unnecessary complexity.
- Agents must not implement app code before the user approves the exact F-00 implementation scope.
