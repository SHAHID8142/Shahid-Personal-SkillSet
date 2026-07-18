#!/usr/bin/env bash
# Bootstrap project-local .sps/ memory from SPS templates.
# Usage:
#   bash scripts/bootstrap-sps.sh [target-project-dir]
#   bash scripts/bootstrap-sps.sh --force [target-project-dir]

set -euo pipefail

FORCE=false
TARGET=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force|-f) FORCE=true; shift ;;
    --help|-h)
      echo "Usage: bash scripts/bootstrap-sps.sh [--force] [target-dir]"
      exit 0
      ;;
    *)
      TARGET="$1"
      shift
      ;;
  esac
done

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_DIR="$REPO/skills/sps/templates"
VERSION="$(tr -d '[:space:]' < "$REPO/skills/sps/VERSION" 2>/dev/null || echo "unknown")"
TARGET="${TARGET:-$PWD}"
DEST="$TARGET/.sps"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "Template directory missing: $TEMPLATE_DIR" >&2
  exit 1
fi

mkdir -p "$DEST"

copy_template() {
  local name="$1"
  local dest="$DEST/$name"
  if [[ -f "$dest" && "$FORCE" != true ]]; then
    echo "keep  $dest"
    return
  fi
  cp "$TEMPLATE_DIR/$name" "$dest"
  # Stamp version into newly written agent/profile/handoff when placeholders exist
  if [[ "$name" == "agent.md" || "$name" == "profile.md" || "$name" == "handoff.md" ]]; then
    if grep -q "Skill version:" "$dest"; then
      tmp="$(mktemp)"
      sed "s/Skill version:.*/Skill version: $VERSION/" "$dest" > "$tmp"
      mv "$tmp" "$dest"
    fi
  fi
  echo "write $dest"
}

copy_template "profile.md"
copy_template "handoff.md"
copy_template "mistakes.md"
copy_template "agent.md"
copy_template "audit-report.md"
copy_template "content-model.md"
copy_template "cms-foundation.md"
copy_template "cms-debt.md"
copy_template "design-system.md"
copy_template "architecture.md"
copy_template "section-registry.md"
copy_template "changelog-sps.md"

mkdir -p "$DEST/section-todos"
if [[ ! -f "$DEST/section-todos/README.md" || "$FORCE" == true ]]; then
  cat > "$DEST/section-todos/README.md" <<EOF
# Section todos

Create one file per section using skills/sps/TODO-FORMAT.md
EOF
  echo "write $DEST/section-todos/README.md"
fi

# Root mirrors (append lock if files missing or lack lock)
LOCK_BLOCK='## /sps lock
This project uses `/sps` as the master workflow.
Read `./.sps/profile.md`, `./.sps/handoff.md`, and the SPS Method Card before
building. Do not replace `/sps` with a host-default scaffolding workflow.
CMS-enabled sections must ship storefront + CMS controls together.'

for root_file in AGENTS.md GEMINI.md CLAUDE.md; do
  target="$TARGET/$root_file"
  if [[ ! -f "$target" ]]; then
    printf "%s
" "$LOCK_BLOCK" > "$target"
    echo "write $target"
  elif ! grep -q "/sps lock" "$target"; then
    printf "
%s
" "$LOCK_BLOCK" >> "$target"
    echo "append $target"
  else
    echo "keep  $target"
  fi
done

echo "Bootstrapped $DEST (SPS $VERSION)"
echo "Next: open the project in your agent and run /sps (or /sps audit, /sps sync)"
