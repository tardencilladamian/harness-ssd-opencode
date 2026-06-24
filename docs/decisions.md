# Decisions

This file stores approved technical and product decisions.

Use newest entries at the bottom. Do not rewrite old decisions; add a superseding decision instead.

## Template Decisions

### 2026-06-21 - Adopt Harness SDD OpenCode

Use a provider-neutral Harness SDD workflow with OpenCode command adapters.

### 2026-06-22 - Add Auto Test Agent

Add `auto-test` to verify implemented features with real evidence before review.

### 2026-06-23 - Add Completion Checker Agent

Add `completion-checker` between Auto Test and Reviewer with a 3-cycle failure limit and escalation path.

### 2026-06-23 - Add Code Refiner Agent

Add `code-refiner` after Completion Checker and before Reviewer for behavior-preserving code quality improvements.

### 2026-06-23 - Add Adaptive Harness

Add `harness.config.example.json`, quality gates, feature templates, and adaptive setup behavior.

### 2026-06-23 - Use F-00 As Real Project Foundation

Use `F-00-project-foundation` as the first real project foundation feature. Use `features/_template.md` as the reusable structure for F-01 and later.

### 2026-06-23 - Consolidate Harness V11

Use `CONTEXT.md` as consolidated project truth, `.opencode/agents/` as the only agent contract location, one markdown file per feature, and `progress/STATUS.md` plus feature logs for progress.

## Project Decisions

Add project-specific decisions here.
