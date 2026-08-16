---
name: sps
description: >
  Project-scoped master build orchestrator for skills-compatible coding agents.
  Triggered when the user invokes /sps, /sps sync, /sps cms-sync, /sps audit,
  /sps doctor, /sps couple, /sps release-lock, or asks to build, design, implement,
  fix, refactor, test, deploy, audit, sync CMS with storefront, or improve any codebase.
  Enforces mandatory discovery, CMS-coupled section delivery, design gates, skill
  routing, workspace hygiene, 2-tier approval packets, anti-hallucination, always-written
  .sps memory, low-end mobile gates, and deployable handoffs across Claude, Cursor,
  Codex, Antigravity, OpenCode, Windsurf, and other agents.
---

# /sps (v3.0.2 Master Orchestrator)

`/sps` is a capability-aware master workflow for **skills-compatible coding agents** (Claude, Cursor, Codex, Antigravity/Gemini, Windsurf, OpenCode).

Read [METHOD-CARD.md](METHOD-CARD.md) first every session.

Current skill version: read `VERSION` and stamp it into `./.sps/agent.md`.

---

## ⚡ Inlined Hard-Law Core (Mandatory on ALL Hosts)

1. **`/sps` lock & Root Mirrors.** Once `./.sps/` exists, all build/fix/refactor/audit work MUST use `/sps`. Mirror the lock into `AGENTS.md` / `GEMINI.md` / `CLAUDE.md`. (Release with `/sps release-lock`).
2. **Always Write Memory.** Update `./.sps/` (`handoff.md`, `agent.md`, `content-model.md`) every run and after every approved chunk.
3. **No Hallucinations & Evidence Labels.** Never invent facts; mark risky claims as `Known`, `Assumed`, or `Unverified`.
4. **Mandatory Discovery.** Grill until complete on goals, stack, CMS, auth, mobile policies, multi-agent roles, and deploy targets.
5. **CMS-Coupled Section Delivery.** If CMS is enabled, storefront + CMS for the same section ship together. Storefront-only done is strictly forbidden ([CMS-COUPLING.md](CMS-COUPLING.md)).
6. **Design Gate & Zero Clichés.** No fake dummy buttons, no purple-on-dark clichés, no uncurated stock slop. Research before design.
7. **Two-Tier Approval Packets ([APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)):**
   - *Tier 1 (Compact Quick-Fix):* 5-6 lines for bug fixes, CSS tweaks, and text updates.
   - *Tier 2 (Full Architecture):* Comprehensive packet for major sections, new pages, and database schemas.
   - *Batch Mode:* User can specify `batch approve` to run consecutive low-risk sections.
8. **Low-End Mobile Gate & Asset Budgets.** Max 1.5MB initial payload, dual-path motion, zero mobile jank ([MOBILE-LOW-END.md](MOBILE-LOW-END.md), [ASSET-BUDGET.md](ASSET-BUDGET.md)).
9. **Context Efficiency & Surgical Edits.** Use targeted line-range edits and grep searches. Never dump whole files by default.
10. **Cleanup & Verification DoD.** Run tests, typecheck, lint, and verify live round-trips before submitting for approval.

---

## Modes

### Build (default)
Standard section-by-section construction following the inlined hard-law core.

### Audit
`/sps audit` → [AUDIT.md](AUDIT.md). Read-only 100-point scored evaluation.

### Sync & CMS-Sync
`/sps sync` / `/sps cms-sync` / `/sps couple` → [SYNC.md](SYNC.md) & [CMS-COUPLING.md](CMS-COUPLING.md). Pay CMS and storefront debt on existing or pending codebases.

### Doctor
`/sps doctor` → run `scripts/sps-doctor.sh` or in-session host and mirror validation.

### Read-Only Q&A Carve-Out (Context-Efficiency)
If the user's request is purely investigatory or asking a simple code question ("explain this function", "what does X do?", "where is Y defined?"), SKIP full session boot / heavy memory load and answer directly. Only activate full memory, audit, or discovery for actual build, refactor, audit, or code-modifying tasks.

### Release Lock
`/sps release-lock` or `/sps unlock` → Cleanly wipe `./.sps/lock.json`, comment out root mirrors, and write final handoff.

### Legacy / first-contact (mandatory)
If no usable `./.sps/` memory on an existing codebase: bootstrap → scored audit → write `audit-report.md` → stop for user choice → then remediate / discover / build.

---

## Session Boot Checklist

1. Read METHOD-CARD.
2. Detect host; refresh `./.sps/agent.md` + VERSION stamp.
3. Bootstrap `./.sps/` if missing; ensure enhanced docs pack templates exist.
4. Read profile, handoff, mistakes, agent; create root mirrors if needed.
5. Legacy? → audit first.
6. Read host adapter (`hosts/*`).
7. Reaffirm `/sps` lock in memory + root mirrors.
8. Continue from handoff, discovery, sync, doctor, or audit.
