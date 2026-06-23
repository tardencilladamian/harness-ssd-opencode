# Decision - Use F-00 As Real Project Foundation

## Date

2026-06-23

## Status

approved

## Context

The template previously included `F-00-project-foundation` as a completed reference feature. After adding `features/_template/`, that reference role became redundant and potentially confusing.

A new project should not start with a fake completed foundation. The first foundation feature should be part of the real project setup.

## Decision

Convert `F-00-project-foundation` into the first real project feature.

`F-00` now represents the project foundation work required after copying the template:

- Create `harness.config.json`.
- Adapt project documentation.
- Configure real verification commands.
- Create the approved initial app/repo scaffold when applicable.
- Record verification and progress evidence.

`features/_template/` is now the structural reference for future features.

## Consequences

- New projects start with `F-00` in `pending`.
- Product features should normally start at `F-01` after F-00 is completed.
- The template no longer implies that project foundation work is already done.
- The onboarding flow becomes:

```text
/init -> /truth -> /specify F-00 -> /approve-spec F-00 -> /implement F-00
```
