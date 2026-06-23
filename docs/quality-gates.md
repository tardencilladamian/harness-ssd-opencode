# Quality Gates

Use quality gates to choose the right workflow intensity for each task.

The goal is high quality without forcing every small change through the most expensive path.

## Flow Levels

### Light Flow

Use for low-risk documentation, small internal cleanup, tiny copy changes, or non-behavioral updates.

```text
truth -> specify minimal scope -> implement -> check -> review -> close
```

Requirements:

- Clear scope.
- No database changes.
- No permissions or security changes.
- No public behavior change unless trivial.
- Verification command passes.

### Standard Flow

Use for normal product features and bug fixes.

```text
truth -> specify -> approve-spec -> implement -> auto-test -> completion-check -> review -> close
```

Requirements:

- Approved requirements, design, and tasks.
- Tests or explicit verification steps.
- Auto Test evidence.
- Completion Checker evidence.
- Reviewer approval.

### Critical Flow

Use for high-risk or high-value work.

```text
truth -> specify -> approve-spec -> implement -> auto-test -> completion-check -> refine-code -> auto-test -> completion-check -> review -> close
```

Critical flow is required when a feature touches:

- Authentication.
- Authorization or permissions.
- Payments.
- Private or sensitive data.
- Database schema or migrations.
- Public/private visibility rules.
- Shared modules used by multiple features.
- Production infrastructure.
- Legacy data migration.
- Complex UI workflows with browser behavior.

## Model Routing

Default strategy:

```text
Think expensive. Build cheap. Verify always.
```

Use a high-capability model for:

- `/init`
- `/truth`
- `/specify`
- architecture analysis
- spec review
- security-sensitive review
- `/escalate-completion`

Use a cost-efficient model for:

- `/implement`
- `/auto-test`
- `/completion-check`
- routine fixes within approved scope
- `/session-close`

Use a higher-capability model again if:

- Completion Checker fails 3 cycles.
- The feature has unresolved ambiguity.
- Implementation repeatedly violates the spec.
- The chosen architecture appears wrong.

## Evidence Requirements

Each completed feature should record:

- Commands executed.
- Test results.
- Browser evidence when UI is involved.
- Requirement-to-test or requirement-to-verification mapping.
- Completion Checker verdict.
- Reviewer verdict.
- Known limitations or waived checks.

Evidence may live in the feature progress file or in:

```text
features/<FEATURE_ID_SLUG>/evidence/
```

## Skip Rules

Skipping Auto Test, Completion Checker, Code Refiner, or Reviewer requires explicit human approval and a recorded reason.

Code Refiner is optional for low-risk features. It is recommended for critical flow, shared code, security-sensitive code, or code that became hard to maintain during implementation.
