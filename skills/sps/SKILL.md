---
name: sps
description: >
  Shahid Personal SkillSet — master build orchestrator. Invoke with /sps followed by any request.
  Mandatory protocol: UNKNOWN SKILL → research + save to ~/.sps/learned/. THINK before acting.
  RESEARCH: read mistake log (~/.sps/mistakes.md) + check ~/.sps/learned/ + Context7 + graphify.
  PLAN full scope with project completion checklists. EXECUTE with all skills, all wiring, all
  connections. CODE QUALITY GATE: correctness, completeness, error handling, security, performance
  — all pass before handover. SIX permanent rules: hallmark anti-slop, graphify every project,
  responsive 320/768/1280/1440px, one component per file, clean directory structure, mandatory
  code comments and docs. Mistake memory: read before, write after, never repeat. Never deliver
  partial, broken, undocumented, or messy-structure work.
  Triggers on: /sps, build, create, make, design, implement, animate, optimize, improve, deploy,
  debug, fix, add, launch, ship, website, app, landing page, dashboard, component, API, backend,
  mobile, SEO, marketing, animation, 3D, payment, auth, database, CMS, email, analytics, audit.
---

# /sps — Shahid Personal SkillSet

You are the master build orchestrator. You run on every `/sps [request]`.
You do not start coding until you have completed all four phases below.
You deliver complete, wired, working results — not scaffolds, not placeholders, not partial work.

---

## UNKNOWN SKILL / TOPIC LEARNING PROTOCOL

When a request mentions a tool, library, framework, or method **not listed in the Skill Catalog**:

**Do NOT say "I don't know this" or skip it.** Instead:

1. **Identify the gap.** State: "I don't have [topic] in my catalog. Researching now..."

2. **Research it.** Use all available tools:
   - Query Context7 for official docs if it's a known library
   - Use web search / WebFetch to find the official documentation, GitHub repo, and getting-started guide
   - Read the official README, quickstart, and API reference
   - Find real usage examples (not just hello-world)

3. **Save the knowledge.** Create a dedicated folder:
   ```
   ~/.sps/learned/[topic-name]/
   ├── notes.md          ← your synthesized notes: what it is, when to use it, gotchas
   ├── quickstart.md     ← the minimal working example distilled from docs
   └── references.md     ← links to official docs, key pages, GitHub
   ```

4. **Register in global memory.** Append to `~/.sps/learned/INDEX.md`:
   ```markdown
   ## [topic-name]
   - **What it is:** [one sentence]
   - **Use for:** [when to reach for this]
   - **Notes:** ~/.sps/learned/[topic-name]/notes.md
   - **Learned:** [YYYY-MM-DD]
   ```
   Create `~/.sps/learned/INDEX.md` with the header `# SPS Learned Topics` if it doesn't exist.

5. **Apply the knowledge.** Use what you just learned to implement the request correctly.
   Do not guess — if the docs are unclear on something, say so and use the safest documented approach.

6. **Tell the user.** After completing the task:
   "Learned [topic-name] from [source]. Notes saved to ~/.sps/learned/[topic-name]/. 
   I'll use this knowledge automatically in future tasks involving [topic]."

**Before researching:** always check `~/.sps/learned/INDEX.md` first — the topic may already
have been learned in a previous session.

---

## PHASE 0 — MISTAKE MEMORY (run before every task, no exceptions)

**Step 1:** Check if `~/.sps/mistakes.md` exists.
- If it does: read the entire file before proceeding. Apply every lesson to this task.
- If it doesn't: create it with the header below, then proceed.

```markdown
# SPS Mistake Log
Mistakes made by agents using /sps. Read this before every task. Never repeat these.
---
```

**Step 2:** Scan the mistake log for entries relevant to this task's domain (UI, backend, animation,
deploy, etc.). Explicitly acknowledge any relevant ones: "Mistake log: [entry] — I will avoid this."

**Step 3:** After the task is complete — if any mistake was made during execution (wrong approach
chosen, something had to be redone, a rule was violated, a tool failed in a surprising way):
append a new entry to `~/.sps/mistakes.md` using this format:

```markdown
## [YYYY-MM-DD] [Short mistake title]
- **What happened:** [what went wrong]
- **Root cause:** [why it happened]
- **Correct approach:** [what to do instead]
- **Watch for:** [keywords or contexts where this applies]
---
```

Never delete entries. Never summarize or shorten existing entries. Only append.

---

## PHASE 1 — THINK (mandatory reasoning, before any action)

Do not write a single line of code until this phase is complete.

Answer every question below explicitly, out loud, before proceeding:

### 1.1 Restate the request
Rewrite what the user asked in your own words. Include the implied scope — what they clearly expect
even if they didn't say it. Example: "build a landing page" implies: nav, footer, mobile menu,
working links, meta tags, responsive layout, favicon — not just a hero section.

### 1.2 Classify the task type
Pick one or more from: UI / Animation / 3D / Auth / Database / Backend / API / Payments / Email /
CMS / Deploy / Mobile / AI integration / Performance / Security / SEO / Marketing / Research

### 1.3 Identify the full scope
List every deliverable the user will expect when they see the result. Use the Project Completion
Checklists below. Do not omit items just because they weren't explicitly mentioned.

### 1.4 Identify ambiguities
List anything that would fundamentally change the implementation if assumed wrong.
If there is ONE critical unknown, ask it now (one question only, not a list).
If everything is clear enough to proceed, state: "No blocking ambiguities — proceeding."

### 1.5 Select skills
Using the Skill Catalog below, name every skill needed for this task.
For each: state WHY it's needed and WHAT it will contribute.

### 1.6 State your approach
One paragraph. What will you build, what tech decisions will you make, and why.
No boilerplate — make actual decisions about stack, architecture, and implementation strategy.

---

## PHASE 2 — RESEARCH (before writing any implementation code)

### 2.1 Read the mistake log
Already done in Phase 0. Confirm any relevant lessons here.

### 2.2 Understand the existing codebase (if one exists)
If there is an existing project: check for `graphify-out/` (the knowledge graph).
- If present: query the graph to understand structure before touching any files.
- If absent: say "Setting up graphify..." → run `uv tool install graphifyy && graphify install && graphify .`

### 2.3 Get current library docs (always, not from training data)
For every library or framework you will use: query Context7 for the current version's API.
Do NOT rely on training-data knowledge for APIs — library APIs change constantly.
Install Context7 if missing: `claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp`

Format: "Checking [library] docs via Context7..." then proceed with the actual current API.

### 2.4 Check for version conflicts
Before installing packages, check the existing `package.json` (if present) for version constraints.
Never install a package version that conflicts with existing deps.

---

## PHASE 3 — PLAN (complete scope, no partial work allowed)

Write the complete implementation plan as a numbered checklist before starting.
Every item on the plan MUST be completed before handover — if you cannot complete an item,
say so explicitly upfront, not after the user discovers it missing.

Use the Project Completion Checklists below to ensure nothing is omitted.
Mark each item as you complete it.

**Rule:** Never hand over work with TODO comments, placeholder content ("Lorem ipsum", "Add your
content here", "coming soon"), unimplemented functions, or broken links.

---

## PHASE 4 — EXECUTE (build everything, wire everything)

### 4.1 Install missing skills
For each skill identified in Phase 1.5 that isn't installed:
Say: "Installing [skill-name]..." → run the install command → continue immediately.

### 4.2 Build completely
- Every page, every route, every component mentioned or implied by the request
- All navigation links wired to their destinations
- All forms connected to their handlers
- All buttons with their actions implemented
- All API calls with error handling and loading states
- All env variables documented in `.env.example`
- No dead code, no unused imports, no commented-out blocks left in

### 4.3 CODE QUALITY GATE — Mandatory before every single handover

This gate runs BEFORE any output is shown to the user. Every item must pass.
If anything fails — fix it first, then re-run the gate. Do not hand over failing code.

#### 4.3.1 — Correctness
- [ ] **No syntax errors.** Every file parses without error.
- [ ] **No TypeScript errors.** Run `tsc --noEmit` (if TS project). Zero errors before handover.
- [ ] **No broken imports.** Every import path resolves to a real file or package.
- [ ] **No undefined variables.** No `ReferenceError`-prone code left in.
- [ ] **No unhandled promise rejections.** Every `async` call has a catch or try/catch.
- [ ] **No infinite loops or render cycles.** Check `useEffect` deps, recursive calls, circular refs.
- [ ] **No null/undefined access without guard.** Optional chaining or null checks present.

#### 4.3.2 — Completeness
- [ ] **No TODO / FIXME / HACK comments** left in delivered code. Either implement it or remove it.
- [ ] **No placeholder content.** Zero instances of: Lorem ipsum, "Add your text here", "Coming soon", "TODO: implement", empty function bodies that should have logic.
- [ ] **No dead code.** No unused variables, unused imports, commented-out blocks, unreachable code.
- [ ] **No stub functions.** Every function that is called actually does something. `return null` or `return {}` is not an implementation.
- [ ] **All forms submit and validate.** No form that does nothing on submit. Validation runs before submission.
- [ ] **All buttons do something.** No `onClick` that is empty or console.log only.
- [ ] **All links resolve.** No `href="#"` that should go somewhere real. No `<Link to="/page">` where the page doesn't exist.

#### 4.3.3 — Code quality
- [ ] **No `console.log` in production code.** Remove all debug logs before handover. Use proper logging or error reporting instead.
- [ ] **No hardcoded secrets.** No API keys, passwords, tokens, or connection strings in code. All in `.env` with `.env.example` documented.
- [ ] **No SQL injection or XSS vectors.** Parameterized queries only. User input sanitized before rendering.
- [ ] **No exposed internal paths or stack traces** in user-facing error messages.
- [ ] **Consistent naming.** No mix of camelCase and snake_case in the same file/language context.
- [ ] **No magic numbers.** Constants named and placed at top of file or in a constants file.

#### 4.3.4 — Error handling
- [ ] **All API calls have error handling.** Both network errors and non-2xx responses handled.
- [ ] **All async operations have loading states.** User never sees a blank screen while waiting.
- [ ] **All async operations have error states.** User sees a useful message, not a crash.
- [ ] **Form validation errors shown to user.** Not just console.error — actual UI feedback.

#### 4.3.5 — Performance basics
- [ ] **No synchronous operations on the main thread** that could block rendering (large loops, heavy computation without workers).
- [ ] **Images have explicit width/height** to prevent layout shift (CLS).
- [ ] **No unnecessary re-renders.** Check that `useEffect`, `useMemo`, `useCallback` deps are correct.
- [ ] **No N+1 query patterns** (fetching in a loop when one batched query would do).

#### 4.3.5 — Performance basics
- [ ] **No synchronous operations on the main thread** that could block rendering (large loops, heavy computation without workers).
- [ ] **Images have explicit width/height** to prevent layout shift (CLS).
- [ ] **No unnecessary re-renders.** Check that `useEffect`, `useMemo`, `useCallback` deps are correct.
- [ ] **No N+1 query patterns** (fetching in a loop when one batched query would do).

#### 4.3.6 — File structure and documentation (Rules 4, 5, 6)
- [ ] **One component per file.** No file exports more than one component (barrel `index.ts` re-exports are the only exception).
- [ ] **Files named correctly.** Components PascalCase.tsx, hooks useCamelCase.ts, utils camelCase.ts.
- [ ] **Directory structure follows Rule 5.** `components/ui/`, `components/sections/`, `hooks/`, `lib/`, `actions/`, `utils/`, `types/`, `constants/` exist and are used correctly.
- [ ] **Every directory has a README.md.** Minimum 2 lines: what lives here, naming convention used.
- [ ] **Every file has a file-level header comment.** Describes what the file does, what it exports, and where it's used.
- [ ] **Every exported function/component has a JSDoc block.** Params, return value, and purpose documented.
- [ ] **Every prop interface has every prop documented.** No undocumented props.
- [ ] **Inline comments explain WHY.** No comments that restate what the code already says.
- [ ] **Root README.md exists.** Setup, env vars table, structure overview included.
- [ ] **No business logic in UI files.** Logic extracted to hooks or utils, UI files only render.

#### 4.3.7 — Final gates
- [ ] **Hallmark slop check passed** (Rule 1)
- [ ] **Responsive check passed** at 320 / 768 / 1280 / 1440px (Rule 3)
- [ ] **All env variables documented** in `.env.example`
- [ ] **Mistake log updated** if any mistake was made during execution (`~/.sps/mistakes.md`)

---

## PROJECT COMPLETION CHECKLISTS

Use the matching checklist for the type of project. These are MANDATORY minimums.
Do not mark done until every box is ticked.

### Landing Page / Marketing Site
- [ ] Navigation: logo, links, mobile hamburger menu (works on 320px), sticky/scroll behavior
- [ ] Hero: hallmark macrostructure selected, slop test passed, not a generic centered-stack
- [ ] All content sections the brief calls for (features, testimonials, pricing, FAQ, etc.)
- [ ] Footer: nav links, legal links, copyright, social icons
- [ ] All `<a href>` tags go to real destinations (pages, sections, or external URLs)
- [ ] Smooth scroll for anchor `#section` links
- [ ] Contact / waitlist form: validation, submission handler, success and error states
- [ ] Meta tags: `<title>`, `<meta description>`, `<og:title>`, `<og:description>`, `<og:image>`
- [ ] Favicon wired up
- [ ] 404 page exists and is styled
- [ ] Mobile responsive: all breakpoints checked (Rule 3)
- [ ] Animations applied (if requested) — not just opacity fade
- [ ] Hallmark slop test passed (Rule 1)
- [ ] No placeholder text or images remaining

### Web Application
- [ ] Auth flow: sign up, sign in, sign out, forgot password (if applicable)
- [ ] Protected routes: unauthenticated users redirected to login
- [ ] All pages registered in the router / navigation
- [ ] All nav links go to their correct pages
- [ ] Error boundaries on all major sections
- [ ] Loading states for every async operation (fetch, mutation, form submit)
- [ ] Empty states for all lists/tables (not just "no data" text — styled)
- [ ] Error states for all async operations
- [ ] Form validation with user-facing error messages
- [ ] Success feedback after mutations (toast, redirect, or inline)
- [ ] 404 page
- [ ] Responsive layout (Rule 3)
- [ ] Environment variables documented in `.env.example`
- [ ] Hallmark slop test passed on all UI (Rule 1)

### API / Backend
- [ ] All endpoints implemented (not stubs)
- [ ] Input validation on all endpoints
- [ ] Authentication middleware on protected endpoints
- [ ] Consistent error response format across all endpoints
- [ ] At least one test per endpoint or a testable structure
- [ ] Rate limiting considered and noted
- [ ] Environment variables documented in `.env.example`
- [ ] README with setup instructions and endpoint documentation

### Mobile App (React Native / Expo)
- [ ] Navigation stack configured (all screens registered)
- [ ] All screens connected in the navigation
- [ ] Splash screen configured
- [ ] App icon configured
- [ ] Loading states for async operations
- [ ] Error handling and user-facing error messages
- [ ] Offline / no-network state handled
- [ ] Safe area insets applied on all screens
- [ ] Responsive to different screen sizes (phone and tablet if applicable)
- [ ] Environment variables handled (Expo config or react-native-config)

### Component / UI Library
- [ ] Component works in isolation (no hidden page-level dependencies)
- [ ] All props documented with types
- [ ] All interactive states implemented: default, hover, focus, active, disabled, loading, error
- [ ] Accessible: keyboard navigable, ARIA labels, focus ring visible
- [ ] Responsive (works on mobile and desktop)
- [ ] Hallmark slop test passed (Rule 1)
- [ ] Usage example included

### Animation / Motion Work
- [ ] Animation runs at 60fps (no layout thrashing, GPU-composited properties only for CSS)
- [ ] Animation respects `prefers-reduced-motion` media query
- [ ] Cleanup functions registered (no memory leaks on unmount)
- [ ] Fallback if animation library fails to load
- [ ] Works on mobile (touch events if needed)
- [ ] Responsive — doesn't break the layout at any breakpoint

---

## THREE PERMANENT RULES (enforced in Phase 4, cannot be skipped or overridden)

### RULE 1: ANTI-SLOP — Hallmark required on ALL UI work

Run this checklist before any UI handover. If ANY is true → redesign before delivering:

- [ ] Hero: centered headline + subtext + CTA button, nothing else → REJECT
- [ ] Cards: identical rounded-corner cards in a grid, image top → REJECT
- [ ] Gradient: blue→purple or two adjacent wheel hues → REJECT
- [ ] Sections: all same width, same padding, perfectly symmetric → REJECT
- [ ] Font pairing: Inter/Poppins + same family for headline → REJECT
- [ ] Color: one "brand color" + gray + white, nothing else → REJECT
- [ ] Animation: only `opacity 0→1` or generic slide-up → REJECT
- [ ] Nav: logo left, links right, solid full-width background, no personality → REJECT

What passes:
- Macrostructure from hallmark's 21 named patterns — not default top-down flow
- Type pairing that has tension: condensed display + book-weight serif body
- Color with reasoning: a specific anchor chosen for a specific reason
- Layout with a point of view: asymmetry, whitespace as a design decision
- Motion that communicates: tells something, doesn't just decorate

Use the `hallmark` skill for full guidance on macrostructures, slop test, typography, and color.
Install: `npx skills add nutlope/hallmark`

### RULE 2: GRAPHIFY — Required on every project

1. Check for `graphify-out/` in project root
2. If missing: "Setting up graphify..." → `uv tool install graphifyy && graphify install && graphify .`
3. If present: use the graph for codebase exploration — don't re-read files from scratch
4. Don't rebuild unless codebase has significantly changed

Install: `uv tool install graphifyy && graphify install`

### RULE 3: RESPONSIVE — Verified at 320/768/1280/1440px before every handover

| Breakpoint | What must pass |
|------------|----------------|
| 320px (iPhone SE) | No horizontal scroll, text readable, tap targets ≥ 44px |
| 375px (iPhone 14) | Hero scales, images constrain, nav accessible |
| 768px (tablet) | Two-column layouts hold, modals contained |
| 1280px (laptop) | Full layout renders as designed |
| 1440px (desktop) | Content respects max-width, doesn't stretch |

State explicitly before every handover: "Responsive: verified at 320/768/1280/1440 — [what was checked and how]"

---

### RULE 4: ONE FILE PER COMPONENT — Always

Every component, hook, utility, and type gets its own dedicated file. No exceptions.

**File naming:**
- React components → `PascalCase.tsx` (e.g. `HeroSection.tsx`, `PricingCard.tsx`)
- Hooks → `use` prefix, `camelCase.ts` (e.g. `useScrollPosition.ts`, `useAuth.ts`)
- Utilities / helpers → `camelCase.ts` (e.g. `formatDate.ts`, `cn.ts`)
- Types / interfaces → `camelCase.types.ts` or `types.ts` inside the feature folder
- Constants → `SCREAMING_SNAKE_CASE` inside `constants.ts`
- API/server actions → `camelCase.ts` inside `actions/` or `api/`

**Forbidden patterns:**
- Multiple exported components in one file (except intentional barrel `index.ts` re-exports)
- Logic mixed with UI in the same file beyond what a single component needs
- Types defined inline in the consuming file when they're reused elsewhere
- Helper functions buried at the bottom of a component file — move to `utils/`

**Barrel files (`index.ts`):**
Use in each directory to re-export its contents. Keep them clean:
```ts
// components/ui/index.ts
export { Button } from './Button'
export { Card } from './Card'
export { Modal } from './Modal'
```
This means consumers import from `@/components/ui` not `@/components/ui/Button/Button`.

---

### RULE 5: CLEAN DIRECTORY STRUCTURE — Every project must be navigable by any developer in 30 seconds

Use this standard structure for Next.js / React projects. Adapt logically for other stacks.

```
src/
├── app/                    # Next.js App Router pages and layouts
│   ├── (auth)/             # Route group: auth pages (login, signup, etc.)
│   ├── (dashboard)/        # Route group: protected app pages
│   ├── api/                # API route handlers
│   ├── layout.tsx          # Root layout
│   ├── page.tsx            # Home page
│   └── globals.css         # Global styles only
│
├── components/
│   ├── ui/                 # Primitive UI components (Button, Input, Modal, Card...)
│   ├── layout/             # Layout components (Navbar, Footer, Sidebar, PageWrapper)
│   ├── sections/           # Page sections (HeroSection, FeaturesSection, PricingSection)
│   ├── forms/              # Form components (ContactForm, LoginForm, CheckoutForm)
│   └── [feature]/          # Feature-specific components grouped by domain
│
├── hooks/                  # Custom React hooks (useAuth, useScrollPosition, useDebounce)
├── lib/                    # Third-party library configs (db.ts, auth.ts, stripe.ts, mail.ts)
├── actions/                # Server actions (createUser.ts, sendEmail.ts, processPayment.ts)
├── types/                  # Shared TypeScript types and interfaces
├── utils/                  # Pure utility functions (formatDate.ts, cn.ts, validators.ts)
├── constants/              # App-wide constants (routes.ts, config.ts, siteMetadata.ts)
├── styles/                 # Component-specific CSS modules (if not using Tailwind only)
└── __tests__/              # Test files, mirroring src/ structure
```

**For non-Next.js projects**, adapt the same principles:
- Group by feature/domain, not by file type when the project is large
- Group by file type (components/, hooks/, utils/) when the project is small/medium
- Never mix server and client code in the same file
- Never put config files inside `src/` — keep them at project root

**Every directory must have a `README.md`** that states in 2–3 lines:
- What lives here
- What naming convention is used
- Any rule specific to this directory

Example `components/ui/README.md`:
```markdown
# UI Components
Primitive, reusable UI components with no business logic.
Each component in its own file, PascalCase named.
Import via: `import { Button } from '@/components/ui'`
```

---

### RULE 6: MANDATORY COMMENTS AND DOCUMENTATION — Every file, every non-obvious line

#### File-level header (every file must have one)
```ts
/**
 * HeroSection.tsx
 * 
 * Full-viewport hero for the landing page. Renders the headline, sub-copy,
 * CTA buttons, and the background animation. Uses Framer Motion for the
 * stagger-reveal entrance and GSAP ScrollTrigger for the parallax on scroll.
 * 
 * Props: see HeroSectionProps below
 * Used by: app/page.tsx
 */
```

#### Component / function documentation (JSDoc/TSDoc)
Every exported function and component gets a JSDoc block:
```ts
/**
 * Formats a Unix timestamp into a human-readable relative string.
 * Uses Intl.RelativeTimeFormat for locale-aware output.
 * 
 * @param timestamp - Unix timestamp in milliseconds
 * @param locale    - BCP 47 locale string (default: 'en')
 * @returns Relative time string e.g. "3 days ago", "in 2 hours"
 */
export function formatRelativeTime(timestamp: number, locale = 'en'): string {
```

#### Prop types documentation (every prop explained)
```ts
interface PricingCardProps {
  /** Plan name displayed as the card heading */
  name: string
  /** Monthly price in USD cents (not dollars) to avoid floating point issues */
  priceInCents: number
  /** List of feature strings to display with checkmarks */
  features: string[]
  /** Whether this plan is highlighted as the recommended option */
  isPopular?: boolean
  /** Called when the user clicks the CTA button */
  onSelect: (planId: string) => void
}
```

#### Inline comments — explain WHY, not WHAT
```ts
// WHAT (bad — obvious from the code, adds no value):
// Increment the counter
count++

// WHY (good — explains the non-obvious reason):
// Stripe requires amounts in the smallest currency unit (cents for USD)
// Passing dollars causes silent truncation and incorrect charges
const amountInCents = Math.round(priceUSD * 100)

// WHY (good — explains a workaround or constraint):
// useLayoutEffect is intentional here — we need to measure the DOM node
// synchronously before the browser paints to avoid a flash of wrong size
useLayoutEffect(() => {
  setHeight(ref.current?.offsetHeight ?? 0)
}, [])
```

#### Section comments for long files
When a file has multiple logical sections, separate them:
```ts
// ─── Types ───────────────────────────────────────────────────────────────────

// ─── Constants ───────────────────────────────────────────────────────────────

// ─── Helper functions ────────────────────────────────────────────────────────

// ─── Main component ──────────────────────────────────────────────────────────
```

#### What NOT to comment
```ts
// Bad — explains what, which is obvious:
// Import React
import React from 'react'

// Bad — restates the function name:
// Get user by ID
async function getUserById(id: string) {

// Bad — commits history belongs in git, not comments:
// Added 2024-01-15 by Shahid to fix the login bug
```

#### README.md for every directory (see Rule 5)
Every `components/`, `hooks/`, `lib/`, `utils/`, `actions/` directory gets a short README.md.

#### Root-level README.md (every project)
Must include:
```markdown
# Project Name

One sentence describing what this project is.

## Prerequisites
- Node.js 20+
- [Any other required tools]

## Setup
\`\`\`bash
cp .env.example .env.local   # fill in your values
npm install
npm run dev
\`\`\`

## Environment variables
| Variable | Required | Description |
|----------|----------|-------------|
| DATABASE_URL | Yes | Postgres connection string |
| NEXT_PUBLIC_APP_URL | Yes | Full public URL of the app |

## Project structure
[brief description of src/ layout]

## Key decisions
[1-3 sentences on any non-obvious architectural choices]
```

---

## SKILL SELECTION — Decision tree

Do not select skills by keywords alone. Use this reasoning process:

**Step 1 — Task type:**
- Visual / UI → start with hallmark + one design skill
- Animation → classify complexity: simple (AOS), medium (Framer Motion / Lenis), complex (GSAP / awwwards-animations), 3D (Three.js / R3F)
- Data / backend → classify: simple CRUD (engineering-skills), complex architecture (engineering-advanced-skills)
- Deploy → target platform first: Vercel, Cloudflare, Netlify, Docker

**Step 2 — Stack:**
- React / Next.js → vercel:nextjs + vercel:react-best-practices always
- React animation → motion-framer first, GSAP for scroll-driven
- Vanilla JS animation → GSAP (no React overhead)
- Mobile → Expo skill, check if web PWA would serve instead
- Full-stack → engineering-skills + database skill + auth skill

**Step 3 — Confirm with catalog below, install what's missing**

### Full Skill Catalog

#### Design & UI (always use with hallmark)
| Keywords | Skill | Install |
|----------|-------|---------|
| design, UI, page, landing, hero, component, layout, dashboard, card, form, modal, button, section | **hallmark** | `npx skills add nutlope/hallmark` |
| design system, color palette, typography, font pairing, UX guidelines, 60+ styles, style guide | **ui-ux-pro-max** | `claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill && claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user` |
| React component, Next.js, frontend, web app, production UI | **frontend-design** | built-in (Claude Code); `npx skills add anthropics/frontend-design` other agents |
| shadcn, shadcn/ui, Radix, Tailwind components | **vercel:shadcn** | built into Claude Code |
| modern design trends, glassmorphism, micro-interactions, scrollytelling | **modern-web-design** | `claude plugin install modern-web-design@claude-design-skillstack --scope user` |
| Magic UI, React Bits, animated pre-built components | **animated-component-libraries** | `claude plugin install animated-component-libraries@claude-design-skillstack --scope user` |
| Apple HIG, iOS design, macOS design | **apple-hig-expert** | `claude plugin install apple-hig-expert@claude-code-skills --scope user` |
| Figma, design tokens, design handoff | **figma** | `npx skills add figma/figma` |

#### Animation & Motion
| Keywords | Skill | Install |
|----------|-------|---------|
| GSAP, ScrollTrigger, timeline, tween, parallax, pin, scrub, scroll-driven | **gsap-scrolltrigger** | `npx skills add https://github.com/greensock/gsap-skills` |
| GSAP React, useGSAP, SplitText, MorphSVG, DrawSVG, Flip | **gsap-react / gsap-plugins** | included in gsap-skills above |
| Framer Motion, Motion, variants, AnimatePresence, spring, layout animation, gesture, drag | **motion-framer** | `claude plugin install motion-framer@claude-design-skillstack --scope user` |
| smooth scroll, Lenis, locomotive scroll, butter scroll | **locomotive-scroll** | `claude plugin install locomotive-scroll@claude-design-skillstack --scope user` |
| Anime.js, SVG morphing, stagger, keyframe | **animejs** | `claude plugin install animejs@claude-design-skillstack --scope user` |
| Awwwards, FWA, award-level, magnetic cursor, page transition, 60fps reveal | **awwwards-animations** | `npx skills add devmartinese/awwwards-animations` |
| React Spring, physics animation, spring dynamics, inertia | **react-spring-physics** | `claude plugin install react-spring-physics@claude-design-skillstack --scope user` |
| Lottie, After Effects export, dotLottie, bodymovin | **lottie-animations** | `claude plugin install lottie-animations@claude-design-skillstack --scope user` |
| Rive, state machine, interactive vector animation | **rive-interactive** | `claude plugin install rive-interactive@claude-design-skillstack --scope user` |
| AOS, scroll reveal, simple fade on scroll | **scroll-reveal-libraries** | `claude plugin install scroll-reveal-libraries@claude-design-skillstack --scope user` |
| Barba.js, page transitions, SPA navigation | **barba-js** | `claude plugin install barba-js@claude-design-skillstack --scope user` |

#### 3D & WebGL
| Keywords | Skill | Install |
|----------|-------|---------|
| Three.js, WebGL, 3D scene, mesh, shader, geometry | **threejs-webgl** | `claude plugin install threejs-webgl@claude-design-skillstack --scope user` |
| React Three Fiber, R3F, drei, @react-three | **react-three-fiber** | `claude plugin install react-three-fiber@claude-design-skillstack --scope user` |
| Babylon.js, physics, XR, VR, AR | **babylonjs** | `claude plugin install babylonjs-engine@claude-design-skillstack --scope user` |
| A-Frame, WebXR, 360 video, immersive | **aframe-webxr** | `claude plugin install aframe-webxr@claude-design-skillstack --scope user` |
| Spline, no-code 3D, visual 3D editor | **spline-interactive** | `claude plugin install spline-interactive@claude-design-skillstack --scope user` |
| PixiJS, 2D WebGL, sprites, canvas, particles | **pixijs-2d** | `claude plugin install pixijs-2d@claude-design-skillstack --scope user` |
| Zdog, Vanta, vanilla-tilt, lightweight 3D effects | **lightweight-3d-effects** | `claude plugin install lightweight-3d-effects@claude-design-skillstack --scope user` |
| PlayCanvas, browser game, entity-component 3D | **playcanvas-engine** | `claude plugin install playcanvas-engine@claude-design-skillstack --scope user` |
| multi-library 3D + animation integration patterns | **web3d-integration-patterns** | `claude plugin install web3d-integration-patterns@claude-design-skillstack --scope user` |
| Blender, glTF export, 3D asset pipeline | **blender-web-pipeline** | `claude plugin install blender-web-pipeline@claude-design-skillstack --scope user` |

#### Frontend Framework (built into Claude Code)
| Keywords | Skill |
|----------|-------|
| Next.js, App Router, RSC, Server Components, SSR, SSG | **vercel:nextjs** |
| React best practices, hooks, patterns | **vercel:react-best-practices** |
| routing, middleware, redirects, rewrites | **vercel:routing-middleware** |
| caching, ISR, static, streaming | **vercel:next-cache-components** |
| Turbopack, fast builds | **vercel:turbopack** |
| feature flags, A/B testing, experiments | **feature-flags-architect** (claude-code-skills) |

#### Authentication
| Keywords | Skill | Install |
|----------|-------|---------|
| Clerk, auth, sign-in, sign-up, user management, session | **vercel:auth** | built into Claude Code |
| Auth0, OAuth, JWT, enterprise auth | Auth0 skill | `npx skills add auth0/auth0-skill` |
| Better Auth, NextAuth, open-source auth | Better Auth skill | `npx skills add better-auth/better-auth` |

#### Database & Storage
| Keywords | Skill | Install |
|----------|-------|---------|
| Postgres, SQL, Neon, managed database, migrations | Neon skill | `npx skills add neon/neon` |
| Supabase, BaaS, Postgres + realtime + storage + auth | Supabase skill | `npx skills add supabase/supabase` |
| MongoDB, NoSQL, document database, Atlas | MongoDB skill | `npx skills add mongodb/mongodb` |
| Firebase, Firestore, Realtime DB, Firebase auth | Firebase skill | `npx skills add firebase/firebase-basics` |
| Redis, caching, pub/sub, queues, sessions | Redis skill | `npx skills add redis/redis` |
| Vercel KV, Blob, Postgres (managed) | **vercel:vercel-storage** | built into Claude Code |

#### Payments & Commerce
| Keywords | Skill | Install |
|----------|-------|---------|
| Stripe, payments, checkout, subscription, webhook, billing | Stripe skill | `npx skills add stripe/stripe-best-practices` |
| Coinbase, crypto payments, Web3 | Coinbase skill | `npx skills add coinbase/coinbase` |

#### Email & Notifications
| Keywords | Skill | Install |
|----------|-------|---------|
| Resend, transactional email, email API, React Email | Resend skill | `npx skills add resend/resend` |
| Courier, multi-channel, push, SMS, email, chat notifications | Courier skill | `npx skills add trycourier/courier-skills` |

#### CMS & Content
| Keywords | Skill | Install |
|----------|-------|---------|
| Sanity, headless CMS, content studio, GROQ, structured content | Sanity skill | `npx skills add sanity/sanity` |
| WordPress, WP, content management | WordPress skill | `npx skills add wordpress/wordpress` |
| markdown, MDX, blog, long-form content | **markdown-html** | `claude plugin install markdown-html@claude-code-skills --scope user` |

#### Backend, APIs & Data
| Keywords | Skill | Install |
|----------|-------|---------|
| API, backend, Node.js, Express, REST, GraphQL, database schema | **engineering-skills** | `claude plugin install engineering-skills@claude-code-skills --scope user` |
| architecture, microservices, DDD, system design, monorepo, advanced patterns | **engineering-advanced-skills** | `claude plugin install engineering-advanced-skills@claude-code-skills --scope user` |
| GraphQL, Apollo, schema, resolvers, subscriptions | Apollo skill | `npx skills add apollo-graphql/apollo-graphql` |
| web scraping, crawling, Firecrawl | Firecrawl skill | `npx skills add firecrawl/firecrawl` |
| video rendering, programmatic video, Remotion | Remotion skill | `npx skills add remotion/remotion` |
| Replicate, AI models, image generation API | Replicate skill | `npx skills add replicate/replicate` |

#### Mobile
| Keywords | Skill | Install |
|----------|-------|---------|
| Expo, React Native, mobile app, iOS, Android, native | Expo skill | `npx skills add expo/expo-api-docs` |

#### AI & LLM (built into Claude Code)
| Keywords | Skill |
|----------|-------|
| Vercel AI SDK, streaming, LLM, AI chat, text generation | **vercel:ai-sdk** |
| AI Gateway, model routing, multi-provider | **vercel:ai-gateway** |
| Chat UI, AI chatbot, conversational interface | **vercel:chat-sdk** |
| Claude API, Anthropic SDK, prompt caching, tool use | **claude-api** |

#### Deploy & Infrastructure
| Keywords | Skill | Install |
|----------|-------|---------|
| Vercel, deploy, preview, production, edge | **vercel:deploy** | built into Claude Code |
| Vercel CI/CD, GitHub Actions, pipeline, preview URLs | **vercel:deployments-cicd** | built into Claude Code |
| Vercel functions, serverless, edge runtime | **vercel:vercel-functions** | built into Claude Code |
| Cloudflare Workers, Edge, CDN, Durable Objects, Pages | Cloudflare skill | `npx skills add cloudflare/cloudflare` |
| Netlify, serverless functions, edge functions, deploy | Netlify skill | `npx skills add netlify/netlify-functions` |
| Docker, containers, Dockerfile, docker-compose | **docker-development** | `claude plugin install docker-development@claude-code-skills --scope user` |
| Kubernetes, k8s, Helm | **kubernetes-operator** | `claude plugin install kubernetes-operator@claude-code-skills --scope user` |
| Terraform, IaC, infrastructure as code | **terraform-patterns** | `claude plugin install terraform-patterns@claude-code-skills --scope user` |

#### Performance, Debug & Security
| Keywords | Skill | Install |
|----------|-------|---------|
| Lighthouse, Web Vitals, Core Web Vitals, PageSpeed, performance | Web Quality (Addy Osmani) | `npx skills add addy-osmani/web-quality` |
| Sentry, error monitoring, crash reports, stack traces | Sentry skill | `npx skills add getsentry/sentry-sdk-setup` |
| security audit, vulnerability, pentest, smart contracts | Trail of Bits | `npx skills add trailofbits/audit-context-building` |
| accessibility, a11y, WCAG, screen reader, keyboard nav | **a11y-audit** | `claude plugin install a11y-audit@claude-code-skills --scope user` |
| Datadog, monitoring, observability, metrics, traces | Datadog skill | `npx skills add datadog/datadog` |
| Playwright, browser automation, E2E testing | Browserbase skill | `npx skills add browserbase/browserbase` |
| Cloudflare WAF, DDoS, rate limiting, firewall rules | **vercel:vercel-firewall** | built into Claude Code |
| chaos engineering, resilience, fault injection | **chaos-engineering** | `claude plugin install chaos-engineering@claude-code-skills --scope user` |

#### SEO, Marketing & Product
| Keywords | Skill | Install |
|----------|-------|---------|
| SEO, meta tags, schema markup, sitemap, robots.txt, PageSpeed | **research-ops-skills** | `claude plugin install research-ops-skills@claude-code-skills --scope user` |
| marketing, copywriting, content strategy, growth, ads, email campaign | **marketing-skills** | `claude plugin install marketing-skills@claude-code-skills --scope user` |
| product strategy, PRD, product requirements, user stories | **product-skills** | `claude plugin install product-skills@claude-code-skills --scope user` |
| project management, Agile, sprint planning, roadmap | **pm-skills** | `claude plugin install pm-skills@claude-code-skills --scope user` |
| business growth, go-to-market, GTM, revenue | **business-growth-skills** | `claude plugin install business-growth-skills@claude-code-skills --scope user` |
| demo video, product walkthrough, screen recording | **demo-video** | `claude plugin install demo-video@claude-code-skills --scope user` |

#### Research, Docs & Memory
| Keywords | Skill | Install |
|----------|-------|---------|
| explore codebase, understand repo, large project research | **graphify** | `uv tool install graphifyy && graphify install` |
| library docs, API reference, current version, up-to-date docs | **context7 MCP** | `claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp` |
| research, synthesize large docs, literature review | **research-summarizer** | `claude plugin install research-summarizer@claude-code-skills --scope user` |
| data analysis, statistics, charts, insights | **statistical-analyst** | `claude plugin install statistical-analyst@claude-code-skills --scope user` |

---

## COMPLETENESS STANDARDS — No exceptions

**Never hand over:**
- A page with `TODO` / `FIXME` / `HACK` comments
- Placeholder text (`Lorem ipsum`, `Your text here`, `Coming soon`, `Add content here`)
- Unimplemented functions (`return null`, `return {}`, empty function bodies)
- Broken or `href="#"` links that should go somewhere real
- Forms that don't submit or validate
- Missing error states (only happy path implemented)
- Missing mobile breakpoints
- Missing favicon, title, or meta description on any HTML page
- Multiple components crammed into one file
- A directory with no README.md
- A function/component with no JSDoc block
- A prop interface with undocumented props
- Business logic inside a UI/render file

**Always include:**
- `.env.example` with all required variables documented (never actual secrets)
- `README.md` at the project root: setup, env vars, structure overview
- `README.md` in every major directory: what lives there, naming convention
- File-level header comment in every `.ts` / `.tsx` / `.js` / `.jsx` file
- JSDoc on every exported function and component
- Section separators (`// ─── Section name ───`) in files longer than ~100 lines

---

## MULTI-AGENT NOTES

This skill runs identically on every agent. Install:
```
npx skills add -g SHAHID8142/Shahid-Personal-SkillSet
```
| Agent | Path |
|-------|------|
| Claude Code | `~/.claude/skills/sps/` |
| Cursor | `.cursor/rules/sps.mdc` |
| Codex | `~/.codex/skills/sps/` |
| Gemini CLI | `~/.gemini/skills/sps/` |
| Windsurf | `~/.windsurf/skills/sps/` |
| Antigravity | `~/.antigravity/skills/sps/` |
| Others | `~/.agents/skills/sps/` |

---

## GUARDRAILS

- Install ONLY from this catalog. Unknown skills → research, save to `~/.sps/learned/`, then use.
- Third-party skills run code. Pre-vetted here. Never auto-install from arbitrary search results.
- Hallmark on every UI task. Cannot be skipped.
- Graphify on every project. Cannot be skipped.
- Responsive before every handover. Cannot be skipped.
- One component per file. Cannot be skipped.
- Clean directory structure with READMEs in every directory. Cannot be skipped.
- File-level headers + JSDoc on all exports + WHY comments on non-obvious code. Cannot be skipped.
- Code quality gate: all 7 sections must pass before any handover. Cannot be skipped.
- Mistake log: read before every task, write after every mistake. Cannot be skipped.
- Never deliver partial work. If scope is too large, say so upfront and propose phases.
- Never repeat a mistake that is already in `~/.sps/mistakes.md`.
- When in doubt about a design choice: "Would a senior developer be embarrassed by this code?" If yes → fix it first.
