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
- `.agents/roles/completion-checker.md`
- `docs/workflow.md`
- `docs/quality-gates.md`
- The full feature spec
- The feature progress file
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
- If the spec is ambiguous, recommend returning to `spec_ready` instead of implementing.
- If implementation is needed, provide precise instructions for Implementer.
- After corrections, require Auto Test and Completion Checker again.

Return:

```text
escalation_plan_ready -> progress/features/<FEATURE_ID_SLUG>.md
```

or:

```text
spec_clarification_required -> progress/features/<FEATURE_ID_SLUG>.md
```

Model recommendation:

- Use a high-capability model. This command exists because the previous model or approach failed after 3 cycles.
