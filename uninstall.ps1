# Shahid Personal SkillSet - Uninstaller (Windows PowerShell)
# -------------------------------------------------------------
# Removes all /sps skills and catalog skills from all agents.
# Does NOT delete your personal data: ~/.sps/profile.md, mistakes.md, learned/
#
# Usage: .\uninstall.ps1
#        .\uninstall.ps1 -All    (also removes ~/.sps/ personal data)

param([switch]$All)

$ErrorActionPreference = "Continue"

function ok($msg)      { Write-Host "  [OK] $msg" -ForegroundColor Green }
function info($msg)    { Write-Host "   --> $msg" -ForegroundColor Yellow }
function removed($msg) { Write-Host "   [-] $msg" -ForegroundColor Red }
function section($msg) { Write-Host ""; Write-Host "-- $msg --" -ForegroundColor Cyan }

Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host "|         Shahid Personal SkillSet - Uninstaller (Windows)         |" -ForegroundColor Magenta
Write-Host "+==================================================================+" -ForegroundColor Magenta
Write-Host ""

if ($All) {
    Write-Host "WARNING: -All flag set. Will also delete $env:USERPROFILE\.sps\" -ForegroundColor Red
    $confirm = Read-Host "Are you sure? (yes/no)"
    if ($confirm -ne "yes") { Write-Host "Aborted."; exit 0 }
}

# -- Remove agent-installed skills ---------------------------------------------
section "Removing globally installed skills"

function Remove-AgentSkill($name) {
    $paths = @(
        "$env:USERPROFILE\.agents\skills\$name",
        "$env:USERPROFILE\.claude\skills\$name",
        "$env:USERPROFILE\.cursor\rules\$name.mdc",
        "$env:USERPROFILE\.codex\skills\$name",
        "$env:USERPROFILE\.gemini\skills\$name",
        "$env:USERPROFILE\.gemini\antigravity\skills\$name",
        "$env:USERPROFILE\.windsurf\skills\$name"
    )
    $found = $false
    foreach ($p in $paths) {
        if (Test-Path $p) { Remove-Item -Recurse -Force $p; $found = $true }
    }
    if ($found) { removed $name }
}

Remove-AgentSkill "sps"
Remove-AgentSkill "universal-build-orchestrator"
Remove-AgentSkill "hallmark"

$gsapSkills = @("gsap-core","gsap-frameworks","gsap-performance","gsap-plugins","gsap-react","gsap-scrolltrigger","gsap-timeline","gsap-utils")
foreach ($s in $gsapSkills) { Remove-AgentSkill $s }

Remove-AgentSkill "awwwards-animations"

$r3fSkills = @("r3f-animation","r3f-fundamentals","r3f-geometry","r3f-interaction","r3f-lighting","r3f-loaders","r3f-materials","r3f-physics","r3f-postprocessing","r3f-shaders","r3f-textures")
foreach ($s in $r3fSkills) { Remove-AgentSkill $s }

$otherSkills = @("tailwind-design-system","threejs-fundamentals","nextjs-app-router-patterns","vercel-composition-patterns","vercel-react-best-practices","supabase","supabase-postgres-best-practices")
foreach ($s in $otherSkills) { Remove-AgentSkill $s }

# -- Remove Claude plugins -----------------------------------------------------
section "Removing Claude plugins"

if (Get-Command claude -ErrorAction SilentlyContinue) {
    $plugins = @(
        "universal-build-orchestrator@shahid-personal-skillset",
        "ui-ux-pro-max@ui-ux-pro-max-skill",
        "gsap-scrolltrigger@claude-design-skillstack",
        "frontend-design@claude-design-skillstack",
        "scroll-reveal-libraries@claude-design-skillstack",
        "playcanvas-engine@claude-design-skillstack",
        "web3d-integration-patterns@claude-design-skillstack",
        "blender-web-pipeline@claude-design-skillstack",
        "animejs@claude-design-skillstack",
        "locomotive-scroll@claude-design-skillstack",
        "modern-web-design@claude-design-skillstack",
        "animated-component-libraries@claude-design-skillstack",
        "threejs-webgl@claude-design-skillstack",
        "react-three-fiber@claude-design-skillstack",
        "babylonjs-engine@claude-design-skillstack",
        "aframe-webxr@claude-design-skillstack",
        "spline-interactive@claude-design-skillstack",
        "pixijs-2d@claude-design-skillstack",
        "lightweight-3d-effects@claude-design-skillstack",
        "react-spring-physics@claude-design-skillstack",
        "lottie-animations@claude-design-skillstack",
        "rive-interactive@claude-design-skillstack",
        "barba-js@claude-design-skillstack",
        "engineering-skills@claude-code-skills",
        "engineering-advanced-skills@claude-code-skills",
        "marketing-skills@claude-code-skills",
        "research-ops-skills@claude-code-skills",
        "a11y-audit@claude-code-skills",
        "docker-development@claude-code-skills"
    )
    foreach ($p in $plugins) {
        claude plugin uninstall $p --scope project 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) { removed $p }
    }

    foreach ($mkt in @("shahid-personal-skillset","ui-ux-pro-max-skill","claude-design-skillstack","claude-code-skills")) {
        claude plugin marketplace remove $mkt 2>$null
        if ($LASTEXITCODE -eq 0) { removed "marketplace: $mkt" }
    }

    claude mcp remove context7 --scope project 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) { removed "Context7 MCP" }
} else {
    info "claude CLI not found - skipping Claude plugin removal"
}

# -- Remove graphify -----------------------------------------------------------
section "Removing graphify"
if (Get-Command uv -ErrorAction SilentlyContinue) {
    uv tool uninstall graphifyy 2>$null
    if ($LASTEXITCODE -eq 0) { removed "graphify (uv)" }
} elseif (Get-Command pip -ErrorAction SilentlyContinue) {
    pip uninstall graphifyy -y 2>$null
    if ($LASTEXITCODE -eq 0) { removed "graphify (pip)" }
}
$graphifySkill = "$env:USERPROFILE\.claude\skills\graphify"
if (Test-Path $graphifySkill) { Remove-Item -Recurse -Force $graphifySkill; removed "graphify skill" }

# -- Remove personal data (only with -All) ------------------------------------
if ($All) {
    section "Removing personal data (~/.sps/)"
    $spsDir = "$env:USERPROFILE\.sps"
    if (Test-Path $spsDir) { Remove-Item -Recurse -Force $spsDir; removed "~\.sps\ (profile, mistakes, learned)" }
} else {
    section "Personal data kept"
    ok "~\.sps\ kept intact (profile, mistakes, learned topics)"
    info "To also remove personal data: .\uninstall.ps1 -All"
}

# -- Done ----------------------------------------------------------------------
Write-Host ""
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host "|                    Uninstall complete                             |" -ForegroundColor Green
Write-Host "|                                                                  |" -ForegroundColor Green
Write-Host "|  To reinstall: powershell -ExecutionPolicy Bypass -File install.ps1  |" -ForegroundColor Green
Write-Host "+==================================================================+" -ForegroundColor Green
Write-Host ""
