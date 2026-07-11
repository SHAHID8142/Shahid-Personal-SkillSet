# Antigravity / Gemini CLI host adapter for `/sps`

This is a thin host note for Antigravity and Gemini CLI. The canonical workflow
is still `skills/sps/SKILL.md`.

## Antigravity notes

- Keep the flow simple and conversational when structured UI is missing.
- Do not rely on Claude plugin ecosystems.
- Rely on mirrored skill paths under `~/.gemini/.../skills/sps` when present.
- Write `./.sps/agent.md` with Host: Antigravity / Gemini CLI and the version.

## Required behavior

1. Follow canonical `/sps` steps with plain-markdown discovery and approvals.
2. Use shell verification when available; otherwise document manual checks.
3. Avoid host-specific extras that reduce portability.
