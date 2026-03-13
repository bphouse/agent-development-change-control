#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: bash scripts/seed_project_governance.sh /path/to/project" >&2
  exit 1
fi

TARGET="$1"

echo "Seed guidance for $TARGET"
echo "1. Review the repository structure."
echo "2. Populate .ai-governance/project-brief.md."
echo "3. Identify protected files and functions."
echo "4. Define contracts for critical flows."
echo "5. Record a stable baseline in rollback-policy.md."
echo "6. Expand golden-dataset.md with must-pass scenarios."
