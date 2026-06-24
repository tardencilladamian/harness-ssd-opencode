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
- `.opencode/agents/code-refiner.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`
- Relevant granular docs for the affected code
- `features/<FEATURE_ID_SLUG>.md`
- `progress/<FEATURE_ID_SLUG>-log.md`
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
- For light-flow features, recommend skipping refinement unless there is obvious maintainability or safety value.

Return one of:

```text
code_refined -> progress/<FEATURE_ID_SLUG>-log.md
refactor_not_recommended -> progress/<FEATURE_ID_SLUG>-log.md
```
