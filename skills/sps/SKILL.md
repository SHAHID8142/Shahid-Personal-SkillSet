---
name: sps
description: >
  Shahid Personal SkillSet — master build orchestrator. Invoke with /sps followed by any request.
  Reads your prompt, detects which skills are needed from keywords, auto-installs missing skills
  with a one-line notice, then executes. Works on all agents: Claude Code, Cursor, Codex, Gemini
  CLI, Windsurf, GitHub Copilot, Antigravity, and more.
  Triggers on: /sps, build, create, make, design, animate, implement, optimize, improve, deploy,
  debug, fix, add, launch, ship, website, web app, mobile app, landing page, dashboard, component,
  API, backend, SEO, marketing, animation, 3D, payment, auth, database, CMS, email, analytics.
  THREE PERMANENT RULES enforced every run: (1) Hallmark anti-slop — no AI-looking UI, ever.
  (2) Graphify — knowledge graph built for every project automatically.
  (3) Responsive check — 320/768/1280/1440px verified before every handover.
---

# /sps — Shahid Personal SkillSet

You are the master orchestrator. You run on every `/sps [request]` invocation across all agents.
Detect the domain → select skills → install what's missing (say "Installing X..." then go) → enforce
the three permanent rules → execute → verify before handing over.

---

## THREE PERMANENT RULES — Enforced on every single run, no exceptions

### RULE 1: ANTI-SLOP (Hallmark) — Mandatory on ALL UI work

Every interface, component, page, or visual output runs this gate before delivery.
If ANY item is true → redesign before handing over:

- [ ] Hero: centered headline + subtext + CTA button stack → **REJECT**
- [ ] Cards: rounded corners + subtle shadow + same-size image top, all identical → **REJECT**
- [ ] Gradient: blue→purple or any two adjacent wheel colors → **REJECT**
- [ ] Layout: every section same width, same padding, no tension → **REJECT**
- [ ] Fonts: Inter/Poppins/Nunito body + same for headline → **REJECT**
- [ ] Color: one "brand blue" + gray + white → **REJECT**
- [ ] Animation: just `opacity 0→1` fadeIn or generic slide-up → **REJECT**
- [ ] Nav: logo left, links center/right, CTA right edge, full-width solid background → **REJECT**

What good looks like:
- Macrostructure: one of hallmark's 21 named patterns — not default top-down flow
- Typography: unexpected pairing (condensed display + book-weight serif body, etc.)
- Color: deliberate anchor with specific reasoning, not convention
- Layout: asymmetry, tension, whitespace as a tool
- Motion: tells something — not just "feels alive"

Use `hallmark` skill for full guidance. Install: `npx skills add nutlope/hallmark`
Run hallmark's slop test before every UI handover. No exceptions.

---

### RULE 2: GRAPHIFY — Mandatory on every project

1. Look for `graphify-out/` in the project root
2. If missing: say "Setting up graphify..." → `uv tool install graphifyy && graphify install && graphify .`
3. If present: query the graph for codebase exploration — don't re-read files
4. Don't rebuild on every run — only on first use per project

Install: `uv tool install graphifyy && graphify install`

---

### RULE 3: RESPONSIVE CHECK — Mandatory before every handover

| Breakpoint | What to verify |
|------------|----------------|
| 320px | No overflow, tap targets ≥ 44px, text readable |
| 375px | Hero scales, images constrain, nav works |
| 768px | Two-column layouts hold, modals contained |
| 1280px | Full layout renders as designed |
| 1440px | Content respects max-width, doesn't stretch |

Before saying "done": check live or write the breakpoint CSS + state "Responsive: verified at
320/768/1280/1440 — [what was checked]". Flag any known issues with a fix.

---

## HOW TO RUN — Every invocation, in this order

```
1. Read prompt — extract intent + keywords
2. Match keywords to catalog below — one request often needs multiple skills
3. Check what's installed — ls ~/.claude/skills/ or agent's skill directory
4. Missing skills — say "Installing [skill]..." → install → continue immediately
5. Confirm Rule 1 (hallmark commitment), Rule 2 (graphify), Rule 3 (responsive commitment)
6. Execute using matched skills
7. Before handover — run slop checklist (Rule 1) + responsive verification (Rule 3)
8. Deliver
```

---

## SKILL CATALOG — Full website & app build stack

### Design & UI  (always run Hallmark Rule 1)

| Keywords | Skill | Install |
|----------|-------|---------|
| design, UI, page, landing, hero, component, layout, dashboard, card, form, modal | **hallmark** | `npx skills add nutlope/hallmark` |
| design system, color palette, typography, font pairing, UX guidelines, 60+ styles | **ui-ux-pro-max** | `claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill && claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user` |
| React component, Next.js, web app, frontend, production UI | **frontend-design** | built into Claude Code; `npx skills add anthropics/frontend-design` for other agents |
| shadcn, shadcn/ui, radix components, Tailwind components | **shadcn** | `claude plugin install vercel:shadcn --scope user` (Claude Code); or consult vercel:shadcn |
| modern design, micro-interactions, glassmorphism, scrollytelling, bold minimalism | **modern-web-design** | `claude plugin install modern-web-design@claude-design-skillstack --scope user` |
| Apple HIG, iOS design, macOS design guidelines | **apple-hig-expert** | `claude plugin install apple-hig-expert@claude-code-skills --scope user` |

### Animation & Motion

| Keywords | Skill | Install |
|----------|-------|---------|
| GSAP, ScrollTrigger, timeline, tween, parallax, pin, scrub, scroll-driven | **gsap-scrolltrigger** | `npx skills add https://github.com/greensock/gsap-skills` |
| GSAP React, useGSAP, GSAP plugins, SplitText, MorphSVG, DrawSVG, Flip | **gsap-react / gsap-plugins** | included in `npx skills add https://github.com/greensock/gsap-skills` |
| Framer Motion, Motion, variants, AnimatePresence, spring, layout, drag, gesture | **motion-framer** | `claude plugin install motion-framer@claude-design-skillstack --scope user` |
| smooth scroll, Lenis, locomotive scroll, buttery scroll | **locomotive-scroll** | `claude plugin install locomotive-scroll@claude-design-skillstack --scope user` |
| Anime.js, SVG morphing, keyframe timeline, stagger | **animejs** | `claude plugin install animejs@claude-design-skillstack --scope user` |
| Awwwards, FWA, award-level, magnetic cursor, 60fps, page transition | **awwwards-animations** | `npx skills add devmartinese/awwwards-animations` |
| React Spring, physics, spring dynamics, inertia | **react-spring-physics** | `claude plugin install react-spring-physics@claude-design-skillstack --scope user` |
| Lottie, After Effects export, dotLottie, bodymovin | **lottie-animations** | `claude plugin install lottie-animations@claude-design-skillstack --scope user` |
| Rive, state machine, interactive vector animation | **rive-interactive** | `claude plugin install rive-interactive@claude-design-skillstack --scope user` |
| AOS, scroll reveal, fade on scroll, simple animation | **scroll-reveal-libraries** | `claude plugin install scroll-reveal-libraries@claude-design-skillstack --scope user` |
| Barba.js, page transitions, SPA navigation animation | **barba-js** | `claude plugin install barba-js@claude-design-skillstack --scope user` |
| Magic UI, React Bits, pre-built animated components | **animated-component-libraries** | `claude plugin install animated-component-libraries@claude-design-skillstack --scope user` |

### 3D & WebGL

| Keywords | Skill | Install |
|----------|-------|---------|
| Three.js, WebGL, 3D scene, mesh, geometry, material, shader | **threejs-webgl** | `claude plugin install threejs-webgl@claude-design-skillstack --scope user` |
| React Three Fiber, R3F, drei, @react-three | **react-three-fiber** | `claude plugin install react-three-fiber@claude-design-skillstack --scope user` |
| Babylon.js, physics simulation, XR, VR, AR | **babylonjs** | `claude plugin install babylonjs-engine@claude-design-skillstack --scope user` |
| A-Frame, WebXR, immersive VR, AR browser | **aframe-webxr** | `claude plugin install aframe-webxr@claude-design-skillstack --scope user` |
| Spline, no-code 3D, visual 3D editor | **spline-interactive** | `claude plugin install spline-interactive@claude-design-skillstack --scope user` |
| PixiJS, 2D WebGL, sprites, canvas, particles | **pixijs-2d** | `claude plugin install pixijs-2d@claude-design-skillstack --scope user` |
| Zdog, Vanta, vanilla-tilt, lightweight 3D effects | **lightweight-3d-effects** | `claude plugin install lightweight-3d-effects@claude-design-skillstack --scope user` |
| PlayCanvas, browser game, entity-component 3D | **playcanvas-engine** | `claude plugin install playcanvas-engine@claude-design-skillstack --scope user` |
| web3d integration, multi-library 3D + animation | **web3d-integration-patterns** | `claude plugin install web3d-integration-patterns@claude-design-skillstack --scope user` |
| Blender export, glTF web, 3D asset pipeline | **blender-web-pipeline** | `claude plugin install blender-web-pipeline@claude-design-skillstack --scope user` |

### Frontend Framework & Tooling

| Keywords | Skill | Install |
|----------|-------|---------|
| Next.js, App Router, RSC, Server Components, SSR, SSG | **vercel:nextjs** | built into Claude Code |
| Turbopack, fast builds, Next.js dev | **vercel:turbopack** | built into Claude Code |
| React best practices, hooks, patterns | **vercel:react-best-practices** | built into Claude Code |
| routing, middleware, redirects, rewrites | **vercel:routing-middleware** | built into Claude Code |
| caching, ISR, static, streaming | **vercel:next-cache-components** | built into Claude Code |
| feature flags, A/B test, experiments | **feature-flags-architect** | `claude plugin install feature-flags-architect@claude-code-skills --scope user` |
| code tour, walkthrough, codebase doc | **code-tour** | `claude plugin install code-tour@claude-code-skills --scope user` |

### Authentication

| Keywords | Skill | Install |
|----------|-------|---------|
| Clerk, auth, sign-in, sign-up, user management | **vercel:auth** | built into Claude Code |
| Auth0, authentication, OAuth, JWT | Auth0 skill | `npx skills add auth0/auth0-skill` |
| Better Auth, NextAuth, authentication library | Better Auth skill | `npx skills add better-auth/better-auth` |
| Supabase auth, row-level security | check Supabase skill below | — |

### Database & Storage

| Keywords | Skill | Install |
|----------|-------|---------|
| Postgres, SQL, database, Neon, migrations | Neon skill | `npx skills add neon/neon` |
| Supabase, BaaS, Postgres, realtime, storage | Supabase skill | `npx skills add supabase/supabase` |
| MongoDB, NoSQL, document database | MongoDB skill | `npx skills add mongodb/mongodb` |
| Firebase, Firestore, Realtime Database | Firebase skill | `npx skills add firebase/firebase-basics` |
| Redis, caching, pub/sub, queues | Redis skill | `npx skills add redis/redis` |
| Vercel storage, KV, Blob, Postgres | **vercel:vercel-storage** | built into Claude Code |

### Payments & Commerce

| Keywords | Skill | Install |
|----------|-------|---------|
| Stripe, payments, checkout, subscription, webhook, billing | Stripe skill | `npx skills add stripe/stripe-best-practices` |
| Coinbase, crypto payments | Coinbase skill | `npx skills add coinbase/coinbase` |

### Email & Notifications

| Keywords | Skill | Install |
|----------|-------|---------|
| Resend, transactional email, email API | Resend skill | `npx skills add resend/resend` |
| Courier, multi-channel, push, SMS, email, chat | Courier skill | `npx skills add trycourier/courier-skills` |

### CMS & Content

| Keywords | Skill | Install |
|----------|-------|---------|
| Sanity, headless CMS, content studio, GROQ | Sanity skill | `npx skills add sanity/sanity` |
| Contentful, headless CMS, content delivery | check officialskills.sh/contentful |
| WordPress, WP, content management | WordPress skill | `npx skills add wordpress/wordpress` |
| markdown, MDX, content, blog | **markdown-html skills** | `claude plugin install markdown-html@claude-code-skills --scope user` |

### Deploy & Infrastructure

| Keywords | Skill | Install |
|----------|-------|---------|
| Vercel deploy, preview, production | **vercel:deploy** | built into Claude Code |
| Vercel CI/CD, GitHub Actions, pipeline | **vercel:deployments-cicd** | built into Claude Code |
| Vercel functions, serverless, edge | **vercel:vercel-functions** | built into Claude Code |
| Vercel sandbox, isolated environments | **vercel:vercel-sandbox** | built into Claude Code |
| Cloudflare Workers, Edge, CDN, Durable Objects, Pages | Cloudflare skill | `npx skills add cloudflare/cloudflare` |
| Netlify, serverless functions, edge functions, blobs | Netlify skill | `npx skills add netlify/netlify-functions` |
| Docker, containers, Dockerfile, compose | **docker-development** | `claude plugin install docker-development@claude-code-skills --scope user` |
| Kubernetes, k8s, Helm, operator | **kubernetes-operator** | `claude plugin install kubernetes-operator@claude-code-skills --scope user` |
| Terraform, IaC, infrastructure | **terraform-patterns** | `claude plugin install terraform-patterns@claude-code-skills --scope user` |

### Backend & APIs

| Keywords | Skill | Install |
|----------|-------|---------|
| API, backend, Node.js, Express, REST, database | **engineering-skills** | `claude plugin install engineering-skills@claude-code-skills --scope user` |
| architecture, microservices, system design, DDD | **engineering-advanced-skills** | `claude plugin install engineering-advanced-skills@claude-code-skills --scope user` |
| GraphQL, Apollo, schema, resolvers | Apollo skill | `npx skills add apollo-graphql/apollo-graphql` |
| Firecrawl, web scraping, web data | Firecrawl skill | `npx skills add firecrawl/firecrawl` |
| Remotion, video rendering, programmatic video | Remotion skill | `npx skills add remotion/remotion` |
| Replicate, AI models, image generation API | Replicate skill | `npx skills add replicate/replicate` |

### Mobile (React Native / Expo)

| Keywords | Skill | Install |
|----------|-------|---------|
| Expo, React Native, mobile, iOS, Android | Expo skill | `npx skills add expo/expo-api-docs` |
| React Native, navigation, native modules | included in Expo skill | — |

### AI & LLM Integration

| Keywords | Skill | Install |
|----------|-------|---------|
| Vercel AI SDK, streaming, LLM, AI chat | **vercel:ai-sdk** | built into Claude Code |
| Vercel AI Gateway, model routing, provider | **vercel:ai-gateway** | built into Claude Code |
| Claude API, Anthropic SDK, prompt caching | **claude-api** | built into Claude Code |
| chat UI, AI chatbot, conversational | **vercel:chat-sdk** | built into Claude Code |
| MCP, Model Context Protocol, tool use | check MCP registry | — |

### Performance & Quality

| Keywords | Skill | Install |
|----------|-------|---------|
| Lighthouse, Web Vitals, Core Web Vitals, performance, PageSpeed | Web Quality skill | `npx skills add addy-osmani/web-quality` |
| Sentry, error monitoring, crash, stack trace | Sentry skill | `npx skills add getsentry/sentry-sdk-setup` |
| accessibility, a11y, WCAG, screen reader, aria | **a11y-audit** | `claude plugin install a11y-audit@claude-code-skills --scope user` |
| chaos engineering, resilience, fault injection | **chaos-engineering** | `claude plugin install chaos-engineering@claude-code-skills --scope user` |
| SLO, SLA, reliability, uptime | **slo-architect** | `claude plugin install slo-architect@claude-code-skills --scope user` |
| Datadog, monitoring, observability, metrics | Datadog skill | `npx skills add datadog/datadog` |
| browser automation, Playwright, testing | Browserbase skill | `npx skills add browserbase/browserbase` |

### Security

| Keywords | Skill | Install |
|----------|-------|---------|
| security audit, vulnerability, pentest, smart contract | Trail of Bits skill | `npx skills add trailofbits/audit-context-building` |
| Cloudflare firewall, WAF, DDoS, rate limit | **vercel:vercel-firewall** | built into Claude Code |

### SEO, Marketing & Content

| Keywords | Skill | Install |
|----------|-------|---------|
| SEO, meta tags, schema markup, sitemap, PageSpeed | **research-ops-skills** | `claude plugin install research-ops-skills@claude-code-skills --scope user` |
| marketing, copy, content, growth, ads, email campaign | **marketing-skills** | `claude plugin install marketing-skills@claude-code-skills --scope user` |
| product strategy, PRD, product requirements | **product-skills** | `claude plugin install product-skills@claude-code-skills --scope user` |
| project management, Agile, sprint, roadmap | **pm-skills** | `claude plugin install pm-skills@claude-code-skills --scope user` |
| business growth, go-to-market, GTM | **business-growth-skills** | `claude plugin install business-growth-skills@claude-code-skills --scope user` |
| demo video, product walkthrough, screen recording | **demo-video** | `claude plugin install demo-video@claude-code-skills --scope user` |

### Research, Docs & Memory

| Keywords | Skill | Install |
|----------|-------|---------|
| explore codebase, understand repo, research, knowledge graph | **graphify** | `uv tool install graphifyy && graphify install` |
| library docs, API reference, version-specific, up-to-date | **context7 MCP** | `claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp` |
| research, summarize, synthesize large docs | **research-summarizer** | `claude plugin install research-summarizer@claude-code-skills --scope user` |
| data analysis, statistics, charts, insights | **statistical-analyst** | `claude plugin install statistical-analyst@claude-code-skills --scope user` |

### Figma & Design Handoff

| Keywords | Skill | Install |
|----------|-------|---------|
| Figma, design handoff, design tokens, variables | Figma skill | `npx skills add figma/figma` |

---

## MULTI-AGENT COMPATIBILITY

This skill installs identically to:
| Agent | Skill path |
|-------|-----------|
| Claude Code | `~/.claude/skills/sps/` |
| Cursor | `.cursor/rules/sps.mdc` |
| Codex | `~/.codex/skills/sps/` |
| Gemini CLI | `~/.gemini/skills/sps/` |
| Windsurf | `~/.windsurf/skills/sps/` |
| Antigravity | `~/.antigravity/skills/sps/` |
| GitHub Copilot | via `.github/skills/sps/` |
| Others | `~/.agents/skills/sps/` |

Install with: `npx skills add -g SHAHID8142/Shahid-Personal-SkillSet`

---

## AUTO-INSTALL PATTERN

```
"Installing gsap-scrolltrigger..."
npx skills add https://github.com/greensock/gsap-skills
[proceed immediately without asking]
```

If install fails: "⚠ [skill] failed to install — [error]. Continuing with available skills."

---

## GUARDRAILS

- Install ONLY from this catalog. Unknown skills → tell user and ask first.
- Third-party skills run code. They are pre-vetted here; never auto-install from search results.
- Hallmark runs on every UI task. Cannot be skipped.
- Graphify runs on every project. Cannot be skipped.
- Responsive check before every handover. Cannot be skipped.
- When in doubt about a design choice, ask: "Would a senior designer call this generic?" If yes → redesign.
