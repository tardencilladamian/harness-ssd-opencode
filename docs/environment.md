# Environment

This file defines local setup, runtime versions, services, variables, and commands.

## Runtime

- Node:
- Package manager:
- Backend runtime:
- Database:
- Browser tooling:

## Services

| Service | Purpose | Required locally? |
|---|---|---|
| Example service | Replace with purpose | Yes |

## Environment Variables

| Variable | Purpose | Required? | Secret? |
|---|---|---|---|
| EXAMPLE_VAR | Replace with purpose | Yes | No |

## Setup Commands

```bash
# Replace with setup commands
```

## Dependency Installation Policy

- Use the project package manager.
- Install the latest stable compatible package versions by default.
- Verify package names and versions through the package manager registry or official docs before installation.
- Do not install prerelease, deprecated, or unmaintained packages unless explicitly approved.
- Preserve lockfiles.
- Record install commands and resulting versions in the feature log when dependencies are added.

Example registry checks:

```bash
npm view <package> version
pnpm info <package> version
```

## Development Commands

```bash
# Replace with development commands
```

## Verification Commands

Project-specific commands should be wired into:

```bash
bash scripts/verify.sh --project
```

## Troubleshooting

| Problem | Check | Fix |
|---|---|---|
| Example problem | Replace with check | Replace with fix |

## Open Questions

- Replace with unresolved environment questions.
