# Shahid Personal SkillSet (`/sps`)

`/sps` is a project-scoped master workflow for AI coding agents.

It is designed to work across Claude, Cursor, Codex, Antigravity, and similar
skills-compatible agents, but it does **not** pretend every host has identical
features. The core workflow is portable. Advanced integrations depend on host
capabilities.

## What `/sps` does

When you invoke `/sps`, the agent should:

1. read the Method Card; detect host; write `./.sps/agent.md` + VERSION
2. bootstrap enhanced `.sps/` docs + root mirrors (`AGENTS.md` / `GEMINI.md` / `CLAUDE.md`)
3. legacy projects: scored audit (+ CMS debt) before building
4. discovery grill including team/multi-agent and deploy target/method
5. docs pack + pre-build “anything missing?” confirm
6. CMS Foundation (when CMS enabled), then section-by-section **UI + CMS together**
7. skill router (install-or-instruct), roles, todos, design gate, hygiene, cleanup
8. stop for approval after Section DoD (including CMS round-trip proof)
9. use `/sps sync` for storefront/CMS debt on pending projects
10. verify honestly before handoff (Known / Assumed / Unverified)

Portability: skills-compatible coding agents. Not identical everywhere. Not for
generic chatbots.

## Compatibility

| Host | Support level | Notes |
|---|---|---|
| Claude Code | Full | Best host for `/sps`, including plugin and MCP enhancers. |
| Cursor | High | Core workflow is strong; use Cursor-native tools instead of Claude plugin assumptions. |
| Codex | High | Core workflow is portable; advanced integrations vary by runtime. |
| Antigravity / Gemini CLI | Medium | Requires root mirrors; keep stack simple and capability-aware. |
| Windsurf / Copilot / OpenCode family | Medium–Varies | Portable laws via SKILL.md + `.sps/`; enhancers optional. |
| Other skills-compatible agents | Varies | Use the portable workflow and fall back cleanly. |

For the detailed host model, see [`skills/sps/CAPABILITY-MATRIX.md`](skills/sps/CAPABILITY-MATRIX.md).

## Install

### One command (recommended)

Clones or updates the repo under `~/.sps/src/Shahid-Personal-SkillSet`, then
runs the installer with a clean progress UI.

Mac / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash
```

Noninteractive core install:

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --profile core --yes
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.ps1 | iex
```

Or:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.ps1))) -Profile core -Yes
```

### Profiles

| Profile | What you get |
|---|---|
| `core` | **Recommended.** `/sps` + curated portable skills |
| `full` | Core + Claude plugins / MCP / extras |

Alias: `balanced` → `core`. Optional: `minimal` → `/sps` only.

### Update later

```bash
bash ~/.sps/src/Shahid-Personal-SkillSet/scripts/sps-update.sh --profile core --yes
# or
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --yes
```

### Health check

```bash
bash ~/.sps/src/Shahid-Personal-SkillSet/scripts/sps-doctor.sh
```

### Local install (already cloned)

```bash
bash install.sh --profile core --yes
bash install.sh --profile full --yes
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1 -Profile core -Yes
```

See [`skills/sps/INSTALL-PROFILES.md`](skills/sps/INSTALL-PROFILES.md).

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
/sps audit
```

Examples:
- `/sps design a premium landing page for a fintech startup`
- `/sps build a dashboard section by section with approval checkpoints`
- `/sps fix this production bug and verify the deploy path`
- `/sps compare CMS options for this project and recommend one`
- `/sps audit`
- `/sps improve this existing website` (forces audit first if `.sps/` was missing)

## Key design rules

- once `./.sps/` exists, `/sps` stays required for that project’s build work
- project rules do not leak into other projects
- memory files are written at boot and after every approved section
- active agent identity + SPS version are stored in `./.sps/agent.md`
- discovery happens before implementation
- section-by-section approval is required, with abort conditions
- capability detection happens before extra tooling
- no invented files, APIs, packages, or “tests passed” claims
- verification is required before handoff
- UI work defaults to minimal mobile: responsive, low-end safe, budgeted assets, no fancy/laggy phone effects unless explicitly approved
- repeated mistakes can be promoted into project or personal rules only with approval

## Maintainer checks

```bash
bash scripts/lint-sps.sh
bash scripts/smoke-sps.sh
bash scripts/bootstrap-sps.sh /path/to/project
```

CI runs the same lint + smoke checks on every push and pull request via
`.github/workflows/sps-ci.yml`.

Windows PowerShell syntax (when `pwsh` is installed):

```powershell
pwsh -NoProfile -File scripts/check-powershell.ps1
```

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
├── skills/sps/*.md                 # reference docs
├── skills/sps/templates/           # project .sps bootstrap templates
├── skills/sps/hosts/               # thin host adapters
├── scripts/bootstrap-sps.sh
├── scripts/lint-sps.sh
├── scripts/smoke-sps.sh
├── get-sps.sh
├── get-sps.ps1
├── scripts/sps-doctor.sh
├── scripts/sps-update.sh
├── scripts/check-powershell.ps1
├── .github/workflows/sps-ci.yml
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
`core` profile unless you specifically need host-specific extras.
