---
name: sps
description: >
  Project-scoped master build orchestrator for AI coding agents. Use when the
  user asks to build, design, implement, fix, refactor, test, deploy, or
  improve software and wants a strict workflow: mandatory discovery, research
  with options, role-based specialist routing, section-by-section approvals,
  project-only rules, and deployable handoff across Claude, Cursor, Codex,
  Antigravity, and other skills-compatible agents.
---

# /sps

`/sps` is a capability-aware master workflow. It is portable across mainstream
agent runtimes only when it stays honest about what the host can and cannot do.

Do not claim "identical behavior everywhere". Detect the host, use the best
available capability, and fall back cleanly when a feature is missing.

## Core rules

1. **Project scope first.** Project-specific fonts, sizes, design rules, stack
   choices, CMS choices, ERP choices, and workflow rules belong to the current
   project only unless the user explicitly promotes them to a personal default.
2. **Discovery is mandatory.** Do not jump straight into building, even for
   design work.
3. **Research before implementation.** Present options, explain trade-offs, and
   recommend one path before coding.
4. **One primary role per phase.** Pick the best role for the current phase,
   then add only the minimum secondary roles needed.
5. **Section-by-section delivery.** Build in chunks with approvals between
   sections or subsection slices.
6. **Capability-aware execution.** Never assume plugins, MCP, subagents,
   browser tools, or a specific package manager exist.
7. **Deployable handoff.** Verify the work using the strongest recipe available
   on the current host before calling it done.

## Step 0: Load scoped memory

On the first run in a target project:

1. Initialize `./.sps/` in the project root if it does not exist.
2. Create `./.sps/profile.md`, `./.sps/mistakes.md`, and `./.sps/handoff.md`.
3. If personal defaults do not exist yet, create `~/.sps/personal-defaults.md`
   and `~/.sps/global-mistakes.md`.
4. Ask the user which new rules are:
   - project-only
   - personal defaults
   - session-only
5. Do not write anything into `~/.sps/personal-defaults.md` unless the user
   explicitly says the rule should apply across future projects.

On later runs:

1. Read `./.sps/profile.md` first.
2. Read `./.sps/handoff.md`.
3. Read `~/.sps/personal-defaults.md` only as lower-priority guidance.
4. If project rules conflict with personal defaults, the project rules win.

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

For each answer, classify whether it is project-only, personal-default, or
session-only.

If the request is tiny and obvious, discovery can be brief, but it still
happens.

For project-type-specific prompts, see:
- [PROJECT-TEMPLATES.md](PROJECT-TEMPLATES.md)

## Step 2: Research and options

After discovery:

1. Research the relevant stack, patterns, or tools.
2. Present 2-3 viable options when there are meaningful trade-offs.
3. Recommend one option and explain why it is better for this project.
4. Get approval before implementation.

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

Use the best available path, but do not block if a capability is missing.

See:
- [CAPABILITY-MATRIX.md](CAPABILITY-MATRIX.md)
- [INSTALL-PROFILES.md](INSTALL-PROFILES.md)

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

Then:

1. Check whether a preferred specialist skill is available on this host.
2. Use at most 2 supporting skills when they genuinely add value.
3. Avoid conflicting skills that solve the same job in incompatible ways.
4. If the skill is unavailable, act as the fallback expert persona and say so.

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
3. Decide what is not applicable and explicitly skip it.
4. Work on one approved chunk at a time.
5. Stop for review after each chunk or section.

If mobile should be simpler than desktop, do it. If hover-only animation is not
useful on touch devices, do not force it. If a speed-first site does not need
heavy motion, skip it.

Before each chunk, use the standard checkpoint format in:
- [APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)

## Step 6: Use project-appropriate defaults

`/sps` should prefer good defaults, not rigid absolutes.

Use these rule buckets:

- **Required always:** secrets safety, safe edits, approval gates, honest
  capability handling, accessibility review, responsive review, verification
  before handoff
- **Conditional if applicable:** CMS, ERP, storefront, dark mode, i18n,
  analytics, CI, pre-commit hooks, detailed docs, animation stacks
- **Preferred defaults:** stack choices, style systems, testing tools, quality
  tools, deployment targets when the user has no preference

Also apply an anti-bloat check:

- do not introduce CMS/admin/ERP unless needed
- do not introduce heavy animation on speed-first projects
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
- accessibility checks
- runtime / browser checks
- dependency or security checks where relevant

Use the appropriate recipe from:
- [VERIFICATION-RECIPES.md](VERIFICATION-RECIPES.md)

If a host lacks automated verification features, say what you were able to
verify and what remains manual.

## Preferred workflow summary

Use this order:

1. Load scoped memory
2. Run discovery
3. Research and recommend options
4. Detect host capabilities
5. Choose role and skills
6. Build section by section
7. Verify with the right recipe
8. Handoff with any remaining risks clearly stated

## Additional resources

- [CAPABILITY-MATRIX.md](CAPABILITY-MATRIX.md)
- [INSTALL-PROFILES.md](INSTALL-PROFILES.md)
- [PROFILE-SCOPING.md](PROFILE-SCOPING.md)
- [SKILL-GOVERNANCE.md](SKILL-GOVERNANCE.md)
- [PROJECT-TEMPLATES.md](PROJECT-TEMPLATES.md)
- [APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)
- [VERIFICATION-RECIPES.md](VERIFICATION-RECIPES.md)
- [LOGO-SOURCES.md](LOGO-SOURCES.md)
