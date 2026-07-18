# Changelog

## 3.0.1

- core install now includes **Karpathy guidelines** (`karpathy-guidelines`)
- full profile adds **Trail of Bits** marketplace + security plugins (Claude)
- Antigravity harden: stronger host adapter, boot refusal if mirrors missing,
  richer `GEMINI.md` lock template in bootstrap

## 3.0.0

Breaking workflow release focused on CMS-coupled delivery and multi-agent reliability.

- hard **CMS-coupled section delivery** (storefront + CMS together); `/sps sync` for debt
- foundation-first build order + discovery grill for team/multi-agent + deploy method
- portable **DESIGN-GATE** (no eyebrows, seamless gaps, palette, research-before-design)
- **SECTION-DOD**, role matrix, todo format, workspace hygiene, context efficiency
- **Skill Router** with install-or-instruct protocol; `/sps` remains sole orchestrator
- **METHOD-CARD** + project root mirrors for Antigravity/Claude/Cursor lock-in
- expanded host adapters (Windsurf, Copilot, OpenCode family, generic)
- installer sync paths / agent expansion for more skills-compatible agents
- enhanced `.sps` templates: content-model, cms-foundation, cms-debt, design-system, registry
- audit checklist updated for CMS debt, mirrors, design-gate, deploy/team
- honest portability claim: skills-compatible coding agents, not every internet agent

2.6.0

- simplified install profiles to two primaries: `core` (recommended default) and
  `full`
- `balanced` now aliases to `core`; `minimal` remains as an optional `/sps`-only
  alias for power users
- updated installer menus, docs, and smoke tests for the simpler model

## 2.5.0

- added one-command bootstrap: `get-sps.sh` / `get-sps.ps1` clones or pulls the
  repo into `~/.sps/src/...` then installs
- redesigned installer UX with banner, host detection, interactive profile menu,
  progress counters, and a success card with next steps
- added `scripts/sps-doctor.sh` and `scripts/sps-update.sh`
- documented the curl one-liner as the recommended install path

## 2.4.0

- added scored SPS audit checklist with `/100` total and Strong/Mixed/Weak/Critical bands
- required writing the full audit report to `./.sps/audit-report.md` on every audit
- added `skills/sps/templates/audit-report.md` and bootstrap support for it
- added GitHub Actions CI workflow `.github/workflows/sps-ci.yml` to run
  `scripts/lint-sps.sh` and `scripts/smoke-sps.sh` on push and pull requests

## 2.3.0

- made legacy/first-contact onboarding mandatory: if a project never used
  `/sps`, bootstrap memory, audit the existing codebase against SPS rules, and
  deliver an SPS Audit Report before building
- expanded `AUDIT.md` into a full alignment audit with Pass / Fail / Warnings,
  evidence labels, remediation order, and explicit next-step choices
- added worked example for old projects that never used `/sps`

## 2.2.0

- added project bootstrap helper (`scripts/bootstrap-sps.sh`) and
  `skills/sps/templates/` for deterministic `.sps/` creation
- added `scripts/lint-sps.sh` regression checks and `scripts/smoke-sps.sh`
- added thin host adapters under `skills/sps/hosts/` for Cursor, Codex,
  Antigravity, and Claude
- added `/sps audit` read-only mode (`AUDIT.md`)
- added mistake → rule promotion flow (`MISTAKE-PROMOTION.md`)
- added approval abort conditions and default asset weight budgets
- added worked examples (`EXAMPLES.md`) and SPS version stamping (`VERSION`)
- hardened uninstallers to clear mirrored `/sps` sync paths from the install
  manifest and default mirror roots
- added `scripts/check-powershell.ps1` for Windows parse checks when `pwsh`
  is available

## 2.1.0

- added hard anti-hallucination rules and Known / Assumed / Unverified labeling
- added mandatory always-write memory contract, including `./.sps/agent.md` for
  active host identity and a project `/sps` lock
- added low-end mobile hard gate: minimal mobile by default, no fancy/laggy
  phone effects unless explicitly approved
- updated approval packets and verification recipes to require mobile evidence
  and anti-hallucination checks
- refreshed profile/handoff templates and Claude plugin adapter for the stronger
  boot checklist

## 2.0.0

- rewrote `skills/sps/SKILL.md` into a capability-aware, project-scoped master workflow
- added reference docs for capability detection, install profiles, profile scoping, skill governance, project templates, approval packets, verification recipes, and logo sourcing
- replaced the old "works identically everywhere" story with explicit support levels and fallbacks
- introduced `minimal`, `balanced`, and `full` install profiles
- added stronger cross-agent default skills such as `web-design-guidelines`, `vercel-react-best-practices`, `vercel-composition-patterns`, and `webapp-testing`
- standardized brand/logo sourcing around `theSVG`
- updated the Claude plugin entrypoint and metadata to match the new behavior
- updated installers and repo templates to respect project-only vs personal-default rule scoping
- made installers target all agents explicitly via the Skills CLI, sync `/sps` into shared Gemini/Antigravity locations, and write an install manifest for robust uninstall
- changed uninstallers to remove installed skills through the Skills CLI first, then perform legacy/manual path cleanup, with full removal as the default behavior
- added direct `/sps` mirroring into Claude, Cursor, Codex, universal-agent, and Gemini/Antigravity skill roots so local installs do not depend on host auto-detection
- added noninteractive uninstall flags, isolated npm/npx cache handling, and nonzero installer exit codes for automation-safe smoke testing
