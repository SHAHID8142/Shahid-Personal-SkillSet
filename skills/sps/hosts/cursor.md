# Cursor host adapter for `/sps`

This is a thin host note for Cursor. The canonical workflow is still
`skills/sps/SKILL.md`.

## Cursor notes

- Prefer Cursor-native tools (shell, file edits, browser MCP if configured).
- Do not assume Claude plugin commands or Claude marketplaces exist.
- Invoke `/sps` explicitly when the user wants the orchestrated workflow.
- Write `./.sps/agent.md` with Host: Cursor and the current SPS version.
- Use project `.sps/` memory; keep personal defaults lower priority.

## Required behavior

1. Follow canonical `/sps` steps.
2. Keep anti-hallucination + mobile/low-end gates active.
3. Fall back cleanly when MCP/browser tooling is unavailable.
