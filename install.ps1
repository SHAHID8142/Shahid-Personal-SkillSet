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
$script:Total     = 43
$spsHome = ".\.sps"
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
    $start = Get-Date
    $tmpOut = ".\.sps\step.out"
    Clear-Content -Path $tmpOut -ErrorAction SilentlyContinue
    
    $job = Start-Job -ScriptBlock $Action -Name "InstallJob"
    Wait-Job -Job $job -Timeout $TimeoutSec | Out-Null
    Receive-Job -Job $job 2>&1 | Out-File -FilePath $tmpOut -Append
    
    if ($job.State -eq 'Completed') {
        $elapsedSec = [math]::Round((Get-Date).Subtract($start).TotalSeconds)
        Get-Content $tmpOut -ErrorAction SilentlyContinue | Add-Content -Path $script:Log
        Remove-Job $job -Force -ErrorAction SilentlyContinue
        Write-Host "done ($elapsedSec`s)" -ForegroundColor Green
        $script:Installed++
    } else {
        Stop-Job  $job -ErrorAction SilentlyContinue
        Remove-Job $job -Force -ErrorAction SilentlyContinue
        $elapsedSec = [math]::Round((Get-Date).Subtract($start).TotalSeconds)
        Get-Content $tmpOut -ErrorAction SilentlyContinue | Add-Content -Path $script:Log
        Write-Host "failed ($elapsedSec`s)" -ForegroundColor Red
        Write-Host "   > Error snippet:" -ForegroundColor Yellow
        Get-Content $tmpOut -Tail 3 -ErrorAction SilentlyContinue | ForEach-Object { Write-Host "     $_" -ForegroundColor DarkGray }
        $script:Skipped++
        Add-Content -Path $script:Log -Value "FAILED: $Label"
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
Step "/sps for all agents" { npx skills add SHAHID8142/Shahid-Personal-SkillSet }

# -- Steps 2-3: Claude core (if available) -------------------------------------
if (have claude) {
    $rd = $repoDir
    Step "/sps Claude marketplace" ([scriptblock]::Create("claude plugin marketplace add `"$rd`""))
    Step "/sps Claude plugin"      { claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope project }
} else { $script:StepNum += 2; note "claude not found - skipped 2 Claude steps" }

# -- Steps 4-6: Core npx skills ------------------------------------------------
section "Core design & animation skills (npx)"
Step "hallmark (anti-slop)"    { npx skills add nutlope/hallmark }
Step "GSAP animation suite"    { npx skills add https://github.com/greensock/gsap-skills }

section "Core Engineering & ML skills (npx)"
Step "andrej-karpathy-skills"  { npx skills add multica-ai/andrej-karpathy-skills }
Step "astro-framework"         { npx skills add withastro/astro }
Step "playwright-e2e"          { npx skills add microsoft/playwright }
Step "vitest-unit-testing"     { npx skills add vitest-dev/vitest }
Step "impeccable-ui"           { npx skills add pbakaus/impeccable }
Step "webgpu-claude-skill"     { npx skills add dgreenheck/webgpu-claude-skill }
Step "taste-skill"             { npx skills add Leonxlnx/taste-skill }

# -- Steps 7-30: ALL Claude design & animation plugins -------------------------
if (have claude) {
    section "Design system & UI plugins"
    Step "ui-ux-pro-max marketplace"      { claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill }
    Step "ui-ux-pro-max"                  { claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope project }
    Step "design-skillstack marketplace" { claude plugin marketplace add freshtechbro/claudedesignskills }
    Step "modern-web-design"             { claude plugin install modern-web-design@claude-design-skillstack --scope project }
    Step "animated-component-libraries"  { claude plugin install animated-component-libraries@claude-design-skillstack --scope project }

    section "Animation & motion plugins"
    Step "locomotive-scroll"              { claude plugin install locomotive-scroll@claude-design-skillstack --scope project }
    Step "animejs"                        { claude plugin install animejs@claude-design-skillstack --scope project }
    Step "react-spring-physics"           { claude plugin install react-spring-physics@claude-design-skillstack --scope project }
    Step "lottie-animations"              { claude plugin install lottie-animations@claude-design-skillstack --scope project }
    Step "rive-interactive"               { claude plugin install rive-interactive@claude-design-skillstack --scope project }
    Step "scroll-reveal-libraries"        { claude plugin install scroll-reveal-libraries@claude-design-skillstack --scope project }
    Step "barba-js (page transitions)"    { claude plugin install barba-js@claude-design-skillstack --scope project }

    section "3D, WebGL & XR plugins"
    Step "react-three-fiber (R3F)"        { claude plugin install react-three-fiber@claude-design-skillstack --scope project }
    Step "threejs-webgl"                  { claude plugin install threejs-webgl@claude-design-skillstack --scope project }
    Step "babylonjs-engine"               { claude plugin install babylonjs-engine@claude-design-skillstack --scope project }
    Step "aframe-webxr"                   { claude plugin install aframe-webxr@claude-design-skillstack --scope project }
    Step "spline-interactive"             { claude plugin install spline-interactive@claude-design-skillstack --scope project }
    Step "pixijs-2d"                      { claude plugin install pixijs-2d@claude-design-skillstack --scope project }
    Step "lightweight-3d-effects"         { claude plugin install lightweight-3d-effects@claude-design-skillstack --scope project }
    Step "playcanvas-engine"              { claude plugin install playcanvas-engine@claude-design-skillstack --scope project }
    Step "web3d-integration-patterns"     { claude plugin install web3d-integration-patterns@claude-design-skillstack --scope project }
    Step "blender-web-pipeline"           { claude plugin install blender-web-pipeline@claude-design-skillstack --scope project }
} else {
    $script:StepNum += 22; note "claude not found - skipped 22 design plugin steps"
}

# -- Steps 31-37: Engineering, marketing & DevOps plugins ----------------------
if (have claude) {
    section "Engineering, marketing & DevOps plugins"
    Step "claude-code-skills marketplace"                  { claude plugin marketplace add alirezarezvani/claude-skills }
    Step "engineering-skills (epic-design, senior-*, code-reviewer)" { claude plugin install engineering-skills@claude-code-skills --scope project }
    Step "engineering-advanced-skills"                     { claude plugin install engineering-advanced-skills@claude-code-skills --scope project }
    Step "marketing-skills (SEO, copy, CRO)"               { claude plugin install marketing-skills@claude-code-skills --scope project }
    Step "a11y-audit"                                      { claude plugin install a11y-audit@claude-code-skills --scope project }
    Step "research-ops-skills"                             { claude plugin install research-ops-skills@claude-code-skills --scope project }
    Step "docker-development"                              { claude plugin install docker-development@claude-code-skills --scope project }
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
    Step "Context7 MCP (live library docs)" { claude mcp add --scope project context7 -- npx -y '@upstash/context7-mcp' }
} else { $script:StepNum++ }

# -- Antigravity CLI sync ------------------------------------------------------
section "Antigravity CLI (agy)"
$repoSps = Join-Path $repoDir "skills\sps\SKILL.md"
$agyDir  = "$env:USERPROFILE\.gemini\antigravity\skills\sps"
if (Test-Path $repoSps) {
    try {
        New-Item -ItemType Directory -Force -Path $agyDir -ErrorAction Stop | Out-Null
        Copy-Item -Path $repoSps -Destination "$agyDir\SKILL.md" -Force -ErrorAction Stop
        note "✓ /sps synced to Antigravity (~/.gemini/antigravity/skills/sps/)"
    } catch {
        note "– /sps sync failed (permission denied to ~/.gemini)"
    }
    if (have agy) { note "agy detected - /sps auto-activates via progressive disclosure" }
    else          { note "agy not found - copied anyway; works once Antigravity is installed" }
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
if (-not (Test-Path "$spsHome\handoff.md")) {
    "# SPS Project Handoff & State`nRead this to understand the current project context, completed tasks, and next steps.`n`n## Current Status`n- `n`n## Conversation Log`n- `n" | Set-Content "$spsHome\handoff.md" -Encoding UTF8
}
note "mistakes.md, learned/INDEX.md, and handoff.md ready"

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
Write-Host "|  Twenty rules always on: anti-slop, graphify, responsive,        |"
Write-Host "|  a11y, tokens, branches, dual-tone, i18n, security, error-bounds,|"
Write-Host "|  DB, rollback, secrets, linting, state, CI/CD, hooks, TSDoc,     |"
Write-Host "|  auditing, modularity.                                           |"
Write-Host "+==================================================================+"

if ($script:Skipped -gt 0) {
    note "Failed items will automatically try to install themselves on demand."
    note "Check .\.sps\install.log for full details."
}
Write-Host ""
