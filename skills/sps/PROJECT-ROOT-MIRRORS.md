# Project Root Mirrors

Some hosts ignore skills unless project root instruction files exist
(especially Antigravity / Gemini). When bootstrapping `/sps` in a project,
create or update short mirrors that point to `./.sps/` and `/sps` laws.

## Required mirrors (create if missing; do not overwrite rich existing docs blindly)

Append a clear SPS lock block if the file already exists and is project-owned:

- `AGENTS.md` — universal agents
- `GEMINI.md` — Antigravity / Gemini CLI
- `CLAUDE.md` — Claude Code

## Lock block (English)

```markdown
## /sps lock
This project uses `/sps` as the master workflow.
Read `./.sps/profile.md`, `./.sps/handoff.md`, and the SPS Method Card before
building. Do not replace `/sps` with a host-default scaffolding workflow.
CMS-enabled sections must ship storefront + CMS controls together.
```

## Also

- Keep detailed rules in `./.sps/` (source of truth)
- Host root files stay short and point inward
