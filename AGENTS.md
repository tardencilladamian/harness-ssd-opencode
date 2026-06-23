# AGENTS.md - Navigation Map for AI Agents

This file is the entry point for any AI agent working in this repository.

This is an operational map. Read only what you need, when you need it, applying progressive disclosure.

## 1. Core Principle

This project is developed with Harness Engineering, Spec Driven Development, and Vertical Slice execution.

Main rule:

```text
Do not create, edit, delete, move, rewrite, or commit files without explicit authorization from the user.
```

Default mode is read-only analysis and proposal mode.

Before approval, agents may:

- Read files.
- Inspect repository state.
- Run non-destructive checks.
- Summarize findings.
- Propose a plan.

Before approval, agents must not:

- Modify code.
- Modify documentation.
- Modify progress files.
- Modify feature indexes.
- Modify specs.
- Modify configuration.
- Modify tests.
- Commit changes.

File changes are allowed only when the user clearly authorizes the exact change scope, for example:

```text
/implement
implement this feature
you may modify these files
apply the proposed patch
I approve these file changes
update this documentation file
```

If the agent says it is waiting for confirmation, it must stop all write actions until the user responds.

## 2. Agent Compatibility

This repository does not depend on a specific AI provider.

Neutral role contracts live in:

```text
.agents/roles/
```

Tool-specific adapters live in:

```text
.opencode/agents/
.opencode/commands/
.agents/prompts/opencode/
```

Important rule:

```text
.agents/roles/ is the source of truth.
```

No OpenCode adapter may contradict the contracts in `.agents/roles/`.

## 3. Before Starting

Before proposing or performing work, the agent must:

1. Read `progress/current.md`.
2. Read `features/index.json`.
3. If there is an active feature, read `progress/features/<FEATURE_ID_SLUG>.md`.
4. Read `docs/workflow.md` before any SDD work.
5. Read only the documentation needed for the current task.
6. Confirm that no other feature is in progress.
7. Confirm whether the requested task is analysis, documentation, specification, review, or implementation.
8. Verify that explicit authorization exists before modifying any file.
9. Confirm whether the current workspace exposes a Git root before making repository changes.

If required documentation is missing, propose the missing documentation first. Create it only after explicit approval.

If business rules, security rules, data rules, payments, migration, or permissions are ambiguous, stop and ask for clarification before implementation.

## 4. Repository Map

| Path | Purpose | When to read |
|---|---|---|
| `docs/index.md` | Documentation index | Always when starting |
| `docs/project-overview.md` | Product context, objective, and scope | When understanding the product |
| `docs/domain-model.md` | Domain entities and business rules | Before business logic |
| `docs/data-model.md` | Data model and persistence rules | Before database work |
| `docs/architecture.md` | Architecture contracts and boundaries | Before implementation |
| `docs/api-contracts.md` | API conventions and endpoint contracts | Before API work |
| `docs/ui-system.md` | UX and UI conventions | Before UI work |
| `docs/security.md` | Security, privacy, permissions | Before sensitive work |
| `docs/testing.md` | Testing and verification strategy | Before declaring completion |
| `docs/environment.md` | Local setup and commands | When setup or commands are needed |
| `docs/workflow.md` | SDD lifecycle and AI rules | Before orchestration |
| `docs/adaptation.md` | Template adaptation rules | During setup or when project config is incomplete |
| `docs/quality-gates.md` | Light, standard, and critical flow rules | Before choosing workflow intensity |
| `docs/decisions/` | Approved decisions | When direction is ambiguous |
| `features/index.json` | Feature list and state | Always when starting |
| `features/<FEATURE_ID_SLUG>/` | Feature specification | Before implementing that feature |
| `progress/current.md` | Live global state | Always when starting |
| `progress/history.md` | Append-only historical log | When history is needed |
| `progress/features/` | Feature-specific progress | Whenever a feature is active |
| `.agents/roles/` | Neutral agent contracts | When executing a role |
| `.opencode/agents/` | OpenCode agent adapters | When using OpenCode agents |
| `.opencode/commands/` | OpenCode slash commands | When using OpenCode commands |
| `CHECKPOINTS.md` | Objective final validation criteria | Before closing a feature |
| `scripts/verify.sh` | Project verification entrypoint | Before marking implemented/tested/reviewed/done |
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

The agent may present:

- Exact files it wants to change.
- Reason for each change.
- Change type: additive, partial edit, move, delete, full rewrite.
- Risks.
- Validation plan.
- Rollback plan.

No files may be changed yet.

### approved_writes

The agent may modify only the files and scope explicitly approved by the user.

If additional files must change, stop and request approval for the expanded scope.

## 7. Protected Files

Protected files may be edited only after explicit approval:

```text
AGENTS.md
CHECKPOINTS.md
docs/
features/index.json
features/<FEATURE_ID_SLUG>/
progress/
.agents/
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

See `docs/workflow.md` for details.

Before implementation, choose the appropriate quality gate from `docs/quality-gates.md`.

Project-specific technology, commands, and model choices belong in `harness.config.json` and project docs. Do not hardcode stack-specific rules into reusable role contracts.

Allowed exceptional states:

```text
blocked
cancelled
```

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
