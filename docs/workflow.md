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

## Allowed Reverse Transitions

Forward motion is preferred, but real projects need controlled rollback.

| Situation | Allowed transition | Rule |
|---|---|---|
| Spec needs changes before approval | `spec_ready -> pending` | Record why the spec was reopened |
| Implementation reveals missing requirements | `in_progress -> blocked -> spec_ready` | Update spec before coding further |
| Review requests implementation fixes | `implemented -> in_progress` | Keep same spec if changes are within scope |
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
