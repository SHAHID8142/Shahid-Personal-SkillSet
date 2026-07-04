# Skill Governance

`/sps` should prefer a small number of strong skills over a noisy pile of
overlapping ones.

## Status buckets

- **Primary default**: first choice for a domain
- **Secondary enhancer**: useful support when it adds something distinct
- **Conditional specialist**: only for narrow jobs
- **Host-specific**: only when the current host supports it
- **Deprecated by default**: do not install or invoke automatically

## Recommended defaults

| Domain | Primary default | Secondary enhancer | Notes |
|---|---|---|---|
| UI correctness | `web-design-guidelines` | `hallmark` | Use guidelines for correctness, `hallmark` for anti-slop direction. |
| Premium visual taste | `hallmark` | `impeccable`, `taste-skill` | Do not stack all three unless they add distinct value. |
| React quality / performance | `vercel-react-best-practices` | `vercel-composition-patterns` | Strong cross-agent defaults. |
| Broad web testing | `webapp-testing` | `microsoft/playwright`, `vitest-dev/vitest` | Use the broader testing workflow first, then framework-specific helpers. |
| Research / docs | `Context7` when available | `graphify` when available | Both are optional and capability-dependent. |
| Logos / brand icons | `theSVG` | official vendor asset page | Use official assets when trademark usage is sensitive or a slug is missing. |

## Claude-only or host-specific enhancers

These can be excellent, but they are not portable defaults:
- `ui-ux-pro-max`
- `engineering-skills`
- `engineering-advanced-skills`
- `marketing-skills`
- `a11y-audit`
- `docker-development`

Use them only when the host supports them.

## Conflict policy

### Do not automatically combine

- multiple design taste operators that all try to control the same aesthetics
- multiple smooth-scroll systems
- multiple 3D engines
- multiple testing frameworks for the same narrow step unless justified
- host-specific plugins plus generic portable skills when they give conflicting advice

### Examples

- Prefer `Lenis` or one scroll system, not several
- Prefer one primary 3D engine for a project
- Prefer one primary UI review baseline and one taste enhancer
- Prefer one testing recipe, then add focused tools only if needed

## Better additions adopted in this repo

These are now treated as stronger mainstream cross-agent defaults:
- `web-design-guidelines`
- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `webapp-testing`
