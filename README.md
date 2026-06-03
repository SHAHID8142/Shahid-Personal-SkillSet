# Shahid Personal SkillSet (`/sps`)

A universal build orchestrator for AI coding agents. One command installs it globally across
**Claude Code, Cursor, Codex, Gemini CLI, Windsurf, GitHub Copilot, Antigravity**, and 10+ more.

When you type `/sps [your request]`, it reads your prompt, detects which skills are needed,
auto-installs anything missing with a one-line notice, and builds — with three rules that can
never be turned off:

| Rule | What it does |
|------|-------------|
| **Hallmark anti-slop** | Every UI runs a slop checklist before handover. Generic hero stacks, default gradients, Inter-on-Inter → redesigned. |
| **Graphify** | Every project gets a knowledge graph (`graphify .`) automatically. Saves tokens on every subsequent query. |
| **Responsive** | Before every handover: 320px / 768px / 1280px / 1440px verified. Not stated — actually checked. |

---

## Install — Mac / Linux

**Requirements:** Node.js, Claude Code CLI

```bash
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
bash install.sh
```

Or, just the `/sps` orchestrator without the full catalog:

```bash
npx skills add -g SHAHID8142/Shahid-Personal-SkillSet
```

---

## Install — Windows

**Requirements:** Node.js, Claude Code CLI, PowerShell 5+

```powershell
git clone https://github.com/SHAHID8142/Shahid-Personal-SkillSet
cd Shahid-Personal-SkillSet
powershell -ExecutionPolicy Bypass -File install.ps1
```

If you've already set your ExecutionPolicy to allow local scripts:

```powershell
.\install.ps1
```

> **Note on ExecutionPolicy:** Windows blocks unsigned scripts by default. The `-ExecutionPolicy Bypass`
> flag runs this script once without permanently changing your system policy. To set it permanently:
> `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

Windows prerequisites if not installed:
```powershell
# Node.js
winget install OpenJS.NodeJS.LTS

# Claude Code CLI
winget install Anthropic.ClaudeCode

# uv (for graphify — optional but recommended)
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

---

## How to use

In any supported agent, type:

```
/sps [your request]
```

Examples:
- `/sps build me an animated SaaS landing page` → hallmark + GSAP + frontend-design
- `/sps create a Stripe checkout with a dashboard` → Stripe + engineering-skills + ui-ux-pro-max
- `/sps add Lottie animations to my hero section` → lottie-animations + awwwards-animations
- `/sps build a React Native mobile app with Expo` → Expo + engineering-skills + hallmark
- `/sps set up Supabase auth and Postgres` → Supabase + engineering-skills
- `/sps audit this UI for slop` → hallmark audit mode

The orchestrator detects the domains from your words, installs what's missing, and uses the right
skills. Hallmark, graphify, and responsive checks run automatically on everything.

---

## Update

```bash
# Mac / Linux
cd Shahid-Personal-SkillSet && git pull && bash install.sh

# Windows
cd Shahid-Personal-SkillSet; git pull; powershell -ExecutionPolicy Bypass -File install.ps1
```

---

## Skill catalog (what gets installed)

`CATALOG.md` has the full list. Summary:

| Category | Skills |
|----------|--------|
| Design & UI | hallmark, ui-ux-pro-max, frontend-design, modern-web-design |
| Animation | GSAP (8 skills), Framer Motion, Lenis, Anime.js, Awwwards, Lottie, Rive, React Spring |
| 3D & WebGL | Three.js, React Three Fiber, Babylon.js, A-Frame, Spline, PixiJS, PlayCanvas |
| Auth | Clerk (via Vercel), Auth0, Better Auth |
| Database | Neon/Postgres, Supabase, MongoDB, Firebase, Redis |
| Payments | Stripe, Coinbase |
| Email | Resend, Courier |
| CMS | Sanity, WordPress |
| Backend | Node.js/REST/GraphQL, Apollo, Firecrawl, Remotion, Replicate |
| Mobile | Expo / React Native |
| AI / LLM | Vercel AI SDK, AI Gateway, Claude API, Chat SDK |
| Deploy | Vercel, Cloudflare, Netlify, Docker, Kubernetes, Terraform |
| Performance | Web Quality (Addy Osmani), Sentry, Datadog, a11y-audit |
| Security | Trail of Bits, Cloudflare WAF |
| SEO & Marketing | SEO/meta/schema, marketing-skills, product-skills |
| Research | graphify, Context7 MCP |
| Design handoff | Figma |

---

## Repo structure

```
Shahid-Personal-SkillSet/
├── skills/
│   └── sps/
│       └── SKILL.md              ← /sps orchestrator (npx skills compatible)
├── plugins/
│   └── universal-build-orchestrator/
│       ├── .claude-plugin/plugin.json
│       └── skills/.../SKILL.md   ← Claude plugin system entry point
├── .claude-plugin/
│   └── marketplace.json          ← Claude marketplace config
├── install.sh                    ← Mac/Linux installer
├── install.ps1                   ← Windows installer (PowerShell)
├── CATALOG.md                    ← Full skill catalog with keywords & sources
└── README.md
```

---

## Safety

Every catalogued skill is third-party code that runs on your machine. They're pre-selected from
reputable official sources. The orchestrator only ever installs from this catalog — never from
arbitrary web search results. Review any source that looks changed or abandoned before trusting it.
