---
name: sps
description: >
  Project-scoped master build orchestrator for skills-compatible coding agents.
  Use for build, design, implement, fix, refactor, test, deploy, audit, sync, or
  improve work with mandatory discovery, CMS-coupled section delivery, design
  gates, skill routing, workspace hygiene, role matrix, todos, approvals,
  anti-hallucination, always-written .sps memory, low-end mobile gates, legacy
  audits, and deployable handoff across Claude, Cursor, Codex, Antigravity,
  Windsurf, Copilot, OpenCode, and other skills-compatible agents.
---

# /sps

`/sps` is a capability-aware master workflow for **skills-compatible coding
agents**. It is portable; it is **not** identical on every host and not for
generic chatbots.

Read [METHOD-CARD.md](METHOD-CARD.md) first every session.

Current skill version: read `VERSION` and stamp it into `./.sps/agent.md`.

## Core laws

1. **`/sps` lock.** Once `./.sps/` exists, build/design/implement/fix/refactor/
   test/deploy/audit/sync work must use `/sps`. Host-native scaffolding must not
   replace it. Mirror the lock into `AGENTS.md` / `GEMINI.md` / `CLAUDE.md`
   ([PROJECT-ROOT-MIRRORS.md](PROJECT-ROOT-MIRRORS.md)).
2. **Project scope first.** Project rules beat personal defaults unless the user
   promotes a rule globally.
3. **Always write memory.** Update `./.sps/` every run and after every approval.
4. **No hallucinations.** Prefer `unknown`, ask, or verify
   ([ANTI-HALLUCINATION.md](ANTI-HALLUCINATION.md)).
5. **Discovery is mandatory.** Grill until complete — including team/multi-agent
   and deploy target/method.
6. **Research before implementation / design.** Options + Known/Assumed/Unverified.
   UI also requires a Design Research Packet ([DESIGN-GATE.md](DESIGN-GATE.md)).
7. **Role matrix.** Declare and play all needed roles per chunk
   ([ROLE-MATRIX.md](ROLE-MATRIX.md)).
8. **CMS-coupled section delivery.** If CMS is enabled, storefront + CMS for the
   same section ship together. Storefront-only done is forbidden
   ([CMS-COUPLING.md](CMS-COUPLING.md)).
9. **Foundation before first section.** Thin CMS Foundation once, then section loop.
10. **Section-by-section + todos.** Tiny tasks with plan/how/evidence
    ([TODO-FORMAT.md](TODO-FORMAT.md)); stop for approval after DoD
    ([SECTION-DOD.md](SECTION-DOD.md)).
11. **Design gate.** No eyebrows; seamless minimal gaps; no thin separators;
    palette discipline; research-before-design ([DESIGN-GATE.md](DESIGN-GATE.md)).
12. **Workspace hygiene.** Organize drops; no duplicate asset copies
    ([WORKSPACE-HYGIENE.md](WORKSPACE-HYGIENE.md)).
13. **Skill router.** Best primary skill per domain; try install if missing;
    else instruct user ([SKILL-ROUTER.md](SKILL-ROUTER.md)). `/sps` is the only
    orchestrator (no Superpowers-as-boss by default).
14. **Context efficiency.** Surgical edits; grep/offset reads; no whole-file
    default. Prefer installed `karpathy-guidelines` + [CONTEXT-EFFICIENCY.md](CONTEXT-EFFICIENCY.md).
15. **Low-end mobile hard gate.** ([MOBILE-LOW-END.md](MOBILE-LOW-END.md),
    [ASSET-BUDGET.md](ASSET-BUDGET.md)).
16. **Cleanup before submit.** Quality, flow, dead code, consistency — then ask
    for approval.
17. **Capability-aware execution.** Never invent host features.
18. **Legacy first contact.** Bootstrap + scored audit before feature work.
19. **Deployable handoff.** Verify with the strongest honest recipe available.
20. **Mistake promotion.** After repeated similar mistakes, promote rules via [MISTAKE-PROMOTION.md](MISTAKE-PROMOTION.md).

## Modes

### Build (default)
Steps 0–9 below after legacy onboarding when required.

### Audit
`/sps audit` → [AUDIT.md](AUDIT.md). Read-only unless asked to fix.

### Sync
`/sps sync` → [SYNC.md](SYNC.md). Pay CMS/storefront debt on existing projects.

### Doctor
`/sps doctor` → run `scripts/sps-doctor.sh` when available; also perform
in-session checks: host, VERSION, mirrors, required skills from router, CMS debt
pointers.

### Read-Only Q&A Carve-Out (Context-Efficiency)
If the user's request is purely investigatory or asking a simple code question ("explain this function", "what does X do?", "where is Y defined?"), SKIP full session boot / heavy memory load and answer directly. Only activate full memory, audit, or discovery for actual build, refactor, audit, or code-modifying tasks.

### Legacy / first-contact (mandatory)
If no usable `./.sps/` memory on an existing codebase: bootstrap → scored audit →
write `audit-report.md` → stop for user choice → then remediate / discover / build.

## Session boot checklist

1. Read METHOD-CARD.
2. Detect host; refresh `./.sps/agent.md` + VERSION stamp.
3. Bootstrap `./.sps/` if missing; ensure enhanced docs pack templates exist.
4. Read profile, handoff, mistakes, agent; create root mirrors if needed.
5. Legacy? → audit first.
6. Read host adapter (`hosts/*`).
7. Reaffirm `/sps` lock in memory + root mirrors.
   On Antigravity/Gemini: enforce boot refusal if mirrors missing
   ([hosts/antigravity.md](hosts/antigravity.md)).
8. Continue from handoff, discovery, sync, doctor, or audit.

## Step 0: Load scoped memory

Initialize or refresh:

- `profile.md`, `handoff.md`, `mistakes.md`, `agent.md`, `audit-report.md`
- `architecture.md`, `content-model.md`, `design-system.md`, `cms-foundation.md`
- `cms-debt.md`, `section-registry.md`, `changelog-sps.md`
- `section-todos/` as needed

Personal defaults (`~/.sps/personal-defaults.md`) are lower priority than project
rules. Promote global design/hygiene rules only with explicit user approval.

## Step 1: Discovery grill (mandatory)

Keep asking until complete. Cover at least:

- business goal, project type, pages/sections
- users, devices, mobile-first vs desktop-first, low-end policy
- brand, typography, palette, motion, references
- CMS / CRM / ERP / admin needs
- auth/roles, integrations, SEO/analytics
- **team / multi-agent / who approves what**
- **deploy target, deploy method, domains, secrets ownership, staging/prod**
- approval style

Write durable answers into `./.sps/`. Classify project-only vs personal-default
vs session-only.

## Step 2: Docs pack + pre-build confirm

After discovery, finish the `.sps` docs pack, then ask:

> Any missing information before building?

Do not start foundation/sections until the user confirms or answers gaps.

## Step 3: Research + options

Present 2–3 options when trade-offs exist; recommend one; label evidence; get
approval; update handoff.

## Step 4: Host capabilities + skill ensure

Detect capabilities into `agent.md`. For the upcoming phase, run Skill Router
ensure/install protocol. Missing critical skills → try install → else stop with
manual instructions.

## Step 5: Roles + specialist stack

Pick one primary engineering/design role for the phase, plus ROLE-MATRIX roles
for the chunk. `/sps` orchestrates; max 1–2 supporting specialist skills per
domain; respect conflict ban.

## Step 6: Foundation (CMS projects)

Build CMS Foundation once ([CMS-COUPLING.md](CMS-COUPLING.md)). Non-CMS projects
skip with an explicit note in profile/handoff.

## Step 7: Section loop

Never build the whole site in one pass. For each section (Navbar → … → Footer):

1. Content inventory
2. Todo list (tiny tasks)
3. Approval packet (CMS evidence plan when CMS on)
4. Design Research Packet for UI/redesign
5. Storefront UI
6. CMS schema + admin UI (if CMS)
7. Wire storefront ← CMS
8. Mobile / a11y / security basics / polish
9. Cleanup gate
10. Round-trip proof + Section DoD
11. Memory update + markers
12. STOP for user approval → next section

Abort conditions: [APPROVAL-PACKETS.md](APPROVAL-PACKETS.md).

## Step 8: Brand / logos

Follow [LOGO-SOURCES.md](LOGO-SOURCES.md) (`theSVG` default).

## Step 9: Verify + handoff

Use [VERIFICATION-RECIPES.md](VERIFICATION-RECIPES.md) including CMS round-trip.
State Known / Assumed / Unverified. Update handoff.

## Preferred workflow summary

1. Boot + METHOD-CARD + mirrors + lock
2. Discovery grill (incl. team + deploy)
3. Docs pack + pre-build confirm
4. Research / options
5. Foundation (if CMS)
6. Section loop with roles, todos, skill router, DoD
7. `/sps sync` when legacy CMS debt exists
8. Verify + handoff

## Maintainer checks

```bash
bash scripts/lint-sps.sh
bash scripts/smoke-sps.sh
bash scripts/sps-doctor.sh
bash scripts/bootstrap-sps.sh /path/to/project
```

## Additional resources

- [METHOD-CARD.md](METHOD-CARD.md)
- [CMS-COUPLING.md](CMS-COUPLING.md)
- [DESIGN-GATE.md](DESIGN-GATE.md)
- [SECTION-DOD.md](SECTION-DOD.md)
- [SYNC.md](SYNC.md)
- [SKILL-ROUTER.md](SKILL-ROUTER.md)
- [CONTEXT-EFFICIENCY.md](CONTEXT-EFFICIENCY.md)
- [WORKSPACE-HYGIENE.md](WORKSPACE-HYGIENE.md)
- [ROLE-MATRIX.md](ROLE-MATRIX.md)
- [TODO-FORMAT.md](TODO-FORMAT.md)
- [PROJECT-ROOT-MIRRORS.md](PROJECT-ROOT-MIRRORS.md)
- [ANTI-HALLUCINATION.md](ANTI-HALLUCINATION.md)
- [MOBILE-LOW-END.md](MOBILE-LOW-END.md)
- [ASSET-BUDGET.md](ASSET-BUDGET.md)
- [AUDIT.md](AUDIT.md)
- [APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)
- [VERIFICATION-RECIPES.md](VERIFICATION-RECIPES.md)
- [CAPABILITY-MATRIX.md](CAPABILITY-MATRIX.md)
- [INSTALL-PROFILES.md](INSTALL-PROFILES.md)
- [SKILL-GOVERNANCE.md](SKILL-GOVERNANCE.md)
- [MISTAKE-PROMOTION.md](MISTAKE-PROMOTION.md)
- [EXAMPLES.md](EXAMPLES.md)
- [hosts/](hosts/)
