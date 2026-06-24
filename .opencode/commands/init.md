---
description: Guided setup for a new project using this template
agent: leader
---

# Guide the user through initializing this Harness SDD OpenCode template for a real project

Follow:

- `AGENTS.md`
- `.opencode/agents/leader.md`
- `README.md`
- `docs/workflow.md`
- `docs/index.md`
- `CONTEXT.md`

Rules:

- Default to read-only.
- Do not edit files until the user approves the exact setup scope.
- Do not implement application code.
- Do not create real product features unless the user explicitly requests it.
- Focus on replacing placeholders and configuring verification.

Process:

1. Read `features/index.json`, `progress/STATUS.md`, `README.md`, `docs/index.md`, and `harness.config.example.json`.
2. Check for placeholders in `CONTEXT.md`, granular docs, features, and progress files.
3. Check whether `harness.config.json` exists and whether it has project-specific values.
4. Ask the user for missing project basics:
   - Project name.
   - Short description.
   - Primary users.
   - Stack.
   - Database/storage.
   - Testing commands.
   - F-00 implementation scope.
5. Confirm dependency policy:
   - Latest stable compatible packages by default.
   - No prerelease packages unless approved.
   - Registry or official documentation verification required before install.
6. Propose exact files to update, including granular docs and whether to create `harness.config.json` from `harness.config.example.json`.
7. Wait for approval before writing.
8. After approved updates, run `bash scripts/verify.sh --all`.
9. Recommend `/truth` as the next command.
10. Recommend preparing `F-00-project-foundation` before creating product features.
