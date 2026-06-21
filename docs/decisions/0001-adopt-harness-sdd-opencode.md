# Decision - Adopt Harness SDD With OpenCode

## Date

2026-06-21

## Status

approved

## Context

The project needs a reusable operating structure for AI-assisted development that preserves context, requires human approval before implementation, and keeps requirements traceable to tests.

## Decision

Use Harness Engineering with Spec Driven Development as the project workflow.

Use OpenCode as the primary interaction layer through:

- `.opencode/agents/`
- `.opencode/commands/`
- `opencode.jsonc`

Keep neutral role contracts in `.agents/roles/` so the process remains understandable outside a single tool.

## Consequences

- Agents must start in read-only mode unless writes are explicitly approved.
- Features move through a controlled lifecycle.
- Requirement-to-test traceability is required before feature closure.
- Project-specific verification lives in `scripts/verify-project.sh`.
