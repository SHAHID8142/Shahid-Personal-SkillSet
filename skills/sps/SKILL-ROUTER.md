# Skill Router

`/sps` remains the only orchestrator. Do **not** install Superpowers (or similar)
as a second orchestrator by default.

## Protocol (every chunk)

1. Detect job domains (UI, review, React, CMS, security, test, backend, …)
2. Pick **one primary** skill per domain from the table below
3. Optional **one secondary** if it adds distinct value
4. If a required skill is missing:
   - try install with the host's supported method (`npx skills`, plugin marketplace,
     copy into skills dir, or this repo's installer)
   - if install fails, stop and give the user exact manual install steps
5. Invoke only the selected skills
6. If unavailable, use SPS fallback docs + expert persona and say so

## Default map (portable core)

| Domain | Primary | Secondary | Fallback if missing |
|---|---|---|---|
| Anti-slop / taste | `hallmark` | `impeccable` | DESIGN-GATE.md |
| UI review / a11y | `web-design-guidelines` | host a11y skill | DESIGN-GATE + manual a11y list |
| React quality | `vercel-react-best-practices` | `vercel-composition-patterns` | stack best practices in repo |
| Testing | `webapp-testing` | Playwright skill | VERIFICATION-RECIPES.md |
| Surgical behavior | Karpathy guidelines skill | — | CONTEXT-EFFICIENCY.md |
| Security | Trail of Bits differential-review (when available) | host security review | security checks in SECTION-DOD |
| CMS coupling | SPS CMS-COUPLING | — | (required; not optional) |
| Logos | `theSVG` | official brand source | LOGO-SOURCES.md |
| Docs / library APIs | Context7 MCP when available | — | official docs fetch |

## Conflict ban

Do not auto-combine:
- hallmark + taste-skill + Anthropic frontend-design + ui-ux-pro-max
- multiple scroll/motion systems
- multiple testing frameworks for the same step
- Superpowers workflow as a parallel orchestrator

## Full-profile enhancers

Claude-only or heavy tools (ui-ux-pro-max, engineering-skills, Trail of Bits full
suite, Firecrawl, Caveman, Handoff) stay optional. Prefer them only when the host
supports them and the chunk needs them.
