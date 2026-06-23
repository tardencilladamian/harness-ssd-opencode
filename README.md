# Harness SDD OpenCode Template

Reusable Harness Engineering + Spec Driven Development structure for AI-assisted software projects.

This template is intentionally stack-agnostic. It can be used for web apps, APIs, CLIs, mobile apps, libraries, data projects, internal tools, or full product builds.

## What This Template Provides

- A neutral project operating system for AI agents.
- Spec Driven Development lifecycle.
- Adaptive setup for new projects through `harness.config.json`.
- Quality gates for light, standard, and critical flows.
- Human approval gates before implementation.
- One-feature-at-a-time execution.
- Requirement-to-test traceability.
- Persistent progress files that survive chat/session loss.
- Neutral agent role contracts in `.agents/roles/`.
- OpenCode adapters in `.opencode/agents/` and `.opencode/commands/`.

## Recommended Lifecycle

```text
pending
-> spec_ready
-> approved
-> in_progress
-> implemented
-> tested
-> completion_checked
-> code_refined
-> tested
-> completion_checked
-> reviewed
-> done
```

## First-Time Setup

1. Copy this template into your project root.
2. Make sure Bash is available.
   - Linux/macOS: use the system shell.
   - Windows: use Git Bash or WSL.
3. Copy the adaptive config:

```bash
cp harness.config.example.json harness.config.json
```

4. Replace placeholder values in:
   - `docs/project-overview.md`
   - `docs/architecture.md`
   - `docs/domain-model.md`
   - `docs/data-model.md`
   - `docs/api-contracts.md`
   - `docs/ui-system.md`
   - `docs/security.md`
   - `docs/environment.md`
   - `docs/testing.md`
   - `harness.config.json`
   - `features/index.json`
   - `progress/current.md`
   - `progress/history.md`
5. Keep `F-00-project-foundation` as a completed reference feature.
   - It shows how a complete feature spec/progress/review should look.
   - Your first real project feature should usually start at `F-01`.
6. Add project-specific checks in `scripts/verify-project.sh`.
   - Keep `scripts/verify.sh` as the reusable Harness verification entrypoint.
   - Use `scripts/verify-project.sh` for stack-specific commands such as `pnpm test`, `pytest`, or `go test ./...`.
7. Run:

```bash
bash scripts/verify.sh
```

8. Open the project with OpenCode.
9. Start with:

```text
/init
```

Then use `/truth` after the setup is customized.

## Main OpenCode Commands

| Command | Purpose |
|---|---|
| `/init` | Guided template setup and placeholder review |
| `/truth` | Read-only repo analysis and current-state report |
| `/status` | Current Harness SDD state summary |
| `/check` | Run verification and summarize results |
| `/analyze` | Technical/architecture analysis without implementation |
| `/new-feature F-XX "Title"` | Create a feature folder from `features/_template/` after approval |
| `/specify F-XX` | Draft or update a feature spec |
| `/approve-spec F-XX` | Mark a reviewed spec as approved |
| `/implement F-XX` | Implement an approved feature |
| `/auto-test F-XX` | Exhaustively test an implemented feature with real verification |
| `/completion-check F-XX` | Confirm the tested feature fully achieves its approved objective |
| `/escalate-completion F-XX` | Resume a blocked completion check with a higher-capability model |
| `/refine-code F-XX` | Refactor completed feature code without changing behavior |
| `/review F-XX` | Review implementation without editing |
| `/close-feature F-XX` | Close a reviewed feature and prepare commit summary |
| `/session-close` | Close the current work session without committing automatically |

## Adaptive Project Setup

This template is intended to stay reusable. Project-specific truth belongs in:

```text
harness.config.json
docs/project-overview.md
docs/architecture.md
docs/domain-model.md
docs/data-model.md
docs/security.md
docs/environment.md
docs/testing.md
scripts/verify-project.sh
```

Use:

```bash
bash scripts/new-feature.sh F-01 "Feature title"
```

to create a new feature folder from `features/_template/`.

## Quality Gates

Read `docs/quality-gates.md` before choosing the workflow intensity.

Recommended default:

```text
light    -> small docs or low-risk internal changes
standard -> normal product features
critical -> security, payments, database, permissions, private data, public visibility, shared modules
```

## Model Strategy

Recommended operating model:

```text
Think expensive. Build cheap. Verify always.
```

Use a high-capability model for `/init`, `/truth`, `/specify`, architecture, spec review, security review, and escalation.

Use a cost-efficient model for `/implement`, `/auto-test`, routine fixes, and evidence collection when the spec is complete.

Do not hardcode model names until the real project selects providers. Record chosen models in `harness.config.json`.

## Browser Testing Rule

When `/auto-test` tests UI behavior and Playwright is available, it must run Playwright in headed mode:

```bash
pnpm exec playwright test --headed
```

Use the project's package manager and equivalent command, but keep `--headed`.

## Completion Check Rule

After `/auto-test` passes, run `/completion-check` before `/review`.

`completion-checker` verifies that the feature actually achieves its approved purpose, requirements, acceptance criteria, and intended user outcome.

If the feature is incomplete, it returns precise instructions for `implementer`. After fixes, run `/auto-test` again before another `/completion-check`.

The loop is limited to 3 failed completion-check cycles. If the third cycle still fails, stop and consider switching to a higher-capability AI model before spending more budget.

After switching models, run:

```text
/escalate-completion F-XX
```

The new model must read the escalation package, identify why the previous cycles failed, and propose a correction plan before making changes.

## Code Refinement Rule

After a feature passes `/auto-test` and `/completion-check`, you may run:

```text
/refine-code F-XX
```

`code-refiner` improves code quality without changing behavior. It must propose a refactor plan before editing.

After refinement, run `/auto-test` and `/completion-check` again before `/review`.

## Core Rule

AI agents may read, inspect, and propose by default. They may not write, delete, move, rewrite, or commit files unless the user explicitly authorizes the exact scope.

## Placeholder Detection

`scripts/verify.sh` warns when common template placeholders remain, such as:

- `PROJECT_NAME`
- `YYYY-MM-DD`
- `Replace with`
- `ExampleEntity`
- `Placeholder`
- `User type 1`
- `Core feature area`
- `Out-of-scope item`

Warnings do not fail verification by default. To fail on placeholders, run:

```bash
HARNESS_STRICT_PLACEHOLDERS=1 bash scripts/verify.sh
```
