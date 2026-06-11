# Shahid Personal SkillSet (`/sps`)

An extremely opinionated, enterprise-grade build orchestrator for AI coding agents. 

With a single install command, it wires up a **54-step** ecosystem of best-in-class skills and lays down **20 unbreakable rules** across Claude Code, Cursor, Codex, Gemini CLI, Windsurf, GitHub Copilot, and Antigravity.

When you type `/sps [your request]`, it reads your prompt, dynamically detects which framework specialists are needed, auto-installs anything missing, and strictly enforces quality gates before handing the code back to you.

---

## The 20 Unbreakable Rules
This orchestrator fundamentally changes how your AI behaves. It forces the AI to act like a senior engineer, preventing "slop", infinite loops, and broken architectures.

| Rule | What it does |
|------|-------------|
| **1. Anti-Slop** | Every UI must pass the "slop checklist". Generic hero stacks, default gradients, and Inter-on-Inter are forbidden. |
| **2. Graphify** | Every project automatically gets a knowledge graph (`graphify .`) mapped out to save tokens on future queries. |
| **3. Responsive** | 320px, 768px, 1280px, and 1440px breakpoints must be explicitly verified before handover. |
| **4. Anti-Frankenstein** | **No arbitrary Tailwind values** (e.g., `w-[323px]`). Only strict design system tokens and CSS variables. |
| **5. A11Y** | Keyboard nav, focus rings, semantic HTML, and strict contrast ratios (4.5:1) are mandatory. |
| **6. Protected Branches** | **Never push to `main`**. The AI must create a feature branch (`git checkout -b`) and push there. |
| **7. Dual-Tone** | Every UI component must inherently support Light and Dark modes. |
| **8. Localization (i18n)**| Hardcoded English text is banned; text must route through a `constants/copy.ts` or translation file. |
| **9. Strict Security** | Zod input validation, sanitization, and secure headers on every backend route. |
| **10. Error Boundaries** | Every async fetch gets a loading skeleton, error boundary, and empty state. No "happy path only" code. |
| **11. Safe Databases** | **No raw SQL hacking.** The AI must use a formal ORM migration file (Drizzle Kit or Prisma) so changes are reversible. |
| **12. 3-Strike Rollback**| If the AI fails to fix a bug 3 times, it **must STOP**, run `git restore` to roll back to safety, and ask you for help. |
| **13. Secrets Safety** | The AI is banned from committing `.env` files. It must generate an `.env.example` and ask you to inject real keys. |
| **14. Clean Code** | The AI must run `npm run lint`, `npm run format`, and strip all leftover `console.log` statements before handover. |
| **15. Safe State** | **No `useEffect` fetching.** It must use TanStack Query or Server Components. Zustand/Jotai is mandated over bloated Redux. |
| **16. Auto CI/CD** | On new projects, it automatically scaffolds a `.github/workflows/ci.yml` to run Playwright tests and linters in the cloud. |
| **17. Pre-commit Hooks** | Always sets up Husky and `lint-staged` so that ESLint and Prettier run automatically before allowing any git commits. |
| **18. Full Documentation** | Every exported function, React component, interface, and type MUST have standard TSDoc/JSDoc comments. |
| **19. Security Auditing** | Always runs `npm audit` before finalizing dependencies, using strict package pinning to prevent breaking changes. |
| **20. Strict Modularity** | Absolutely no "god files". Files must rarely exceed 150-200 lines. Pure functions go in `utils/`, logic goes in `hooks/`. |

---

## Installation

**Requirements:** Node.js, Claude Code CLI (optional but recommended)

### Mac / Linux
```bash
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
bash install.sh
```

### Windows (PowerShell)
```powershell
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
powershell -ExecutionPolicy Bypass -File install.ps1
```
*(Note: Failed installations will print an error snippet but continue. The orchestrator will dynamically re-attempt to install skipped skills on demand!)*

---

## Uninstallation
If you ever want to cleanly wipe the entire bundle (all 50+ installed tools, plugins, and globals) from your machine without touching your personal AI memory data:

**Mac / Linux:**
```bash
cd Shahid-Personal-SkillSet
bash uninstall.sh
```

**Windows:**
```powershell
cd Shahid-Personal-SkillSet
powershell -ExecutionPolicy Bypass -File uninstall.ps1
```

---

## How to Use
In any supported agent, simply type: `/sps [your request]`

**Examples:**
- `/sps build an animated SaaS landing page with impeccable taste` → Triggers Hallmark, GSAP, and `taste-skill`.
- `/sps create a WebGPU compute shader` → Triggers `webgpu-claude-skill` + Three.js.
- `/sps build a React Native mobile app with Expo` → Triggers Expo mobile specialists + UI tokens.
- `/sps set up a Drizzle ORM schema with Postgres` → Triggers Drizzle, DB Rules, and Supabase.
- `/sps write E2E tests for the auth flow` → Triggers Playwright E2E and Vitest unit testing.

---

## The Ultimate Skill Catalog

`CATALOG.md` has the full list. Highlights include:

| Category | Skills |
|----------|--------|
| **Premium UI** | hallmark, ui-ux-pro-max, frontend-design, impeccable, taste-skill, npxskillui |
| **Animation** | GSAP (8 skills), Lenis, Anime.js, Awwwards, Lottie, Rive, React Spring |
| **3D & WebGPU** | WebGPU, Three.js, React Three Fiber, Babylon.js, A-Frame, Spline |
| **Testing** | Playwright (E2E), Vitest (Unit) |
| **State / Fetch**| TanStack Query, Zustand, Jotai |
| **Databases** | Drizzle ORM, Prisma, Neon/Postgres, Supabase, MongoDB, Redis |
| **CI/CD** | GitHub Actions workflows |
| **Mobile/Desktop**| Expo (React Native), Tauri (Rust/JS) |
| **Auth** | Clerk, Auth0, Better Auth |
| **Deploy** | Vercel, Cloudflare, Docker, Kubernetes, Terraform |
| **Performance** | Web Quality, Sentry, Datadog, a11y-audit |
| **SEO / Copy** | SEO/meta/schema, marketing-skills |

---

## Repo Structure

```text
Shahid-Personal-SkillSet/
├── skills/
│   └── sps/
│       └── SKILL.md              ← Master orchestrator (npx skills compatible)
├── plugins/
│   └── universal-build-orchestrator/
│       └── skills/.../SKILL.md   ← Claude plugin entry point
├── install.sh                    ← Mac/Linux full installer
├── install.ps1                   ← Windows full installer
├── uninstall.sh                  ← Clean removal script (Mac/Linux)
├── uninstall.ps1                 ← Clean removal script (Windows)
├── CATALOG.md                    ← Full mapped skill catalog
└── README.md
```

## Safety Notice
Every catalogued skill is third-party code that runs on your machine. They are pre-selected from reputable official sources. The orchestrator only ever installs from this catalog—never from arbitrary web search results. Review any source that looks changed or abandoned before trusting it.
