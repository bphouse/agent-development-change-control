# Repository Autopilot

Use this guide when the user wants a repository to teach an AI agent how to operate automatically without repeated prompting.

## Goal

Make the repository itself act as the agent's operating system.

## Required repository-native layers

1. Startup entry file
   - Example: `AGENT_STARTUP.md`
   - Purpose: define what the agent must read first and in what order.

2. Project governance files
   - `.ai-governance/project-brief.md`
   - `.ai-governance/protected-core.md`
   - `.ai-governance/contracts.md`
   - `.ai-governance/release-checklist.md`
   - Purpose: define project-specific constraints and release expectations.

3. Task prompt files
   - `.openclaw/task-prompts/bootstrap.md`
   - `.openclaw/task-prompts/change-plan.md`
   - `.openclaw/task-prompts/review.md`
   - `.openclaw/task-prompts/release-gate.md`
   - Purpose: make the agent follow a standard sequence instead of inventing its own flow.

4. CI gate
   - Verify governance files exist.
   - Block merge or release when governance gates fail.

## Recommended startup order

1. Read `AGENT_STARTUP.md`.
2. Read project governance files.
3. If governance is incomplete, run bootstrap before feature work.
4. Before code changes, output `[CHANGE PLAN]`.
5. After changes, output `[REVIEW SUMMARY]`.
6. Before merge or release, output `[RELEASE GATE RESULT]`.

## Principle

Do not rely on memory.
Do not rely on repeated manual prompts.
Do not treat governance as optional guidance.
Treat governance as repository infrastructure.
