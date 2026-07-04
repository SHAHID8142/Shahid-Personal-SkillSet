# Install Profiles

`/sps` uses install profiles so the skillset can stay portable instead of
forcing every machine into the same heavy setup.

## Minimal

Use for the widest compatibility and lowest conflict risk.

Installs:
- `/sps`

Command:

```bash
npx skills add SHAHID8142/Shahid-Personal-SkillSet -g --agent claude-code --agent cursor --agent codex --agent antigravity --agent antigravity-cli --agent universal
```

## Balanced

Use as the default for most users. This keeps the stack cross-agent friendly
while adding high-confidence specialist skills.

Installs:
- `/sps`
- `hallmark`
- `impeccable`
- `taste-skill`
- `microsoft/playwright`
- `vitest-dev/vitest`
- `webapp-testing`
- `web-design-guidelines`
- `vercel-react-best-practices`
- `vercel-composition-patterns`

Representative commands:

```bash
npx skills add SHAHID8142/Shahid-Personal-SkillSet -g --agent '*'
npx skills add nutlope/hallmark -g --agent '*'
npx skills add pbakaus/impeccable -g --agent '*'
npx skills add Leonxlnx/taste-skill -g --agent '*'
npx skills add https://github.com/anthropics/skills --skill webapp-testing -g --agent '*'
npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines -g --agent '*'
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -g --agent '*'
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-composition-patterns -g --agent '*'
```

In the SPS installers, `--agents '*'` expands to:
- `claude-code`
- `cursor`
- `codex`
- `antigravity`
- `antigravity-cli`
- `universal`

## Full

Use only when the host and user actually benefit from extra tooling.

Includes everything in `balanced`, plus optional host-specific enhancers such as:
- Claude plugin entrypoint
- `ui-ux-pro-max`
- `engineering-skills`
- `engineering-advanced-skills`
- `marketing-skills`
- `a11y-audit`
- `docker-development`
- `graphify`
- `Context7`

The full profile is capability-aware:
- if `claude` is not present, Claude plugin steps are skipped
- if `uv` or `pip` is missing, `graphify` is skipped
- if MCP is unavailable, MCP setup is skipped

## Recommendation

- `minimal`: use when you want portability first
- `balanced`: use for day-to-day work on Claude, Cursor, Codex, and similar agents
- `full`: use only when you want the extra host-specific integrations
