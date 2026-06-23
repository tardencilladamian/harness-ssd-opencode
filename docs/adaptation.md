# Adaptive Harness Setup

This template starts as a reusable Harness SDD foundation. Each real project adapts it during setup and then keeps adapting it as commands discover project-specific facts.

## Principle

```text
Keep the Harness core stable.
Move project-specific truth into project docs and harness.config.json.
```

The reusable core is:

- `AGENTS.md`
- `docs/workflow.md`
- `docs/testing.md`
- `docs/quality-gates.md`
- `.agents/roles/`
- `.opencode/commands/`
- `scripts/verify.sh`

The project-adapted layer is:

- `harness.config.json`
- `docs/project-overview.md`
- `docs/architecture.md`
- `docs/domain-model.md`
- `docs/data-model.md`
- `docs/api-contracts.md`
- `docs/security.md`
- `docs/environment.md`
- `scripts/verify-project.sh`
- `features/F-XX-*`
- `progress/current.md`
- `progress/features/`
- `progress/sessions/`

## Setup Flow

1. Copy `harness.config.example.json` to `harness.config.json`.
2. Replace the project basics: name, description, type, stack, and verification commands.
3. Replace placeholders in project docs.
4. Create `scripts/verify-project.sh` from `scripts/verify-project.sh.example`.
5. Run `bash scripts/verify.sh`.
6. Create the first real feature from `features/_template/`.
7. Use `/truth` before starting implementation.

## Command Adaptation

`/init` should detect missing setup data and propose exact updates.

`/truth` should report whether the project is still in template mode and which setup gaps remain.

`/specify` should read `harness.config.json`, `docs/quality-gates.md`, and the relevant project docs before drafting feature specs.

`/check` should run `scripts/verify.sh`, which delegates project-specific checks to `scripts/verify-project.sh` when present.

## Model Strategy

Use the configured model strategy from `harness.config.json`:

```text
Think expensive. Build cheap. Verify always.
```

High-capability models should handle ambiguity, architecture, specs, critical reviews, and escalations.

Cost-efficient models should handle implementation, tests, routine fixes, and evidence collection when the spec is complete.

## Non-Negotiable Rule

If an agent has to guess a business rule, security rule, data rule, or architecture decision, the Harness setup is incomplete. Stop and request clarification instead of inventing behavior.
