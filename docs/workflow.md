# Workflow - Harness SDD Lifecycle

## Operating Modes

```text
read_only -> proposed_changes -> approved_writes
```

### read_only

Default mode. Agents inspect, analyze, and propose. No writes.

### proposed_changes

Agents propose exact file changes, risks, validation, and rollback. No writes.

### approved_writes

Agents may write only within the explicitly approved scope.

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
| `tested` | Auto Test completed exhaustive verification and recorded evidence |
| `completion_checked` | Completion Checker confirmed the tested feature achieves its approved objective |
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

- Reusable Harness core: roles, commands, lifecycle, verification entrypoint, and quality gates.
- Project-adapted layer: `harness.config.json`, project docs, project verification commands, feature specs, and progress files.

Project-specific rules should be added to project docs and `harness.config.json`, not hardcoded into reusable agent contracts.

If a command discovers missing project setup, it should report the gap and propose the smallest setup update before continuing.

## Quality Gate Selection

Before implementation, choose one of the quality gates from `docs/quality-gates.md`:

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

## Allowed Reverse Transitions

Forward motion is preferred, but real projects need controlled rollback.

| Situation | Allowed transition | Rule |
|---|---|---|
| Spec needs changes before approval | `spec_ready -> pending` | Record why the spec was reopened |
| Implementation reveals missing requirements | `in_progress -> blocked -> spec_ready` | Update spec before coding further |
| Review requests implementation fixes | `tested -> in_progress` or `implemented -> in_progress` | Keep same spec if changes are within scope |
| Auto Test finds failures | `tested -> in_progress` or `implemented -> in_progress` | Implementer fixes issues, then Auto Test runs again |
| Completion Checker finds gaps | `completion_checked -> in_progress` or `tested -> in_progress` | Implementer fixes objective gaps, then Auto Test and Completion Checker run again |
| Completion Checker fails 3 cycles | `tested -> blocked` | Stop and recommend switching to a higher-capability AI model before more AI budget is spent |
| Code Refiner changes behavior accidentally | `code_refined -> in_progress` | Implementer restores intended behavior or fixes regression, then Auto Test and Completion Checker run again |
| Code refinement is too risky | `completion_checked -> reviewed` | Skip refinement and document why |
| Review reveals spec gap | `implemented -> blocked -> spec_ready` | Update requirements/design/tasks |
| Feature is abandoned | `pending/spec_ready/approved/in_progress -> cancelled` | Record reason in progress file |
| Completed feature needs new behavior | `done -> new feature` | Do not reopen done features for new scope |

## Specification Phase

Each SDD feature must include:

```text
features/<FEATURE_ID_SLUG>/
  requirements.md
  design.md
  tasks.md
```

Optional files:

```text
test-plan.md
review.md
notes.md
evidence/
```

New features may start from:

```text
features/_template/
```

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

`design.md` must explain:

- Files and modules to touch.
- Data changes.
- API changes.
- UI changes.
- Permissions and validation.
- Risks.
- Alternatives discarded.

## Task Rules

`tasks.md` must be executable:

```text
- [ ] T01 - Create migration. Covers: R1, R2.
- [ ] T02 - Implement endpoint. Covers: R3.
- [ ] T03 - Add tests. Covers: R1, R2, R3.
```

## Human Approval Gate

Implementation must not begin until:

1. The spec is complete.
2. The user has reviewed it.
3. The user explicitly approves implementation.

## Auto Test Phase

After implementation and before review, run Auto Test when the feature affects behavior.

Auto Test is responsible for exhaustive verification, not for approval.

Auto Test must:

- Run project verification.
- Run feature-specific tests.
- Run affected regression tests.
- Use real browser checks when the feature includes UI and browser tooling is available.
- Record evidence and failures in the feature progress file or an approved test report.

If Auto Test fails, the feature returns to `in_progress` for fixes.

The Reviewer should not review a feature with failed or missing Auto Test evidence unless the user explicitly waives that requirement.

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
5. Record the remaining gaps and the failed cycle count.
6. Write a Completion Escalation Package.
7. Tell the user to switch models and run `/escalate-completion <FEATURE_ID>`.

The Reviewer should not review a feature with failed or missing Completion Checker evidence unless the user explicitly waives that requirement.

## Escalated Completion

When a feature is blocked after 3 failed Completion Checker cycles, a higher-capability model should resume with:

```text
/escalate-completion <FEATURE_ID>
```

The escalated model must:

1. Start in read-only mode.
2. Read the Completion Escalation Package.
3. Read the feature spec, progress file, Auto Test evidence, and failed-cycle summaries.
4. Identify why the previous cycles failed.
5. Classify the root cause as implementation gap, spec ambiguity, architecture issue, missing tests, wrong approach, or model limitation.
6. Propose the smallest correction plan.
7. Wait for user approval before any writes.

If the issue is spec ambiguity, the feature should return to `spec_ready` for clarification instead of forcing more implementation attempts.

## Code Refiner Phase

After a feature passes Auto Test and Completion Checker, Code Refiner may run before Reviewer.

Code Refiner improves internal quality without changing behavior:

- Readability.
- Maintainability.
- Structure.
- Type safety.
- Error handling.
- Security posture.
- Test clarity.
- Removal of unnecessary duplication.

Code Refiner must:

1. Start with a refactor plan.
2. Wait for user approval before editing.
3. Stay within the approved feature scope.
4. Preserve behavior exactly.
5. Avoid dependency, stack, schema, or public API changes unless explicitly approved.
6. Record what changed and why.

After Code Refiner runs, the feature must go back through:

```text
code_refined -> tested -> completion_checked -> reviewed
```

The Reviewer should not review a refined feature until Auto Test and Completion Checker pass again, unless the user explicitly waives that requirement.

## Resuming a Session

When a session resumes after interruption, context compaction, crash, or a new day:

1. Read `progress/current.md`.
2. Read `features/index.json`.
3. If a feature is `in_progress`, read its feature progress file.
4. Read the active feature's `tasks.md`.
5. Summarize the found state to the user.
6. Ask for confirmation before continuing implementation.

Do not assume the last chat message is a complete source of truth.

## Closing a Session

Before ending a session:

1. Update progress files if approved.
2. Run verification.
3. Show `git status`.
4. Summarize diff.
5. Ask for commit approval if a commit is needed.

Session-level details may be recorded in:

```text
progress/sessions/<DATE>-<FEATURE_ID>.md
```

Session logs do not replace `progress/current.md`, feature progress files, or human approval gates.

## Project-Specific Verification

The reusable Harness entrypoint is:

```bash
bash scripts/verify.sh
```

Project-specific checks should live in:

```bash
scripts/verify-project.sh
```

This keeps the reusable Harness checks stable while letting each project define its own stack validation.
