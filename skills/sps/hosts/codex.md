# Codex host adapter for `/sps`

This is a thin host note for OpenAI Codex. The canonical workflow is still
`skills/sps/SKILL.md`.

## Codex notes

- Favor portable shell + filesystem verification.
- Do not assume Claude plugins or Cursor-only MCP wiring.
- Keep approval packets and evidence labels explicit in markdown.
- Write `./.sps/agent.md` with Host: Codex and the current SPS version.

## Required behavior

1. Follow canonical `/sps` steps.
2. Prefer deterministic commands for verification.
3. Mark anything not executed as Unverified.
