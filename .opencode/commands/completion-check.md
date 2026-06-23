---
description: Check whether a tested feature fully achieves its approved objective
agent: completion-checker
---

# Check whether this tested feature is truly complete

```text
$ARGUMENTS
```

Follow:

- `AGENTS.md`
- `.agents/roles/completion-checker.md`
- `docs/workflow.md`
- `docs/quality-gates.md`
- Relevant feature spec files
- Relevant feature progress file
- Auto Test evidence

Rules:

- Do not implement fixes.
- Do not edit application code.
- Do not approve the feature.
- Do not change requirements.
- Verify the feature purpose, requirements, acceptance criteria, and user outcome.
- Verify the selected quality gate was followed or explicitly waived.
- If incomplete, produce precise instructions for Implementer.
- After implementation corrections, require Auto Test to run again before another completion check.
- Count each failed completion check as one cycle.
- Stop after 3 failed cycles.
- On the third failed cycle, recommend switching to a higher-capability AI model before spending more AI budget.
- On the third failed cycle, write a Completion Escalation Package for the next model.
- Tell the user to switch model and run `/escalate-completion <FEATURE_ID>`.

Return:

```text
completion_checked -> progress/features/<FEATURE_ID_SLUG>.md
```

or:

```text
completion_incomplete_cycle_<N> -> progress/features/<FEATURE_ID_SLUG>.md
```

or:

```text
blocked_model_escalation_recommended -> progress/features/<FEATURE_ID_SLUG>.md
```

Model recommendation:

- Use a cost-efficient model for normal completion checks. Use a high-capability model after 3 failed cycles or when the root cause is unclear.
