# Shahid Personal SkillSet - install (Windows PowerShell)
# -----------------------------------------------------------------------------
# Usage:
#   git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
#   cd Shahid-Personal-SkillSet
#   powershell -ExecutionPolicy Bypass -File install.ps1
#
# Installs /sps + ALL catalog skills globally across all detected agents.
# NOTHING hangs. Every network call has a hard timeout, git/npm cannot prompt,
# and a live [n/N] counter shows progress.
# Re-runnable and safe to Ctrl-C at any point.
# -----------------------------------------------------------------------------

$ErrorActionPreference = "Continue"

# -- Hang-prevention -----------------------------------------------------------
$env:GIT_TERMINAL_PROMPT = "0"
$env:GIT_SSH_COMMAND     = "ssh -oBatchMode=yes -oStrictHostKeyChecking=no"
$env:npm_config_yes      = "true"
$env:CI                  = "1"
$NetworkTimeout          = 90

$script:Installed = 0
$script:Skipped   = 0
$script:StepNum   = 0
$script:Total     = 39
$spsHome = "$env:USERPROFILE\.sps"
New-Item -ItemType Directory -Force -Path "$spsHome\learned" | Out-Null
$script:Log = "$spsHome\install.log"
"" | Set-Content -Path $script:Log

function note($msg)    { Write-Host "  $msg" -ForegroundColor DarkGray }
function section($msg) { Write-Host ""; Write-Host "-- $msg --" -ForegroundColor Cyan }
function have($cmd)    { [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }

function Step {
    param([string]$Label, [scriptblock]$Action, [int]$TimeoutSec = $NetworkTimeout)
    $script:StepNum++
    Write-Host ("-> [{0,2}/{1}] {2} ... " -f $script:StepNum, $script:Total, $Label) -NoNewline
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $job = Start-Job -ScriptBlock $Action
    $finished = Wait-Job $job -Timeout $TimeoutSec
    $secs = [int]$sw.Elapsed.TotalSeconds
    if ($finished -and $job.State -eq 'Completed') {
        Remove-Job $job -Force -ErrorAction SilentlyContinue
        Write-Host ("done ({0}s)" -f $secs) -ForegroundColor Green
        $script:Installed++
    } else {
        Stop-Job  $job -ErrorAction SilentlyContinue
        Remove-Job $job -Force -ErrorAction SilentlyContinue
        Write-Host ("skipped ({0}s - will retry on demand)" -f $secs) -ForegroundColor Yellow
        $script:Skipped++
        Add-Content -Path $script:Log -Value "SKIPPED: $Label"
    }
}

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host "|        Shahid Personal SkillSet - install (Windows)             |" -ForegroundColor Magenta
Write-Host "|   /sps + ALL catalog skills -> all detected agents              |" -ForegroundColor Magenta
Write-Host "+==================================================================+" -ForegroundColor Magenta

# -- Prerequisites -------------------------------------------------------------
section "Prerequisites"
if (have node) { note "Node.js $(node -v)" }   else { Write-Host "Node.js required: https://nodejs.org" -ForegroundColor Red; exit 1 }
if (have npx)  { note "npx available" }         else { Write-Host "npx required (ships with Node.js)" -ForegroundColor Red; exit 1 }
if (have claude) { note "claude CLI found" }     else { note "claude CLI not found - Claude plugins will be skipped" }
if (have uv)   { note "uv found" }              else { note "uv not found - graphify will use pip" }

$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# -- Step 1: /sps on all agents ------------------------------------------------
section "Core orchestrator"
Step "/sps for all agents" { npx skills add -g SHAHID8142/Shahid-Personal-SkillSet }

# -- Steps 2-3: Claude core (if available) -------------------------------------
if (have claude) {
    $rd = $repoDir
    Step "/sps Claude marketplace" ([scriptblock]::Create("claude plugin marketplace add `"$rd`""))
    Step "/sps Claude plugin"      { claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope user }
} else { $script:StepNum += 2; note "claude not found - skipped 2 Claude steps" }

# -- Steps 4-6: Core npx skills ------------------------------------------------
section "Core design & animation skills (npx)"
Step "hallmark (anti-slop)"    { npx skills add -g nutlope/hallmark }
Step "GSAP animation suite"    { npx skills add -g https://github.com/greensock/gsap-skills }
Step "awwwards-animations"     { npx skills add -g devmartinese/awwwards-animations }

# -- Steps 7-30: ALL Claude design & animation plugins -------------------------
if (have claude) {
    section "Design system & UI plugins"
    Step "ui-ux-pro-max marketplace"      { claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill }
    Step "ui-ux-pro-max"                  { claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user }
    Step "design-skillstack marketplace"  { claude plugin marketplace add freshtechbro/claudedesignskills }
    Step "frontend-design"                { claude plugin install frontend-design@claude-design-skillstack --scope user }
    Step "modern-web-design"              { claude plugin install modern-web-design@claude-design-skillstack --scope user }
    Step "animated-component-libraries"   { claude plugin install animated-component-libraries@claude-design-skillstack --scope user }

    section "Animation & motion plugins"
    Step "motion-framer"                  { claude plugin install motion-framer@claude-design-skillstack --scope user }
    Step "locomotive-scroll"              { claude plugin install locomotive-scroll@claude-design-skillstack --scope user }
    Step "animejs"                        { claude plugin install animejs@claude-design-skillstack --scope user }
    Step "react-spring-physics"           { claude plugin install react-spring-physics@claude-design-skillstack --scope user }
    Step "lottie-animations"              { claude plugin install lottie-animations@claude-design-skillstack --scope user }
    Step "rive-interactive"               { claude plugin install rive-interactive@claude-design-skillstack --scope user }
    Step "scroll-reveal-libraries"        { claude plugin install scroll-reveal-libraries@claude-design-skillstack --scope user }
    Step "barba-js (page transitions)"    { claude plugin install barba-js@claude-design-skillstack --scope user }

    section "3D, WebGL & XR plugins"
    Step "react-three-fiber (R3F)"        { claude plugin install react-three-fiber@claude-design-skillstack --scope user }
    Step "threejs-webgl"                  { claude plugin install threejs-webgl@claude-design-skillstack --scope user }
    Step "babylonjs-engine"               { claude plugin install babylonjs-engine@claude-design-skillstack --scope user }
    Step "aframe-webxr"                   { claude plugin install aframe-webxr@claude-design-skillstack --scope user }
    Step "spline-interactive"             { claude plugin install spline-interactive@claude-design-skillstack --scope user }
    Step "pixijs-2d"                      { claude plugin install pixijs-2d@claude-design-skillstack --scope user }
    Step "lightweight-3d-effects"         { claude plugin install lightweight-3d-effects@claude-design-skillstack --scope user }
    Step "playcanvas-engine"              { claude plugin install playcanvas-engine@claude-design-skillstack --scope user }
    Step "web3d-integration-patterns"     { claude plugin install web3d-integration-patterns@claude-design-skillstack --scope user }
    Step "blender-web-pipeline"           { claude plugin install blender-web-pipeline@claude-design-skillstack --scope user }
} else { $script:StepNum += 24; note "claude not found - skipped 24 design plugin steps" }

# -- Steps 31-37: Engineering, marketing & DevOps plugins ----------------------
if (have claude) {
    section "Engineering, marketing & DevOps plugins"
    Step "claude-code-skills marketplace"                  { claude plugin marketplace add alirezarezvani/claude-skills }
    Step "engineering-skills (epic-design, senior-*, code-reviewer)" { claude plugin install engineering-skills@claude-code-skills --scope user }
    Step "engineering-advanced-skills"                     { claude plugin install engineering-advanced-skills@claude-code-skills --scope user }
    Step "marketing-skills (SEO, copy, CRO)"               { claude plugin install marketing-skills@claude-code-skills --scope user }
    Step "a11y-audit"                                      { claude plugin install a11y-audit@claude-code-skills --scope user }
    Step "research-ops-skills"                             { claude plugin install research-ops-skills@claude-code-skills --scope user }
    Step "docker-development"                              { claude plugin install docker-development@claude-code-skills --scope user }
} else { $script:StepNum += 7; note "claude not found - skipped 7 engineering plugin steps" }

# -- Step 38: Graphify ---------------------------------------------------------
section "Research & memory tools"
if (have uv) {
    Step "graphify (knowledge graphs)" { uv tool install graphifyy; graphify install }
} elseif (have pip) {
    Step "graphify (via pip)" { pip install graphifyy; graphify install }
} else { $script:StepNum++; note "no uv/pip - graphify skipped (install uv: https://docs.astral.sh/uv/)" }

# -- Step 39: Context7 MCP -----------------------------------------------------
if (have claude) {
    Step "Context7 MCP (live library docs)" { claude mcp add --scope user context7 -- npx -y '@upstash/context7-mcp' }
} else { $script:StepNum++ }

# -- Antigravity CLI sync ------------------------------------------------------
section "Antigravity CLI (agy)"
$repoSps = Join-Path $repoDir "skills\sps\SKILL.md"
$agyDir  = "$env:USERPROFILE\.gemini\antigravity\skills\sps"
if (Test-Path $repoSps) {
    New-Item -ItemType Directory -Force -Path $agyDir | Out-Null
    Copy-Item $repoSps "$agyDir\SKILL.md" -Force
    note "/sps synced to Antigravity (~\.gemini\antigravity\skills\sps\)"
    if (have agy) { note "agy detected - /sps auto-activates via progressive disclosure" } else { note "agy not found - copied anyway" }
} else { note "skills\sps\SKILL.md not found - run from repo root" }

# -- Profile + memory seed (never overwrites) ----------------------------------
section "Profile & memory"
$profilePath = "$spsHome\profile.md"
if (-not (Test-Path $profilePath)) {
@"
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
"@ | Set-Content -Path $profilePath -Encoding UTF8
    note "profile.md created - /sps fills it in on first task"
} else { note "profile.md kept (already exists)" }
if (-not (Test-Path "$spsHome\mistakes.md")) {
    "# SPS Mistake Log`nRead before every task. Never repeat these.`n`n---" | Set-Content "$spsHome\mistakes.md" -Encoding UTF8
}
if (-not (Test-Path "$spsHome\learned\INDEX.md")) {
    "# SPS Learned Topics`nResearched tools saved here. Check before researching.`n`n---" | Set-Content "$spsHome\learned\INDEX.md" -Encoding UTF8
}
note "mistakes.md + learned/INDEX.md ready"

# -- Verify + summary ----------------------------------------------------------
section "Verification"
if (Test-Path "$env:USERPROFILE\.agents\skills\sps\SKILL.md") { note "/sps present for universal agents" } else { note "/sps missing for universal agents" }
if (Test-Path "$agyDir\SKILL.md") { note "/sps present for Antigravity" } else { note "/sps missing for Antigravity" }
if (have claude) { note ("Claude plugins enabled: " + (claude plugin list 2>$null | Select-String "enabled").Count) }

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host "|  Install complete                                                |" -ForegroundColor Green
Write-Host "+------------------------------------------------------------------+" -ForegroundColor Green
Write-Host ("|  Installed: {0,-3}   Skipped (will retry on demand): {1,-3}         |" -f $script:Installed, $script:Skipped) -ForegroundColor Green
Write-Host "+------------------------------------------------------------------+" -ForegroundColor Green
Write-Host "|  Use it:  Claude Code -> /sps [request]                          |" -ForegroundColor Green
Write-Host "|           Antigravity -> just describe what to build             |" -ForegroundColor Green
Write-Host "|  Six rules always on: anti-slop, graphify, responsive,           |" -ForegroundColor Green
Write-Host "|  a11y, design-tokens, conventional-commits.                      |" -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
if ($script:Skipped -gt 0) {
    note "Skipped items: /sps installs any missing tool on demand at runtime."
    note "Details: $script:Log"
}
Write-Host ""
