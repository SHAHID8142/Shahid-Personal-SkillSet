---
name: sps
description: >
  Shahid Personal SkillSet — the master build orchestrator. Use this for ANY request to build,
  design, create, make, implement, animate, code, fix, debug, refactor, deploy, or improve software:
  websites, landing pages, web apps, dashboards, components, UI, APIs, backends, mobile apps,
  databases, auth, animations, 3D, or SEO. It detects the task type and INVOKES the real best-in-class
  specialist skill for the job (epic-design for design, senior-frontend/backend/fullstack for
  engineering, awwwards-animations for motion, stripe-integration-expert for payments, code-reviewer
  before handover) instead of generic output — then layers six enforced rules on top: hallmark
  anti-slop design, graphify every project, responsive 320/768/1280/1440px, a11y WCAG AA, design
  tokens (no hardcoded values), conventional commits. Reads ~/.sps/profile.md (user's stack +
  aesthetic) and ~/.sps/mistakes.md (never repeat past mistakes) before every task; researches and
  saves unknown tools to ~/.sps/learned/. Builds section by section, never a whole page at once.
  Invoke whenever the user wants something built or designed, or types /sps.
---

# /sps — Shahid Personal SkillSet

---

## STEP 0 — INITIALIZATION & MEMORY (FIRST RUN PROTOCOL)

If this is the **FIRST TIME** `/sps` is used on a project:
1. Initialize the local `./.sps/` directory in the project root.
2. Setup essential docs (`./.sps/profile.md`, `./.sps/mistakes.md`, `./.sps/handoff.md`).
3. Write a complete architectural plan and save it to `./.sps/architecture.md`.
4. Ask the user for any **new project-specific rules**. If provided, strictly add them to `./.sps/profile.md` and enforce them on all future tasks.
5. Pause and wait for user approval on the initial docs before writing code.

**On EVERY subsequent run**, strictly read and apply the global `~/.sps/profile.md` AND the local `./.sps/profile.md`. Read `./.sps/handoff.md` to resume context. Update mistakes logs if errors occur.

---

## STEP 1 — DETECT TASK TYPE → INVOKE THE REAL EXPERT SKILL

Classify the request into a primary type. Then **invoke the real specialist skill** for that type —
do not just role-play. These are best-in-class skills already installed on the machine. Invoking the
real skill gives you actual technique, scripts, and patterns — this is what makes the output great
instead of generic.

**How to use this table:**
1. Find the matching task type.
2. **If the "Specialist skill" is available** (check the agent's skill list / `~/.gemini/antigravity/skills/`): invoke it via the Skill tool, then layer the six core rules (Step 7) on top.
3. **If it is NOT available** on this agent: embody the fallback persona as text and apply that type's standards manually.
4. State what you did: "Invoking [skill]" or "Acting as [role] (specialist skill not installed here)".

| Task type | Trigger words | Specialist skill to INVOKE | Text fallback if absent |
|-----------|--------------|----------------------------|-------------------------|
| **UI / Design** | design, landing page, UI, layout, impeccable, taste | **`epic-design`** + `impeccable` + `taste-skill` + `ui-ux-pro-max` | World-class designer: cinematic, impeccable taste |
| **Animation / Motion** | animate, scroll, parallax, motion, GSAP, Lenis | **`awwwards-animations`** + `gsap-animation` / `animejs` | Motion director: purposeful 60fps motion |
| **3D / WebGL / GPU** | 3D, WebGL, WebGPU, WGSL, Three.js, R3F, shader | **`webgpu-claude-skill`** / r3f / threejs / babylonjs | Creative technologist: perf + impact |
| **Frontend / React** | React, Next.js, component, hook, TypeScript | **`senior-frontend`** + `vercel:react-best-practices` | Senior frontend engineer: clean, typed |
| **Backend / API** | API, backend, Node, REST, GraphQL, server | **`senior-backend`** + `engineering-skills` | Senior backend engineer: correct, secure |
| **Full-stack** | full-stack, auth + database + UI, complete app | **`senior-fullstack`** + design + backend skills | Senior fullstack with design taste |
| **Architecture** | architecture, system design, microservices, scale | **`senior-architect`** + `engineering-advanced-skills` | Principal architect |
| **Database** | schema, migration, SQL, data model | **`database-designer`** + `sql-database-assistant` | Senior data engineer |
| **Debug / Fix** | bug, fix, error, broken, not working | **`focused-fix`** + `adversarial-reviewer` | Expert debugger: root cause, never symptom |
| **Testing** | test, TDD, unit test, coverage | **`tdd-guide`** + `senior-qa` | Test-first engineer |
| **Performance** | slow, performance, Core Web Vitals, bundle | **`performance-profiler`** + Web Quality skill | Performance engineer |
| **Security** | security, vulnerability, XSS, injection, auth flaw | **`senior-security`** + `security-pen-testing` | Security engineer: attacker mindset |
| **DevOps / Deploy** | deploy, CI/CD, Docker, k8s, pipeline | **`senior-devops`** + `ci-cd-pipeline-builder` | Senior DevOps engineer |
| **Payments** | Stripe, checkout, subscription, billing | **`stripe-integration-expert`** | Payments engineer |
| **Email** | transactional email, templates, Resend | **`email-template-builder`** | Email systems engineer |
| **SEO / Marketing** | SEO, meta, schema, copy, growth, CRO | `marketing-skills` (`seo-audit`, `copywriting`, `page-cro`) | Technical-SEO + conversion marketer |

**Code review gate (always, before handover):** invoke **`code-reviewer`** and for critical code
**`adversarial-reviewer`** if available. Otherwise self-review against Step 8.

For multi-type tasks (e.g. "animated landing page with Stripe"), invoke ALL matching specialist
skills and combine them — they are additive. Always layer the six core rules (Step 7) on top of
whatever specialist skill you invoke.

> Why this matters: a text persona only changes tone. A real skill brings real technique
> (e.g. `epic-design` has 45+ cinematic scroll patterns and asset-inspection scripts). Invoking the
> real skill is the difference between generic output and portfolio-grade output.

---

## STEP 2 — VERTICAL SLICING & SECTION-BY-SECTION (The Workflow)

**You must strictly follow this interactive workflow. Never build an entire page at once. Never do "design first, wiring later."**

1. **Sub-sectioning:** When starting a major section (e.g., a Navbar), first output a detailed plan breaking it down into *subsections* (e.g., Logo, Desktop Links, Mobile Menu, Auth Buttons). Wait for approval.
2. **Vertical Slicing:** Work on exactly ONE subsection at a time. For that subsection, you must complete the frontend, backend, API wiring, state management, and functions **all at once**. 
3. **Approval & Upgrades:** After finishing the subsection, **STOP**. Ask the user to check it. Explicitly ask for their approval to continue, and proactively **suggest upgrades or enhancements** you could apply to make it even better. Do not proceed until approved.

---

## STEP 3 — UNKNOWN TOOL PROTOCOL

If the request mentions a library or tool **not in the catalog below**:
1. Say: "I don't have [topic] in my catalog — researching now..."
2. Research: use Context7 for official docs + web for real examples
3. Save to `~/.sps/learned/[topic]/` (notes.md, quickstart.md, references.md)
4. Register in `~/.sps/learned/INDEX.md`
5. Apply the knowledge. Tell user: "Learned [topic], saved notes for future use."

---

## STEP 4 — DESIGN EXECUTION (UI / Design tasks)

**First, invoke `epic-design`** — it is the primary design specialist (45+ cinematic scroll
techniques, asset inspection, depth/parallax planning). Then activate the supporting stack. All
together, never just one:

```
epic-design           ← PRIMARY: cinematic technique, asset/depth planning, scroll storytelling
hallmark              ← macrostructure + slop test + anti-AI-pattern enforcement
frontend-design       ← production-grade component implementation
ui-ux-pro-max         ← color palettes (161), typography pairings (57), design system decisions
tailwind-design-system ← CSS-first design tokens, Tailwind v4 configuration
awwwards-animations   ← micro-interactions, reveal animations, premium feel
```

If `epic-design` isn't installed on this agent, apply its core mindset manually: every site feels
cinematic — depth/layers that respond to scroll, text that enters with intention, sections that
transition, never a flat static page.

**Macrostructure first** — before writing any markup, pick a hallmark macrostructure that fits the brief. Not the default top-down flow. Options: Bento Grid, Long Document, Marquee Hero, Stat-Led, Workbench, Manifesto, Photographic, Quote-Led, Specimen, Catalogue, Letter, Index-First, Narrative Workflow, Split Studio, Feature Stack, Type Specimen, Portfolio Grid, Map Diagram, Ecosystem Index, Component Playground, or custom.

**Slop test** — before handing over any UI, reject and redesign if any of these are true:
- Centered headline + subtext + CTA button, nothing else → REJECT
- Rounded-corner card grid, same image top, identical cards → REJECT
- Blue→purple gradient → REJECT
- Inter/Poppins body + same family for headline → REJECT
- One "brand blue" + gray + white = full palette → REJECT
- Every section same width, same padding, no tension → REJECT
- Animation = just opacity 0→1 → REJECT

**What good looks like:**
```tsx
// Macrostructure: Split Studio (asymmetric, editorial feel)
// Typography: Instrument Serif (display) + Inter (body) — unexpected pairing
// Color: oklch(35% 0.15 240) anchor — chosen for specific reason, not convention
// Layout: 60/40 split, content left with generous margin, visual right bleeds edge
// Motion: text reveals with GSAP SplitText stagger, not a generic fadeIn
```

---

## STEP 5 — ONE TOOL PER JOB (animation rules)

Pick one tool per animation category. Never stack competing tools.

| Job | Tool | Install |
|-----|------|---------|
| **Smooth scroll** (feel, momentum, butter) | **Lenis** — always, no alternatives | `npm install lenis` |
| **Scroll-triggered effects** (parallax, pin, scrub) | **GSAP + ScrollTrigger** — pair with Lenis | `npm install gsap @gsap/react` |
| **React component animation** (enter/exit/gesture/layout) | **Framer Motion** | `npm install motion` |
| **SVG / stagger / keyframe choreography** | **Anime.js** | `npm install animejs` |
| **Award-level motion** (magnetic cursor, page transitions) | **awwwards-animations** skill | installed |
| **After Effects export, dotLottie** | **Lottie** | `npm install @lottiefiles/dotlottie-react` |

**Lenis + GSAP ScrollTrigger setup** (use this exact pattern every time):
```tsx
// lib/lenis.ts
import Lenis from 'lenis'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

export function initLenis() {
  const lenis = new Lenis({ duration: 1.2, easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)) })
  lenis.on('scroll', ScrollTrigger.update)
  gsap.ticker.add((time) => lenis.raf(time * 1000))
  gsap.ticker.lagSmoothing(0)
  return lenis
}
```

**Framer Motion reveal pattern** (use this, not generic opacity):
```tsx
// components/ui/RevealText.tsx
import { motion, useInView } from 'motion/react'
import { useRef } from 'react'

export function RevealText({ children, delay = 0 }: { children: React.ReactNode; delay?: number }) {
  const ref = useRef(null)
  const isInView = useInView(ref, { once: true, margin: '-10%' })
  return (
    <motion.div ref={ref}
      initial={{ opacity: 0, y: 24 }}
      animate={isInView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.6, delay, ease: [0.22, 1, 0.36, 1] }}>
      {children}
    </motion.div>
  )
}
```

---

## STEP 6 — SKILL CATALOG

### Design & UI
| Keywords | Skill | Install / Location |
|----------|-------|-------------------|
| design, UI, page, landing, hero, layout, dashboard, component | **hallmark** | `npx skills add nutlope/hallmark` |
| design system, color palette, typography, font pairing, UX | **ui-ux-pro-max** | `claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope project` |
| React, Next.js, frontend, production UI | **frontend-design** | built-in Claude Code |
| Tailwind, design tokens, CSS variables | **tailwind-design-system** | `~/.agents/skills/` |
| impeccable standard, high quality frontend UI, anti-slop | **impeccable** | `npx skills add pbakaus/impeccable` |
| UI components, templates, pre-built sections | **npxskillui** | `npx skills add amaancoderx/npxskillui` |
| premium taste, cinematic design, aesthetics | **taste-skill** | `npx skills add Leonxlnx/taste-skill` |
| Astro, static sites, islands architecture | **astro-framework** | `npx skills add withastro/astro` |
| shadcn, shadcn/ui, Radix, headless UI | **vercel:shadcn** | built-in Claude Code |
| micro-interactions, reveal, magnetic, premium animations | **awwwards-animations** | `~/.claude/skills/awwwards-animations/` |
| Figma, design handoff, tokens export | **figma** | `npx skills add figma/figma` |

### Animation & Motion
| Keywords | Skill | Install |
|----------|-------|---------|
| GSAP, ScrollTrigger, timeline, pin, scrub, parallax | **gsap-animation** | `~/.claude/skills/gsap-animation/` |
| Framer Motion, Motion, variants, AnimatePresence, spring | **framer-motion** | `~/.claude/skills/framer-motion/` |
| Lenis, smooth scroll, butter scroll | **lenis-scroll** | `~/.claude/skills/lenis-scroll/` |
| Anime.js, SVG morphing, stagger, keyframe | **animejs** | `claude plugin install animejs@claude-design-skillstack --scope user` |
| Lottie, After Effects, dotLottie | lottie-animations | `claude plugin install lottie-animations@claude-design-skillstack --scope user` |
| Barba.js, page transitions, SPA navigation | barba-js | `claude plugin install barba-js@claude-design-skillstack --scope user` |

### 3D & WebGL
| Keywords | Skill | Install |
|----------|-------|---------|
| Three.js, WebGL, 3D scene, mesh, shader | threejs-webgl | `claude plugin install threejs-webgl@claude-design-skillstack --scope user` |
| React Three Fiber, R3F, drei | react-three-fiber | `~/.agents/skills/r3f-fundamentals/` (+ r3f-* suite) |
| Babylon.js, physics, XR, VR | **babylonjs** | `~/.claude/skills/babylonjs/` |
| Spline, no-code 3D | spline-interactive | `claude plugin install spline-interactive@claude-design-skillstack --scope user` |
| PixiJS, 2D WebGL, canvas, particles | pixijs-2d | `claude plugin install pixijs-2d@claude-design-skillstack --scope user` |

### Authentication
| Decision | Skill |
|----------|-------|
| Using Supabase DB → | **Supabase Auth** (built-in) — `@supabase/ssr` + RLS on every table |
| Enterprise SSO / RBAC → | **Clerk** via `vercel:auth` (built-in Claude Code) |
| OAuth only / open-source → | **Better Auth** — `npx skills add better-auth/better-auth` |

### Database & ORM
| Keywords | Tool | Notes |
|----------|------|-------|
| Supabase, BaaS, Postgres + realtime + storage | Supabase client | `npx skills add supabase/supabase` |
| Neon, managed Postgres | Neon + Drizzle or Prisma | `npx skills add neon/neon` |
| Drizzle, SQL-first ORM | Drizzle ORM | `npm install drizzle-orm drizzle-kit` |
| Prisma, auto-migrate, Prisma Studio | Prisma | `npm install prisma @prisma/client` |
| MongoDB, document database | MongoDB | `npx skills add mongodb/mongodb` |
| Redis, caching, queues | Redis | `npx skills add redis/redis` |

### Forms, State & Data Fetching
| Keywords | Tool | Install |
|----------|------|---------|
| React Hook Form, form, useForm, validation | React Hook Form + Zod | `npm install react-hook-form zod @hookform/resolvers` |
| Zustand, global state, useStore | Zustand | `npm install zustand` |
| TanStack Query, React Query, useQuery, server state | TanStack Query v5 | `npm install @tanstack/react-query` |
| tRPC, type-safe API, end-to-end types | tRPC v11 | `npm install @trpc/server @trpc/client @trpc/react-query` |
| Jotai, atoms | Jotai | `npm install jotai` |

### Payments, Email & CMS
| Keywords | Tool | Install |
|----------|------|---------|
| Stripe, payments, checkout | Stripe | `npx skills add stripe/stripe-best-practices` |
| Resend, transactional email | Resend + React Email | `npm install resend react-email @react-email/components` |
| Sanity, headless CMS | Sanity | `npx skills add sanity/sanity` |
| Uploadthing, file upload | UploadThing | `npm install uploadthing @uploadthing/react` |
| Cloudinary, image transform | Cloudinary | `npm install next-cloudinary` |

### Deploy & Infrastructure
| Keywords | Skill |
|----------|-------|
| Vercel, Next.js deploy | vercel:deploy (built-in) |
| Cloudflare Workers, Edge | `npx skills add cloudflare/cloudflare` |
| Netlify functions | `npx skills add netlify/netlify-functions` |
| Docker, containers | `claude plugin install docker-development@claude-code-skills --scope user` |

### Backend, API & Engineering
| Keywords | Skill | Install |
|----------|-------|---------|
| API, backend, Node.js, REST | **engineering-skills** | `claude plugin install engineering-skills@claude-code-skills --scope user` |
| architecture, microservices, DDD | **engineering-advanced-skills** | `claude plugin install engineering-advanced-skills@claude-code-skills --scope user` |
| GraphQL, Apollo, resolvers | Apollo | `npx skills add apollo-graphql/apollo-graphql` |
| PWA, service worker, offline, manifest | Serwist | `npm install @serwist/next serwist` |

### AI, Performance & SEO
| Keywords | Skill |
|----------|-------|
| Vercel AI SDK, LLM, streaming | vercel:ai-sdk (built-in) |
| Claude API, Anthropic SDK | claude-api (built-in) |
| Lighthouse, Web Vitals, performance | `npx skills add addy-osmani/web-quality` |
| Sentry, error monitoring | `npx skills add getsentry/sentry-sdk-setup` |
| a11y, accessibility, WCAG | `claude plugin install a11y-audit@claude-code-skills --scope user` |
| SEO, meta, schema, sitemap | `claude plugin install research-ops-skills@claude-code-skills --scope user` |
| Marketing, copy, growth | `claude plugin install marketing-skills@claude-code-skills --scope user` |

### Research & Memory
| Keywords | Skill |
|----------|-------|
| explore codebase, understand repo | **graphify** — `uv tool install graphifyy && graphify install` |
| library docs, current API | **Context7 MCP** — `claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp` |

---

## STEP 7 — TWENTY CORE RULES

These apply to every task, every time. No exceptions.

**1. HALLMARK ANTI-SLOP** — Every UI section passes the slop test before handover (see Step 4).

**2. GRAPHIFY** — Every project gets `graphify .` before deep codebase work. Check for `graphify-out/` first; build if absent.

**3. RESPONSIVE** — Before every handover: verified at 320px / 768px / 1280px / 1440px. State it explicitly.

**4. DESIGN TOKENS (ANTI-FRANKENSTEIN)** — Zero hardcoded colors/spacing/fonts. Everything must use CSS variables or Tailwind `@theme` tokens. Absolutely NO arbitrary Tailwind values (e.g., no `w-[323px]` or `text-[#FF0000]`).

**5. A11Y** — Every UI: keyboard nav, focus rings, ARIA labels, semantic HTML, contrast ≥ 4.5:1 body / 3:1 large text. `prefers-reduced-motion` respected on all animations.

**6. GIT BRANCHING & CONVENTIONAL COMMITS** — Every commit: `type(scope): description`. NEVER push directly to `main` or `master`. Always create a feature branch (`git checkout -b feature/...`) and run `git push -u origin HEAD` on that branch.

**7. DUAL-TONE SUPPORT** — Ensure every UI component supports light and dark modes via semantic color tokens.

**8. LOCALIZATION (i18n)** — All user-facing text must be stored in `constants/copy.ts` or a translation file to allow for future i18n.

**9. SECURITY** — Validate all user inputs via Zod; implement sanitization; ensure secure headers; never expose DB secrets in client-side code.

**10. ERROR BOUNDARIES & FALLBACKS** — Every network request or data fetch must have a corresponding loading skeleton, error boundary, and empty state gracefully handled.

**11. DATABASE MIGRATIONS** — Never modify production or local database schemas directly via raw SQL scripts. Always generate a formal migration file (e.g., via Drizzle Kit or Prisma) so changes are tracked and reversible.

**12. 3-STRIKE & ROLLBACK RULE** — If you attempt to fix a bug or pass a quality gate 3 times and fail, DO NOT keep hacking. Use `git restore <file>` or `git reset` to roll back to the last working state, document the failure in `./.sps/handoff.md`, and ask the user for help.

**13. SECRETS & ENV SAFETY** — Never commit `.env` files. If your code requires new environment variables, add them to `.env.example` and explicitly instruct the user to add the real keys locally.

**14. CODE CLEANUP & LINTING** — Before handover, run `npm run lint` and `npm run format` (or equivalent). Remove all debugging `console.log` statements.

**15. DATA FETCHING & STATE** — NEVER use `useEffect` for data fetching. Always use TanStack Query (React Query) for client-side fetching or React Server Components. Use Zustand or Jotai for global state, never bloated Redux.

**16. CI/CD PIPELINES** — On new project initialization, always scaffold a `.github/workflows/ci.yml` to automatically run linters, type checks, and Playwright tests on every Pull Request.

**17. PRE-COMMIT HOOKS** — Always configure Husky and `lint-staged` so that ESLint and Prettier run automatically, physically preventing messy code from being committed.

**18. TSDOC / DOCUMENTATION** — Every exported function, React component, interface, and type MUST have standard TSDoc/JSDoc comments explaining its purpose. Undocumented code is considered broken.

**19. SECURITY AUDITING** — Always run `npm audit` before finalizing dependencies. Use strict package pinning to prevent unexpected breaking changes.

**20. STRICT MODULARITY** — Never build large "god files". Always use separate files for separate components. A single file should rarely exceed 150-200 lines. Extract logic into custom hooks in `hooks/` and pure functions into `utils/`.

---

## STEP 8 — QUALITY GATE (19 checks before every handover)

Run before showing output to user. Fix anything that fails, then re-run.

| # | Check | Pass condition |
|---|-------|----------------|
| 1 | **No syntax / TS errors** | `tsc --noEmit` clean, no red underlines |
| 2 | **No broken imports** | every import resolves to a real file/package |
| 3 | **No TODO / placeholder content** | zero `Lorem ipsum`, `// TODO`, `return null` stubs |
| 4 | **All links real** | no `href="#"` that should go somewhere, no missing routes |
| 5 | **Error + loading states** | every async op has both; no happy-path-only code |
| 6 | **No hardcoded values** | colors/spacing through tokens; no `#3B82F6` in components |
| 7 | **Slop test passed** | all 7 slop gates clear (Step 4) |
| 8 | **Responsive** | 320/768/1280/1440px stated and checked (Rule 3) |
| 9 | **A11y basics** | keyboard nav, labels, contrast (Rule 5) |
| 10 | **One file per component** | PascalCase.tsx per component, hooks in `hooks/`, utils in `utils/` |
| 11 | **Language check (i18n)** | No hardcoded text if the project is multi-language |
| 12 | **Dual-tone check** | Component adapts correctly if dual-tone/dark mode is active |
| 13 | **Automated Testing** | Core business logic / critical flows have basic Vitest or Playwright tests |
| 14 | **Clean Code** | No debug `console.log`, linter passes, codebase formatted |
| 15 | **State check** | No `useEffect` used for data fetching; TanStack/Zustand used correctly |
| 16 | **Git Hooks Configuration** | Husky and lint-staged are active and functioning |
| 17 | **Full Documentation** | All exported types/functions have TSDoc/JSDoc comments |
| 18 | **Dependency Security** | `npm audit` shows 0 high/critical vulnerabilities |
| 19 | **Strict Modularity** | Exactly 1 component per file; files are < 200 lines long |

---

## FILE STRUCTURE (every project)

```
src/
├── app/                    # Next.js App Router — pages, layouts, API routes
│   ├── (auth)/             # Auth pages group
│   ├── api/                # API route handlers
│   └── layout.tsx          # Root layout
├── components/
│   ├── ui/                 # Primitives: Button, Input, Modal, Card
│   ├── layout/             # Navbar, Footer, Sidebar
│   └── sections/           # HeroSection, FeaturesSection, PricingSection
├── hooks/                  # useAuth, useScrollPosition, useDebounce
├── lib/                    # db.ts, auth.ts, stripe.ts (third-party configs)
├── actions/                # Server actions
├── types/                  # Shared TypeScript interfaces
├── utils/                  # Pure functions: formatDate, cn, validators
└── constants/
    ├── copy.ts             # ALL user-facing strings (never hardcode in JSX)
    └── queryKeys.ts        # TanStack Query keys
```

Every directory → `README.md` (2 lines: what lives here, naming convention).
Every file → file-level header comment + JSDoc on every export.
All user strings → `constants/copy.ts`. Never in JSX.

---

## MULTI-AGENT INSTALL

```bash
# Install /sps on all agents globally
npx skills add -g SHAHID8142/Shahid-Personal-SkillSet

# Or full catalog
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
bash install.sh          # Mac / Linux
.\install.ps1            # Windows PowerShell
bash uninstall.sh        # Remove everything
.\uninstall.ps1          # Windows remove
```

Skill paths by agent:
`~/.claude/skills/sps/` · `~/.cursor/rules/sps.mdc` · `~/.codex/skills/sps/` · `~/.gemini/skills/sps/` · `~/.agents/skills/sps/`
