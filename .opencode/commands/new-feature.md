---
description: Create a new feature folder from the reusable feature template
agent: leader
---

# Prepare a new Harness feature

```text
$ARGUMENTS
```

Expected arguments:

```text
F-XX "Feature title"
```

Follow:

- `AGENTS.md`
- `.opencode/agents/leader.md`
- `docs/workflow.md`
- `features/_template.md`

Rules:

- Do not create files until the user explicitly approves the new feature ID, title, and scope.
- Confirm the feature ID is not already used in `features/index.json`.
- Confirm no other feature is `in_progress`.
- After approval, use:

```bash
bash scripts/new-feature.sh F-XX "Feature title"
```

- Propose the required `features/index.json` entry.
- Do not mark the feature `approved` or `in_progress`.
- Recommend `/specify F-XX` as the next command.
