# Shahid Personal SkillSet - Windows Install Script (PowerShell)
# -----------------------------------------------------------------------------
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
# Re-runnable - already-installed skills are skipped automatically.
# -----------------------------------------------------------------------------

$ErrorActionPreference = "Continue"

# Counters + failure log for the end-of-run summary
$script:Installed = 0
$script:Failed = 0
$script:FailedList = @()
$spsHome = "$env:USERPROFILE\.sps"
New-Item -ItemType Directory -Force -Path $spsHome | Out-Null
$script:Log = "$spsHome\install.log"
"" | Set-Content -Path $script:Log

# -- Colour helpers ------------------------------------------------------------
function ok($msg)   { Write-Host "  [OK] $msg" -ForegroundColor Green; $script:Installed++ }
function info($msg) { Write-Host "   --> $msg" -ForegroundColor Yellow }
function fail($msg) { Write-Host "  [!] $msg" -ForegroundColor Red; $script:Failed++; $script:FailedList += $msg; Add-Content -Path $script:Log -Value "FAILED: $msg" }
function section($msg) { Write-Host ""; Write-Host "-- $msg --" -ForegroundColor Cyan }

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

# -- Banner --------------------------------------------------------------------
Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host "|         Shahid Personal SkillSet - Windows Install               |" -ForegroundColor Magenta
Write-Host "|   /sps + full website & app stack -> all detected agents          |" -ForegroundColor Magenta
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host ""

# -- Prerequisites -------------------------------------------------------------
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
    info "claude CLI not found - Claude-only skills will be skipped"
    info "Install: winget install Anthropic.ClaudeCode"
}

if (Get-Command uv -ErrorAction SilentlyContinue) { ok "uv found" } else {
    info "uv not found - will fall back to pip for graphify"
    info "Install uv: powershell -c 'irm https://astral.sh/uv/install.ps1 | iex'"
}

# -- STEP 1: /sps Orchestrator -------------------------------------------------
section "/sps Orchestrator"
$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
npx-add "/sps (Shahid Personal SkillSet)" "SHAHID8142/Shahid-Personal-SkillSet"
claude-marketplace "shahid-personal-skillset" $repoDir
claude-install "universal-build-orchestrator" "universal-build-orchestrator@shahid-personal-skillset"

# -- STEP 2: Design & Anti-slop -----------------------------------------------
section "Design & Anti-slop"
npx-add "hallmark (anti-AI-slop)"              "nutlope/hallmark"
claude-marketplace "ui-ux-pro-max"             "nextlevelbuilder/ui-ux-pro-max-skill"
claude-install     "ui-ux-pro-max"             "ui-ux-pro-max@ui-ux-pro-max-skill"
claude-marketplace "claude-design-skillstack"  "freshtechbro/claudedesignskills"
claude-install     "modern-web-design"         "modern-web-design@claude-design-skillstack"
claude-install     "animated-component-libs"   "animated-component-libraries@claude-design-skillstack"
claude-install     "apple-hig-expert"          "apple-hig-expert@claude-code-skills"

# -- STEP 3: Animation & Motion -----------------------------------------------
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

# -- STEP 4: 3D & WebGL -------------------------------------------------------
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

# -- STEP 5: Frontend & Framework ---------------------------------------------
section "Frontend Framework & Tooling"
claude-marketplace "claude-code-skills"        "alirezarezvani/claude-skills"
claude-install "feature-flags-architect"       "feature-flags-architect@claude-code-skills"
claude-install "code-tour"                     "code-tour@claude-code-skills"

# -- STEP 6: Authentication ---------------------------------------------------
section "Authentication"
npx-add "Auth0"                                "auth0/auth0-skill"
npx-add "Better Auth"                          "better-auth/better-auth"

# -- STEP 7: Database & Storage -----------------------------------------------
section "Database & Storage"
npx-add "Neon (Postgres)"                      "neon/neon"
npx-add "Supabase"                             "supabase/supabase"
npx-add "MongoDB"                              "mongodb/mongodb"
npx-add "Firebase"                             "firebase/firebase-basics"
npx-add "Redis"                                "redis/redis"

# -- STEP 8: Payments & Commerce ----------------------------------------------
section "Payments & Commerce"
npx-add "Stripe"                               "stripe/stripe-best-practices"
npx-add "Coinbase"                             "coinbase/coinbase"

# -- STEP 9: Email & Notifications --------------------------------------------
section "Email & Notifications"
npx-add "Resend (transactional email)"         "resend/resend"
npx-add "Courier (multi-channel)"              "trycourier/courier-skills"

# -- STEP 10: CMS & Content ---------------------------------------------------
section "CMS & Content"
npx-add "Sanity (headless CMS)"                "sanity/sanity"
npx-add "WordPress"                            "wordpress/wordpress"
claude-install "markdown-html"                 "markdown-html@claude-code-skills"

# -- STEP 11: Backend, APIs & Data --------------------------------------------
section "Backend, APIs & Data"
claude-install "engineering-skills"            "engineering-skills@claude-code-skills"
claude-install "engineering-advanced-skills"   "engineering-advanced-skills@claude-code-skills"
npx-add "Apollo GraphQL"                       "apollo-graphql/apollo-graphql"
npx-add "Firecrawl (web scraping)"             "firecrawl/firecrawl"
npx-add "Remotion (video rendering)"           "remotion/remotion"
npx-add "Replicate (AI image APIs)"            "replicate/replicate"

# -- STEP 12: Mobile ----------------------------------------------------------
section "Mobile (React Native / Expo)"
npx-add "Expo / React Native"                  "expo/expo-api-docs"

# -- STEP 13: Deploy & Infrastructure -----------------------------------------
section "Deploy & Infrastructure"
npx-add "Cloudflare"                           "cloudflare/cloudflare"
npx-add "Netlify functions"                    "netlify/netlify-functions"
claude-install "docker-development"            "docker-development@claude-code-skills"
claude-install "kubernetes-operator"           "kubernetes-operator@claude-code-skills"
claude-install "terraform-patterns"            "terraform-patterns@claude-code-skills"
claude-install "helm-chart-builder"            "helm-chart-builder@claude-code-skills"

# -- STEP 14: Performance, Debug & Security -----------------------------------
section "Performance, Debug & Security"
npx-add "Web Quality (Addy Osmani)"            "addy-osmani/web-quality"
npx-add "Sentry (error monitoring)"            "getsentry/sentry-sdk-setup"
npx-add "Trail of Bits (security)"             "trailofbits/audit-context-building"
npx-add "Datadog (monitoring)"                 "datadog/datadog"
npx-add "Browserbase (Playwright)"             "browserbase/browserbase"
claude-install "a11y-audit"                    "a11y-audit@claude-code-skills"
claude-install "chaos-engineering"             "chaos-engineering@claude-code-skills"
claude-install "slo-architect"                 "slo-architect@claude-code-skills"

# -- STEP 15: SEO, Marketing & Product ----------------------------------------
section "SEO, Marketing & Product"
claude-install "marketing-skills"              "marketing-skills@claude-code-skills"
claude-install "research-ops-skills (SEO)"     "research-ops-skills@claude-code-skills"
claude-install "product-skills"                "product-skills@claude-code-skills"
claude-install "pm-skills"                     "pm-skills@claude-code-skills"
claude-install "business-growth-skills"        "business-growth-skills@claude-code-skills"
claude-install "demo-video"                    "demo-video@claude-code-skills"
claude-install "c-level-skills"                "c-level-skills@claude-code-skills"

# -- STEP 16: Figma & Design Handoff ------------------------------------------
section "Figma & Design Handoff"
npx-add "Figma"                                "figma/figma"

# -- STEP 17: Research, Docs & Memory -----------------------------------------
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
    fail "graphify (no uv or pip found - install Python from https://python.org)"
}

if (Get-Command claude -ErrorAction SilentlyContinue) {
    info "Installing Context7 MCP..."
    claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { ok "Context7 MCP" } else { fail "Context7 MCP" }
}

claude-install "research-summarizer"           "research-summarizer@claude-code-skills"
claude-install "statistical-analyst"           "statistical-analyst@claude-code-skills"

# -- STEP 18: User Profile & Persistent Memory --------------------------------
section "User Profile & Persistent Memory"

$spsDir = "$env:USERPROFILE\.sps"
$learnedDir = "$spsDir\learned"
New-Item -ItemType Directory -Force -Path $learnedDir | Out-Null

# Seed profile if it doesn't exist
$profilePath = "$spsDir\profile.md"
if (-not (Test-Path $profilePath)) {
    @"
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
"@ | Set-Content -Path $profilePath -Encoding UTF8
    ok "Profile template created ($profilePath)"
    info "On your first /sps task, the agent will ask 5 quick questions to fill this in."
} else {
    ok "Profile already exists - skipping"
}

# Seed mistake log if it doesn't exist
$mistakesPath = "$spsDir\mistakes.md"
if (-not (Test-Path $mistakesPath)) {
    @"
# SPS Mistake Log
Mistakes made by agents using /sps. Read this before every task. Never repeat these.

---
"@ | Set-Content -Path $mistakesPath -Encoding UTF8
    ok "Mistake log created ($mistakesPath)"
} else {
    ok "Mistake log exists - skipping"
}

# Seed learned topics index if it doesn't exist
$indexPath = "$learnedDir\INDEX.md"
if (-not (Test-Path $indexPath)) {
    @"
# SPS Learned Topics

Topics researched by /sps when not found in the built-in catalog.
Read before every task to check if required knowledge is already here.

---
"@ | Set-Content -Path $indexPath -Encoding UTF8
    ok "Learned topics index created ($indexPath)"
} else {
    ok "Learned topics index exists - skipping"
}

# -- Antigravity CLI sync (agy reads a different directory) -------------------
section "Antigravity CLI (agy)"
# Antigravity reads global skills from ~\.gemini\antigravity\skills\<name>\SKILL.md
$repoSps = Join-Path $repoDir "skills\sps\SKILL.md"
$agyDir  = "$env:USERPROFILE\.gemini\antigravity\skills\sps"
if (Test-Path $repoSps) {
    New-Item -ItemType Directory -Force -Path $agyDir | Out-Null
    Copy-Item $repoSps "$agyDir\SKILL.md" -Force
    ok "/sps synced to Antigravity (~\.gemini\antigravity\skills\sps\)"
    if (Get-Command agy -ErrorAction SilentlyContinue) {
        ok "agy CLI detected - /sps will auto-activate via progressive disclosure"
    } else {
        info "agy CLI not found - skill copied anyway; works once Antigravity is installed"
    }
} else {
    fail "Antigravity sync (skills\sps\SKILL.md not found - run from repo root)"
}

# -- Verification --------------------------------------------------------------
section "Verification"
if (Get-Command claude -ErrorAction SilentlyContinue) {
    $pluginCount = (claude plugin list 2>$null | Select-String "enabled").Count
    ok "Claude plugins enabled: $pluginCount"
}
if (Test-Path "$env:USERPROFILE\.agents\skills\sps\SKILL.md") { ok "/sps present for universal agents" } else { info "/sps not in ~\.agents\skills\" }
if (Test-Path "$agyDir\SKILL.md") { ok "/sps present for Antigravity" } else { info "/sps not synced to Antigravity" }

# -- Summary -------------------------------------------------------------------
Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host "|  Installation complete                                            |" -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host ("|  Installed/synced: {0,-3}   Failed: {1,-3}                            |" -f $script:Installed, $script:Failed) -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host "|  Use it everywhere - describe what to build, or type /sps:        |" -ForegroundColor Green
Write-Host "|    Claude Code   ->  /sps [request]                              |" -ForegroundColor Green
Write-Host "|    Antigravity   ->  auto-activates (progressive disclosure)     |" -ForegroundColor Green
Write-Host "|    Cursor/Codex  ->  auto-loaded from skill dir                  |" -ForegroundColor Green
Write-Host "|                                                                  |" -ForegroundColor Green
Write-Host "|  Six rules always on: anti-slop, graphify, responsive,           |" -ForegroundColor Green
Write-Host "|  a11y, design-tokens, conventional-commits                       |" -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
if ($script:Failed -gt 0) {
    Write-Host ""
    Write-Host "$($script:Failed) item(s) failed - optional/best-effort, don't block /sps." -ForegroundColor Yellow
    Write-Host "Full list saved to: $script:Log" -ForegroundColor Yellow
}
Write-Host ""
