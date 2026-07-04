param(
    [ValidateSet("minimal","balanced","full")]
    [string]$Profile = "balanced",
    [string]$Agents = "*"
)

$ErrorActionPreference = "Continue"
$env:GIT_TERMINAL_PROMPT = "0"
$env:GIT_SSH_COMMAND = "ssh -oBatchMode=yes -oStrictHostKeyChecking=no"
$env:npm_config_yes = "true"
$env:CI = "1"
$env:npm_config_cache = Join-Path $env:USERPROFILE ".sps\npm-cache"
$env:NPX_NO_UPDATE_NOTIFIER = "1"
$NetworkTimeout = 90

$script:Installed = 0
$script:Skipped = 0
$script:StepNum = 0
$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$spsHome = Join-Path $env:USERPROFILE ".sps"
$manifestPath = Join-Path $spsHome "install-manifest.env"
New-Item -ItemType Directory -Force -Path $spsHome | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $spsHome "learned") | Out-Null
$script:Log = Join-Path $spsHome "install.log"
"" | Set-Content -Path $script:Log
$script:ManagedSkills = @("sps")
$script:ClaudePlugins = @()
$script:ClaudeMarketplaces = @()
$script:UseContext7 = 0
$script:UseGraphify = 0
$syncRoots = @(
    "$env:USERPROFILE\.claude\skills",
    "$env:USERPROFILE\.cursor\skills",
    "$env:USERPROFILE\.codex\skills",
    "$env:USERPROFILE\.agents\skills",
    "$env:USERPROFILE\.config\agents\skills",
    "$env:USERPROFILE\.gemini\config\skills",
    "$env:USERPROFILE\.gemini\skills",
    "$env:USERPROFILE\.gemini\antigravity\skills",
    "$env:USERPROFILE\.gemini\antigravity-cli\skills"
)

function note($msg)    { Write-Host "  $msg" -ForegroundColor DarkGray }
function section($msg) { Write-Host ""; Write-Host "-- $msg --" -ForegroundColor Cyan }
function have($cmd)    { [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }
function Get-AgentArgs {
    if ($Agents -eq "*") { return @("--agent","claude-code","--agent","cursor","--agent","codex","--agent","antigravity","--agent","antigravity-cli","--agent","universal") }
    $args = @()
    foreach ($agent in ($Agents -split ",")) {
        if ($agent.Trim()) {
            $args += "--agent"
            $args += $agent.Trim()
        }
    }
    return $args
}

function Get-AgentArgString {
    $quoted = @()
    foreach ($arg in (Get-AgentArgs)) {
        $escaped = $arg.Replace("'", "''")
        $quoted += "'$escaped'"
    }
    return ($quoted -join " ")
}

function Step {
    param([string]$Label, [scriptblock]$Action, [int]$TimeoutSec = $NetworkTimeout)
    $script:StepNum++
    Write-Host ("-> [{0,2}] {1} ... " -f $script:StepNum, $Label) -NoNewline
    $start = Get-Date
    $tmpOut = Join-Path $spsHome ".step.out"
    Clear-Content -Path $tmpOut -ErrorAction SilentlyContinue

    $job = Start-Job -ScriptBlock $Action -Name "InstallJob"
    Wait-Job -Job $job -Timeout $TimeoutSec | Out-Null
    Receive-Job -Job $job 2>&1 | Out-File -FilePath $tmpOut -Append

    if ($job.State -eq "Completed") {
        $elapsedSec = [math]::Round((Get-Date).Subtract($start).TotalSeconds)
        Get-Content $tmpOut -ErrorAction SilentlyContinue | Add-Content -Path $script:Log
        Remove-Job $job -Force -ErrorAction SilentlyContinue
        Write-Host "done ($elapsedSec`s)" -ForegroundColor Green
        $script:Installed++
    } else {
        Stop-Job $job -ErrorAction SilentlyContinue
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

function Seed-GlobalMemory {
    $personalDefaults = Join-Path $spsHome "personal-defaults.md"
    $globalMistakes = Join-Path $spsHome "global-mistakes.md"
    $learnedIndex = Join-Path $spsHome "learned\INDEX.md"

    if (-not (Test-Path $personalDefaults)) {
@"
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
"@ | Set-Content -Path $personalDefaults -Encoding UTF8
    }

    if (-not (Test-Path $globalMistakes)) {
@"
# SPS Global Mistakes

Use this file only for mistakes that should not be repeated across projects.
"@ | Set-Content -Path $globalMistakes -Encoding UTF8
    }

    if (-not (Test-Path $learnedIndex)) {
@"
# SPS Learned Topics

Shared research notes saved here.
"@ | Set-Content -Path $learnedIndex -Encoding UTF8
    }
}

function Write-Manifest {
@"
PROFILE=$Profile
AGENTS=$Agents
MANAGED_SKILLS=$($script:ManagedSkills -join ",")
CLAUDE_PLUGINS=$($script:ClaudePlugins -join ",")
CLAUDE_MARKETPLACES=$($script:ClaudeMarketplaces -join ",")
USE_CONTEXT7=$script:UseContext7
USE_GRAPHIFY=$script:UseGraphify
SYNC_PATHS=$($syncRoots -join ",")
"@ | Set-Content -Path $manifestPath -Encoding UTF8
}

function Sync-CoreSkill {
    $src = Join-Path $repoDir "skills\sps"
    if (-not (Test-Path $src)) {
        note "skills\sps not found - run from repo root"
        return
    }
    foreach ($destRoot in $syncRoots) {
        $dest = Join-Path $destRoot "sps"
        try {
            New-Item -ItemType Directory -Force -Path $destRoot -ErrorAction Stop | Out-Null
            if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
            Copy-Item -Path $src -Destination $destRoot -Recurse -Force -ErrorAction Stop
            note "+ synced /sps to $dest"
        } catch {
            note "- could not sync /sps to $destRoot"
        }
    }
}

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host "| Shahid Personal SkillSet install                                 |" -ForegroundColor Magenta
Write-Host ("| Profile: {0,-56}|" -f $Profile) -ForegroundColor Magenta
Write-Host ("| Agents: {0,-57}|" -f $Agents) -ForegroundColor Magenta
Write-Host "+==================================================================+" -ForegroundColor Magenta

section "Prerequisites"
if (have node) { note "Node.js $(node -v)" } else { Write-Host "Node.js required: https://nodejs.org" -ForegroundColor Red; exit 1 }
if (have npx) { note "npx available" } else { Write-Host "npx required (ships with Node.js)" -ForegroundColor Red; exit 1 }
if (have claude) { note "claude CLI found" } else { note "claude CLI not found - Claude extras will be skipped" }
if (have uv) { note "uv found" } else { note "uv not found - graphify may use pip" }
if (have pip) { note "pip found" } else { note "pip not found" }
$agentArgs = Get-AgentArgs
$agentArgsString = Get-AgentArgString

section "Core"
Step "/sps core skill" ([scriptblock]::Create("npx skills add `"$repoDir`" -g --copy -y $agentArgsString"))

if ($Profile -ne "minimal") {
    section "Balanced portable stack"
    $script:ManagedSkills += @("hallmark","impeccable","taste-skill","webapp-testing","web-design-guidelines","vercel-react-best-practices","vercel-composition-patterns")
    Step "hallmark" ([scriptblock]::Create("npx skills add nutlope/hallmark -g -y $agentArgsString"))
    Step "impeccable" ([scriptblock]::Create("npx skills add pbakaus/impeccable -g -y $agentArgsString"))
    Step "taste-skill" ([scriptblock]::Create("npx skills add Leonxlnx/taste-skill -g -y $agentArgsString"))
    Step "webapp-testing" ([scriptblock]::Create("npx skills add https://github.com/anthropics/skills --skill webapp-testing -g -y $agentArgsString"))
    Step "web-design-guidelines" ([scriptblock]::Create("npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines -g -y $agentArgsString"))
    Step "vercel-react-best-practices" ([scriptblock]::Create("npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -g -y $agentArgsString"))
    Step "vercel-composition-patterns" ([scriptblock]::Create("npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-composition-patterns -g -y $agentArgsString"))
}

if ($Profile -eq "full") {
    section "Optional specialists"
    $script:ManagedSkills += @("astro-framework","webgpu-claude-skill")
    Step "astro-framework" ([scriptblock]::Create("npx skills add withastro/astro -g -y $agentArgsString"))
    Step "webgpu-claude-skill" ([scriptblock]::Create("npx skills add dgreenheck/webgpu-claude-skill -g -y $agentArgsString"))

    if (have claude) {
        section "Claude extras"
        $rd = $repoDir
        $script:ClaudeMarketplaces += @("shahid-personal-skillset","ui-ux-pro-max-skill","claude-code-skills")
        $script:ClaudePlugins += @(
            "universal-build-orchestrator@shahid-personal-skillset",
            "ui-ux-pro-max@ui-ux-pro-max-skill",
            "engineering-skills@claude-code-skills",
            "engineering-advanced-skills@claude-code-skills",
            "marketing-skills@claude-code-skills",
            "a11y-audit@claude-code-skills",
            "docker-development@claude-code-skills"
        )
        Step "/sps Claude marketplace" ([scriptblock]::Create("claude plugin marketplace add `"$rd`""))
        Step "/sps Claude plugin" { claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope project }
        Step "ui-ux-pro-max marketplace" { claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill }
        Step "ui-ux-pro-max" { claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope project }
        Step "claude-code-skills marketplace" { claude plugin marketplace add alirezarezvani/claude-skills }
        Step "engineering-skills" { claude plugin install engineering-skills@claude-code-skills --scope project }
        Step "engineering-advanced-skills" { claude plugin install engineering-advanced-skills@claude-code-skills --scope project }
        Step "marketing-skills" { claude plugin install marketing-skills@claude-code-skills --scope project }
        Step "a11y-audit" { claude plugin install a11y-audit@claude-code-skills --scope project }
        Step "docker-development" { claude plugin install docker-development@claude-code-skills --scope project }
        $script:UseContext7 = 1
        Step "Context7 MCP" {
            $out = claude mcp add --scope project context7 -- npx -y @upstash/context7-mcp 2>&1
            if ($LASTEXITCODE -ne 0 -and $out -match "already exists") {
                Write-Output "MCP server context7 already exists"
            } else {
                if ($LASTEXITCODE -ne 0) { throw $out }
                Write-Output $out
            }
        }
    } else {
        note "Claude extras skipped because claude CLI was not found"
    }

    section "Optional research tools"
    if (have uv) {
        $script:UseGraphify = 1
        Step "graphify" { uv tool install graphifyy; graphify install }
    } elseif (have pip) {
        $script:UseGraphify = 1
        Step "graphify (pip)" { pip install graphifyy; graphify install }
    } else {
        note "graphify skipped because neither uv nor pip is available"
    }
}

section "Shared setup"
Seed-GlobalMemory
note "Seeded ~/.sps/personal-defaults.md, ~/.sps/global-mistakes.md, and ~/.sps/learned/INDEX.md"
Sync-CoreSkill
Write-Manifest
note "Wrote install manifest to ~/.sps/install-manifest.env"

section "Summary"
note "Installed steps: $script:Installed"
note "Skipped/failed steps: $script:Skipped"
if (Test-Path "$env:USERPROFILE\.claude\skills\sps\SKILL.md") { note "+ /sps present for Claude" } else { note "- /sps missing for Claude" }
if (Test-Path "$env:USERPROFILE\.cursor\skills\sps\SKILL.md") { note "+ /sps present for Cursor" } else { note "- /sps missing for Cursor" }
if (Test-Path "$env:USERPROFILE\.codex\skills\sps\SKILL.md") { note "+ /sps present for Codex" } else { note "- /sps missing for Codex" }
if (Test-Path "$env:USERPROFILE\.gemini\config\skills\sps") { note "+ /sps present for Gemini/Antigravity shared path" } else { note "- /sps missing for Gemini/Antigravity shared path" }
note "Log: $script:Log"

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host "| Install complete                                                 |" -ForegroundColor Green
Write-Host ("| Profile: {0,-56}|" -f $Profile) -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host ""

if ($script:Skipped -gt 0) {
    exit 1
}
