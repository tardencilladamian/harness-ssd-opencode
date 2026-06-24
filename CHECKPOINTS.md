# CHECKPOINTS - Objective Final Validation

Use this checklist before marking a feature as `done`.

## C1 - Harness Structure

- [ ] `AGENTS.md` exists and defines the read-only default.
- [ ] `CONTEXT.md` exists.
- [ ] `features/index.json` exists and is valid JSON.
- [ ] `progress/STATUS.md` exists.
- [ ] `docs/index.md` exists.
- [ ] `docs/project.md` exists.
- [ ] `docs/domain.md` exists.
- [ ] `docs/data.md` exists.
- [ ] `docs/architecture.md` exists.
- [ ] `docs/api.md` exists.
- [ ] `docs/ui.md` exists.
- [ ] `docs/security.md` exists.
- [ ] `docs/environment.md` exists.
- [ ] `docs/testing.md` exists.
- [ ] `docs/workflow.md` exists.
- [ ] `docs/decisions.md` exists.
- [ ] `CHECKPOINTS.md` exists.
- [ ] `harness.config.example.json` exists.
- [ ] Agent contracts exist in `.opencode/agents/`.
- [ ] OpenCode commands exist in `.opencode/commands/`.
- [ ] `scripts/verify.sh --harness` passes.
- [ ] Project-specific checks are configured in `scripts/verify.sh --project` when applicable.

## C2 - State Coherence

- [ ] At most one feature is `in_progress`.
- [ ] The active feature in `features/index.json` matches `progress/STATUS.md`.
- [ ] The active feature has a log file at `progress/<FEATURE_ID_SLUG>-log.md`.
- [ ] No feature skipped required lifecycle states.
- [ ] Cancelled or blocked features include a documented reason.
- [ ] Feature dependencies are satisfied before implementation.

## C3 - Specification Quality

- [ ] `features/<FEATURE_ID_SLUG>.md` exists.
- [ ] Feature metadata includes status, quality gate, next gate, and owner role.
- [ ] The feature file has `## Requirements`, `## Design`, and `## Tasks`.
- [ ] Requirements are numbered with stable IDs.
- [ ] Requirements are verifiable.
- [ ] Out-of-scope items are explicit.
- [ ] Risks and assumptions are documented.
- [ ] The selected quality gate is documented.

## C4 - Implementation Quality

- [ ] Changes match the approved scope.
- [ ] Architecture boundaries are respected.
- [ ] No unrelated refactors were introduced.
- [ ] No unapproved dependency or stack change was introduced.
- [ ] Error handling is explicit.
- [ ] Sensitive data is protected.

## C5 - Verification

- [ ] Project verification command passes.
- [ ] Auto Test was executed when applicable.
- [ ] Auto Test evidence was recorded.
- [ ] Completion Checker was executed when applicable.
- [ ] Completion Checker evidence was recorded.
- [ ] Completion Checker did not exceed 3 failed cycles.
- [ ] If 3 cycles failed, a Completion Escalation Package was recorded.
- [ ] If escalated, the new model started from the escalation package instead of restarting from scratch.
- [ ] If Code Refiner ran, refinement evidence was recorded.
- [ ] If Code Refiner ran, Auto Test passed again after refinement.
- [ ] If Code Refiner ran, Completion Checker passed again after refinement.
- [ ] Feature-specific tests pass.
- [ ] Happy path verified.
- [ ] Validation errors verified.
- [ ] Permission/security behavior verified where applicable.
- [ ] Persistence behavior verified where applicable.
- [ ] Requirement-to-test traceability exists.
- [ ] Evidence is recorded in `progress/<FEATURE_ID_SLUG>-log.md`.

## C6 - Review

- [ ] Reviewer inspected Auto Test evidence when applicable.
- [ ] Reviewer inspected Completion Checker evidence when applicable.
- [ ] Reviewer inspected Code Refiner evidence when applicable.
- [ ] Reviewer inspected requirements coverage.
- [ ] Reviewer inspected tasks completion.
- [ ] Reviewer inspected architecture compliance.
- [ ] Reviewer inspected security and privacy.
- [ ] Reviewer inspected tests and verification output.
- [ ] Reviewer recorded result in the feature log.

## C7 - Session Closure

- [ ] `progress/STATUS.md` updated.
- [ ] `progress/<FEATURE_ID_SLUG>-log.md` updated when a feature was active.
- [ ] `git status` reviewed when Git is available.
- [ ] `git diff` reviewed when Git is available.
- [ ] Commit approved by user before committing.

## C8 - Template Instantiation

- [ ] Project name placeholders were replaced.
- [ ] Stack placeholders were replaced.
- [ ] Domain/data/API/UI/security placeholders were reviewed.
- [ ] Granular docs were either completed or explicitly marked not applicable.
- [ ] `F-00` is used as the real project foundation feature or was intentionally replaced.
- [ ] `harness.config.json` was created from `harness.config.example.json` when the real project starts.
- [ ] `features/_template.md` exists for future features.
- [ ] First real project feature is defined.
