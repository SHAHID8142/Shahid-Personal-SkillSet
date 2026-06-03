# Catalog — what skill for what

Every entry is a real, verified skill. The orchestrator installs from these on demand; the setup
script installs them upfront. Sources stay upstream (not copied in), so they stay current.

| Skill | What it's for | Source |
|-------|---------------|--------|
| **hallmark** | Anti-AI-slop visual design — typography, color, layout, motion, microinteractions + pre-ship quality audit. Makes UI look intentionally crafted. | `Nutlope/hallmark` |
| **ui-ux-pro-max** | Design intelligence — UI styles, color palettes, font pairings, UX guidelines, chart types across many stacks. Design systems and layout decisions. | `nextlevelbuilder/ui-ux-pro-max-skill` |
| **frontend-design** | Distinctive, production-grade frontend interfaces that avoid the generic AI look. | `anthropics/skills` |
| **awwwards-animations** | One toolkit: GSAP + Framer Motion + Lenis + Anime.js with a decision matrix. Scroll-driven motion, parallax, stagger, 60fps timelines. | `devmartinese/awwwards-animations-skill` |
| **gsap (official)** | GreenSock's official skills — timelines, ScrollTrigger, plugins, framework integration. Deep GSAP work. | `greensock/gsap-skills` |
| **claudedesignskills** | 3D + advanced motion marketplace — three.js, react-three-fiber, gsap-scrolltrigger, motion-framer, animejs, lottie, locomotive-scroll. | `freshtechbro/claudedesignskills` |
| **Stripe / Cloudflare / Netlify / Expo** | Official backend, payments, and deploy skills. | `VoltAgent/awesome-agent-skills` |
| **backend & APIs** | General backend/API engineering skills. | `alirezarezvani/claude-skills` |
| **Sentry** | Error monitoring / debugging. | `VoltAgent/awesome-agent-skills` |
| **Trail of Bits** | Security review. | `VoltAgent/awesome-agent-skills` |
| **mattpocock/skills** | Test-first / phase-gate workflow guardrails. | `mattpocock/skills` |
| **SEO + Google Ads** | SEO audits, schema markup, meta tags, PageSpeed, Search Console. | `alirezarezvani/claude-skills` |
| **marketing / content** | Growth, content-ops, copywriting, outbound. | `alirezarezvani/claude-skills` |
| **graphify** | Turn a codebase / docs into a queryable knowledge graph. Research over large material; big token savings per query. | `safishamsi/graphify` |
| **Context7** | Up-to-date, version-specific docs for any library, on demand. Stops outdated/hallucinated APIs. | `upstash/context7` (MCP) |

## How to add to the catalog

1. Find the skill (browse [claudemarketplaces.com](https://claudemarketplaces.com),
   `VoltAgent/awesome-agent-skills`, or the [MCP registry](https://registry.modelcontextprotocol.io)).
2. Review its `SKILL.md` and any scripts.
3. Add a row here **and** a row in the orchestrator's Catalog section
   (`plugins/universal-build-orchestrator/skills/universal-build-orchestrator/SKILL.md`) with its
   install command, so the orchestrator can auto-install it.
4. Commit and push so every machine gets it.
