#!/usr/bin/env bash
# Shahid Personal SkillSet — global install (Mac / Linux)
# ─────────────────────────────────────────────────────────────────────────────
# Usage: git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
#        cd Shahid-Personal-SkillSet && bash install.sh
#
# Installs /sps + a reliable core of skills globally across all detected agents
# (Claude Code, Antigravity, Cursor, Codex, Gemini CLI, Windsurf, and more).
#
# Design: NOTHING hangs. Every network call has a hard timeout, git/npm can't
# prompt for credentials, and a live [n/N] progress counter shows it's working.
# Skills not installed here are installed on-demand at runtime by /sps itself.
# Re-runnable and safe to Ctrl-C at any point.
# ─────────────────────────────────────────────────────────────────────────────

set -uo pipefail

# ── Hang-prevention: never let git/ssh/npm block on a prompt ─────────────────
export GIT_TERMINAL_PROMPT=0                              # git fails instead of asking for login
export GIT_SSH_COMMAND="ssh -oBatchMode=yes -oStrictHostKeyChecking=no"
export GIT_CLONE_PROTECTION_ACTIVE=false
export npm_config_yes=true                                # npx never prompts to install
export CI=1                                               # many tools go non-interactive under CI
NETWORK_TIMEOUT=90                                        # seconds before we give up on any one item

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; BOLD='\033[1m'; DIM='\033[2m'; NC='\033[0m'

# Counters + failure log
INSTALLED=0; FAILED=0; STEP=0
LOG="$HOME/.sps/install.log"
mkdir -p "$HOME/.sps"; : > "$LOG"

# Total number of install steps (keep in sync with the calls below) — for the [n/N] counter
TOTAL=23

ok()      { echo -e "${GREEN}✓${NC} $* ${DIM}(${SECONDS_THIS}s)${NC}"; INSTALLED=$((INSTALLED+1)); }
softfail(){ echo -e "${YELLOW}–${NC} $* ${DIM}(skipped — /sps will install on demand)${NC}"; FAILED=$((FAILED+1)); echo "SKIPPED: $*" >> "$LOG"; }
section() { echo ""; echo -e "${BOLD}── $* ──${NC}"; }
note()    { echo -e "${DIM}  $*${NC}"; }

# Portable timeout (macOS has no `timeout`). Kills the command if it runs too long.
run_timeout() {
  local secs="$1"; shift
  "$@" >/dev/null 2>&1 &
  local cmd_pid=$!
  ( sleep "$secs"; kill -TERM "$cmd_pid" 2>/dev/null; sleep 2; kill -KILL "$cmd_pid" 2>/dev/null ) >/dev/null 2>&1 &
  local watch_pid=$!
  wait "$cmd_pid" 2>/dev/null; local rc=$?
  kill -TERM "$watch_pid" 2>/dev/null; wait "$watch_pid" 2>/dev/null
  return $rc
}

# Run one install step with a live progress line + elapsed time.
step() {
  local label="$1"; shift
  STEP=$((STEP+1))
  local start=$SECONDS
  printf "${YELLOW}→${NC} [%2d/%d] %s ... " "$STEP" "$TOTAL" "$label"
  if run_timeout "$NETWORK_TIMEOUT" "$@"; then
    SECONDS_THIS=$((SECONDS-start)); echo -e "${GREEN}done${NC} ${DIM}(${SECONDS_THIS}s)${NC}"; INSTALLED=$((INSTALLED+1))
  else
    SECONDS_THIS=$((SECONDS-start)); echo -e "${YELLOW}skipped${NC} ${DIM}(${SECONDS_THIS}s — /sps installs on demand)${NC}"; FAILED=$((FAILED+1)); echo "SKIPPED: $label" >> "$LOG"
  fi
}

have(){ command -v "$1" >/dev/null 2>&1; }

echo ""
echo "+==================================================================+"
echo "|        Shahid Personal SkillSet — install (Mac / Linux)          |"
echo "|   /sps + core skills -> all detected agents. Nothing hangs.      |"
echo "+==================================================================+"

# ── Prerequisites ─────────────────────────────────────────────────────────────
section "Prerequisites"
have node  && note "Node.js $(node -v)"      || { echo "Node.js required: https://nodejs.org"; exit 1; }
have npx   && note "npx available"           || { echo "npx required (ships with Node.js)"; exit 1; }
have claude && note "claude CLI found"       || note "claude CLI not found — Claude plugins will be skipped"
have uv    && note "uv found"                || note "uv not found — graphify will use pip"

# ── Core: /sps everywhere ─────────────────────────────────────────────────────
section "Core orchestrator"
step "/sps for all agents"            npx skills add -g SHAHID8142/Shahid-Personal-SkillSet
if have claude; then
  REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  step "/sps Claude marketplace"      claude plugin marketplace add "$REPO"
  step "/sps Claude plugin"           claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope user
else
  STEP=$((STEP+2)); note "claude not found — skipped 2 Claude steps"
fi

# ── Reliable npx skills (verified small repos, all timeout-guarded) ───────────
section "Design & animation skills"
step "hallmark (anti-slop)"           npx skills add -g nutlope/hallmark
step "GSAP (official suite)"          npx skills add -g https://github.com/greensock/gsap-skills
step "awwwards-animations"            npx skills add -g devmartinese/awwwards-animations

# ── Claude plugin skills (fast — marketplaces are small) ─────────────────────
if have claude; then
  section "Claude design plugins"
  step "ui-ux-pro-max marketplace"    claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
  step "ui-ux-pro-max"                claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user
  step "design-skillstack marketplace" claude plugin marketplace add freshtechbro/claudedesignskills
  step "motion-framer"                claude plugin install motion-framer@claude-design-skillstack --scope user
  step "locomotive-scroll"            claude plugin install locomotive-scroll@claude-design-skillstack --scope user
  step "animejs"                      claude plugin install animejs@claude-design-skillstack --scope user
  step "three.js / R3F / babylon"     claude plugin install react-three-fiber@claude-design-skillstack --scope user

  section "Engineering, marketing & SEO plugins"
  step "claude-code-skills marketplace" claude plugin marketplace add alirezarezvani/claude-skills
  step "engineering-skills (epic-design, senior-*, code-reviewer)" claude plugin install engineering-skills@claude-code-skills --scope user
  step "engineering-advanced-skills"  claude plugin install engineering-advanced-skills@claude-code-skills --scope user
  step "marketing-skills (SEO, copy, CRO)" claude plugin install marketing-skills@claude-code-skills --scope user
  step "a11y-audit"                   claude plugin install a11y-audit@claude-code-skills --scope user
else
  STEP=$((STEP+12)); note "claude not found — skipped 12 Claude plugin steps"
fi

# ── Research / memory ─────────────────────────────────────────────────────────
section "Research & docs"
if have uv; then
  step "graphify (knowledge graphs)"  bash -c 'uv tool install graphifyy && graphify install'
elif have pip; then
  step "graphify (via pip)"           bash -c 'pip install graphifyy && graphify install'
else
  STEP=$((STEP+1)); note "no uv/pip — graphify skipped"
fi
if have claude; then
  step "Context7 MCP (live docs)"     claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp
else
  STEP=$((STEP+1))
fi

# ── Antigravity CLI sync (reads a different dir than npx writes) ──────────────
section "Antigravity CLI (agy)"
REPO_SPS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/sps/SKILL.md"
AGY_DIR="$HOME/.gemini/antigravity/skills/sps"
if [ -f "$REPO_SPS" ]; then
  mkdir -p "$AGY_DIR" && cp "$REPO_SPS" "$AGY_DIR/SKILL.md" && note "✓ /sps synced to Antigravity (~/.gemini/antigravity/skills/sps/)"
  have agy && note "agy detected — /sps auto-activates via progressive disclosure" || note "agy not found — copied anyway; works once Antigravity is installed"
else
  note "skills/sps/SKILL.md not found — run from repo root"
fi

# ── Profile + memory seed (never overwrites existing) ────────────────────────
section "Profile & memory"
mkdir -p "$HOME/.sps/learned"
if [ ! -f "$HOME/.sps/profile.md" ]; then
  cat > "$HOME/.sps/profile.md" <<'P'
# SPS User Profile
Last updated:

## Identity
- Role / experience level:
- What they typically build:

## Tech preferences
- Primary stack:
- Preferred database:
- Preferred auth:
- Preferred deploy:
- Libraries loved:
- Libraries to avoid:
- Package manager:

## Design aesthetic
- Style keywords:
- Typography lean:
- Color approach:
- Likes to see:
- Dislikes / patterns to avoid:
- References / inspirations:

## Mode preference
- Color scheme default:

## Communication style
- Verbosity:
- Prefers:
- Dislikes:

## Explicit approvals
-

## Explicit rejections
-

## Working patterns observed
-
P
  note "profile.md created — /sps fills it in on first task"
else
  note "profile.md kept (already exists)"
fi
[ -f "$HOME/.sps/mistakes.md" ] || printf '# SPS Mistake Log\nRead before every task. Never repeat these.\n\n---\n' > "$HOME/.sps/mistakes.md"
[ -f "$HOME/.sps/learned/INDEX.md" ] || printf '# SPS Learned Topics\nResearched tools saved here. Check before researching.\n\n---\n' > "$HOME/.sps/learned/INDEX.md"
note "mistakes.md + learned/INDEX.md ready"

# ── Verify + summary ──────────────────────────────────────────────────────────
section "Verification"
[ -f "$HOME/.agents/skills/sps/SKILL.md" ]            && note "✓ /sps present for universal agents" || note "– /sps missing for universal agents"
[ -f "$HOME/.gemini/antigravity/skills/sps/SKILL.md" ] && note "✓ /sps present for Antigravity"       || note "– /sps missing for Antigravity"
if have claude; then note "✓ Claude plugins enabled: $(claude plugin list 2>/dev/null | grep -c enabled)"; fi

echo ""
echo "+==================================================================+"
echo "|  Install complete                                                |"
echo "+------------------------------------------------------------------+"
printf "|  Installed: %-3s   Skipped (optional): %-3s                       |\n" "$INSTALLED" "$FAILED"
echo "+------------------------------------------------------------------+"
echo "|  Use it:  Claude Code -> /sps [request]                          |"
echo "|           Antigravity -> just describe what to build             |"
echo "|  Six rules always on: anti-slop, graphify, responsive,           |"
echo "|  a11y, design-tokens, conventional-commits.                      |"
echo "+==================================================================+"
if [ "$FAILED" -gt 0 ]; then
  note "Skipped items are optional — /sps installs any tool on demand at runtime."
  note "Details: $LOG"
fi
echo ""
