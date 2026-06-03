---
name: universal-build-orchestrator
description: >
  Shahid Personal SkillSet orchestrator (Claude plugin entry point — mirrors skills/sps/SKILL.md).
  Invoke with /sps. Mandatory 4-phase protocol: THINK before acting, RESEARCH using mistake log +
  Context7 + graphify, PLAN full scope with project completion checklists, EXECUTE with all
  wiring and connections. Three permanent rules: hallmark anti-slop, graphify on every project,
  responsive at 320/768/1280/1440px. Mistake memory at ~/.sps/mistakes.md — read before every
  task, write after every mistake, never repeat a logged mistake. Works on all agents.
---

This is the Claude plugin system entry point for /sps.
The full skill definition, all rules, all checklists, and the complete skill catalog
are in `skills/sps/SKILL.md` in the Shahid-Personal-SkillSet repo.

**All behaviour is identical** — the 4-phase protocol (THINK → RESEARCH → PLAN → EXECUTE),
the three permanent rules, the project completion checklists, the mistake memory system,
and the full skill catalog all apply exactly as written in `skills/sps/SKILL.md`.

Refer to that file for the complete authoritative instructions.
Install the full skill for all agents: `npx skills add -g SHAHID8142/Shahid-Personal-SkillSet`
