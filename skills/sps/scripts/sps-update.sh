#!/usr/bin/env bash
# SPS update — pull latest source clone and reinstall.
# Usage:
#   bash scripts/sps-update.sh
#   bash scripts/sps-update.sh --profile core --yes

set -euo pipefail

REPO_DIR="${SPS_REPO_DIR:-$HOME/.sps/src/Shahid-Personal-SkillSet}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -f "$ROOT/get-sps.sh" ]]; then
  exec bash "$ROOT/get-sps.sh" "$@"
fi

if [[ -f "$REPO_DIR/get-sps.sh" ]]; then
  exec bash "$REPO_DIR/get-sps.sh" "$@"
fi

echo "get-sps.sh not found. Run the one-command installer first:"
echo "  curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash"
exit 1
