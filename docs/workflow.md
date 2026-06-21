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

## Closing a Session

Before ending a session:

1. Update progress files if approved.
2. Run verification.
3. Show `git status`.
4. Summarize diff.
5. Ask for commit approval if a commit is needed.
