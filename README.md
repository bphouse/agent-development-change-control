# Agent Development Change Control

A reusable governance framework for agent-driven software development.

This repository provides:
- global agent operating rules
- project governance templates
- OpenClaw task prompt templates
- CI/CD gate templates
- project bootstrap and verification scripts
- a packaged ChatGPT skill for reuse

## Why this exists

AI agents can accelerate development, but they can also break stable code when changing too much too quickly. This repository helps teams enforce a safer operating model across projects.

## What it does

- installs governance files into every new project
- gives agents a standard pre-change / post-change / pre-release workflow
- protects architecture-critical behavior from accidental erosion
- provides templates for contracts, protected core, release checklists, and rollback policy
- connects governance to CI/CD gates

## Who should use it

- engineering managers
- platform teams
- DevOps
- architects
- teams adopting AI-agent-first development

## Core idea

Do not rely on repeated prompts.
Treat governance as infrastructure.

## Repository structure

```txt
agent-development-change-control/
  README.md
  docs/
  global/
  templates/
  scripts/
  skill/
  dist/
```

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
