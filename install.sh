#!/usr/bin/env bash
# Shahid Personal SkillSet — global install script
# ─────────────────────────────────────────────────────────────────────────────
# Usage: git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
#        cd Shahid-Personal-SkillSet
#        bash install.sh
#
# Installs /sps and the FULL skill catalog globally across ALL detected agents:
# Claude Code, Cursor, Codex, Gemini CLI, Windsurf, GitHub Copilot, Antigravity, and more.
#
# Re-runnable — already-installed skills are skipped automatically.
# Lines marked ✗ after running = that skill needs manual install (see its repo README).
# ─────────────────────────────────────────────────────────────────────────────

set -uo pipefail

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; BOLD='\033[1m'; NC='\033[0m'
ok()      { echo -e "${GREEN}✓${NC} $*"; }
info()    { echo -e "${YELLOW}→${NC} $*"; }
fail()    { echo -e "${RED}✗${NC} $* — verify against the repo README and retry manually"; }
section() { echo ""; echo -e "${BOLD}── $* ──${NC}"; }

npx_add() {
  local label="$1"; shift
  info "Installing $label..."
  if npx skills add -g "$@" >/dev/null 2>&1; then ok "$label"
  else fail "$label ($*)"; fi
}

claude_install() {
  local label="$1" plugin="$2"
  info "Installing $label..."
  if command -v claude >/dev/null 2>&1; then
    if claude plugin install "$plugin" --scope user >/dev/null 2>&1; then ok "$label"
    else fail "$label"; fi
  else
    fail "$label (claude CLI not found)"
  fi
}

claude_marketplace() {
  local label="$1" source="$2"
  if command -v claude >/dev/null 2>&1; then
    claude plugin marketplace add "$source" >/dev/null 2>&1 && ok "Marketplace: $label" || true
  fi
}

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║         Shahid Personal SkillSet — Global Catalog Install        ║"
echo "║   /sps + full website & app stack → all detected agents          ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# ── Prerequisites ─────────────────────────────────────────────────────────────
section "Prerequisites"
command -v node >/dev/null 2>&1  && ok "Node.js $(node -v)" || { echo "Node.js required — https://nodejs.org"; exit 1; }
command -v npx  >/dev/null 2>&1  && ok "npx available"      || { echo "npx required (comes with Node.js)"; exit 1; }
command -v claude >/dev/null 2>&1 && ok "claude CLI found"  || info "claude CLI not found — Claude-only skills will be skipped"
command -v uv >/dev/null 2>&1    && ok "uv found"           || info "uv not found — will fall back to pip for graphify"

# ── STEP 1: /sps Orchestrator (this skill) ───────────────────────────────────
section "/sps Orchestrator"
npx_add "/sps (Shahid Personal SkillSet)" "SHAHID8142/Shahid-Personal-SkillSet"
claude_marketplace "shahid-personal-skillset" "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
claude_install "universal-build-orchestrator" "universal-build-orchestrator@shahid-personal-skillset"

# ── STEP 2: Anti-slop & Design ───────────────────────────────────────────────
section "Design & Anti-slop"
npx_add "hallmark (anti-AI-slop)"              "nutlope/hallmark"
claude_marketplace "ui-ux-pro-max"             "nextlevelbuilder/ui-ux-pro-max-skill"
claude_install     "ui-ux-pro-max"             "ui-ux-pro-max@ui-ux-pro-max-skill"
claude_marketplace "claude-design-skillstack"  "freshtechbro/claudedesignskills"
claude_install     "modern-web-design"         "modern-web-design@claude-design-skillstack"
claude_install     "animated-component-libs"   "animated-component-libraries@claude-design-skillstack"
claude_install     "apple-hig-expert"          "apple-hig-expert@claude-code-skills"

# ── STEP 3: Animation & Motion ───────────────────────────────────────────────
section "Animation & Motion"
npx_add "GSAP official (all 8 skills)"         "https://github.com/greensock/gsap-skills"
claude_install "motion-framer"                 "motion-framer@claude-design-skillstack"
claude_install "locomotive-scroll (Lenis)"     "locomotive-scroll@claude-design-skillstack"
claude_install "animejs"                       "animejs@claude-design-skillstack"
npx_add "awwwards-animations"                  "devmartinese/awwwards-animations"
claude_install "react-spring-physics"          "react-spring-physics@claude-design-skillstack"
claude_install "lottie-animations"             "lottie-animations@claude-design-skillstack"
claude_install "rive-interactive"              "rive-interactive@claude-design-skillstack"
claude_install "scroll-reveal (AOS)"           "scroll-reveal-libraries@claude-design-skillstack"
claude_install "barba-js (page transitions)"   "barba-js@claude-design-skillstack"

# ── STEP 4: 3D & WebGL ───────────────────────────────────────────────────────
section "3D & WebGL"
claude_install "three.js / WebGL"              "threejs-webgl@claude-design-skillstack"
claude_install "react-three-fiber (R3F)"       "react-three-fiber@claude-design-skillstack"
claude_install "babylon.js"                    "babylonjs-engine@claude-design-skillstack"
claude_install "a-frame / webxr"               "aframe-webxr@claude-design-skillstack"
claude_install "spline-interactive"            "spline-interactive@claude-design-skillstack"
claude_install "pixijs-2d"                     "pixijs-2d@claude-design-skillstack"
claude_install "lightweight-3d-effects"        "lightweight-3d-effects@claude-design-skillstack"
claude_install "playcanvas-engine"             "playcanvas-engine@claude-design-skillstack"
claude_install "web3d-integration-patterns"    "web3d-integration-patterns@claude-design-skillstack"
claude_install "blender-web-pipeline"          "blender-web-pipeline@claude-design-skillstack"

# ── STEP 5: Frontend & Framework ─────────────────────────────────────────────
section "Frontend Framework & Tooling"
claude_marketplace "claude-code-skills"        "alirezarezvani/claude-skills"
claude_install "feature-flags-architect"       "feature-flags-architect@claude-code-skills"
claude_install "code-tour"                     "code-tour@claude-code-skills"
# Next.js / Vercel skills are built into Claude Code — no install needed

# ── STEP 6: Authentication ───────────────────────────────────────────────────
section "Authentication"
npx_add "Auth0"                                "auth0/auth0-skill"
npx_add "Better Auth"                          "better-auth/better-auth"
# Clerk is covered by vercel:auth (built into Claude Code)

# ── STEP 7: Database & Storage ───────────────────────────────────────────────
section "Database & Storage"
npx_add "Neon (Postgres)"                      "neon/neon"
npx_add "Supabase"                             "supabase/supabase"
npx_add "MongoDB"                              "mongodb/mongodb"
npx_add "Firebase"                             "firebase/firebase-basics"
npx_add "Redis"                                "redis/redis"
# Vercel KV/Blob/Postgres — built into Claude Code (vercel:vercel-storage)

# ── STEP 8: Payments & Commerce ──────────────────────────────────────────────
section "Payments & Commerce"
npx_add "Stripe"                               "stripe/stripe-best-practices"
npx_add "Coinbase"                             "coinbase/coinbase"

# ── STEP 9: Email & Notifications ────────────────────────────────────────────
section "Email & Notifications"
npx_add "Resend (transactional email)"         "resend/resend"
npx_add "Courier (multi-channel)"              "trycourier/courier-skills"

# ── STEP 10: CMS & Content ───────────────────────────────────────────────────
section "CMS & Content"
npx_add "Sanity (headless CMS)"                "sanity/sanity"
npx_add "WordPress"                            "wordpress/wordpress"
claude_install "markdown-html"                 "markdown-html@claude-code-skills"

# ── STEP 11: Backend, APIs & Data ────────────────────────────────────────────
section "Backend, APIs & Data"
claude_install "engineering-skills"            "engineering-skills@claude-code-skills"
claude_install "engineering-advanced-skills"   "engineering-advanced-skills@claude-code-skills"
npx_add "Apollo GraphQL"                       "apollo-graphql/apollo-graphql"
npx_add "Firecrawl (web scraping)"             "firecrawl/firecrawl"
npx_add "Remotion (video rendering)"           "remotion/remotion"
npx_add "Replicate (AI image APIs)"            "replicate/replicate"

# ── STEP 12: Mobile ──────────────────────────────────────────────────────────
section "Mobile (React Native / Expo)"
npx_add "Expo / React Native"                  "expo/expo-api-docs"

# ── STEP 13: Deploy & Infrastructure ─────────────────────────────────────────
section "Deploy & Infrastructure"
npx_add "Cloudflare"                           "cloudflare/cloudflare"
npx_add "Netlify functions"                    "netlify/netlify-functions"
claude_install "docker-development"            "docker-development@claude-code-skills"
claude_install "kubernetes-operator"           "kubernetes-operator@claude-code-skills"
claude_install "terraform-patterns"            "terraform-patterns@claude-code-skills"
claude_install "helm-chart-builder"            "helm-chart-builder@claude-code-skills"

# ── STEP 14: Performance, Debug & Security ───────────────────────────────────
section "Performance, Debug & Security"
npx_add "Web Quality (Addy Osmani)"            "addy-osmani/web-quality"
npx_add "Sentry (error monitoring)"            "getsentry/sentry-sdk-setup"
npx_add "Trail of Bits (security)"             "trailofbits/audit-context-building"
npx_add "Datadog (monitoring)"                 "datadog/datadog"
npx_add "Browserbase (Playwright)"             "browserbase/browserbase"
claude_install "a11y-audit"                    "a11y-audit@claude-code-skills"
claude_install "chaos-engineering"             "chaos-engineering@claude-code-skills"
claude_install "slo-architect"                 "slo-architect@claude-code-skills"

# ── STEP 15: SEO, Marketing & Product ────────────────────────────────────────
section "SEO, Marketing & Product"
claude_install "marketing-skills"              "marketing-skills@claude-code-skills"
claude_install "research-ops-skills (SEO)"     "research-ops-skills@claude-code-skills"
claude_install "product-skills"                "product-skills@claude-code-skills"
claude_install "pm-skills"                     "pm-skills@claude-code-skills"
claude_install "business-growth-skills"        "business-growth-skills@claude-code-skills"
claude_install "demo-video"                    "demo-video@claude-code-skills"
claude_install "c-level-skills"                "c-level-skills@claude-code-skills"

# ── STEP 16: Figma & Design Handoff ──────────────────────────────────────────
section "Figma & Design Handoff"
npx_add "Figma"                                "figma/figma"

# ── STEP 17: Research, Docs & Memory ─────────────────────────────────────────
section "Research, Docs & Memory"
if command -v uv >/dev/null 2>&1; then
  info "Installing graphify..."
  uv tool install graphifyy >/dev/null 2>&1 && graphify install >/dev/null 2>&1 && ok "graphify" || fail "graphify"
else
  info "Installing graphify via pip..."
  pip install graphifyy >/dev/null 2>&1 && graphify install >/dev/null 2>&1 && ok "graphify" || fail "graphify"
fi

if command -v claude >/dev/null 2>&1; then
  info "Installing Context7 MCP..."
  claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp >/dev/null 2>&1 && ok "Context7 MCP" || fail "Context7 MCP"
fi

claude_install "research-summarizer"           "research-summarizer@claude-code-skills"
claude_install "statistical-analyst"           "statistical-analyst@claude-code-skills"

# ── STEP 18: User Profile & Persistent Memory ────────────────────────────────
section "User Profile & Persistent Memory"

# Create ~/.sps/ directory structure
mkdir -p ~/.sps/learned

# Seed profile if it doesn't exist
if [ ! -f ~/.sps/profile.md ]; then
  cat > ~/.sps/profile.md << 'PROFILE'
# SPS User Profile
Last updated:

---

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
- Notes:

## Communication style
- Verbosity:
- Prefers:
- Dislikes:

## Explicit approvals (things praised or confirmed as correct)
-

## Explicit rejections (things criticized or asked to change)
-

## Working patterns observed
-
PROFILE
  ok "Profile template created (~/.sps/profile.md)"
  info "On your first /sps task, the agent will ask 5 quick questions to fill this in."
else
  ok "Profile already exists (~/.sps/profile.md) — skipping"
fi

# Seed mistake log if it doesn't exist
if [ ! -f ~/.sps/mistakes.md ]; then
  cat > ~/.sps/mistakes.md << 'MISTAKES'
# SPS Mistake Log
Mistakes made by agents using /sps. Read this before every task. Never repeat these.

---
MISTAKES
  ok "Mistake log created (~/.sps/mistakes.md)"
else
  ok "Mistake log exists — skipping"
fi

# Seed learned topics index if it doesn't exist
if [ ! -f ~/.sps/learned/INDEX.md ]; then
  cat > ~/.sps/learned/INDEX.md << 'INDEX'
# SPS Learned Topics

Topics researched by /sps when not found in the built-in catalog.
Read before every task to check if required knowledge is already here.

---
INDEX
  ok "Learned topics index created (~/.sps/learned/INDEX.md)"
else
  ok "Learned topics index exists — skipping"
fi

# ── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                     Installation complete                         ║"
echo "║                                                                  ║"
echo "║   Claude Code: type /sps [your request]                          ║"
echo "║   Cursor:      sps skill is auto-loaded from .cursor/rules/      ║"
echo "║   Codex:       skill in ~/.codex/skills/sps/                     ║"
echo "║   Gemini CLI:  skill in ~/.gemini/skills/sps/                    ║"
echo "║   Others:      skill in ~/.agents/skills/sps/                    ║"
echo "║                                                                  ║"
echo "║   THREE RULES always active (no override):                       ║"
echo "║   1. Hallmark anti-slop — no AI-looking UI ever                  ║"
echo "║   2. Graphify — every project gets a knowledge graph             ║"
echo "║   3. Responsive — 320/768/1280/1440px before every handover      ║"
echo "║                                                                  ║"
echo "║   ✗ lines above = failed installs. Run claude plugin list        ║"
echo "║   to confirm Claude installs, and check each repo's README.      ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
