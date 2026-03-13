# Agent Startup

This repository uses repository-native governance. Do not rely on memory or repeated human prompting.

## Required startup order

1. Read `.ai-governance/project-brief.md`.
2. Read `.ai-governance/protected-core.md`.
3. Read `.ai-governance/contracts.md`.
4. If project governance is incomplete, read `.openclaw/task-prompts/bootstrap.md` and initialize governance first.
5. Before code changes, read `.openclaw/task-prompts/change-plan.md` and output `[CHANGE PLAN]`.
6. After changes, read `.openclaw/task-prompts/review.md` and output `[REVIEW SUMMARY]`.
7. Before merge or release, read `.openclaw/task-prompts/release-gate.md` and output `[RELEASE GATE RESULT]`.

## Operating rules

- Treat governance as required operating infrastructure.
- Do not rewrite protected core files wholesale.
- If protected core changes, output `[PROTECTED CHANGE JUSTIFICATION]`.
- Prefer minimal local patches over wide refactors.
