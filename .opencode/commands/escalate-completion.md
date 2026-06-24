---
description: Resume a blocked completion check with a higher-capability model
agent: completion-checker
---

# Resume completion work for this feature after 3 failed completion-check cycles

```text
$ARGUMENTS
```

This command is intended for a higher-capability AI model after `completion-checker` returned:

```text
blocked_model_escalation_recommended
```

Follow:

- `AGENTS.md`
- `.opencode/agents/completion-checker.md`
- `docs/workflow.md`
- `features/<FEATURE_ID_SLUG>.md`
- `progress/<FEATURE_ID_SLUG>-log.md`
- Auto Test evidence
- Completion Checker failed-cycle summaries
- The `Completion Escalation Package` section

Rules:

- Start in read-only mode.
- Do not restart from scratch.
- Do not repeat the same failed attempts.
- Do not edit files until the user approves the exact correction scope.
- Identify why the previous 3 cycles failed.
- Classify the root cause as implementation gap, spec ambiguity, architecture issue, missing tests, wrong approach, or model limitation.
- Propose the smallest correction plan.
- If the spec is ambiguous, recommend returning to `spec_ready`.
- If implementation is needed, provide precise instructions for Implementer.
- After corrections, require Auto Test and Completion Checker again.

Return one of:

```text
escalation_plan_ready -> progress/<FEATURE_ID_SLUG>-log.md
spec_clarification_required -> progress/<FEATURE_ID_SLUG>-log.md
```
