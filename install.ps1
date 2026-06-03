# Shahid Personal SkillSet — Windows Install Script (PowerShell)
# ─────────────────────────────────────────────────────────────────────────────
# Usage:
#   git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
#   cd Shahid-Personal-SkillSet
#   powershell -ExecutionPolicy Bypass -File install.ps1
#
# Or, if you've already set your ExecutionPolicy:
#   .\install.ps1
#
# Installs /sps and the FULL skill catalog globally across ALL detected agents:
# Claude Code, Cursor, Codex, Gemini CLI, Windsurf, GitHub Copilot, Antigravity, and more.
# Re-runnable — already-installed skills are skipped automatically.
# ─────────────────────────────────────────────────────────────────────────────

$ErrorActionPreference = "Continue"

# ── Colour helpers ────────────────────────────────────────────────────────────
function ok($msg)   { Write-Host "  [OK] $msg" -ForegroundColor Green }
function info($msg) { Write-Host "   --> $msg" -ForegroundColor Yellow }
function fail($msg) { Write-Host "  [!] $msg — verify against the repo README and retry manually" -ForegroundColor Red }
function section($msg) { Write-Host ""; Write-Host "── $msg ──" -ForegroundColor Cyan }

function npx-add($label, $source) {
    info "Installing $label..."
    $result = npx skills add -g $source 2>&1
    if ($LASTEXITCODE -eq 0) { ok $label } else { fail "$label ($source)" }
}

function claude-install($label, $plugin) {
    if (Get-Command claude -ErrorAction SilentlyContinue) {
        info "Installing $label..."
        $result = claude plugin install $plugin --scope user 2>&1
        if ($LASTEXITCODE -eq 0) { ok $label } else { fail $label }
    } else {
        fail "$label (claude CLI not found)"
    }
}

function claude-marketplace($label, $source) {
    if (Get-Command claude -ErrorAction SilentlyContinue) {
        claude plugin marketplace add $source 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) { ok "Marketplace: $label" }
    }
}

# ── Banner ────────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║         Shahid Personal SkillSet — Windows Install               ║" -ForegroundColor Magenta
Write-Host "║   /sps + full website & app stack → all detected agents          ║" -ForegroundColor Magenta
Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""

# ── Prerequisites ─────────────────────────────────────────────────────────────
section "Prerequisites"

if (Get-Command node -ErrorAction SilentlyContinue) {
    ok "Node.js $(node -v)"
} else {
    Write-Host "Node.js is required. Download from https://nodejs.org" -ForegroundColor Red
    exit 1
}

if (Get-Command npx -ErrorAction SilentlyContinue) { ok "npx available" } else {
    Write-Host "npx not found. Reinstall Node.js from https://nodejs.org" -ForegroundColor Red
    exit 1
}

if (Get-Command claude -ErrorAction SilentlyContinue) { ok "claude CLI found" } else {
    info "claude CLI not found — Claude-only skills will be skipped"
    info "Install: winget install Anthropic.ClaudeCode"
}

if (Get-Command uv -ErrorAction SilentlyContinue) { ok "uv found" } else {
    info "uv not found — will fall back to pip for graphify"
    info "Install uv: powershell -c 'irm https://astral.sh/uv/install.ps1 | iex'"
}

# ── STEP 1: /sps Orchestrator ─────────────────────────────────────────────────
section "/sps Orchestrator"
$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
npx-add "/sps (Shahid Personal SkillSet)" "SHAHID8142/Shahid-Personal-SkillSet"
claude-marketplace "shahid-personal-skillset" $repoDir
claude-install "universal-build-orchestrator" "universal-build-orchestrator@shahid-personal-skillset"

# ── STEP 2: Design & Anti-slop ───────────────────────────────────────────────
section "Design & Anti-slop"
npx-add "hallmark (anti-AI-slop)"              "nutlope/hallmark"
claude-marketplace "ui-ux-pro-max"             "nextlevelbuilder/ui-ux-pro-max-skill"
claude-install     "ui-ux-pro-max"             "ui-ux-pro-max@ui-ux-pro-max-skill"
claude-marketplace "claude-design-skillstack"  "freshtechbro/claudedesignskills"
claude-install     "modern-web-design"         "modern-web-design@claude-design-skillstack"
claude-install     "animated-component-libs"   "animated-component-libraries@claude-design-skillstack"
claude-install     "apple-hig-expert"          "apple-hig-expert@claude-code-skills"

# ── STEP 3: Animation & Motion ───────────────────────────────────────────────
section "Animation & Motion"
npx-add "GSAP official (all 8 skills)"         "https://github.com/greensock/gsap-skills"
claude-install "motion-framer"                 "motion-framer@claude-design-skillstack"
claude-install "locomotive-scroll (Lenis)"     "locomotive-scroll@claude-design-skillstack"
claude-install "animejs"                       "animejs@claude-design-skillstack"
npx-add "awwwards-animations"                  "devmartinese/awwwards-animations"
claude-install "react-spring-physics"          "react-spring-physics@claude-design-skillstack"
claude-install "lottie-animations"             "lottie-animations@claude-design-skillstack"
claude-install "rive-interactive"              "rive-interactive@claude-design-skillstack"
claude-install "scroll-reveal (AOS)"           "scroll-reveal-libraries@claude-design-skillstack"
claude-install "barba-js (page transitions)"   "barba-js@claude-design-skillstack"

# ── STEP 4: 3D & WebGL ───────────────────────────────────────────────────────
section "3D & WebGL"
claude-install "three.js / WebGL"              "threejs-webgl@claude-design-skillstack"
claude-install "react-three-fiber (R3F)"       "react-three-fiber@claude-design-skillstack"
claude-install "babylon.js"                    "babylonjs-engine@claude-design-skillstack"
claude-install "a-frame / webxr"               "aframe-webxr@claude-design-skillstack"
claude-install "spline-interactive"            "spline-interactive@claude-design-skillstack"
claude-install "pixijs-2d"                     "pixijs-2d@claude-design-skillstack"
claude-install "lightweight-3d-effects"        "lightweight-3d-effects@claude-design-skillstack"
claude-install "playcanvas-engine"             "playcanvas-engine@claude-design-skillstack"
claude-install "web3d-integration-patterns"    "web3d-integration-patterns@claude-design-skillstack"
claude-install "blender-web-pipeline"          "blender-web-pipeline@claude-design-skillstack"

# ── STEP 5: Frontend & Framework ─────────────────────────────────────────────
section "Frontend Framework & Tooling"
claude-marketplace "claude-code-skills"        "alirezarezvani/claude-skills"
claude-install "feature-flags-architect"       "feature-flags-architect@claude-code-skills"
claude-install "code-tour"                     "code-tour@claude-code-skills"

# ── STEP 6: Authentication ───────────────────────────────────────────────────
section "Authentication"
npx-add "Auth0"                                "auth0/auth0-skill"
npx-add "Better Auth"                          "better-auth/better-auth"

# ── STEP 7: Database & Storage ───────────────────────────────────────────────
section "Database & Storage"
npx-add "Neon (Postgres)"                      "neon/neon"
npx-add "Supabase"                             "supabase/supabase"
npx-add "MongoDB"                              "mongodb/mongodb"
npx-add "Firebase"                             "firebase/firebase-basics"
npx-add "Redis"                                "redis/redis"

# ── STEP 8: Payments & Commerce ──────────────────────────────────────────────
section "Payments & Commerce"
npx-add "Stripe"                               "stripe/stripe-best-practices"
npx-add "Coinbase"                             "coinbase/coinbase"

# ── STEP 9: Email & Notifications ────────────────────────────────────────────
section "Email & Notifications"
npx-add "Resend (transactional email)"         "resend/resend"
npx-add "Courier (multi-channel)"              "trycourier/courier-skills"

# ── STEP 10: CMS & Content ───────────────────────────────────────────────────
section "CMS & Content"
npx-add "Sanity (headless CMS)"                "sanity/sanity"
npx-add "WordPress"                            "wordpress/wordpress"
claude-install "markdown-html"                 "markdown-html@claude-code-skills"

# ── STEP 11: Backend, APIs & Data ────────────────────────────────────────────
section "Backend, APIs & Data"
claude-install "engineering-skills"            "engineering-skills@claude-code-skills"
claude-install "engineering-advanced-skills"   "engineering-advanced-skills@claude-code-skills"
npx-add "Apollo GraphQL"                       "apollo-graphql/apollo-graphql"
npx-add "Firecrawl (web scraping)"             "firecrawl/firecrawl"
npx-add "Remotion (video rendering)"           "remotion/remotion"
npx-add "Replicate (AI image APIs)"            "replicate/replicate"

# ── STEP 12: Mobile ──────────────────────────────────────────────────────────
section "Mobile (React Native / Expo)"
npx-add "Expo / React Native"                  "expo/expo-api-docs"

# ── STEP 13: Deploy & Infrastructure ─────────────────────────────────────────
section "Deploy & Infrastructure"
npx-add "Cloudflare"                           "cloudflare/cloudflare"
npx-add "Netlify functions"                    "netlify/netlify-functions"
claude-install "docker-development"            "docker-development@claude-code-skills"
claude-install "kubernetes-operator"           "kubernetes-operator@claude-code-skills"
claude-install "terraform-patterns"            "terraform-patterns@claude-code-skills"
claude-install "helm-chart-builder"            "helm-chart-builder@claude-code-skills"

# ── STEP 14: Performance, Debug & Security ───────────────────────────────────
section "Performance, Debug & Security"
npx-add "Web Quality (Addy Osmani)"            "addy-osmani/web-quality"
npx-add "Sentry (error monitoring)"            "getsentry/sentry-sdk-setup"
npx-add "Trail of Bits (security)"             "trailofbits/audit-context-building"
npx-add "Datadog (monitoring)"                 "datadog/datadog"
npx-add "Browserbase (Playwright)"             "browserbase/browserbase"
claude-install "a11y-audit"                    "a11y-audit@claude-code-skills"
claude-install "chaos-engineering"             "chaos-engineering@claude-code-skills"
claude-install "slo-architect"                 "slo-architect@claude-code-skills"

# ── STEP 15: SEO, Marketing & Product ────────────────────────────────────────
section "SEO, Marketing & Product"
claude-install "marketing-skills"              "marketing-skills@claude-code-skills"
claude-install "research-ops-skills (SEO)"     "research-ops-skills@claude-code-skills"
claude-install "product-skills"                "product-skills@claude-code-skills"
claude-install "pm-skills"                     "pm-skills@claude-code-skills"
claude-install "business-growth-skills"        "business-growth-skills@claude-code-skills"
claude-install "demo-video"                    "demo-video@claude-code-skills"
claude-install "c-level-skills"                "c-level-skills@claude-code-skills"

# ── STEP 16: Figma & Design Handoff ──────────────────────────────────────────
section "Figma & Design Handoff"
npx-add "Figma"                                "figma/figma"

# ── STEP 17: Research, Docs & Memory ─────────────────────────────────────────
section "Research, Docs & Memory"

info "Installing graphify..."
if (Get-Command uv -ErrorAction SilentlyContinue) {
    uv tool install graphifyy 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        graphify install 2>&1 | Out-Null
        ok "graphify"
    } else { fail "graphify (uv)" }
} elseif (Get-Command pip -ErrorAction SilentlyContinue) {
    pip install graphifyy 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        graphify install 2>&1 | Out-Null
        ok "graphify"
    } else { fail "graphify (pip)" }
} else {
    fail "graphify (no uv or pip found — install Python from https://python.org)"
}

if (Get-Command claude -ErrorAction SilentlyContinue) {
    info "Installing Context7 MCP..."
    claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { ok "Context7 MCP" } else { fail "Context7 MCP" }
}

claude-install "research-summarizer"           "research-summarizer@claude-code-skills"
claude-install "statistical-analyst"           "statistical-analyst@claude-code-skills"

# ── Done ─────────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                     Installation complete                         ║" -ForegroundColor Green
Write-Host "║                                                                  ║" -ForegroundColor Green
Write-Host "║   Claude Code: type /sps [your request]                          ║" -ForegroundColor Green
Write-Host "║   Cursor:      sps skill is auto-loaded from .cursor/rules/      ║" -ForegroundColor Green
Write-Host "║   Codex:       skill in %USERPROFILE%\.codex\skills\sps\         ║" -ForegroundColor Green
Write-Host "║   Windsurf:    skill in %USERPROFILE%\.windsurf\skills\sps\      ║" -ForegroundColor Green
Write-Host "║   Others:      skill in %USERPROFILE%\.agents\skills\sps\        ║" -ForegroundColor Green
Write-Host "║                                                                  ║" -ForegroundColor Green
Write-Host "║   THREE RULES always active (no override):                       ║" -ForegroundColor Green
Write-Host "║   1. Hallmark anti-slop — no AI-looking UI ever                  ║" -ForegroundColor Green
Write-Host "║   2. Graphify — every project gets a knowledge graph             ║" -ForegroundColor Green
Write-Host "║   3. Responsive — 320/768/1280/1440px before every handover      ║" -ForegroundColor Green
Write-Host "║                                                                  ║" -ForegroundColor Green
Write-Host "║   [!] lines above = failed installs. Run:                        ║" -ForegroundColor Green
Write-Host "║       claude plugin list   to see installed Claude plugins.      ║" -ForegroundColor Green
Write-Host "╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
