# Changelog

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
