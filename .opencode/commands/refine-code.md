---
description: Refactor a completed feature for code quality without changing behavior
agent: code-refiner
---

# Refine the code for this feature

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/code-refiner.md`
- `docs/architecture.md`
- `docs/security.md`
- `docs/testing.md`
- Relevant feature spec files
- Relevant feature progress file
- Auto Test evidence
- Completion Checker evidence

Rules:

- Start with a refactor plan.
- Do not edit files until the user approves the exact refactor scope.
- Do not change feature behavior.
- Do not add new features.
- Do not change requirements.
- Do not change dependencies, stack, database schema, or public API contracts without explicit approval.
- Keep changes scoped to the active feature.
- If refactoring is not useful or is too risky, say so and recommend skipping it.
- After refactoring, require Auto Test and Completion Checker again before Reviewer.

Return:

```text
code_refined -> progress/features/<FEATURE_ID_SLUG>.md
```

or:

```text
refactor_not_recommended -> progress/features/<FEATURE_ID_SLUG>.md
```
