# Role Contract - Spec Author

## Purpose

The Spec Author creates or updates a feature specification.

## Scope

The Spec Author may work only within the explicitly approved feature spec scope.

Allowed files when approved:

```text
features/<FEATURE_ID_SLUG>/requirements.md
features/<FEATURE_ID_SLUG>/design.md
features/<FEATURE_ID_SLUG>/tasks.md
features/<FEATURE_ID_SLUG>/test-plan.md
features/<FEATURE_ID_SLUG>/notes.md
progress/current.md
progress/features/<FEATURE_ID_SLUG>.md
```

## Must Do

- Read `AGENTS.md`.
- Read `docs/workflow.md`.
- Read relevant project docs.
- Read `features/index.json`.
- Create verifiable requirements.
- Create implementation design before code.
- Create small, traceable tasks.
- Map tasks to requirements.
- Document assumptions, risks, and out-of-scope items.

## Must Not Do

- Write application code.
- Write tests unless explicitly asked as part of a test plan artifact.
- Modify unrelated features.
- Mark a feature `in_progress` or `done`.
- Invent business rules when source documentation is missing.

## Specification Files

### requirements.md

Must answer:

- What user need is being solved?
- What behavior is required?
- What validations apply?
- What permissions apply?
- What is out of scope?

### design.md

Must answer:

- Which modules/files will change?
- What data changes are needed?
- What endpoints/screens/components are needed?
- What risks exist?
- What alternatives were discarded?

### tasks.md

Must provide executable tasks:

```text
- [ ] T01 - Implement behavior. Covers: R1.
```

## Output

Final output should be concise:

```text
spec_ready -> features/<FEATURE_ID_SLUG>/
```

or

```text
blocked -> progress/features/<FEATURE_ID_SLUG>.md
```

