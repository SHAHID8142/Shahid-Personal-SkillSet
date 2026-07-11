# Install Profiles

`/sps` uses two install profiles so the skillset stays simple and portable.

## Core (recommended default)

Use for day-to-day work across Claude, Cursor, Codex, Antigravity, and similar
agents.

Installs:
- `/sps`
- `hallmark`
- `impeccable`
- `taste-skill`
- `webapp-testing`
- `web-design-guidelines`
- `vercel-react-best-practices`
- `vercel-composition-patterns`

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --profile core --yes
```

Alias: `balanced` still maps to `core`.

## Full

Use when you want host-specific extras on top of `core`.

Includes everything in `core`, plus optional enhancers such as:
- Claude plugin entrypoint
- `ui-ux-pro-max`
- `engineering-skills`
- `engineering-advanced-skills`
- `marketing-skills`
- `a11y-audit`
- `docker-development`
- `graphify`
- `Context7`
- optional specialists like `astro-framework`

The full profile is capability-aware:
- if `claude` is not present, Claude plugin steps are skipped
- if `uv` or `pip` is missing, `graphify` is skipped
- if MCP is unavailable, MCP setup is skipped

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --profile full --yes
```

## Optional alias: minimal

`minimal` still works and installs **only `/sps`** (fastest / most portable).
It is kept as an alias for power users, not a primary menu choice.

```bash
bash install.sh --profile minimal --yes
```

## Agent expansion

In the SPS installers, `--agents '*'` expands to:
- `claude-code`
- `cursor`
- `codex`
- `antigravity`
- `antigravity-cli`
- `universal`

## Recommendation

- `core`: default for almost everyone
- `full`: only when you want Claude/MCP extras
- `minimal`: only when you want `/sps` alone
