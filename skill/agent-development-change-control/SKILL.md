---
name: agent-development-change-control
description: governance framework for agent-driven software development. use when chatgpt or an ai agent needs to plan a code change, control development scope, review a diff against protected behavior, prevent regressions, define project governance overlays, or decide whether a software change is safe to merge or release.
---

# Agent Development Change Control

Use this skill as a governance layer for agent-driven software development. Treat it as a control plane for three phases: before a change, after a change, and before release.

## Core responsibilities

1. Scope the requested change before code is modified.
2. Protect architecture-critical behavior from accidental erosion.
3. Review diffs against explicit contracts instead of vague intent.
4. Decide whether a change is safe to merge or release.
5. Help create project-specific governance overlays when needed.

## Workflow

### 1. Before a change
When the user asks an AI agent to build, modify, refactor, or fix code:
- Identify the requested goal.
- Separate likely affected files from protected files.
- Determine whether the request touches protected core behavior.
- Produce a structured change plan using the template in `references/change-templates.md`.
- Keep the proposal local and minimal. Avoid endorsing whole-file rewrites unless the user explicitly requires them.

### 2. After a change
When the user provides code, a patch, a diff, a PR summary, or asks whether a change is safe:
- Review scope, contract impact, and regression risk.
- Check whether the change touched protected core behavior.
- Check whether required tests were added, updated, or bypassed.
- Produce a structured review using the template in `references/change-templates.md`.

### 3. Before release
When the user asks whether a change can ship, whether a release is safe, or how to block regressions:
- Evaluate static guard requirements.
- Evaluate contract, integration, and smoke-test expectations.
- Produce a release gate result using the template in `references/change-templates.md`.
- Default to blocking release when protected behavior changed without adequate verification.

## Operating model

### Protected core first
Treat the following as protected by default unless the project defines otherwise:
- routing and dispatch logic
- authentication, authorization, and session persistence
- data integrity and source-of-truth logic
- output contracts relied on by downstream systems
- download, export, and transmission compatibility behavior
- fallback and error-handling paths that preserve safety or compatibility

If a request appears to touch protected core behavior, require explicit justification and stronger verification.

### Contract-based reasoning
Do not rely on statements like "this should still work" or "I only cleaned things up". Evaluate changes against explicit behavior contracts.

Minimum contract categories:
- interface contract
- behavioral contract
- compatibility contract
- release gate expectations

Use `references/governance-reference.md` for default governance rules and `references/project-onboarding.md` for project-specific overlays.

### Minimal-change bias
Prefer the smallest patch that satisfies the request while preserving compatibility. Flag these as high risk:
- whole-file rewrites
- removal of complex conditionals or fallback logic
- collapsing multiple execution paths into one path
- renaming or reformatting outputs relied on by clients
- changing session, auth, or download behavior without tests

## Output rules

Use the exact structured blocks from `references/change-templates.md` when relevant:
- `[CHANGE PLAN]`
- `[PROTECTED CHANGE JUSTIFICATION]`
- `[CHANGE RESULT]`
- `[REVIEW SUMMARY]`
- `[RELEASE GATE RESULT]`

Choose the block that matches the user's stage. If the request spans multiple stages, output multiple blocks in order.

## Project-specific overlays

If the user is defining governance for a specific project, help them derive:
- project protected core list
- project contracts
- golden dataset expectations
- release checklist
- rollback target and stable baseline rules

Use `references/project-onboarding.md` to structure this work.

## Decision defaults

- If protected behavior changes and verification is weak, block release.
- If scope is unclear, narrow the change instead of widening it.
- If the user wants agent-first development, optimize for explicit constraints, standard templates, and reviewable outputs.
- If a project lacks governance documents, bootstrap them from the references in this skill.
