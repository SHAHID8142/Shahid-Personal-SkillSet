# Shahid Personal SkillSet (`/sps`)

`/sps` is a project-scoped master workflow for AI coding agents.

It is designed to work across Claude, Cursor, Codex, Antigravity, and similar
skills-compatible agents, but it does **not** pretend every host has identical
features. The core workflow is portable. Advanced integrations depend on host
capabilities.

## What `/sps` does

When you invoke `/sps`, the agent should:

1. load project-scoped memory before global defaults
2. ask mandatory discovery questions
3. research options and recommend one path
4. choose the best role and specialist stack for the phase
5. build section by section with approvals
6. verify the work before handoff

## Compatibility

| Host | Support level | Notes |
|---|---|---|
| Claude Code | Full | Best host for `/sps`, including plugin and MCP enhancers. |
| Cursor | High | Core workflow is strong; use Cursor-native tools instead of Claude plugin assumptions. |
| Codex | High | Core workflow is portable; advanced integrations vary by runtime. |
| Antigravity / Gemini CLI | Medium | Core workflow works; keep the stack simple and capability-aware. |
| Other skills-compatible agents | Varies | Use the portable workflow and fall back cleanly. |

For the detailed host model, see [`skills/sps/CAPABILITY-MATRIX.md`](skills/sps/CAPABILITY-MATRIX.md).

## Install

### Minimal

Installs only `/sps` for maximum portability.

```bash
npx skills add SHAHID8142/Shahid-Personal-SkillSet -g --agent claude-code --agent cursor --agent codex --agent antigravity --agent antigravity-cli --agent universal
```

### Balanced

Recommended default. Installs `/sps` plus a small set of strong, portable
specialist skills.

```bash
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
bash install.sh --profile balanced --agents '*'
```

Windows:

```powershell
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
powershell -ExecutionPolicy Bypass -File install.ps1 -Profile balanced -Agents "*"
```

### Full

Adds optional host-specific enhancers such as Claude plugins, `graphify`, and
MCP setup where supported.

```bash
bash install.sh --profile full --agents '*'
```

See [`skills/sps/INSTALL-PROFILES.md`](skills/sps/INSTALL-PROFILES.md).

### One-command bootstrap

Mac / Linux:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/install.sh) --profile balanced --agents '*'
```

Windows PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "$tmp=Join-Path $env:TEMP 'sps-install.ps1'; irm https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/install.ps1 -OutFile $tmp; & $tmp -Profile balanced -Agents '*'"
```

The installer writes an install manifest to `~/.sps/install-manifest.env` so the
uninstaller can remove what the installer managed.

When you pass `--agents '*'`, the installer targets this curated mainstream set:
`claude-code`, `cursor`, `codex`, `antigravity`, `antigravity-cli`, and `universal`.

The core `/sps` skill is also mirrored into the major global skill roots
directly, so local-repo installs do not depend on uneven host detection in the
Skills CLI.

The install scripts exit nonzero if any requested step fails, which makes them
safe to use from automation and CI.

## Uninstall

By default, uninstall removes `/sps`, the curated installed skills, host
integrations, and `~/.sps/` personal data.

Mac / Linux:

```bash
bash uninstall.sh
bash uninstall.sh --yes
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File uninstall.ps1
powershell -ExecutionPolicy Bypass -File uninstall.ps1 -Yes
```

If you want to keep `~/.sps/` personal data:

```bash
bash uninstall.sh --keep-personal
bash uninstall.sh --keep-personal --yes
```

```powershell
powershell -ExecutionPolicy Bypass -File uninstall.ps1 -KeepPersonal
powershell -ExecutionPolicy Bypass -File uninstall.ps1 -KeepPersonal -Yes
```

## Use

In any supported host:

```text
/sps [your request]
```

Examples:
- `/sps design a premium landing page for a fintech startup`
- `/sps build a dashboard section by section with approval checkpoints`
- `/sps fix this production bug and verify the deploy path`
- `/sps compare CMS options for this project and recommend one`

## Key design rules

- project rules do not leak into other projects
- discovery happens before implementation
- section-by-section approval is required
- capability detection happens before extra tooling
- verification is required before handoff
- low-end mobile and responsiveness are first-class concerns

## Better defaults adopted

This repo now treats a smaller set of cross-agent skills as stronger defaults:
- `web-design-guidelines`
- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `webapp-testing`
- `hallmark`
- `impeccable`
- `taste-skill`

The repo also standardizes brand/logo sourcing around [`theSVG`](https://thesvg.org/).

## Repo structure

```text
Shahid-Personal-SkillSet/
├── skills/sps/SKILL.md
├── skills/sps/*.md                 # reference docs for capability, profiles, verification, etc.
├── plugins/universal-build-orchestrator/
├── install.sh
├── install.ps1
├── uninstall.sh
├── uninstall.ps1
├── CATALOG.md
└── README.md
```

## Safety note

This repo intentionally avoids claiming that every agent or IDE supports the
same workflow. Review third-party skills before trusting them, and prefer the
`balanced` profile unless you specifically need host-specific extras.
