# Workflow - Harness SDD Lifecycle

## Operating Modes

```text
read_only -> proposed_changes -> approved_writes
```

- `read_only`: agents inspect, analyze, and propose. No writes.
- `proposed_changes`: agents propose exact changes, risks, validation, and rollback. No writes.
- `approved_writes`: agents write only inside the explicitly approved scope.

## Feature Lifecycle

```text
pending
-> spec_ready
-> approved
-> in_progress
-> implemented
-> tested
-> completion_checked
-> code_refined
-> tested
-> completion_checked
-> reviewed
-> done
```

| Status | Meaning |
|---|---|
| `pending` | Feature exists but has no complete spec |
| `spec_ready` | Spec is ready for human review |
| `approved` | Human approved the spec |
| `in_progress` | Implementation is active |
| `implemented` | Code and tests are complete |
| `tested` | Auto Test completed verification and recorded evidence |
| `completion_checked` | Completion Checker confirmed the tested feature achieves its objective |
| `code_refined` | Code Refiner improved code quality without intended behavior changes |
| `reviewed` | Reviewer approved the implementation |
| `done` | Feature is closed with documentation and commit |
| `blocked` | Work cannot continue without clarification or external change |
| `cancelled` | Feature was intentionally abandoned or replaced |

## Work Modes

| Work mode | Spec required | Tests required | Expected result |
|---|---:|---:|---|
| `foundation` | Yes | Structural verification | Repository, platform, or documentation foundation |
| `feature` | Yes | Yes | User-facing or system behavior |
| `vertical_slice` | Yes | Yes | End-to-end feature across layers |
| `bugfix` | Minimal spec | Regression test required | Defect fixed with evidence |
| `spike` | Notes only | Optional | Technical discovery or decision |
| `docs` | Scope note | No, unless docs tooling exists | Documentation update |

`spike` work must not ship production behavior. It must produce a decision, prototype result, or documented recommendation.

## Adaptive Harness Flow

The template has two layers:

- Reusable Harness core: agent contracts, commands, lifecycle, verification entrypoint, and quality gates.
- Project-adapted layer: `harness.config.json`, `CONTEXT.md`, granular docs under `docs/`, project verification commands, feature specs, and progress logs.

Project-specific rules should be added to `CONTEXT.md`, the relevant granular docs, `docs/decisions.md`, and `harness.config.json`, not hardcoded into reusable agent contracts.

If a command discovers missing project setup, it should report the gap and propose the smallest setup update before continuing.

## Documentation Structure

`CONTEXT.md` is the short executive summary. Detailed project truth belongs in granular docs:

```text
docs/index.md
docs/project.md
docs/domain.md
docs/data.md
docs/architecture.md
docs/api.md
docs/ui.md
docs/security.md
docs/environment.md
docs/testing.md
docs/decisions.md
```

Agents should read `docs/index.md` first, then only the detailed docs required for the current task.

If a feature touches business rules, data, API, UI, security, environment, or testing, the related detailed document must be complete enough before implementation starts.

## Feature Structure

Each SDD feature uses a single file:

```text
features/<FEATURE_ID_SLUG>.md
```

The file must include:

```text
Feature metadata
## Requirements
## Design
## Tasks
```

Recommended feature metadata:

```text
> Status: pending
> Quality gate: standard
> Next gate: spec approval
> Owner role: spec-author
```

New features may start from:

```text
features/_template.md
```

Each active or worked feature uses one log file:

```text
progress/<FEATURE_ID_SLUG>-log.md
```

Global progress, active feature, summary, and history live in:

```text
progress/STATUS.md
```

## Large Feature Exception

Default to one feature file:

```text
features/<FEATURE_ID_SLUG>.md
```

Use a feature folder only when the feature file would become hard to review, usually because it exceeds about 300 lines or needs large supporting evidence, diagrams, fixtures, or migration notes:

```text
features/<FEATURE_ID_SLUG>/
  feature.md
  evidence/
  notes.md
```

This exception must be documented in the feature file or feature log before implementation.

## Requirements Rules

Requirements must be:

- Numbered with stable IDs: `R1`, `R2`, `R3`.
- Verifiable.
- Atomic enough to test.
- Written without vague verbs.

Preferred EARS patterns:

```text
WHEN <event>, THE SYSTEM SHALL <behavior>.
IF <condition>, THEN THE SYSTEM SHALL <behavior>.
WHILE <state>, THE SYSTEM SHALL <behavior>.
WHERE <feature applies>, THE SYSTEM SHALL <behavior>.
```

## Design Rules

The `## Design` section must explain:

- Files and modules to touch.
- Data changes.
- API changes.
- UI changes.
- Permissions and validation.
- Risks.
- Alternatives discarded when relevant.

## Task Rules

The `## Tasks` section must be executable:

```text
- [ ] T01 - Create migration. Covers: R1, R2.
- [ ] T02 - Implement endpoint. Covers: R3.
- [ ] T03 - Add tests. Covers: R1, R2, R3.
```

## Quality Gate Selection

Before implementation, choose one quality gate:

- `light` for low-risk documentation or small internal changes.
- `standard` for normal product features.
- `critical` for security, permissions, payments, private data, database, public visibility, shared modules, migrations, or complex UI flows.

Critical flow should include Code Refiner unless the user explicitly waives refinement and the reason is recorded.

## Model Strategy

Recommended strategy:

```text
Think expensive. Build cheap. Verify always.
```

Use high-capability models for ambiguity, specs, architecture, critical review, and escalation.

Use cost-efficient models for implementation, tests, routine fixes, and evidence collection when the approved spec is complete.

Chosen model names belong in `harness.config.json`.

## Dependency And Package Policy

Default rule: use the most recent stable compatible version of every library or package when adding new dependencies.

Agents must follow these rules before installing or using a package:

- Verify the package name and latest stable version through the package manager registry or official documentation.
- Do not invent package names, versions, APIs, configuration keys, imports, or command syntax.
- Do not use alpha, beta, release candidate, nightly, canary, or deprecated packages unless the user explicitly approves that risk.
- Prefer the project's package manager and existing stack conventions.
- Record new dependency decisions in the feature spec, feature log, or `docs/decisions.md` when the dependency affects architecture.
- If the latest stable version is incompatible with the approved stack, stop and propose options instead of silently downgrading.
- If registry or official documentation cannot be verified, stop and ask before installing or coding against the package.

Use exact installed versions or lockfiles according to the project's package manager. "Latest" means latest verified stable at installation time, not an unverified floating assumption.

## Anti-Hallucination Rules

Agents cannot be guaranteed to never make mistakes, so correctness must be enforced through verification gates.

Before generating code that depends on external libraries, framework APIs, CLI flags, migrations, schemas, or configuration:

- Confirm the source of truth: existing code, project docs, official docs, package registry, generated types, or installed package metadata.
- Inspect the installed package or generated types when available.
- Use the repo's existing patterns before inventing abstractions.
- Run typecheck, lint, tests, and targeted verification after implementation.
- If an API, business rule, permission rule, migration behavior, or package capability is uncertain, stop and ask.

Do not present guessed code as verified code.

## Allowed Reverse Transitions

| Situation | Allowed transition | Rule |
|---|---|---|
| Spec needs changes before approval | `spec_ready -> pending` | Record why the spec was reopened |
| Implementation reveals missing requirements | `in_progress -> blocked -> spec_ready` | Update spec before coding further |
| Auto Test finds failures | `tested -> in_progress` or `implemented -> in_progress` | Implementer fixes issues, then Auto Test runs again |
| Completion Checker finds gaps | `completion_checked -> in_progress` or `tested -> in_progress` | Implementer fixes objective gaps, then Auto Test and Completion Checker run again |
| Completion Checker fails 3 cycles | `tested -> blocked` | Stop and recommend switching to a higher-capability AI model |
| Code Refiner changes behavior accidentally | `code_refined -> in_progress` | Implementer restores intended behavior or fixes regression |
| Code refinement is too risky | `completion_checked -> reviewed` | Skip refinement and document why |
| Review reveals spec gap | `implemented -> blocked -> spec_ready` | Update requirements/design/tasks |
| Feature is abandoned | `pending/spec_ready/approved/in_progress -> cancelled` | Record reason in the feature log |
| Completed feature needs new behavior | `done -> new feature` | Do not reopen done features for new scope |

## Human Approval Gate

Implementation must not begin until:

1. The spec is complete.
2. The user has reviewed it.
3. The user explicitly approves implementation.

## Auto Test Phase

After implementation and before review, run Auto Test when the feature affects behavior.

Auto Test must:

- Run project verification.
- Run feature-specific tests.
- Run affected regression tests.
- Use real browser checks when the feature includes UI and browser tooling is available.
- Run Playwright in headed mode when Playwright is used:

```bash
pnpm exec playwright test --headed
```

- Record evidence and failures in `progress/<FEATURE_ID_SLUG>-log.md`.

If Auto Test fails, the feature returns to `in_progress` for fixes.

## Completion Checker Phase

After Auto Test passes and before Reviewer runs, run Completion Checker.

Completion Checker validates that the tested feature fully achieves:

- The feature purpose.
- The intended user outcome.
- Every approved requirement.
- Every acceptance criterion.
- The behavior implied by the approved design.

Completion Checker must not implement fixes and must not approve the feature.

If the feature is incomplete, Completion Checker returns precise correction instructions for Implementer. After Implementer fixes the issue, Auto Test must run again before another Completion Checker cycle.

Completion Checker is limited to 3 failed cycles per feature.

If the third failed cycle still does not achieve the objective:

1. Stop the loop.
2. Mark or recommend the feature as `blocked`.
3. Notify the user that the current AI model may be insufficient.
4. Recommend switching to a higher-capability model before spending more AI budget.
5. Record remaining gaps and failed cycle count.
6. Write a Completion Escalation Package in the feature log.
7. Tell the user to switch models and run `/escalate-completion <FEATURE_ID>`.

The escalated model must start in read-only mode, read the escalation package, identify the root cause, propose the smallest correction plan, and wait for approval before writes.

## Code Refiner Phase

After a feature passes Auto Test and Completion Checker, Code Refiner may improve code quality without changing behavior.

Code Refiner must:

- Read the feature spec, feature log, Auto Test evidence, and Completion Checker evidence.
- Propose a refactor plan before editing.
- Avoid new behavior, new requirements, and unapproved architecture changes.
- Run or route the feature back through Auto Test and Completion Checker after refinement.

## Reviewer Phase

Reviewer verifies requirements, tasks, architecture, security, tests, evidence, and acceptance criteria.

Reviewer must not silently fix issues while reviewing.

If issues are found, the feature stays out of `done`.

## Verification Commands

Use one entrypoint:

```bash
bash scripts/verify.sh --harness
bash scripts/verify.sh --project
bash scripts/verify.sh --all
```

`--harness` verifies reusable structure and feature/progress coherence.

`--project` runs project-specific checks configured inside `scripts/verify.sh`.

`--all` runs both.

## Session Closure

Before ending a session:

1. Update `progress/STATUS.md` if progress updates are within the approved scope.
2. Update `progress/<FEATURE_ID_SLUG>-log.md` if a feature is active and progress updates are within scope.
3. Record completed work, pending work, blockers, risks, and verification results.
4. Remove debug logs or temporary artifacts.
5. Show `git status` and diff summary when Git is available.
6. Do not commit until the user approves the commit.
