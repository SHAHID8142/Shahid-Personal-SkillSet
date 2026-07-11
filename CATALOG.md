# Shahid Personal SkillSet - Catalog

This catalog is now curated for cross-agent robustness, not maximum volume.

## How to use

```text
/sps [your request]
```

The core workflow is portable. Advanced behavior depends on the host. See
`skills/sps/CAPABILITY-MATRIX.md` for the support model.

## Install profiles

- `core`: `/sps` plus curated portable specialist skills (recommended)
- `full`: `core` plus optional host-specific enhancers
- aliases: `balanced` → `core`, `minimal` → `/sps` only

See `skills/sps/INSTALL-PROFILES.md`.

## Curated defaults

| Domain | Status | Skill | Why |
|---|---|---|---|
| UI correctness | Primary default | `web-design-guidelines` | Strong mainstream review baseline with cross-agent install path. |
| UI taste | Primary default | `hallmark` | Anti-slop design direction. |
| UI taste | Secondary enhancer | `impeccable` | Polish operator, useful but not a full design baseline by itself. |
| Premium visual direction | Secondary enhancer | `taste-skill` | Strong aesthetic steering, best used selectively. |
| React performance | Primary default | `vercel-react-best-practices` | Large adoption and strong React/Next guidance. |
| React architecture | Secondary enhancer | `vercel-composition-patterns` | Good complement for maintainable component APIs. |
| Broad web testing | Primary default | `webapp-testing` | Cross-agent testing workflow, not tied to one framework only. |
| E2E specifics | Secondary enhancer | `microsoft/playwright` | Good when Playwright is already part of the stack. |
| Unit testing | Secondary enhancer | `vitest-dev/vitest` | Strong default for JS/TS unit tests. |
| Logos / brand icons | Primary default | `theSVG` | Standardized brand/cloud icon source. |

## Host-specific enhancers

These are useful but should not be treated as universal defaults:

| Host | Skill | Status |
|---|---|---|
| Claude Code | `ui-ux-pro-max` | Optional full-profile enhancer |
| Claude Code | `engineering-skills` | Optional full-profile enhancer |
| Claude Code | `engineering-advanced-skills` | Optional full-profile enhancer |
| Claude Code | `marketing-skills` | Optional full-profile enhancer |
| Claude Code | `a11y-audit` | Optional full-profile enhancer |
| Claude Code | `docker-development` | Optional full-profile enhancer |
| Any host with MCP | `Context7` | Optional enhancer |
| Any host with shell + Python/uv | `graphify` | Optional enhancer |

## Conflicts removed from the default path

These are no longer installed or invoked by default because they are noisy,
overlapping, or too host-specific:

- multiple scroll/motion libraries for the same job
- multiple 3D engines without a project-specific reason
- giant Claude-only design stacks on hosts that are not Claude
- "invoke every matching skill" behavior

## When adding a new skill

1. Check whether it is cross-agent or host-specific.
2. Score it for reputation, maintenance, portability, and conflict risk.
3. Decide whether it is:
   - primary default
   - secondary enhancer
   - conditional specialist
   - host-specific
   - deprecated by default
4. Update:
   - `skills/sps/SKILL-GOVERNANCE.md`
   - `skills/sps/INSTALL-PROFILES.md`
   - `install.sh`
   - `install.ps1`
