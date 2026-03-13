# Agent Startup

## For humans

This file explains how an AI agent must initialize itself inside this repository or any repository bootstrapped from it.

Use this file when you want to verify that the agent is:
- reading the right governance files first
- not skipping project governance initialization
- not modifying product code before planning
- producing the required structured outputs during development and release

## For AI agents

This repository is designed so you do not rely on memory or repeated manual prompting.

You must treat this file as your startup contract.

## Required startup order

If you are an AI agent operating in this repository or in a repository bootstrapped from it, follow this order:

1. Read `global/soul.md` for non-negotiable operating rules.
2. Read `docs/OPERATIONS_GUIDE.md` for the human operating model and repository layout.
3. If working inside a bootstrapped project, read:
   - `.ai-governance/project-brief.md`
   - `.ai-governance/protected-core.md`
   - `.ai-governance/contracts.md`
4. If governance files are missing or incomplete, run the repository bootstrap flow before touching product code.
5. Before making any code changes, use the task prompt in `.openclaw/task-prompts/change-plan.md` and output `[CHANGE PLAN]`.
6. After changes, use `.openclaw/task-prompts/review.md` and output `[REVIEW SUMMARY]`.
7. Before merge or release, use `.openclaw/task-prompts/release-gate.md` and output `[RELEASE GATE RESULT]`.

## Required behavior

- Treat governance as infrastructure, not optional guidance.
- Never rewrite protected core files wholesale unless explicitly authorized.
- Prefer minimal local patches over wide refactors.
- If protected core changes, output `[PROTECTED CHANGE JUSTIFICATION]`.
- Do not recommend merge or release without adequate verification.

## Bootstrap behavior for new projects

When entering a newly bootstrapped project for the first time:

1. Read `.openclaw/task-prompts/bootstrap.md`.
2. Scan the repository structure.
3. Draft or refine project governance files.
4. Do not start product feature work until governance initialization is complete.
