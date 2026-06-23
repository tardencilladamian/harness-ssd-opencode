---
description: Guided setup for a new project using this template
agent: leader
---

# Guide the user through initializing this Harness SDD OpenCode template for a real project.

Follow:

- `AGENTS.md`
- `.agents/roles/leader.md`
- `README.md`
- `docs/workflow.md`
- `docs/adaptation.md`
- `docs/quality-gates.md`

Rules:

- Default to read-only.
- Do not edit files until the user approves the exact setup scope.
- Do not implement application code.
- Do not create real product features unless the user explicitly requests it.
- Focus on replacing placeholders and configuring verification.

Process:

1. Read `features/index.json`, `progress/current.md`, `README.md`, and `harness.config.example.json`.
2. Check for placeholders in docs, features, and progress files.
3. Check whether `harness.config.json` exists and whether it has project-specific values.
4. Ask the user for missing project basics:
   - Project name.
   - Short description.
   - Primary users.
   - Stack.
   - Database/storage.
   - Testing commands.
   - First real feature ID and title.
5. Propose exact files to update, including whether to create `harness.config.json` from `harness.config.example.json`.
6. Wait for approval before writing.
7. After approved updates, run `bash scripts/verify.sh`.
8. Recommend `/truth` as the next command.
9. Recommend preparing `F-00-project-foundation` before creating product features.

Model recommendation:

- Use a high-capability model for setup because project assumptions and architecture choices are still ambiguous.
