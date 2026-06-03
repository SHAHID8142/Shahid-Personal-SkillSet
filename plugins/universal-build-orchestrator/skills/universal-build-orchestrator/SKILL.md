---
name: universal-build-orchestrator
description: >
  Shahid Personal SkillSet (/sps) — Claude plugin entry point. Mirrors skills/sps/SKILL.md exactly.
  Use for ANY request to build, design, create, implement, animate, fix, debug, deploy, or improve
  software. Detects the task type and INVOKES the real best-in-class specialist skill (epic-design
  for design, senior-frontend/backend/fullstack for engineering, awwwards-animations for motion,
  stripe-integration-expert for payments, code-reviewer before handover) instead of generic output,
  then layers six enforced rules: hallmark anti-slop, graphify every project, responsive
  320/768/1280/1440px, a11y WCAG AA, design tokens (no hardcoded values), conventional commits.
  Reads ~/.sps/profile.md and ~/.sps/mistakes.md before every task; researches unknown tools into
  ~/.sps/learned/. Builds section by section, never a whole page at once.
---

This is the Claude plugin entry point for **/sps**.

The full, authoritative skill definition lives in `skills/sps/SKILL.md` in the
Shahid-Personal-SkillSet repo. All behaviour is identical:

- **STEP 0 — Memory:** read `~/.sps/profile.md`, `~/.sps/mistakes.md`, `~/.sps/learned/INDEX.md`
- **STEP 1 — Detect task type → invoke the real specialist skill** (epic-design, senior-frontend,
  senior-backend, awwwards-animations, stripe-integration-expert, etc.), with text fallback
- **STEP 2 — Unknown tool protocol:** research → save to `~/.sps/learned/` → apply
- **STEP 3 — Section by section:** never build a whole page at once
- **STEP 4 — Design execution:** invoke `epic-design` first, then the design stack
- **STEP 5 — One tool per job:** Lenis for smooth scroll, GSAP for scroll-triggers, etc.
- **STEP 6 — Skill catalog**
- **STEP 7 — Six core rules:** anti-slop · graphify · responsive · a11y · design-tokens · conventional-commits
- **STEP 8 — Quality gate:** 10 checks before every handover

Refer to `skills/sps/SKILL.md` for the complete instructions.
Install everywhere: `npx skills add -g SHAHID8142/Shahid-Personal-SkillSet` + `bash install.sh`
