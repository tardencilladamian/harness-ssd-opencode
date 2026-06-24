# AGENTS.md - Navigation Map for AI Agents

This file is the entry point for any AI agent working in this repository.

Read only what you need, when you need it, applying progressive disclosure.

## 1. Core Principle

This project is developed with Harness Engineering, Spec Driven Development, and Vertical Slice execution.

Main rule:

```text
Do not create, edit, delete, move, rewrite, or commit files without explicit authorization from the user.
```

Default mode is read-only analysis and proposal mode.

Before approval, agents may read files, inspect repository state, run non-destructive checks, summarize findings, and propose a plan.

Before approval, agents must not modify code, documentation, progress files, feature indexes, specs, configuration, tests, or commits.

File changes are allowed only when the user clearly authorizes the exact change scope.

If an agent says it is waiting for confirmation, it must stop all write actions until the user responds.

## 2. Agent Compatibility

This repository is optimized for OpenCode while keeping the process provider-neutral.

Official agent contracts live in:

```text
.opencode/agents/
```

OpenCode slash commands live in:

```text
.opencode/commands/
```

`.opencode/agents/` is the source of truth for agent behavior in this template.

## 3. Before Starting

Before proposing or performing work, the agent must:

1. Read `progress/STATUS.md`.
2. Read `features/index.json`.
3. If there is an active feature, read `progress/<FEATURE_ID_SLUG>-log.md`.
4. Read `docs/workflow.md` before any SDD work.
5. Read `docs/index.md` to decide which detailed docs apply.
6. Read `CONTEXT.md` for project summary.
7. Read only the detailed docs needed for the current task.
8. Read `docs/decisions.md` when direction is ambiguous.
9. Confirm that no other feature is in progress.
10. Confirm whether the requested task is analysis, documentation, specification, review, testing, refinement, or implementation.
11. Verify that explicit authorization exists before modifying any file.
12. Confirm whether the current workspace exposes a Git root before making repository changes.

If required documentation is missing, propose the missing documentation first. Create it only after explicit approval.

If business rules, security rules, data rules, payments, migration, or permissions are ambiguous, stop and ask for clarification before implementation.

## 4. Repository Map

| Path | Purpose | When to read |
|---|---|---|
| `CONTEXT.md` | Executive project summary and documentation map | Starting, onboarding, or checking setup completeness |
| `docs/index.md` | Documentation routing map | Before choosing which detailed docs to read |
| `docs/project.md` | Product objective, users, scope, and feature areas | Product behavior, scope, UX intent, or roadmap |
| `docs/domain.md` | Domain concepts, terminology, and business rules | Business rules or domain-sensitive implementation |
| `docs/data.md` | Data model, constraints, migrations, seeds, and imports | Database, persistence, migration, or reports |
| `docs/architecture.md` | Technical boundaries, stack, modules, and dependency rules | Implementation, refactors, or architecture decisions |
| `docs/api.md` | API conventions and contracts | Endpoints, clients, integrations, or API tests |
| `docs/ui.md` | UI system, accessibility, responsive behavior, states, and forms | Frontend, forms, or browser testing |
| `docs/security.md` | Security, privacy, permissions, uploads, secrets, and logging | Auth, permissions, private data, payments, or uploads |
| `docs/environment.md` | Local setup, services, variables, runtime versions, and commands | Setup, CI, failing commands, or onboarding |
| `docs/testing.md` | Test strategy, evidence, verification, and browser testing | Before marking implemented, tested, reviewed, or done |
| `docs/workflow.md` | Lifecycle, quality gates, adaptive setup, and AI work rules | Before orchestration |
| `docs/decisions.md` | Approved technical and product decisions | When direction is ambiguous |
| `features/index.json` | Feature list and state | Always when starting |
| `features/<FEATURE_ID_SLUG>.md` | Complete feature specification | Before implementing that feature |
| `progress/STATUS.md` | Live global progress and history | Always when starting |
| `progress/<FEATURE_ID_SLUG>-log.md` | Feature-specific progress, evidence, and review notes | Whenever a feature is active |
| `.opencode/agents/` | Agent contracts | When executing a role |
| `.opencode/commands/` | OpenCode slash command procedures | When using OpenCode commands |
| `CHECKPOINTS.md` | Objective final validation criteria | Before closing a feature |
| `scripts/verify.sh` | Harness and project verification entrypoint | Before marking tested, reviewed, or done |
| `harness.config.json` | Project-specific Harness configuration | After setup, before specs or implementation |
| `harness.config.example.json` | Reusable config template | During setup |

## 5. Hard Rules

- Work on only one feature at a time.
- Do not modify files without explicit authorization.
- Do not implement without explicit authorization.
- Do not skip the specification phase.
- Do not skip human approval.
- Do not declare a feature complete without passing tests.
- Do not change architecture, stack, database, or core dependencies without approval.
- Do not rewrite protected foundation documents without explicit approval for a full rewrite.
- Do not expose secrets, private data, or sensitive documents.
- Do not invent business rules when documentation is incomplete.
- Do not mix changes from multiple features in the same session.
- Do not change feature status without approval or documented lifecycle transition.
- Do not commit until the user has reviewed the diff and approved the commit.
- Stop before editing if the Git root is unavailable.

## 6. Human Approval Gate

The repository has three operating modes:

```text
read_only -> proposed_changes -> approved_writes
```

### read_only

Default mode. The agent may inspect, analyze, and report. No files may be changed.

### proposed_changes

The agent may present exact file changes, reasons, risks, validation, and rollback. No files may be changed yet.

### approved_writes

The agent may modify only the files and scope explicitly approved by the user.

If additional files must change, stop and request approval for the expanded scope.

## 7. Protected Files

Protected files may be edited only after explicit approval:

```text
AGENTS.md
CHECKPOINTS.md
CONTEXT.md
docs/
features/index.json
features/<FEATURE_ID_SLUG>.md
progress/
.opencode/
opencode.jsonc
scripts/verify.sh
```

Full rewrites are forbidden unless the user explicitly approves a full rewrite.

## 8. SDD Workflow

Every SDD feature follows this lifecycle:

```text
pending -> spec_ready -> approved -> in_progress -> implemented -> tested -> completion_checked -> code_refined -> tested -> completion_checked -> reviewed -> done
```

Allowed exceptional states:

```text
blocked
cancelled
```

See `docs/workflow.md` for details.

## 9. Truth Priority

When there is a conflict, prioritize:

1. Explicit user instructions.
2. Approved project documentation.
3. Approved feature specification.
4. Registered decisions.
5. Security and privacy rules.
6. Technical conventions.
7. Existing implementation.

Never prioritize chat memory over approved repository files.
