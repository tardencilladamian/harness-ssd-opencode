# Decision - Add Adaptive Harness

## Date

2026-06-23

## Status

approved

## Context

The Harness template must remain reusable across different project types while still becoming precise enough for production-quality AI-assisted development after project setup.

The previous structure had strong SDD roles and verification gates, but project-specific setup, quality-gate intensity, model strategy, feature templates, and session evidence were not formalized.

## Decision

Add an adaptive project layer without replacing the reusable Harness core.

The reusable core remains:

- `AGENTS.md`
- `docs/workflow.md`
- `docs/testing.md`
- `docs/quality-gates.md`
- `.agents/roles/`
- `.opencode/commands/`
- `scripts/verify.sh`

The project-adapted layer is configured through:

- `harness.config.json`
- project docs
- `scripts/verify-project.sh`
- feature specs
- progress files
- session logs

Add:

- `harness.config.example.json`
- `docs/adaptation.md`
- `docs/quality-gates.md`
- `features/_template/`
- `progress/sessions/`
- `scripts/new-feature.sh`
- `/session-close`

Keep model names configurable instead of hardcoding provider-specific values in the reusable template.

## Consequences

- New projects can start from a generic template and become project-specific through `/init`, `/truth`, `/specify`, and `/check`.
- Features can declare dependencies, slices, quality gates, and model usage metadata.
- Teams can choose light, standard, or critical flow depending on risk.
- The template remains stack-agnostic and does not force Supabase, RLS, JWT, R2, pnpm, or any specific provider unless the project config chooses them.
- Session closure is documented, but commits still require explicit human approval.
