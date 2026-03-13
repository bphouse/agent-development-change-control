#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: bash scripts/bootstrap_project.sh /path/to/project" >&2
  exit 1
fi

TARGET="$1"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

mkdir -p "$TARGET/.ai-governance"
mkdir -p "$TARGET/.openclaw/task-prompts"
mkdir -p "$TARGET/.github/workflows"

cp -f "$ROOT_DIR/templates/AGENT_STARTUP.md" "$TARGET/AGENT_STARTUP.md"
cp -f "$ROOT_DIR/templates/.ai-governance/"* "$TARGET/.ai-governance/"
cp -f "$ROOT_DIR/templates/.openclaw/task-prompts/"* "$TARGET/.openclaw/task-prompts/"
cp -f "$ROOT_DIR/templates/.github/workflows/"* "$TARGET/.github/workflows/"

echo "[OK] governance templates installed into $TARGET"
echo "[OK] agent startup file installed at $TARGET/AGENT_STARTUP.md"
