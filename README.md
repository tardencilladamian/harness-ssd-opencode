# Harness SDD OpenCode Template

Reusable Harness Engineering + Spec Driven Development structure for AI-assisted software projects.

This template is intentionally stack-agnostic. It can be used for web apps, APIs, CLIs, mobile apps, libraries, data projects, internal tools, or full product builds.

## What This Template Provides

- A neutral project operating system for AI agents.
- Spec Driven Development lifecycle.
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
-> reviewed
-> done
```

## First-Time Setup

1. Copy this template into your project root.
2. Make sure Bash is available.
   - Linux/macOS: use the system shell.
   - Windows: use Git Bash or WSL.
3. Replace placeholder values in:
   - `docs/project-overview.md`
   - `docs/architecture.md`
   - `docs/domain-model.md`
   - `docs/data-model.md`
   - `docs/api-contracts.md`
   - `docs/ui-system.md`
   - `docs/security.md`
   - `docs/environment.md`
   - `docs/testing.md`
   - `features/index.json`
   - `progress/current.md`
   - `progress/history.md`
4. Keep `F-00-project-foundation` as a completed reference feature.
   - It shows how a complete feature spec/progress/review should look.
   - Your first real project feature should usually start at `F-01`.
5. Add project-specific checks in `scripts/verify-project.sh`.
   - Keep `scripts/verify.sh` as the reusable Harness verification entrypoint.
   - Use `scripts/verify-project.sh` for stack-specific commands such as `pnpm test`, `pytest`, or `go test ./...`.
6. Run:

```bash
bash scripts/verify.sh
```

7. Open the project with OpenCode.
8. Start with:

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
| `/specify F-XX` | Draft or update a feature spec |
| `/approve-spec F-XX` | Mark a reviewed spec as approved |
| `/implement F-XX` | Implement an approved feature |
| `/auto-test F-XX` | Exhaustively test an implemented feature with real verification |
| `/review F-XX` | Review implementation without editing |
| `/close-feature F-XX` | Close a reviewed feature and prepare commit summary |

## Browser Testing Rule

When `/auto-test` tests UI behavior and Playwright is available, it must run Playwright in headed mode:

```bash
pnpm exec playwright test --headed
```

Use the project's package manager and equivalent command, but keep `--headed`.

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
