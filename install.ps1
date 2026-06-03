# Shahid Personal SkillSet - install (Windows PowerShell)
# -----------------------------------------------------------------------------
# Usage:
#   git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
#   cd Shahid-Personal-SkillSet
#   powershell -ExecutionPolicy Bypass -File install.ps1
#
# Design: NOTHING hangs. Every network call has a hard timeout, git/npm can't
# prompt for credentials, and a live [n/N] progress counter shows it working.
# Skills not installed here are installed on-demand at runtime by /sps itself.
# Re-runnable and safe to Ctrl-C at any point.
# -----------------------------------------------------------------------------

$ErrorActionPreference = "Continue"

# -- Hang-prevention: never let git/ssh/npm block on a prompt -----------------
$env:GIT_TERMINAL_PROMPT = "0"
$env:GIT_SSH_COMMAND     = "ssh -oBatchMode=yes -oStrictHostKeyChecking=no"
$env:npm_config_yes      = "true"
$env:CI                  = "1"
$NetworkTimeout          = 90    # seconds per item before we give up

# Counters + log
$script:Installed = 0
$script:Skipped   = 0
$script:StepNum   = 0
$script:Total     = 21
$spsHome = "$env:USERPROFILE\.sps"
New-Item -ItemType Directory -Force -Path "$spsHome\learned" | Out-Null
$script:Log = "$spsHome\install.log"
"" | Set-Content -Path $script:Log

function note($msg)    { Write-Host "  $msg" -ForegroundColor DarkGray }
function section($msg) { Write-Host ""; Write-Host "-- $msg --" -ForegroundColor Cyan }
function have($cmd)    { [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }

# Run one install step with a hard timeout + live progress line.
# $Action is a scriptblock running an external CLI command.
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
        Stop-Job $job -ErrorAction SilentlyContinue
        Remove-Job $job -Force -ErrorAction SilentlyContinue
        Write-Host ("skipped ({0}s - /sps installs on demand)" -f $secs) -ForegroundColor Yellow
        $script:Skipped++
        Add-Content -Path $script:Log -Value "SKIPPED: $Label"
    }
}

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host "|        Shahid Personal SkillSet - install (Windows)             |" -ForegroundColor Magenta
Write-Host "|   /sps + core skills -> all detected agents. Nothing hangs.     |" -ForegroundColor Magenta
Write-Host "+==================================================================+" -ForegroundColor Magenta

# -- Prerequisites ------------------------------------------------------------
section "Prerequisites"
if (have node) { note "Node.js $(node -v)" } else { Write-Host "Node.js required: https://nodejs.org" -ForegroundColor Red; exit 1 }
if (have npx)  { note "npx available" }      else { Write-Host "npx required (ships with Node.js)" -ForegroundColor Red; exit 1 }
if (have claude) { note "claude CLI found" } else { note "claude CLI not found - Claude plugins skipped" }
if (have uv)   { note "uv found" }           else { note "uv not found - graphify will use pip" }

$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# -- Core: /sps everywhere ----------------------------------------------------
section "Core orchestrator"
Step "/sps for all agents" { npx skills add -g SHAHID8142/Shahid-Personal-SkillSet }
if (have claude) {
    Step "/sps Claude marketplace" ([scriptblock]::Create("claude plugin marketplace add `"$repoDir`"")).GetNewClosure()
    Step "/sps Claude plugin"      { claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope user }
} else { $script:StepNum += 2; note "claude not found - skipped 2 steps" }

# -- Design & animation (small repos, timeout-guarded) ------------------------
section "Design & animation skills"
Step "hallmark (anti-slop)" { npx skills add -g nutlope/hallmark }
Step "GSAP (official suite)" { npx skills add -g https://github.com/greensock/gsap-skills }
Step "awwwards-animations" { npx skills add -g devmartinese/awwwards-animations }

# -- Claude plugins (fast) ----------------------------------------------------
if (have claude) {
    section "Claude design plugins"
    Step "ui-ux-pro-max marketplace" { claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill }
    Step "ui-ux-pro-max" { claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user }
    Step "design-skillstack marketplace" { claude plugin marketplace add freshtechbro/claudedesignskills }
    Step "motion-framer" { claude plugin install motion-framer@claude-design-skillstack --scope user }
    Step "locomotive-scroll" { claude plugin install locomotive-scroll@claude-design-skillstack --scope user }
    Step "animejs" { claude plugin install animejs@claude-design-skillstack --scope user }
    Step "three.js / R3F / babylon" { claude plugin install react-three-fiber@claude-design-skillstack --scope user }

    section "Engineering, marketing & SEO plugins"
    Step "claude-code-skills marketplace" { claude plugin marketplace add alirezarezvani/claude-skills }
    Step "engineering-skills (epic-design, senior-*, code-reviewer)" { claude plugin install engineering-skills@claude-code-skills --scope user }
    Step "engineering-advanced-skills" { claude plugin install engineering-advanced-skills@claude-code-skills --scope user }
    Step "marketing-skills (SEO, copy, CRO)" { claude plugin install marketing-skills@claude-code-skills --scope user }
    Step "a11y-audit" { claude plugin install a11y-audit@claude-code-skills --scope user }
} else { $script:StepNum += 12; note "claude not found - skipped 12 plugin steps" }

# -- Research / memory --------------------------------------------------------
section "Research & docs"
if (have uv) {
    Step "graphify (knowledge graphs)" { uv tool install graphifyy; graphify install }
} elseif (have pip) {
    Step "graphify (via pip)" { pip install graphifyy; graphify install }
} else { $script:StepNum++; note "no uv/pip - graphify skipped" }
if (have claude) {
    Step "Context7 MCP (live docs)" { claude mcp add --scope user context7 -- npx -y '@upstash/context7-mcp' }
} else { $script:StepNum++ }

# -- Antigravity CLI sync -----------------------------------------------------
section "Antigravity CLI (agy)"
$repoSps = Join-Path $repoDir "skills\sps\SKILL.md"
$agyDir  = "$env:USERPROFILE\.gemini\antigravity\skills\sps"
if (Test-Path $repoSps) {
    New-Item -ItemType Directory -Force -Path $agyDir | Out-Null
    Copy-Item $repoSps "$agyDir\SKILL.md" -Force
    note "/sps synced to Antigravity (~\.gemini\antigravity\skills\sps\)"
    if (have agy) { note "agy detected - /sps auto-activates" } else { note "agy not found - copied anyway" }
} else { note "skills\sps\SKILL.md not found - run from repo root" }

# -- Profile + memory seed (never overwrites) ---------------------------------
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

# -- Verify + summary ---------------------------------------------------------
section "Verification"
if (Test-Path "$env:USERPROFILE\.agents\skills\sps\SKILL.md") { note "/sps present for universal agents" } else { note "/sps missing for universal agents" }
if (Test-Path "$agyDir\SKILL.md") { note "/sps present for Antigravity" } else { note "/sps missing for Antigravity" }
if (have claude) { note ("Claude plugins enabled: " + (claude plugin list 2>$null | Select-String "enabled").Count) }

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host "|  Install complete                                                |" -ForegroundColor Green
Write-Host "+------------------------------------------------------------------+" -ForegroundColor Green
Write-Host ("|  Installed: {0,-3}   Skipped (optional): {1,-3}                       |" -f $script:Installed, $script:Skipped) -ForegroundColor Green
Write-Host "+------------------------------------------------------------------+" -ForegroundColor Green
Write-Host "|  Use it:  Claude Code -> /sps [request]                          |" -ForegroundColor Green
Write-Host "|           Antigravity -> just describe what to build             |" -ForegroundColor Green
Write-Host "|  Six rules always on: anti-slop, graphify, responsive,           |" -ForegroundColor Green
Write-Host "|  a11y, design-tokens, conventional-commits.                      |" -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
if ($script:Skipped -gt 0) {
    note "Skipped items are optional - /sps installs any tool on demand at runtime."
    note "Details: $script:Log"
}
Write-Host ""
