# Agent Development Change Control: Operations Guide

## Purpose

This guide explains how to deploy and operate a reusable governance system for AI-agent-assisted software development.

The goal is to make governance automatic across projects so teams do not have to repeat instructions by hand for every agent task.

## What this system installs

Each project receives four persistent layers:

1. Global agent rules via your agent platform configuration.
2. Project governance files inside the repository.
3. Repository-native task prompts for agents.
4. CI/CD enforcement to block unsafe changes.

## Recommended project layout after bootstrap

```txt
your-project/
  AGENT_STARTUP.md
  .ai-governance/
    project-brief.md
    protected-core.md
    contracts.md
    golden-dataset.md
    release-checklist.md
    rollback-policy.md
  .openclaw/
    task-prompts/
      bootstrap.md
      change-plan.md
      review.md
      release-gate.md
  .github/
    workflows/
      governance-check.yml
      release-gate.yml
```

## Agent auto-operation model

The repository must make the operating order explicit so the agent can self-load the right rules.

### Required startup order

1. Read `AGENT_STARTUP.md`.
2. Read `.ai-governance/project-brief.md`.
3. Read `.ai-governance/protected-core.md`.
4. Read `.ai-governance/contracts.md`.
5. If governance is incomplete, run the bootstrap prompt before product changes.
6. Before code changes, output `[CHANGE PLAN]`.
7. After changes, output `[REVIEW SUMMARY]`.
8. Before merge or release, output `[RELEASE GATE RESULT]`.

This means the agent does not need repeated human prompting. The repository itself becomes the operating system for the agent workflow.

## Deployment steps

### Step 1: Set global agent rules

Use `global/soul.md` as the base policy for your agent runtime. Keep this global layer short and strict.

### Step 2: Bootstrap each repository

Run:

```bash
bash scripts/bootstrap_project.sh /path/to/project
```

This copies governance templates, task prompts, workflow templates, and `AGENT_STARTUP.md` into the target repository.

### Step 3: Verify installation

Run:

```bash
bash scripts/verify_governance.sh /path/to/project
```

The script checks that the expected governance files, startup file, prompt files, and workflow files exist.

### Step 4: Seed project-specific governance

Run:

```bash
bash scripts/seed_project_governance.sh /path/to/project
```

This produces starter guidance and tells the agent or reviewer how to populate protected core, contracts, and release details.

### Step 5: Enforce the workflow

Require agents to follow this sequence:

1. Output `[CHANGE PLAN]` before modifying code.
2. Output `[CHANGE RESULT]` after changes.
3. Output `[REVIEW SUMMARY]` to assess regression risk.
4. Output `[RELEASE GATE RESULT]` before release or merge.

## Ownership model

### Engineering leadership
- approve organization-wide rollout
- decide governance policy changes

### Platform / DevOps
- maintain scripts and workflow templates
- maintain global rules
- own CI enforcement

### Project tech leads
- maintain protected core definitions
- maintain contracts and release rules
- review high-risk changes

### Project teams
- keep governance files current
- expand golden dataset coverage
- use the workflow consistently

## Maintenance cadence

### Monthly
- check which repositories are missing governance
- review whether protected-core and contracts are stale
- confirm `AGENT_STARTUP.md` still reflects the intended operating order

### Quarterly
- update templates based on incidents and learnings
- expand smoke and regression expectations

## Incident response

If an agent-driven regression escapes:

1. Roll back to the last known stable baseline.
2. Update `release-checklist.md`.
3. Tighten `protected-core.md` or `contracts.md`.
4. Add a missing guard, smoke test, or contract test.
5. Update global rules if the failure mode is general.

## Principle

Do not treat governance as a prompt.
Treat governance as infrastructure.
