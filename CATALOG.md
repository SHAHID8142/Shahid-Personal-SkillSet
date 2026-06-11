# Shahid Personal SkillSet — Catalog

## How to use

```
/sps [your request]
```

The `/sps` orchestrator reads your prompt, matches keywords to the right skills, installs
anything missing (one-line notice, then proceeds), and executes. Works identically on:
Claude Code, Cursor, Codex, Gemini CLI, Windsurf, GitHub Copilot, Antigravity, and more.

**Install everything:** `bash install.sh` (from the cloned repo root)
**Or just the orchestrator:** `npx skills add -g SHAHID8142/Shahid-Personal-SkillSet`

---

## THREE PERMANENT RULES (always active, cannot be skipped)

| # | Rule | Enforced |
|---|------|----------|
| 1 | **Hallmark anti-slop** | Every UI output runs the slop checklist. Generic patterns → rejected and redesigned. |
| 2 | **Graphify** | Every project gets a knowledge graph (`graphify .`) before deep work starts. |
| 3 | **Responsive** | Before every handover: 320px / 768px / 1280px / 1440px verified. |

---

## Full Skill Catalog — Website & App Build Stack

### Design & UI
| Skill | Keywords | Source |
|-------|----------|--------|
| **hallmark** | design, UI, page, landing, hero, component, layout, dashboard | `Nutlope/hallmark` |
| **ui-ux-pro-max** | design system, color palette, typography, font pairing, UX | `nextlevelbuilder/ui-ux-pro-max-skill` |
| **frontend-design** | React component, Next.js, web app, frontend, production UI | `anthropics/skills` |
| **modern-web-design** | modern trends, glassmorphism, micro-interactions, dark mode | `freshtechbro/claudedesignskills` |
| **animated-component-libraries** | Magic UI, React Bits, pre-built animated components | `freshtechbro/claudedesignskills` |
| **apple-hig-expert** | Apple HIG, iOS design, macOS guidelines | `alirezarezvani/claude-skills` |

### Animation & Motion
| Skill | Keywords | Source |
|-------|----------|--------|
| **gsap-animation** | GSAP, ScrollTrigger, timeline, pin, scrub, parallax | `~/.claude/skills/gsap-animation/` |
| **lenis-scroll** | Lenis, smooth scroll, momentum, butter scroll | `~/.claude/skills/lenis-scroll/` |
| **animejs** | Anime.js, SVG morphing, stagger, keyframe | `freshtechbro/claudedesignskills` |
| **awwwards-animations** | award-level, magnetic cursor, 60fps, Awwwards, FWA | `devmartinese/awwwards-animations-skill` |
| **react-spring-physics** | React Spring, physics, spring dynamics, inertia | `freshtechbro/claudedesignskills` |
| **lottie-animations** | Lottie, After Effects, dotLottie, bodymovin | `freshtechbro/claudedesignskills` |
| **rive-interactive** | Rive, state machine animation, interactive vector | `freshtechbro/claudedesignskills` |
| **scroll-reveal-libraries** | AOS, scroll reveal, fade on scroll | `freshtechbro/claudedesignskills` |
| **barba-js** | Barba.js, page transitions, SPA navigation | `freshtechbro/claudedesignskills` |

### 3D & WebGL
| Skill | Keywords | Source |
|-------|----------|--------|
| **threejs-webgl** | Three.js, WebGL, 3D scene, mesh, shader | `freshtechbro/claudedesignskills` |
| **react-three-fiber** | R3F, drei, @react-three, 3D in React | `freshtechbro/claudedesignskills` |
| **babylonjs** | Babylon.js, physics, XR, VR, AR | `freshtechbro/claudedesignskills` |
| **aframe-webxr** | A-Frame, WebXR, VR, AR | `freshtechbro/claudedesignskills` |
| **webgpu-claude-skill**| WebGPU, WGSL, compute shaders, graphics API | `dgreenheck/webgpu-claude-skill` |
| **spline-interactive** | Spline, 3D embed, interactive | `freshtechbro/claudedesignskills` |
| **pixijs-2d** | PixiJS, 2D WebGL, sprites, canvas | `freshtechbro/claudedesignskills` |
| **lightweight-3d-effects** | Zdog, Vanta, vanilla-tilt, lightweight 3D | `freshtechbro/claudedesignskills` |
| **playcanvas-engine** | PlayCanvas, browser game, entity-component | `freshtechbro/claudedesignskills` |
| **web3d-integration-patterns** | multi-library 3D + animation integration | `freshtechbro/claudedesignskills` |
| **blender-web-pipeline** | Blender, glTF export, 3D asset pipeline | `freshtechbro/claudedesignskills` |

### Frontend Frameworks & UI
| Skill | Keywords | Source |
|-------|----------|--------|
| **frontend-design** | React, Next.js, frontend, UI components, pages | `freshtechbro/claudedesignskills` |
| **astro-framework** | Astro, static sites, islands architecture | `withastro/astro` |
| **impeccable** | impeccable standard, high quality UI, anti-slop | `pbakaus/impeccable` |
| **npxskillui** | UI components, templates, pre-built sections | `amaancoderx/npxskillui` |
| **taste-skill** | premium taste, cinematic design, aesthetics | `Leonxlnx/taste-skill` |
| **awesome-design-md** | design guidelines, markdown references | `VoltAgent/awesome-design-md` |
| **vercel:shadcn** | shadcn, shadcn/ui, Radix, accessible UI components | built-in Claude Code |
| **tailwind-design-system** | Tailwind CSS v4, design tokens, variables | `VoltAgent/awesome-agent-skills` |
| **feature-flags-architect** | feature flags, A/B testing, experiments | `VoltAgent/awesome-agent-skills` |

### Authentication
| Skill | Keywords | Source |
|-------|----------|--------|
| **vercel:auth (Clerk)** | Clerk, auth, sign-in, sign-up | built into Claude Code |
| **Auth0** | Auth0, OAuth, JWT | `VoltAgent/awesome-agent-skills` |
| **Better Auth** | Better Auth, NextAuth | `VoltAgent/awesome-agent-skills` |

### Database & Storage
| Skill | Keywords | Source |
|-------|----------|--------|
| **Neon** | Postgres, SQL, Neon, migrations | `VoltAgent/awesome-agent-skills` |
| **Supabase** | Supabase, BaaS, Postgres, realtime | `VoltAgent/awesome-agent-skills` |
| **MongoDB** | MongoDB, NoSQL, document database | `VoltAgent/awesome-agent-skills` |
| **Firebase** | Firebase, Firestore, Realtime Database | `VoltAgent/awesome-agent-skills` |
| **Redis** | Redis, caching, pub/sub, queues | `VoltAgent/awesome-agent-skills` |
| **vercel:vercel-storage** | Vercel KV, Blob, Postgres | built into Claude Code |

### Payments & Commerce
| Skill | Keywords | Source |
|-------|----------|--------|
| **Stripe** | payments, checkout, subscription, webhook | `VoltAgent/awesome-agent-skills` |
| **Coinbase** | crypto payments, Web3 | `VoltAgent/awesome-agent-skills` |

### Email & Notifications
| Skill | Keywords | Source |
|-------|----------|--------|
| **Resend** | transactional email, email API | `VoltAgent/awesome-agent-skills` |
| **Courier** | multi-channel, push, SMS, email, chat | `trycourier/courier-skills` |

### CMS & Content
| Skill | Keywords | Source |
|-------|----------|--------|
| **Sanity** | headless CMS, content studio, GROQ | `VoltAgent/awesome-agent-skills` |
| **WordPress** | WordPress, WP, content management | `VoltAgent/awesome-agent-skills` |
| **markdown-html** | markdown, MDX, blog, content | `alirezarezvani/claude-skills` |

### Backend & APIs
| Skill | Keywords | Source |
|-------|----------|--------|
| **engineering-skills** | API, backend, Node.js, REST, database | `alirezarezvani/claude-skills` |
| **engineering-advanced-skills** | architecture, microservices, DDD | `alirezarezvani/claude-skills` |
| **Apollo GraphQL** | GraphQL, Apollo, schema, resolvers | `VoltAgent/awesome-agent-skills` |
| **Firecrawl** | web scraping, web data, crawl | `VoltAgent/awesome-agent-skills` |
| **Remotion** | video rendering, programmatic video | `VoltAgent/awesome-agent-skills` |
| **Replicate** | AI models, image generation API | `VoltAgent/awesome-agent-skills` |
| **andrej-karpathy-skills** | machine learning, deep learning, PyTorch, AI models | `multica-ai/andrej-karpathy-skills` |

### Mobile & Desktop Apps
| Skill | Keywords | Source |
|-------|----------|--------|
| **Expo** | React Native, Expo, mobile, iOS, Android | `VoltAgent/awesome-agent-skills` |
| **Tauri** | Desktop apps, Rust, Tauri, macOS, Windows | `VoltAgent/awesome-agent-skills` |

### AI & LLM (built into Claude Code)
| Skill | Keywords |
|-------|----------|
| **vercel:ai-sdk** | Vercel AI SDK, streaming, LLM, AI chat |
| **vercel:ai-gateway** | AI Gateway, model routing, providers |
| **vercel:chat-sdk** | chat UI, AI chatbot, conversational |
| **claude-api** | Claude API, Anthropic SDK, prompt caching |

### Deploy & Infrastructure
| Skill | Keywords | Source |
|-------|----------|--------|
| **vercel:deploy** | Vercel deploy, preview, production | built into Claude Code |
| **vercel:vercel-functions** | serverless, edge functions | built into Claude Code |
| **Cloudflare** | Workers, Edge, CDN, Durable Objects | `VoltAgent/awesome-agent-skills` |
| **Netlify** | serverless functions, deploy, blobs | `VoltAgent/awesome-agent-skills` |
| **docker-development** | Docker, containers, Dockerfile | `alirezarezvani/claude-skills` |
| **kubernetes-operator** | Kubernetes, k8s, Helm | `alirezarezvani/claude-skills` |
| **terraform-patterns** | Terraform, IaC | `alirezarezvani/claude-skills` |

### Testing & QA
| Skill | Keywords | Source |
|-------|----------|--------|
| **Playwright** | E2E testing, browser automation, testing | `VoltAgent/awesome-agent-skills` |
| **Vitest** | Unit testing, test runner, jest | `VoltAgent/awesome-agent-skills` |

### State Management & Data Fetching
| Skill | Keywords | Source |
|-------|----------|--------|
| **TanStack Query** | React Query, data fetching, caching, server state | `VoltAgent/awesome-agent-skills` |
| **Zustand** | global state, zustand, stores, jotai | `VoltAgent/awesome-agent-skills` |

### Databases & ORMs
| Skill | Keywords | Source |
|-------|----------|--------|
| **Drizzle ORM** | drizzle, SQL, schema, migrations, relational | `VoltAgent/awesome-agent-skills` |
| **Prisma** | prisma, schema.prisma, ORM, postgres | `VoltAgent/awesome-agent-skills` |

### CI/CD & Automation
| Skill | Keywords | Source |
|-------|----------|--------|
| **GitHub Actions** | workflows, CI/CD, automation, pipelines | `VoltAgent/awesome-agent-skills` |

### Performance, Debug & Security
| Skill | Keywords | Source |
|-------|----------|--------|
| **Web Quality (Addy Osmani)** | Lighthouse, Web Vitals, PageSpeed, performance | `VoltAgent/awesome-agent-skills` |
| **Sentry** | error monitoring, crash, stack trace | `VoltAgent/awesome-agent-skills` |
| **Trail of Bits** | security audit, vulnerability, pentest | `VoltAgent/awesome-agent-skills` |
| **Datadog** | monitoring, observability, metrics | `VoltAgent/awesome-agent-skills` |
| **Browserbase** | browser automation, Playwright, testing | `VoltAgent/awesome-agent-skills` |
| **a11y-audit** | accessibility, WCAG, a11y, screen reader | `alirezarezvani/claude-skills` |
| **vercel:vercel-firewall** | Cloudflare WAF, DDoS, rate limit | built into Claude Code |

### SEO, Marketing & Product
| Skill | Keywords | Source |
|-------|----------|--------|
| **research-ops-skills** | SEO, meta tags, schema markup, PageSpeed | `alirezarezvani/claude-skills` |
| **marketing-skills** | marketing, copy, content, growth, ads | `alirezarezvani/claude-skills` |
| **product-skills** | product strategy, PRD, requirements | `alirezarezvani/claude-skills` |
| **pm-skills** | project management, Agile, sprint | `alirezarezvani/claude-skills` |
| **business-growth-skills** | go-to-market, GTM, growth | `alirezarezvani/claude-skills` |
| **demo-video** | demo video, product walkthrough | `alirezarezvani/claude-skills` |

### Design Handoff
| Skill | Keywords | Source |
|-------|----------|--------|
| **Figma** | Figma, design tokens, handoff, variables | `VoltAgent/awesome-agent-skills` |

### Research, Docs & Memory
| Skill | Keywords | Source |
|-------|----------|--------|
| **graphify** | explore codebase, research, knowledge graph | `safishamsi/graphify` |
| **context7 MCP** | library docs, API reference, version-specific | `upstash/context7` |
| **research-summarizer** | research, summarize, synthesize | `alirezarezvani/claude-skills` |
| **statistical-analyst** | data analysis, statistics, charts | `alirezarezvani/claude-skills` |

---

## Adding a new skill

1. Review its `SKILL.md` and any scripts it runs.
2. Add a row to the relevant table above with keywords and source.
3. Add the matching keyword row in `skills/sps/SKILL.md` with its install command.
4. Add the install line in `install.sh` under the right section.
5. Commit and push — every clone gets it on the next `bash install.sh`.
