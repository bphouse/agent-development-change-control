# Agent Development Change Control

## For humans

**Agent Development Change Control** is a governance framework for **agent-driven software development**.

Use this repository to:
- bootstrap project governance into new repositories
- protect architecture-critical behavior from accidental erosion
- standardize pre-change planning, post-change review, and pre-release decision gates
- give OpenClaw-style agents a repository-native startup order
- connect governance rules to CI/CD checks and release safety

This repository is intended for:
- engineering managers
- platform teams
- DevOps
- architects
- project owners
- teams adopting AI-agent-first development

## For AI agents

**Agent Development Change Control** defines your required operating model inside this repository and any repository bootstrapped from it.

You must:
1. read the governance entry files first
2. read the project governance files before touching product code
3. produce a structured `[CHANGE PLAN]` before changes
4. avoid rewriting protected core behavior without explicit justification
5. produce a structured `[REVIEW SUMMARY]` after changes
6. produce a structured `[RELEASE GATE RESULT]` before merge or release
7. treat governance as required operating infrastructure, not optional guidance

## Why this exists

AI agents can accelerate development, but they can also break stable code when changing too much too quickly. This repository helps teams enforce a safer operating model across projects.

## What it does

- installs governance files into every new project
- gives agents a standard pre-change / post-change / pre-release workflow
- protects architecture-critical behavior from accidental erosion
- provides templates for contracts, protected core, release checklists, and rollback policy
- connects governance to CI/CD gates
- gives agents a repository-native startup order so they can automatically load and follow the right rules

## Core idea

Do not rely on repeated prompts.
Treat governance as infrastructure.

## Repository structure

```txt
agent-development-change-control/
  README.md
  AGENT_STARTUP.md
  docs/
  global/
  templates/
  scripts/
  skill/
  dist/
```

## Agent startup order

If an AI agent is operating in this repository, or in a repository bootstrapped from it, it should follow this order:

1. Read `AGENT_STARTUP.md`
2. Read `global/soul.md`
3. Read `docs/OPERATIONS_GUIDE.md`
4. In a target project, read:
   - `.ai-governance/project-brief.md`
   - `.ai-governance/protected-core.md`
   - `.ai-governance/contracts.md`
5. Before changes, use `.openclaw/task-prompts/change-plan.md`
6. After changes, use `.openclaw/task-prompts/review.md`
7. Before merge or release, use `.openclaw/task-prompts/release-gate.md`

This ensures the agent can automatically understand and operate the governance model from the repository itself.

## Quick start

### 1. Bootstrap a project

```bash
bash scripts/bootstrap_project.sh /path/to/your-project
```

### 2. Verify governance files are installed

```bash
bash scripts/verify_governance.sh /path/to/your-project
```

### 3. Seed initial project governance

```bash
bash scripts/seed_project_governance.sh /path/to/your-project
```

## Included deliverables

- `AGENT_STARTUP.md`: repository-native startup order for agents
- `docs/OPERATIONS_GUIDE.md`: human-facing deployment and operations guide
- `global/soul.md`: global agent rules for OpenClaw-style agents
- `templates/.ai-governance/*`: project governance templates
- `templates/.openclaw/task-prompts/*`: task prompt templates
- `templates/.github/workflows/*`: CI gate templates
- `skill/agent-development-change-control/*`: uploadable skill source
- `dist/skill.zip`: packaged skill bundle

## Suggested rollout model

1. Adopt `global/soul.md` as the organization-wide agent rule layer.
2. Run the bootstrap script on every new repository.
3. Let the agent seed the first draft of project governance files.
4. Require change-plan, review, and release-gate outputs for all meaningful changes.
5. Wire CI checks to block merges when governance gates fail.

## Naming

- skill name: `agent-development-change-control`
- display name: `Agent Development Change Control`

## License

Use your organization's preferred license before publishing externally.
