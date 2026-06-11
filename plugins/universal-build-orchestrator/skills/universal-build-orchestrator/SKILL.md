---
name: universal-build-orchestrator
description: >
  Shahid Personal SkillSet (/sps) — Claude plugin entry point. Mirrors skills/sps/SKILL.md exactly.
  Use for ANY request to build, design, create, implement, animate, fix, debug, deploy, or improve
  software. Detects the task type and INVOKES the real best-in-class specialist skill (epic-design
  for design, senior-frontend/backend/fullstack for engineering, awwwards-animations for motion,
  stripe-integration-expert for payments, code-reviewer before handover) instead of generic output,
  then layers twenty enforced rules: hallmark anti-slop, graphify, responsive 320-1440px, a11y WCAG AA,
  design tokens, branching & commits, dual-tone support, i18n, security, error boundaries, DB safety, rollback, secrets, linting, state management, CI/CD, hooks, TSDoc, auditing, and modularity.
  Reads both global (~/.sps/) and local (./.sps/) profile/mistakes files before every task; researches unknown tools into
  ./.sps/learned/. Builds section by section, never a whole page at once.
---

This is the Claude plugin entry point for **/sps**.

The full, authoritative skill definition lives in `skills/sps/SKILL.md` in the
Shahid-Personal-SkillSet repo. All behaviour is identical:

- **STEP 0 — Initialization & Memory:** Setup local `.sps/` docs on first run; parse rules.
- **STEP 1 — Detect & invoke:** Call expert skills, never just roleplay.
- **STEP 2 — Vertical Slicing:** Strict section-by-section approval. Fullstack at once.
- **STEP 3 — Unknown tool protocol:** Research missing skills with Context7.
- **STEP 4 — Design execution:** invoke `epic-design` first, then the design stack
- **STEP 5 — One tool per job:** Lenis for smooth scroll, GSAP for scroll-triggers, etc.
- **STEP 6 — Skill catalog**
- **STEP 7 — Twenty core rules:** anti-slop, graphify, responsive, a11y, tokens, branch & commits, dual-tone, i18n, security, error bounds, DB, rollback, secrets, linting, state, CI/CD, hooks, TSDoc, auditing, modularity
- **STEP 8 — Quality gate:** 19 checks before every handover

Refer to `skills/sps/SKILL.md` for the complete instructions.
Install per-project: `npx skills add SHAHID8142/Shahid-Personal-SkillSet` + `bash install.sh`
