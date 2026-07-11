#!/usr/bin/env bash
# SPS doctor — check whether /sps is installed across agents.
# Usage: bash scripts/sps-doctor.sh

set -euo pipefail

GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; DIM='\033[2m'; NC='\033[0m'

echo ""
echo -e "${CYAN}${BOLD}SPS Doctor${NC}"
echo -e "${DIM}Checking /sps presence and basics${NC}"
echo ""

ok()   { echo -e "  ${GREEN}✓${NC} $*"; }
bad()  { echo -e "  ${RED}✗${NC} $*"; }
info() { echo -e "  ${DIM}- $*${NC}"; }

VERSION="unknown"
if [[ -f "$HOME/.sps/src/Shahid-Personal-SkillSet/skills/sps/VERSION" ]]; then
  VERSION="$(tr -d '[:space:]' < "$HOME/.sps/src/Shahid-Personal-SkillSet/skills/sps/VERSION")"
elif [[ -f "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills/sps/VERSION" ]]; then
  VERSION="$(tr -d '[:space:]' < "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills/sps/VERSION")"
fi
info "SPS version reference: $VERSION"

command -v node >/dev/null && ok "Node.js $(node -v)" || bad "Node.js missing"
command -v npx  >/dev/null && ok "npx available" || bad "npx missing"
command -v git  >/dev/null && ok "git available" || bad "git missing"
command -v claude >/dev/null && ok "claude CLI found" || info "claude CLI not found (optional)"

echo ""
echo -e "${BOLD}Host skill paths${NC}"
check_skill() {
  local label="$1" path="$2"
  if [[ -f "$path/SKILL.md" ]]; then
    local ver="?"
    [[ -f "$path/VERSION" ]] && ver="$(tr -d '[:space:]' < "$path/VERSION")"
    ok "$label ($ver)  ${path/#$HOME/\~}"
  else
    bad "$label missing  ${path/#$HOME/\~}"
  fi
}

check_skill "Claude" "$HOME/.claude/skills/sps"
check_skill "Cursor" "$HOME/.cursor/skills/sps"
check_skill "Codex" "$HOME/.codex/skills/sps"
check_skill "Agents" "$HOME/.agents/skills/sps"
check_skill "Gemini config" "$HOME/.gemini/config/skills/sps"
check_skill "Antigravity" "$HOME/.gemini/antigravity/skills/sps"

echo ""
if [[ -f "$HOME/.sps/install-manifest.env" ]]; then
  ok "Install manifest present"
  info "$(grep '^PROFILE=' "$HOME/.sps/install-manifest.env" || true)"
else
  bad "Install manifest missing (run get-sps.sh / install.sh)"
fi

if [[ -d "$HOME/.sps/src/Shahid-Personal-SkillSet/.git" ]]; then
  ok "Source clone at ~/.sps/src/Shahid-Personal-SkillSet"
else
  info "No source clone yet — use: curl .../get-sps.sh | bash"
fi

echo ""
echo -e "${BOLD}Next commands${NC}"
info "Install/update:  curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash"
info "Doctor again:     bash scripts/sps-doctor.sh"
info "In a project:     /sps   or   /sps audit"
echo ""
