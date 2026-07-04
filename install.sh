#!/usr/bin/env bash
# Shahid Personal SkillSet install (Mac / Linux)
# Usage:
#   bash install.sh --profile minimal
#   bash install.sh --profile balanced
#   bash install.sh --profile full

set -uo pipefail

export GIT_TERMINAL_PROMPT=0
export GIT_SSH_COMMAND="ssh -oBatchMode=yes -oStrictHostKeyChecking=no"
export GIT_CLONE_PROTECTION_ACTIVE=false
export npm_config_yes=true
export CI=1
export npm_config_cache="${HOME}/.sps/npm-cache"
export NPX_NO_UPDATE_NOTIFIER=1

NETWORK_TIMEOUT=90
PROFILE="balanced"
AGENTS="*"
MANIFEST="$HOME/.sps/install-manifest.env"
MANAGED_SKILLS=("sps")
CLAUDE_PLUGINS=()
CLAUDE_MARKETPLACES=()
USE_CONTEXT7=0
USE_GRAPHIFY=0
SYNC_PATHS=(
  "$HOME/.claude/skills"
  "$HOME/.cursor/skills"
  "$HOME/.codex/skills"
  "$HOME/.agents/skills"
  "$HOME/.config/agents/skills"
  "$HOME/.gemini/config/skills"
  "$HOME/.gemini/skills"
  "$HOME/.gemini/antigravity/skills"
  "$HOME/.gemini/antigravity-cli/skills"
)

usage() {
  cat <<'EOF'
Usage: bash install.sh [--profile minimal|balanced|full] [--agents '*'|agent1,agent2]

Profiles:
  minimal   Install /sps only
  balanced  Install /sps plus curated portable specialist skills
  full      Install balanced profile plus optional Claude/MCP/graphify extras

Agents:
  *         Install to the curated mainstream set: claude-code,cursor,codex,antigravity,antigravity-cli,universal
  list      Comma-separated subset, e.g. claude-code,cursor,codex,antigravity,antigravity-cli
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile|-p)
      PROFILE="${2:-}"
      shift 2
      ;;
    --agents|-a)
      AGENTS="${2:-}"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1"
      usage
      exit 1
      ;;
  esac
done

case "$PROFILE" in
  minimal|balanced|full) ;;
  *)
    echo "Invalid profile: $PROFILE"
    usage
    exit 1
    ;;
esac

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; BOLD='\033[1m'; DIM='\033[2m'; NC='\033[0m'
INSTALLED=0; FAILED=0; STEP=0
LOG_DIR="$HOME/.sps"
LOG="$LOG_DIR/install.log"
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$LOG_DIR/learned"
: > "$LOG"

section() { echo ""; echo -e "${BOLD}-- $* --${NC}"; }
note()    { echo -e "${DIM}  $*${NC}"; }
have()    { command -v "$1" >/dev/null 2>&1; }

build_agent_args() {
  AGENT_ARGS=()
  if [[ "$AGENTS" == "*" ]]; then
    AGENT_ARGS=(--agent "claude-code" --agent "cursor" --agent "codex" --agent "antigravity" --agent "antigravity-cli" --agent "universal")
    return
  fi
  IFS=',' read -r -a _agents <<< "$AGENTS"
  for agent in "${_agents[@]}"; do
    [[ -n "$agent" ]] && AGENT_ARGS+=(--agent "$agent")
  done
}

run_timeout() {
  local secs="$1"; shift
  local out_file="$1"; shift
  "$@" >"$out_file" 2>&1 &
  local cmd_pid=$!
  ( sleep "$secs"; kill -TERM "$cmd_pid" 2>/dev/null; sleep 2; kill -KILL "$cmd_pid" 2>/dev/null ) >/dev/null 2>&1 &
  local watch_pid=$!
  wait "$cmd_pid" 2>/dev/null; local rc=$?
  kill -TERM "$watch_pid" 2>/dev/null; wait "$watch_pid" 2>/dev/null
  return $rc
}

step() {
  local label="$1"; shift
  STEP=$((STEP+1))
  local start=$SECONDS
  local tmp_out="$LOG_DIR/.step.out"
  printf "${YELLOW}->${NC} [%02d] %s ... " "$STEP" "$label"
  : > "$tmp_out"
  if run_timeout "$NETWORK_TIMEOUT" "$tmp_out" "$@"; then
    cat "$tmp_out" >> "$LOG"
    echo -e "${GREEN}done${NC} ${DIM}($((SECONDS-start))s)${NC}"
    INSTALLED=$((INSTALLED+1))
  else
    cat "$tmp_out" >> "$LOG"
    echo -e "${RED}failed${NC} ${DIM}($((SECONDS-start))s)${NC}"
    echo -e "${YELLOW}   > Error snippet:${NC}"
    tail -n 3 "$tmp_out" | while read -r line; do echo "     $line"; done
    FAILED=$((FAILED+1))
    echo "FAILED: $label" >> "$LOG"
  fi
}

seed_global_memory() {
  [ -f "$HOME/.sps/personal-defaults.md" ] || cat > "$HOME/.sps/personal-defaults.md" <<'EOF'
# SPS Personal Defaults

Only put rules here when the user explicitly says they should apply across
future projects.

## Preferred tools
- Package manager:
- Preferred deploy:

## Preferred workflow
- Review style:
- Commit style:

## Explicit global approvals
-

## Explicit global rejections
-
EOF

  [ -f "$HOME/.sps/global-mistakes.md" ] || cat > "$HOME/.sps/global-mistakes.md" <<'EOF'
# SPS Global Mistakes

Use this file only for mistakes that should not be repeated across projects.
EOF

  [ -f "$HOME/.sps/learned/INDEX.md" ] || cat > "$HOME/.sps/learned/INDEX.md" <<'EOF'
# SPS Learned Topics

Shared research notes saved here.
EOF
}

write_manifest() {
  local managed="" claude_plugins="" claude_marketplaces=""
  if ((${#MANAGED_SKILLS[@]})); then
    managed=$(IFS=,; echo "${MANAGED_SKILLS[*]}")
  fi
  if ((${#CLAUDE_PLUGINS[@]})); then
    claude_plugins=$(IFS=,; echo "${CLAUDE_PLUGINS[*]}")
  fi
  if ((${#CLAUDE_MARKETPLACES[@]})); then
    claude_marketplaces=$(IFS=,; echo "${CLAUDE_MARKETPLACES[*]}")
  fi
  mkdir -p "$HOME/.sps"
  cat > "$MANIFEST" <<EOF
PROFILE=$PROFILE
AGENTS=$AGENTS
MANAGED_SKILLS=$managed
CLAUDE_PLUGINS=$claude_plugins
CLAUDE_MARKETPLACES=$claude_marketplaces
USE_CONTEXT7=$USE_CONTEXT7
USE_GRAPHIFY=$USE_GRAPHIFY
SYNC_PATHS=$(IFS=,; echo "${SYNC_PATHS[*]}")
EOF
}

sync_core_skill() {
  local src="$REPO/skills/sps"
  if [ ! -d "$src" ]; then
    note "skills/sps not found - run from repo root"
    return
  fi
  for dest_root in "${SYNC_PATHS[@]}"; do
    if mkdir -p "$dest_root" 2>/dev/null; then
      rm -rf "$dest_root/sps"
      cp -R "$src" "$dest_root/"
      note "+ synced /sps to ${dest_root/#$HOME/\~}/sps"
    else
      note "- could not sync /sps to ${dest_root/#$HOME/\~}"
    fi
  done
}

add_context7() {
  local out
  out=$(claude mcp add --scope project context7 -- npx -y @upstash/context7-mcp 2>&1)
  local rc=$?
  if [ $rc -ne 0 ] && printf '%s' "$out" | grep -q "already exists"; then
    echo "MCP server context7 already exists"
    return 0
  fi
  printf '%s\n' "$out"
  return $rc
}

echo ""
echo "+==================================================================+"
echo "| Shahid Personal SkillSet install                                 |"
printf "| Profile: %-55s |\n" "$PROFILE"
printf "| Agents: %-56s|\n" "$AGENTS"
echo "+==================================================================+"

section "Prerequisites"
have node   && note "Node.js $(node -v)" || { echo "Node.js required: https://nodejs.org"; exit 1; }
have npx    && note "npx available"      || { echo "npx required (ships with Node.js)"; exit 1; }
have claude && note "claude CLI found"   || note "claude CLI not found - Claude extras will be skipped"
have uv     && note "uv found"           || note "uv not found - graphify may use pip"
have pip    && note "pip found"          || note "pip not found"
build_agent_args

section "Core"
step "/sps core skill" npx skills add "$REPO" -g --copy -y "${AGENT_ARGS[@]}"

if [[ "$PROFILE" != "minimal" ]]; then
  section "Balanced portable stack"
  MANAGED_SKILLS+=(hallmark impeccable taste-skill webapp-testing web-design-guidelines vercel-react-best-practices vercel-composition-patterns)
  step "hallmark" npx skills add nutlope/hallmark -g -y "${AGENT_ARGS[@]}"
  step "impeccable" npx skills add pbakaus/impeccable -g -y "${AGENT_ARGS[@]}"
  step "taste-skill" npx skills add Leonxlnx/taste-skill -g -y "${AGENT_ARGS[@]}"
  step "webapp-testing" npx skills add https://github.com/anthropics/skills --skill webapp-testing -g -y "${AGENT_ARGS[@]}"
  step "web-design-guidelines" npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines -g -y "${AGENT_ARGS[@]}"
  step "vercel-react-best-practices" npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -g -y "${AGENT_ARGS[@]}"
  step "vercel-composition-patterns" npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-composition-patterns -g -y "${AGENT_ARGS[@]}"
fi

if [[ "$PROFILE" == "full" ]]; then
  section "Optional specialists"
  MANAGED_SKILLS+=(astro-framework webgpu-claude-skill)
  step "astro-framework" npx skills add withastro/astro -g -y "${AGENT_ARGS[@]}"
  step "webgpu-claude-skill" npx skills add dgreenheck/webgpu-claude-skill -g -y "${AGENT_ARGS[@]}"

  if have claude; then
    section "Claude extras"
    CLAUDE_MARKETPLACES+=(shahid-personal-skillset ui-ux-pro-max-skill claude-code-skills)
    CLAUDE_PLUGINS+=(universal-build-orchestrator@shahid-personal-skillset ui-ux-pro-max@ui-ux-pro-max-skill engineering-skills@claude-code-skills engineering-advanced-skills@claude-code-skills marketing-skills@claude-code-skills a11y-audit@claude-code-skills docker-development@claude-code-skills)
    step "/sps Claude marketplace" claude plugin marketplace add "$REPO"
    step "/sps Claude plugin" claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope project
    step "ui-ux-pro-max marketplace" claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
    step "ui-ux-pro-max" claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope project
    step "claude-code-skills marketplace" claude plugin marketplace add alirezarezvani/claude-skills
    step "engineering-skills" claude plugin install engineering-skills@claude-code-skills --scope project
    step "engineering-advanced-skills" claude plugin install engineering-advanced-skills@claude-code-skills --scope project
    step "marketing-skills" claude plugin install marketing-skills@claude-code-skills --scope project
    step "a11y-audit" claude plugin install a11y-audit@claude-code-skills --scope project
    step "docker-development" claude plugin install docker-development@claude-code-skills --scope project
    USE_CONTEXT7=1
    step "Context7 MCP" add_context7
  else
    note "Claude extras skipped because claude CLI was not found"
  fi

  section "Optional research tools"
  if have uv; then
    USE_GRAPHIFY=1
    step "graphify" bash -c 'uv tool install graphifyy && graphify install'
  elif have pip; then
    USE_GRAPHIFY=1
    step "graphify (pip)" bash -c 'pip install graphifyy && graphify install'
  else
    note "graphify skipped because neither uv nor pip is available"
  fi
fi

section "Shared setup"
seed_global_memory
note "Seeded ~/.sps/personal-defaults.md, ~/.sps/global-mistakes.md, and ~/.sps/learned/INDEX.md"
sync_core_skill
write_manifest
note "Wrote install manifest to ~/.sps/install-manifest.env"

section "Summary"
note "Installed steps: $INSTALLED"
note "Skipped/failed steps: $FAILED"
[ -f "$HOME/.claude/skills/sps/SKILL.md" ] && note "+ /sps present for Claude" || note "- /sps missing for Claude"
[ -f "$HOME/.cursor/skills/sps/SKILL.md" ] && note "+ /sps present for Cursor" || note "- /sps missing for Cursor"
[ -f "$HOME/.codex/skills/sps/SKILL.md" ] && note "+ /sps present for Codex" || note "- /sps missing for Codex"
[ -d "$HOME/.gemini/config/skills/sps" ] && note "+ /sps present for Gemini/Antigravity shared path" || note "- /sps missing for Gemini/Antigravity shared path"
note "Log: $LOG"

echo ""
echo "+==================================================================+"
echo "| Install complete                                                 |"
printf "| Profile: %-55s |\n" "$PROFILE"
echo "+==================================================================+"
echo ""

if ((FAILED > 0)); then
  exit 1
fi
