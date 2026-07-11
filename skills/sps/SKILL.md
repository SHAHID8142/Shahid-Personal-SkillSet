---
name: sps
description: >
  Project-scoped master build orchestrator for AI coding agents. Use when the
  user asks to build, design, implement, fix, refactor, test, deploy, audit, or
  improve software and wants a strict workflow: mandatory discovery, research
  with options, role-based specialist routing, section-by-section approvals,
  anti-hallucination checks, always-written project memory, low-end mobile
  gates, asset budgets, legacy-project alignment audits, project-only rules,
  and deployable handoff across Claude, Cursor, Codex, Antigravity, and other
  skills-compatible agents.
---

# /sps

`/sps` is a capability-aware master workflow. It is portable across mainstream
agent runtimes only when it stays honest about what the host can and cannot do.

Do not claim "identical behavior everywhere". Detect the host, use the best
available capability, and fall back cleanly when a feature is missing.

Current skill version: read `VERSION` and stamp it into `./.sps/agent.md`.

## Core rules

1. **`/sps` lock.** Once a project has `./.sps/`, all build, design, implement,
   fix, refactor, test, deploy, and audit work in that project must use `/sps`
   as the orchestrator. Write that lock into project memory and keep it active.
2. **Project scope first.** Project-specific fonts, sizes, design rules, stack
   choices, CMS choices, ERP choices, and workflow rules belong to the current
   project only unless the user explicitly promotes them to a personal default.
3. **Always write memory.** Create or update `./.sps/` memory files every run
   and after every approved section. Prefer `scripts/bootstrap-sps.sh` or the
   `templates/` copies when initializing. Never rely on chat history alone.
4. **No hallucinations.** Never invent files, APIs, packages, test results, or
   host capabilities. Prefer `unknown`, ask, or verify. See
   [ANTI-HALLUCINATION.md](ANTI-HALLUCINATION.md).
5. **Discovery is mandatory.** Do not jump straight into building, even for
   design work.
6. **Research before implementation.** Present options, explain trade-offs, and
   recommend one path before coding. Mark Known / Assumed / Unverified.
7. **One primary role per phase.** Pick the best role for the current phase,
   then add only the minimum secondary roles needed.
8. **Section-by-section delivery.** Build in chunks with approvals between
   sections or subsection slices.
9. **Low-end mobile is a hard gate.** Any UI creation must check responsiveness
   and low-end mobile support. Default to minimal mobile with no fancy, buggy,
   or laggy effects unless the user explicitly approves richer mobile behavior.
   Enforce [MOBILE-LOW-END.md](MOBILE-LOW-END.md) and
   [ASSET-BUDGET.md](ASSET-BUDGET.md).
10. **Capability-aware execution.** Never assume plugins, MCP, subagents,
    browser tools, or a specific package manager exist.
11. **Deployable handoff.** Verify the work using the strongest recipe available
    on the current host before calling it done.
13. **Legacy first contact.** On any old project that has never used `/sps`,
    bootstrap memory, run a scored SPS alignment audit (`/100`), write
    `./.sps/audit-report.md`, and show the report before building or large
    refactors.

## Modes

### Build mode (default)

Follow Steps 0-8 below **only after** legacy onboarding is complete when
required.

### Audit mode

When the user asks `/sps audit`, or when this is a legacy/first-contact
project, follow [AUDIT.md](AUDIT.md). Do not implement fixes unless asked after
the report.

### Legacy / first-contact mode (mandatory)

If the project has never used `/sps` (no usable `./.sps/` memory), do this
before discovery-heavy building or feature work:

1. Bootstrap `./.sps/` from `templates/` or `scripts/bootstrap-sps.sh`
2. Write host + version + `/sps` lock into memory
3. Run a full scored SPS alignment audit of the existing codebase
4. Write the full report to `./.sps/audit-report.md`
5. Save score + summary into `./.sps/handoff.md`
6. Stop and show the report before building anything
7. Only then continue with remediation, discovery, or the original request

This applies even if the user said “build X” or “fix Y”. On an old unused
project, the first deliverable is the audit report.

## Session boot checklist

Run this at the start of every `/sps` session:

1. Detect the active host and write or refresh `./.sps/agent.md`.
2. Stamp the SPS version from `VERSION` into `./.sps/agent.md` (and profile /
   handoff version fields when present).
3. If `./.sps/` is missing, bootstrap it from `templates/` (or run
   `scripts/bootstrap-sps.sh`).
4. Initialize or read `./.sps/profile.md`, `./.sps/handoff.md`,
   `./.sps/mistakes.md`, and `./.sps/agent.md`.
5. Detect legacy/first-contact status. If legacy, enter mandatory audit mode
   from [AUDIT.md](AUDIT.md) before building.
6. Read the matching host adapter under `hosts/` when present
   (`hosts/cursor.md`, `hosts/codex.md`, `hosts/antigravity.md`,
   `hosts/claude.md`).
7. Reaffirm in memory: **this project must use `/sps`**.
8. Read personal defaults only as lower-priority guidance.
9. Continue from handoff state, finish the audit report, start discovery, or
   enter explicit audit mode.

## Step 0: Load scoped memory

On the first run in a target project:

1. Initialize `./.sps/` from `templates/` if it does not exist.
2. Create `./.sps/profile.md`, `./.sps/mistakes.md`, `./.sps/handoff.md`, and
   `./.sps/agent.md`.
3. Record the active agent host and SPS version in `./.sps/agent.md`.
4. Write the `/sps` required lock into `./.sps/profile.md` and
   `./.sps/agent.md`.
5. If this project already has code but no prior SPS usage, run the mandatory
   legacy alignment audit from [AUDIT.md](AUDIT.md) and stop for the user's
   next-step choice before feature work.
6. If personal defaults do not exist yet, create `~/.sps/personal-defaults.md`
   and `~/.sps/global-mistakes.md`.
7. Ask the user which new rules are:
   - project-only
   - personal defaults
   - session-only
8. Do not write anything into `~/.sps/personal-defaults.md` unless the user
   explicitly says the rule should apply across future projects.

On later runs:

1. Read `./.sps/agent.md`, refresh the active host, and update the version stamp.
2. Read `./.sps/profile.md` first.
3. Read `./.sps/handoff.md`.
4. Read `~/.sps/personal-defaults.md` only as lower-priority guidance.
5. If project rules conflict with personal defaults, the project rules win.
6. Update memory after every approved section, not only at start or end.

For the detailed model, see:
- [PROFILE-SCOPING.md](PROFILE-SCOPING.md)

## Step 1: Discovery is mandatory

Before planning or building, ask enough questions to understand the project.
Discovery must cover all relevant areas:

- business goal and project type
- users, devices, and low-end mobile constraints
- brand, typography, color, and motion preferences
- pages, sections, and content ownership
- CMS needs
- storefront / commerce needs
- ERP / inventory / order / operations needs
- admin / dashboard / management needs
- auth / roles / permissions
- integrations
- SEO / analytics / marketing
- performance priorities
- deployment / hosting
- approval and review style

Default mobile policy unless the user overrides it:

- minimal mobile
- no fancy / laggy motion on phones
- dual path allowed only when desktop needs richer treatment
- respect default asset budgets

For each answer, classify whether it is project-only, personal-default, or
session-only. Write durable answers into `./.sps/profile.md`.

If the request is tiny and obvious, discovery can be brief, but it still
happens.

For project-type-specific prompts, see:
- [PROJECT-TEMPLATES.md](PROJECT-TEMPLATES.md)
- [EXAMPLES.md](EXAMPLES.md)

## Step 2: Research and options

After discovery:

1. Research the relevant stack, patterns, or tools.
2. Present 2-3 viable options when there are meaningful trade-offs.
3. Recommend one option and explain why it is better for this project.
4. Label Known / Assumed / Unverified.
5. Get approval before implementation.
6. Update `./.sps/handoff.md` with the chosen path.

If the host supports docs tools, web search, or MCP, use them. If not, fall
back to the best local reasoning available and say so.

## Step 3: Detect host capabilities

Before invoking extra tooling, determine what the current host supports:

- explicit skill invocation
- ambient skill loading
- shell/package installation
- MCP access
- subagents
- structured question UI
- browser/runtime verification
- project-local memory

Write the result into `./.sps/agent.md`. Read the host adapter file for that
runtime. Use the best available path, but do not block if a capability is
missing. Never invent a capability.

See:
- [CAPABILITY-MATRIX.md](CAPABILITY-MATRIX.md)
- [INSTALL-PROFILES.md](INSTALL-PROFILES.md)
- [hosts/cursor.md](hosts/cursor.md)
- [hosts/codex.md](hosts/codex.md)
- [hosts/antigravity.md](hosts/antigravity.md)
- [hosts/claude.md](hosts/claude.md)

## Step 4: Choose the role and specialist stack

Pick one primary role for the current phase:

- design -> award-level design director
- architecture -> principal architect
- frontend -> senior frontend engineer
- backend -> senior backend engineer
- full-stack -> product builder / systems integrator
- debugging -> root-cause debugger
- testing -> verification engineer
- deploy -> DevOps / release engineer
- audit -> compliance / quality auditor

Then:

1. Keep `/sps` as the orchestrator.
2. Check whether a preferred specialist skill is available on this host.
3. Use at most 2 supporting skills when they genuinely add value.
4. Avoid conflicting skills that solve the same job in incompatible ways.
5. If the skill is unavailable, act as the fallback expert persona and say so.

Do not blindly invoke every matching skill.

See:
- [SKILL-GOVERNANCE.md](SKILL-GOVERNANCE.md)

## Step 5: Build section by section

Never build an entire app or page in one pass.

For each major section:

1. Break it into subsections.
2. Map the subsection across the relevant dimensions:
   - frontend / UI
   - backend / data
   - CMS / content
   - storefront / payments
   - ERP / operations
   - admin / management
   - SEO / analytics
   - accessibility
   - performance
   - low-end mobile behavior
   - motion / animation
   - asset budget
3. Decide what is not applicable and explicitly skip it.
4. Work on one approved chunk at a time.
5. Stop for review after each chunk or section.
6. Update `./.sps/handoff.md` and relevant profile fields after approval.
7. If abort conditions in the approval packet are true, stop and resolve them
   before coding.

Mobile defaults for every UI chunk:

- check responsiveness
- prefer minimal mobile
- no hover-only critical actions
- no fancy / laggy mobile motion unless explicitly approved
- stay inside asset budgets unless the user approves more
- use a simpler mobile path when desktop is richer

Before each chunk, use the standard checkpoint format in:
- [APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)
- [MOBILE-LOW-END.md](MOBILE-LOW-END.md)
- [ASSET-BUDGET.md](ASSET-BUDGET.md)
- [ANTI-HALLUCINATION.md](ANTI-HALLUCINATION.md)

## Step 6: Use project-appropriate defaults

`/sps` should prefer good defaults, not rigid absolutes.

Use these rule buckets:

- **Required always:** `/sps` lock, memory writes, version stamp,
  anti-hallucination, secrets safety, safe edits, approval gates, honest
  capability handling, accessibility review, responsive + low-end mobile review,
  asset budget review, verification before handoff
- **Conditional if applicable:** CMS, ERP, storefront, dark mode, i18n,
  analytics, CI, pre-commit hooks, detailed docs, animation stacks
- **Preferred defaults:** stack choices, style systems, testing tools, quality
  tools, deployment targets when the user has no preference

Also apply an anti-bloat check:

- do not introduce CMS/admin/ERP unless needed
- do not introduce heavy animation on speed-first or mobile-default projects
- do not perform large refactors for tiny tasks
- do not apply one project's design rules to another project

## Step 7: Brand and logo sourcing

When the project needs brand, framework, or cloud-service logos:

1. Use `theSVG` as the default source.
2. Resolve the slug from the registry instead of guessing paths.
3. Choose the right delivery format:
   - CDN URL
   - local downloaded SVG
   - package/component usage
   - raw SVG markup
4. If `theSVG` does not cover it, fall back to the official brand source before
   using anything weaker.
5. Warn about trademark-sensitive use when relevant.

See:
- [LOGO-SOURCES.md](LOGO-SOURCES.md)

## Step 8: Verify before handoff

Before handoff, run the strongest realistic verification available on the host.
The exact recipe depends on the kind of change.

Possible checks include:

- lint / type checks
- focused tests
- build or deployability checks
- mobile and responsiveness checks
- low-end performance checks
- asset budget checks
- accessibility checks
- runtime / browser checks
- dependency or security checks where relevant
- anti-hallucination evidence review

Use the appropriate recipe from:
- [VERIFICATION-RECIPES.md](VERIFICATION-RECIPES.md)
- [MOBILE-LOW-END.md](MOBILE-LOW-END.md)
- [ASSET-BUDGET.md](ASSET-BUDGET.md)
- [ANTI-HALLUCINATION.md](ANTI-HALLUCINATION.md)

If a host lacks automated verification features, say what you were able to
verify and what remains manual. Update `./.sps/handoff.md` with the evidence.

After repeated similar mistakes, run the promotion flow in
[MISTAKE-PROMOTION.md](MISTAKE-PROMOTION.md).

## Preferred workflow summary

Use this order:

1. Boot memory + bootstrap if needed + write active agent + version stamp +
   reaffirm `/sps` lock
2. Run discovery, or enter audit mode when requested
3. Research and recommend options with evidence labels
4. Detect host capabilities into `./.sps/agent.md` and read host adapter
5. Choose role and skills under `/sps` orchestration
6. Build section by section with mobile, asset-budget, and anti-hallucination
   gates
7. Update memory after every approved section
8. Verify with the right recipe
9. Handoff with Known / Assumed / Unverified clearly stated

## Maintainer checks

From the skillset repo:

```bash
bash scripts/lint-sps.sh
bash scripts/smoke-sps.sh
bash scripts/bootstrap-sps.sh /path/to/project
pwsh -NoProfile -File scripts/check-powershell.ps1   # when pwsh is available
```

## Additional resources

- [ANTI-HALLUCINATION.md](ANTI-HALLUCINATION.md)
- [MOBILE-LOW-END.md](MOBILE-LOW-END.md)
- [ASSET-BUDGET.md](ASSET-BUDGET.md)
- [AUDIT.md](AUDIT.md)
- [MISTAKE-PROMOTION.md](MISTAKE-PROMOTION.md)
- [EXAMPLES.md](EXAMPLES.md)
- [CAPABILITY-MATRIX.md](CAPABILITY-MATRIX.md)
- [INSTALL-PROFILES.md](INSTALL-PROFILES.md)
- [PROFILE-SCOPING.md](PROFILE-SCOPING.md)
- [SKILL-GOVERNANCE.md](SKILL-GOVERNANCE.md)
- [PROJECT-TEMPLATES.md](PROJECT-TEMPLATES.md)
- [APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)
- [VERIFICATION-RECIPES.md](VERIFICATION-RECIPES.md)
- [LOGO-SOURCES.md](LOGO-SOURCES.md)
- [hosts/cursor.md](hosts/cursor.md)
- [hosts/codex.md](hosts/codex.md)
- [hosts/antigravity.md](hosts/antigravity.md)
- [hosts/claude.md](hosts/claude.md)
