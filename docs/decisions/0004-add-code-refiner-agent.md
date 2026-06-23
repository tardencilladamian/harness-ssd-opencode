# Decision - Add Code Refiner Agent

## Date

2026-06-23

## Status

approved

## Context

Implementer focuses on delivering working behavior. Auto Test proves technical behavior. Completion Checker proves the feature objective is achieved. Reviewer approves the feature against final quality gates.

A feature can satisfy behavior and objective while still having code quality issues such as duplication, weak typing, unclear structure, fragile tests, poor naming, or avoidable security risks.

## Decision

Add a dedicated `code-refiner` role and OpenCode command:

```text
/refine-code <FEATURE_ID>
```

Code Refiner runs after Auto Test and Completion Checker pass, and before Reviewer when refinement is useful or required:

```text
implemented -> tested -> completion_checked -> code_refined -> tested -> completion_checked -> reviewed -> done
```

Code Refiner must preserve behavior. If behavior changes, the work is no longer a refactor and must return to implementation with approval.

## Consequences

- Code quality gets an explicit improvement phase.
- Refactors are scoped and reviewed separately from implementation.
- Behavior is protected by requiring Auto Test and Completion Checker again after refinement.
- Reviewers receive cleaner code and better evidence.
- Small or low-risk features may skip Code Refiner if the user approves skipping it.
