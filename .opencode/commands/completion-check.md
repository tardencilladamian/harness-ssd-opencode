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
- `.opencode/agents/completion-checker.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`
- `features/<FEATURE_ID_SLUG>.md`
- `progress/<FEATURE_ID_SLUG>-log.md`
- Auto Test evidence

Rules:

- Do not implement fixes.
- Do not edit application code.
- Do not approve the feature.
- Do not change requirements.
- Verify feature purpose, requirements, acceptance criteria, and user outcome.
- Verify the selected quality gate was followed or explicitly waived.
- If incomplete, produce precise instructions for Implementer.
- After implementation corrections, require Auto Test to run again before another completion check.
- Count each failed completion check as one cycle.
- Stop after 3 failed cycles.
- On the third failed cycle, recommend switching to a higher-capability AI model before spending more AI budget.
- On the third failed cycle, write a Completion Escalation Package when writes are approved.
- Tell the user to switch model and run `/escalate-completion <FEATURE_ID>`.

Return one of:

```text
completion_checked -> progress/<FEATURE_ID_SLUG>-log.md
completion_incomplete_cycle_<N> -> progress/<FEATURE_ID_SLUG>-log.md
blocked_model_escalation_recommended -> progress/<FEATURE_ID_SLUG>-log.md
```
