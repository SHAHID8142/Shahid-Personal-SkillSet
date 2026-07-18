# Install Profiles

## Core (recommended default)

Installs:
- `/sps` (orchestrator + CMS/design/sync/router laws)
- `hallmark`
- `impeccable`
- `taste-skill` (secondary; do not stack with hallmark on the same chunk)
- `webapp-testing`
- `web-design-guidelines`
- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `karpathy-guidelines` (Forrest Chang / Andrej Karpathy guidelines)
- `theSVG` when available via skills CLI

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --profile core --yes
```

## Full

Everything in `core`, plus optional enhancers when the host supports them:
- Claude plugins (`ui-ux-pro-max`, engineering/marketing/a11y/docker sets)
- Trail of Bits security skills (Claude marketplace) when available
- `Context7`, `graphify`, Firecrawl, Handoff, Caveman (optional)
- Anthropic `frontend-design` only if not conflicting with active taste skill

## Minimal

`/sps` only.

## Agent expansion

`--agents '*'` expands to skills-compatible coding agents the installer knows:

- `claude-code`, `cursor`, `codex`
- `antigravity`, `antigravity-cli`
- `windsurf`, `github-copilot`, `opencode`, `cline`, `roo`, `kiro-cli`, `amp`
- `universal` (shared `~/.agents/skills` style paths)

Unsupported hosts still get project-local `.sps/` portability via METHOD-CARD.
