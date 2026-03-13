#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: bash scripts/seed_project_governance.sh /path/to/project" >&2
  exit 1
fi

TARGET="$1"

cat <<MSG
Seed guidance for $TARGET

Startup order for the agent:
1. Read AGENT_STARTUP.md
2. Read .ai-governance/project-brief.md
3. Read .ai-governance/protected-core.md
4. Read .ai-governance/contracts.md
5. Use .openclaw/task-prompts/bootstrap.md if governance is incomplete

Governance seeding checklist:
1. Review the repository structure.
2. Populate .ai-governance/project-brief.md.
3. Identify protected files and functions.
4. Define contracts for critical flows.
5. Record a stable baseline in rollback-policy.md.
6. Expand golden-dataset.md with must-pass scenarios.
7. Confirm AGENT_STARTUP.md matches the intended operating order.
MSG
