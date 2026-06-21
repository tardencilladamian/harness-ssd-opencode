---
description: Guided setup for a new project using this template
agent: leader
---

# Guide the user through initializing this Harness SDD OpenCode template for a real project

Follow:

- `AGENTS.md`
- `.agents/roles/leader.md`
- `README.md`
- `docs/workflow.md`

Rules:

- Default to read-only.
- Do not edit files until the user approves the exact setup scope.
- Do not implement application code.
- Do not create real product features unless the user explicitly requests it.
- Focus on replacing placeholders and configuring verification.

Process:

1. Read `features/index.json`, `progress/current.md`, and `README.md`.
2. Check for placeholders in docs, features, and progress files.
3. Ask the user for missing project basics:
   - Project name.
   - Short description.
   - Primary users.
   - Stack.
   - Database/storage.
   - Testing commands.
   - First real feature ID and title.
4. Propose exact files to update.
5. Wait for approval before writing.
6. After approved updates, run `bash scripts/verify.sh`.
7. Recommend `/truth` as the next command.
