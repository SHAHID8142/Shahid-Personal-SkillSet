# Shahid Personal SkillSet (`/sps`)

**Version:** 3.0.1

`/sps` tells your coding agent **how to build a project step by step** — with
memory, approvals, and (when you use a CMS) **storefront + admin controls
together**.

It works on **skills-compatible coding agents** (Claude Code, Cursor, Codex,
Antigravity, Windsurf, Copilot, OpenCode, and similar).  
It does **not** work the same on every tool, and it is **not** for ChatGPT-style
chatbots.

---

## Quick start (install)

### Mac / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --profile core --yes
```

### Windows (PowerShell)

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.ps1))) -Profile core -Yes
```

### Check install

```bash
bash ~/.sps/src/Shahid-Personal-SkillSet/scripts/sps-doctor.sh
```

### Update later

```bash
curl -fsSL https://raw.githubusercontent.com/SHAHID8142/Shahid-Personal-SkillSet/main/get-sps.sh | bash -s -- --yes
```

---

## Which profile should I use?

| Profile | Use when | Includes |
|---|---|---|
| **`core`** (recommended) | Everyday work | `/sps` + design/React/testing skills + **Karpathy guidelines** |
| **`full`** | Claude-heavy / security extras | Everything in core + Claude plugins + **Trail of Bits** security + MCP extras |
| **`minimal`** | Only the orchestrator | `/sps` only |

```bash
# full (Claude + Trail of Bits security plugins)
bash ~/.sps/src/Shahid-Personal-SkillSet/install.sh --profile full --yes
```

---

## How to use (in any project)

Open the project in your agent, then type:

| Command | Meaning |
|---|---|
| `/sps` | Start / continue the normal build workflow |
| `/sps audit` | Score the project against SPS rules (old projects start here) |
| `/sps sync` | Fix **CMS debt** (site built first, admin controls missing) |
| `/sps doctor` | Check install / host / skill health |

### Examples

```text
/sps build a marketing site. CMS for every section. Mobile-first.
/sps audit
/sps sync
/sps fix the navbar and keep CMS control working
```

---

## What happens when you run `/sps`

Simple flow:

1. **Ask questions** until the plan is clear (including team + deploy)
2. **Write project memory** into `./.sps/` (and short locks in `AGENTS.md` / `GEMINI.md` / `CLAUDE.md`)
3. Confirm: “anything missing?”
4. If CMS: build a small **CMS foundation** once
5. Build **one section at a time**
6. For each section (when CMS is on): **UI + CMS + proof they connect**
7. Stop for **your approval** → next section
8. Verify honestly before calling it done

### The CMS rule (important)

If the project has a CMS:

- every content piece (text, image, video, menu, demo data) should be editable in admin
- a section is **not done** with storefront UI alone
- pending projects that already have UI: use **`/sps sync`**

---

## What the agent must follow

- **Memory:** write `./.sps/` every session (not chat-only)
- **Sections:** small todos → approval → next section
- **Design gate:** no eyebrows, seamless section flow, planned palette, research before design
- **Cleanup:** quality check before submit
- **Hygiene:** organize dropped files; no duplicate assets
- **Skills:** pick the best skill per job; if missing, try install or give you install steps
- **Tokens:** surgical edits; don’t read whole repos by default (Karpathy + context rules)
- **Antigravity:** must respect `/sps` locks in `GEMINI.md` / `AGENTS.md` (boot refusal if missing)

---

## Compatibility (honest)

| Host | Level | Notes |
|---|---|---|
| Claude Code | Best | Full profile enhancers work here |
| Cursor | High | Strong core workflow |
| Codex | High | Portable core |
| Antigravity / Gemini | Medium | Needs root mirrors + `/sps` |
| Windsurf / Copilot / OpenCode family | Medium | Portable laws; extras vary |
| Other skills-compatible agents | Varies | Falls back cleanly |
| Generic chatbots | No | Out of scope |

Details: [`skills/sps/CAPABILITY-MATRIX.md`](skills/sps/CAPABILITY-MATRIX.md)

---

## Core skills included

**Always with `core`:**
- `/sps` (orchestrator)
- `hallmark`, `impeccable`, `taste-skill` (design taste — don’t stack all at once)
- `web-design-guidelines`, `vercel-react-best-practices`, `vercel-composition-patterns`
- `webapp-testing`
- **`karpathy-guidelines`** (surgical, simple changes)

**Extra with `full` (mainly Claude):**
- UI/engineering/marketing/a11y plugins
- **Trail of Bits** security plugins (`differential-review`, `static-analysis`, and related)
- optional MCP helpers

Skill picking rules: [`skills/sps/SKILL-ROUTER.md`](skills/sps/SKILL-ROUTER.md)

---

## Project memory (`./.sps/`)

When `/sps` bootstraps a project, it creates files like:

| File | Purpose |
|---|---|
| `profile.md` | Project rules, CMS/CRM flags, deploy notes |
| `handoff.md` | Current status + next chunk |
| `content-model.md` | What each section can edit in CMS |
| `cms-debt.md` | Missing CMS controls (for `/sps sync`) |
| `design-system.md` | Palette, type, motion, refs |
| `section-registry.md` | Section list + status |
| `section-todos/` | Tiny task lists per section |

Also short locks in project root: `AGENTS.md`, `GEMINI.md`, `CLAUDE.md`.

---

## Uninstall

```bash
bash ~/.sps/src/Shahid-Personal-SkillSet/uninstall.sh --yes
# keep personal memory:
bash ~/.sps/src/Shahid-Personal-SkillSet/uninstall.sh --keep-personal --yes
```

Windows: `uninstall.ps1` / `uninstall.ps1 -KeepPersonal -Yes`

---

## Maintainer checks

```bash
bash scripts/lint-sps.sh
bash scripts/smoke-sps.sh
bash scripts/bootstrap-sps.sh /path/to/project
```

CI runs lint + smoke on push/PR.

---

## Learn more

| Doc | Topic |
|---|---|
| [`skills/sps/METHOD-CARD.md`](skills/sps/METHOD-CARD.md) | 1-page laws |
| [`skills/sps/CMS-COUPLING.md`](skills/sps/CMS-COUPLING.md) | CMS + UI together |
| [`skills/sps/SYNC.md`](skills/sps/SYNC.md) | `/sps sync` for pending projects |
| [`skills/sps/DESIGN-GATE.md`](skills/sps/DESIGN-GATE.md) | Design rules |
| [`skills/sps/SECTION-DOD.md`](skills/sps/SECTION-DOD.md) | When a section is “done” |
| [`CATALOG.md`](CATALOG.md) | Skill catalog |
| [`CHANGELOG.md`](CHANGELOG.md) | Version history |

---

## Safety

- Prefer **`core`** unless you need Claude/security extras
- Review third-party skills before trusting them
- Never claim “works identically on every agent on the internet”
