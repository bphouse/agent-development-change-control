#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: bash scripts/verify_governance.sh /path/to/project" >&2
  exit 1
fi

TARGET="$1"
REQ_FILES=(
  ".ai-governance/project-brief.md"
  ".ai-governance/protected-core.md"
  ".ai-governance/contracts.md"
  ".ai-governance/golden-dataset.md"
  ".ai-governance/release-checklist.md"
  ".ai-governance/rollback-policy.md"
  ".openclaw/task-prompts/bootstrap.md"
  ".openclaw/task-prompts/change-plan.md"
  ".openclaw/task-prompts/review.md"
  ".openclaw/task-prompts/release-gate.md"
  ".github/workflows/governance-check.yml"
  ".github/workflows/release-gate.yml"
)

MISSING=0
for f in "${REQ_FILES[@]}"; do
  if [ ! -f "$TARGET/$f" ]; then
    echo "[MISSING] $f"
    MISSING=1
  fi
done

if [ "$MISSING" -ne 0 ]; then
  echo "governance verification failed" >&2
  exit 1
fi

echo "[OK] governance verification passed"
