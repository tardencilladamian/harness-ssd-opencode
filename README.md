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
-> reviewed
-> done
```

## First-Time Setup

1. Copy this template into your project root.
2. Replace placeholder values in:
   - `docs/project-overview.md`
   - `docs/architecture.md`
   - `docs/environment.md`
   - `features/index.json`
   - `progress/current.md`
3. Adjust validation commands in `scripts/verify.sh`.
4. Open the project with OpenCode.
5. Start with:

```text
/truth
```

## Main OpenCode Commands

| Command | Purpose |
|---|---|
| `/truth` | Read-only repo analysis and current-state report |
| `/specify F-XX` | Draft or update a feature spec |
| `/approve-spec F-XX` | Mark a reviewed spec as approved |
| `/implement F-XX` | Implement an approved feature |
| `/review F-XX` | Review implementation without editing |
| `/close-feature F-XX` | Close a reviewed feature and prepare commit summary |

## Core Rule

AI agents may read, inspect, and propose by default. They may not write, delete, move, rewrite, or commit files unless the user explicitly authorizes the exact scope.
