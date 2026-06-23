# Requirements - F-00 Project Foundation

## Status

Pending project adaptation.

## Purpose

Adapt the reusable Harness template into the real project foundation before product features begin.

This is not a demo feature. It is the first real feature of a new project.

## R1

WHEN the project starts from this template, THE SYSTEM SHALL create or configure `harness.config.json` with the real project name, stack, verification commands, model strategy, and default quality gate.

## R2

WHEN setup is performed, THE SYSTEM SHALL replace project placeholders in the required documentation with real project-specific information.

## R3

WHEN the project has a selected stack, THE SYSTEM SHALL configure `scripts/verify-project.sh` with real project verification commands or document why they are not available yet.

## R4

WHEN the project requires application code scaffolding, THE SYSTEM SHALL create the approved initial repository/app structure for the selected stack.

## R5

WHEN F-00 is completed, THE SYSTEM SHALL prove that the reusable Harness checks and project-specific checks pass or record approved limitations.

## R6

WHEN the project foundation is complete, THE SYSTEM SHALL update progress files and evidence so future agents can continue from repository truth instead of chat memory.

## Out of Scope

- Product business features beyond project foundation.
- Production deployment automation unless explicitly approved.
- Payment, authentication, or domain behavior unless they are part of the approved foundation scope.
