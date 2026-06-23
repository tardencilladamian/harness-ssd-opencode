# Decision - Add Completion Checker Agent

## Date

2026-06-23

## Status

approved

## Context

Auto Test verifies technical behavior through tests, browser checks, regression checks, and evidence. Reviewer approves or rejects the feature against quality gates. A gap remains: a feature can pass tests but still fail to achieve its approved objective or intended user outcome.

## Decision

Add a dedicated `completion-checker` role and OpenCode command.

Completion Checker runs after Auto Test and before Reviewer:

```text
implemented -> tested -> completion_checked -> reviewed -> done
```

Completion Checker validates:

- Feature purpose.
- Intended user outcome.
- Approved requirements.
- Acceptance criteria.
- Auto Test evidence.

If incomplete, Completion Checker sends precise correction instructions to Implementer. After corrections, Auto Test must run again before another Completion Checker cycle.

Completion Checker is limited to 3 failed cycles per feature.

If the third cycle still fails, the workflow stops and recommends switching to a higher-capability AI model before spending more AI budget.

The failed third cycle must produce a Completion Escalation Package. After switching models, the next model resumes with:

```text
/escalate-completion <FEATURE_ID>
```

The escalated model starts in read-only mode, reads the package, identifies why the previous cycles failed, and proposes the smallest correction plan before making changes.

## Consequences

- The workflow reduces the risk of technically green but functionally incomplete features.
- AI budget is protected by a hard 3-cycle limit.
- Reviewer gets clearer evidence that the feature is complete before final review.
- The system creates an explicit escalation point when the current model appears insufficient.
