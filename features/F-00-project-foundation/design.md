# Design - F-00 Project Foundation

## Scope

This feature establishes the reusable Harness SDD operating structure.

## Files

| File | Purpose |
|---|---|
| `AGENTS.md` | Agent navigation and hard rules |
| `docs/` | Project documentation contracts |
| `features/index.json` | Feature state index |
| `features/F-00-project-foundation/` | Initial feature spec |
| `progress/` | Current, history, and per-feature progress |
| `.agents/roles/` | Neutral agent role contracts |
| `.opencode/` | OpenCode adapters |
| `scripts/verify.sh` | Verification entrypoint |

## Decisions

- Keep role contracts neutral and tool-independent.
- Treat OpenCode as an adapter, not the source of truth.
- Require explicit user approval before writes.
- Require requirement-to-test traceability before feature closure.

## Risks

- Agents may treat command names as authorization. Commands are not enough; the user must authorize the scope.
- Stack-specific validation must be added by each project.
