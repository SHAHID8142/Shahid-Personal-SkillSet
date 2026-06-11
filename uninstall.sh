#!/usr/bin/env bash
# Shahid Personal SkillSet — Uninstaller (Mac / Linux)
# ─────────────────────────────────────────────────────
# Removes all /sps skills and catalog skills from all agents.
# Does NOT delete your personal data: ~/.sps/profile.md, mistakes.md, learned/
# Those are yours — delete manually if you want them gone.
#
# Usage: bash uninstall.sh
#        bash uninstall.sh --all    (also removes ~/.sps/ personal data)

set -uo pipefail

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; BOLD='\033[1m'; NC='\033[0m'
ok()      { echo -e "${GREEN}✓${NC} $*"; }
info()    { echo -e "${YELLOW}→${NC} $*"; }
removed() { echo -e "${RED}−${NC} $*"; }
section() { echo ""; echo -e "${BOLD}── $* ──${NC}"; }

REMOVE_PERSONAL=false
[[ "${1:-}" == "--all" ]] && REMOVE_PERSONAL=true

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║         Shahid Personal SkillSet — Uninstaller                   ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

if $REMOVE_PERSONAL; then
  echo -e "${RED}WARNING: --all flag set. Will also delete ~/.sps/ (profile, mistakes, learned).${NC}"
  read -p "Are you sure? (yes/no): " confirm
  [[ "$confirm" != "yes" ]] && echo "Aborted." && exit 0
fi

# ── Remove npx-installed skills (from ~/.agents/skills/) ─────────────────────
section "Removing globally installed skills"

remove_agent_skill() {
  local name="$1"
  local found=false
  local paths=(
    "$HOME/.agents/skills/$name"
    "./.agents/skills/$name"
    "$HOME/.claude/skills/$name"
    "./.claude/skills/$name"
    "$HOME/.cursor/rules/$name.mdc"
    "./.cursor/rules/$name.mdc"
    "$HOME/.codex/skills/$name"
    "./.codex/skills/$name"
    "$HOME/.gemini/skills/$name"
    "./.gemini/skills/$name"
    "$HOME/.gemini/antigravity/skills/$name"
    "./.gemini/antigravity/skills/$name"
    "$HOME/.windsurf/skills/$name"
    "./.windsurf/skills/$name"
    "$HOME/.antigravity/skills/$name"
    "./.antigravity/skills/$name"
  )
  for p in "${paths[@]}"; do
    if [ -e "$p" ]; then
      rm -rf "$p" && found=true
    fi
  done
  $found && removed "$name" || true
}

# Core orchestrator
remove_agent_skill "sps"
remove_agent_skill "universal-build-orchestrator"

# Known skills installed by npx skills add
for skill in \
  analyze-github-action-logs astro-developer astro-pr-writer brandkit changeset \
  design-taste-frontend design-taste-frontend-v1 full-output-enforcement gpt-taste \
  gsap-core gsap-frameworks gsap-performance gsap-plugins gsap-react gsap-scrolltrigger \
  gsap-timeline gsap-utils hallmark high-end-visual-design image-to-code \
  imagegen-frontend-mobile imagegen-frontend-web impeccable industrial-brutalist-ui \
  karpathy-guidelines merge minimalist-ui playwright-dev playwright-devops \
  redesign-existing-projects stitch-design-taste triage typo-checker webgpu-threejs-tsl; do
  remove_agent_skill "$skill"
done

# ── Remove Claude plugin system skills ───────────────────────────────────────
section "Removing Claude plugins"

if command -v claude >/dev/null 2>&1; then
  plugins=(
    "universal-build-orchestrator@shahid-personal-skillset"
    "ui-ux-pro-max@ui-ux-pro-max-skill"
    "gsap-scrolltrigger@claude-design-skillstack"
    "frontend-design@claude-design-skillstack"
    "animejs@claude-design-skillstack"
    "locomotive-scroll@claude-design-skillstack"
    "modern-web-design@claude-design-skillstack"
    "animated-component-libraries@claude-design-skillstack"
    "threejs-webgl@claude-design-skillstack"
    "react-three-fiber@claude-design-skillstack"
    "babylonjs-engine@claude-design-skillstack"
    "aframe-webxr@claude-design-skillstack"
    "spline-interactive@claude-design-skillstack"
    "pixijs-2d@claude-design-skillstack"
    "lightweight-3d-effects@claude-design-skillstack"
    "playcanvas-engine@claude-design-skillstack"
    "web3d-integration-patterns@claude-design-skillstack"
    "blender-web-pipeline@claude-design-skillstack"
    "react-spring-physics@claude-design-skillstack"
    "lottie-animations@claude-design-skillstack"
    "rive-interactive@claude-design-skillstack"
    "scroll-reveal-libraries@claude-design-skillstack"
    "barba-js@claude-design-skillstack"
    "engineering-skills@claude-code-skills"
    "engineering-advanced-skills@claude-code-skills"
    "marketing-skills@claude-code-skills"
    "research-ops-skills@claude-code-skills"
    "a11y-audit@claude-code-skills"
    "docker-development@claude-code-skills"
    "kubernetes-operator@claude-code-skills"
    "terraform-patterns@claude-code-skills"
    "helm-chart-builder@claude-code-skills"
    "c-level-skills@claude-code-skills"
    "product-skills@claude-code-skills"
    "pm-skills@claude-code-skills"
    "business-growth-skills@claude-code-skills"
    "demo-video@claude-code-skills"
    "research-summarizer@claude-code-skills"
    "statistical-analyst@claude-code-skills"
    "feature-flags-architect@claude-code-skills"
    "code-tour@claude-code-skills"
    "chaos-engineering@claude-code-skills"
    "slo-architect@claude-code-skills"
    "markdown-html@claude-code-skills"
  )
  for plugin in "${plugins[@]}"; do
    claude plugin uninstall "$plugin" --scope project >/dev/null 2>&1 && removed "$plugin" || true
  done

  # Remove marketplaces
  for mkt in shahid-personal-skillset ui-ux-pro-max-skill claude-design-skillstack claude-code-skills; do
    claude plugin marketplace remove "$mkt" >/dev/null 2>&1 && removed "marketplace: $mkt" || true
  done

  # Remove Context7 MCP
  claude mcp remove context7 --scope project >/dev/null 2>&1 && removed "Context7 MCP" || true
else
  info "claude CLI not found — skipping Claude plugin removal"
fi

# ── Remove graphify ───────────────────────────────────────────────────────────
section "Removing graphify"
if command -v uv >/dev/null 2>&1; then
  uv tool uninstall graphifyy >/dev/null 2>&1 && removed "graphify (uv)" || true
elif command -v pip >/dev/null 2>&1; then
  pip uninstall graphifyy -y >/dev/null 2>&1 && removed "graphify (pip)" || true
fi
# Remove graphify skill file
rm -rf "$HOME/.claude/skills/graphify" && removed "graphify skill" || true

# ── Remove personal data (only with --all) ────────────────────────────────────
if $REMOVE_PERSONAL; then
  section "Removing personal data (~/.sps/)"
  rm -rf "$HOME/.sps" && removed "~/.sps/ (profile, mistakes, learned)" || true
else
  section "Personal data kept"
  ok "~/.sps/ kept intact (profile, mistakes, learned topics)"
  info "To also remove personal data: bash uninstall.sh --all"
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    Uninstall complete                             ║"
echo "║                                                                  ║"
echo "║  All /sps skills and catalog skills removed.                     ║"
if $REMOVE_PERSONAL; then
echo "║  Personal data (~/.sps/) also removed.                           ║"
else
echo "║  Your profile, mistakes, and learned topics are still at         ║"
echo "║  ~/.sps/ — they're yours to keep or delete manually.             ║"
fi
echo "║                                                                  ║"
echo "║  To reinstall: bash install.sh                                   ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
