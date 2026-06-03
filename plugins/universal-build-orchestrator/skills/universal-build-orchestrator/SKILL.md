---
name: universal-build-orchestrator
description: Universal build router for any project. Use this whenever the user asks to build, make, create, design, implement, animate, optimize, or improve something — a website, landing page, dashboard, UI, animation, API/backend, deploy, debug, security review, SEO, content, or research task. It detects which specialized skill the request needs, and if that skill isn't installed yet it installs it automatically from the vetted catalog below, then uses it. Always consult this skill first on any "build X for me" request.
---

# Universal Build Orchestrator

This skill turns any "build this for me" request into: detect the domain → pick the best skill →
install it automatically if missing → use it. It only installs from the vetted catalog in this
file — never from arbitrary web search results.

## Procedure (follow every time you're triggered)

1. **Read the request and detect domains.** Match the user's words to one or more rows in the
   Catalog below (a request can need several — e.g. "build an animated SaaS landing page" needs
   design + animation + maybe frontend).
2. **Check what's already installed.** Look in `~/.claude/skills/` and run `claude plugin list`
   (or `/plugin` interactively) to see installed plugins/skills.
3. **Auto-install anything missing** from the matched rows, using that row's install command.
   Install without pausing to ask (this is the user's standing preference). Install **only** skills
   listed in the Catalog.
4. **Reload**, then use the skill. After installing, run `/reload-plugins` (interactive) so the new
   skill is active, then proceed with the actual task using that skill's guidance.
5. **If an install command fails**, open the skill's source repo README, use the exact command it
   documents, and retry. If it still fails, tell the user which skill failed and continue with the
   skills that did install.

## Catalog (what to use for what + how to install)

Install commands use the Claude Code CLI (`claude plugin ...`) or the cross-agent skills CLI
(`npx skills add ...`). Pin versions where the source supports it. Verify against each repo's
README if a command errors.

### Design & frontend
- **hallmark** — anti-AI-slop visual design: typography, color, layout, motion, microinteractions,
  and a pre-ship quality audit. Use for: making any UI look intentionally crafted, redesigns, audits.
  Source: `Nutlope/hallmark`. Install: check the repo README for its current installer
  (`npx`-based); or copy its `SKILL.md` + `references/` into `~/.claude/skills/hallmark/`.
- **ui-ux-pro-max** — design intelligence: 60+ UI styles, 160+ color palettes, font pairings, UX
  guidelines, chart types across many stacks (React, Next, Vue, Svelte, Flutter, SwiftUI, Tailwind…).
  Use for: design systems, palettes, layout/UX decisions, "design this page/dashboard."
  Source: `nextlevelbuilder/ui-ux-pro-max-skill`.
  Install: `claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill` then
  `claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user`.
- **frontend-design** — distinctive, production-grade frontend interfaces that avoid the generic AI
  look. Use for: component/page implementation with strong defaults. (Overlaps hallmark; pair them.)
  Source: Anthropic skills — `anthropics/skills` (locate the frontend-design skill path and install/copy).

### Animation & motion
- **awwwards-animations** — one toolkit bundling GSAP, Framer Motion, Lenis smooth scroll, and
  Anime.js with a decision matrix and React hooks/cleanup patterns. Use for: scroll-driven motion,
  parallax, stagger reveals, magnetic cursors, 60fps timelines. Covers your gsap/framer/lenis/anime
  needs in one. Source: `devmartinese/awwwards-animations-skill` (install per its README / claudemarketplaces).
- **gsap (official)** — GreenSock's official skills: timelines, ScrollTrigger, plugins, React/Vue/
  Svelte/vanilla. Use for: deep/complex GSAP work. Source: `greensock/gsap-skills`.
  Install: `npx skills add https://github.com/greensock/gsap-skills` (verify flags in README).
- **claudedesignskills** — marketplace for 3D + advanced motion: three.js, react-three-fiber,
  gsap-scrolltrigger, motion-framer, animejs, locomotive-scroll, lottie. Use for: 3D/WebGL, advanced
  scroll. Source: `freshtechbro/claudedesignskills`.
  Install: `claude plugin marketplace add freshtechbro/claudedesignskills` then
  `claude plugin install <plugin>@claudedesignskills --scope user` (e.g. gsap-scrolltrigger, motion-framer, animejs).

### Backend, APIs & deploy
- **official platform skills** — Stripe (payments), Cloudflare, Netlify (deploy/edge), Expo.
  Use for: backend integrations, payments, deployment. Source: `VoltAgent/awesome-agent-skills`
  (official-team skills). Install: `npx skills add https://github.com/VoltAgent/awesome-agent-skills --skill <skill-path>` (find the path in the repo table), or copy the skill folder.
- **backend & APIs skills** — general backend/API skills. Source: `alirezarezvani/claude-skills`.
  Install: `claude plugin marketplace add alirezarezvani/claude-skills` then
  `claude plugin install <plugin>@claude-code-skills --scope user`.

### Debug, security & code quality
- **Sentry** (error monitoring/debugging) and **Trail of Bits** (security review) — official skills
  via `VoltAgent/awesome-agent-skills` (install the specific skill path as above).
- **mattpocock/skills** — test-first / phase-gate workflow guardrails. Use for: disciplined,
  reviewable changes. Install: review repo, copy chosen `SKILL.md` folders into `~/.claude/skills/`.

### SEO, growth, marketing & content
- **SEO + Google Ads skills** — Search Console, PageSpeed, schema markup, meta tags; plus marketing,
  content-ops, and research skills. Use for: SEO audits, structured data, copy/content, growth.
  Source: `alirezarezvani/claude-skills` (marketing/SEO/research categories).
  Install: `claude plugin install <plugin>@claude-code-skills --scope user`.

### Research, docs & memory
- **graphify** — turn a codebase or doc set into a queryable knowledge graph (big token savings per
  query). Use for: large repos, research over many docs. Source: `safishamsi/graphify`.
  Install: `uv tool install graphifyy && graphify install`.
- **Context7** — up-to-date, version-specific docs for any library, pulled on demand. Use for:
  stopping outdated/hallucinated APIs. Source: `upstash/context7` (MCP server).
  Install: `claude mcp add context7 -- npx -y @upstash/context7-mcp`.

## Guardrails

- Install **only** from this catalog. If a task needs something not listed, tell the user and ask
  before adding a new source — do not auto-install from arbitrary search results.
- These are third-party skills that run code. They're pre-vetted here, but if a source repo looks
  changed/abandoned, flag it rather than installing blindly.
- Prefer the smallest set of skills that covers the task (don't install the whole catalog for a
  one-line request — the setup script already handles bulk install).
- After installs, `/reload-plugins`, then do the actual work the user asked for.
