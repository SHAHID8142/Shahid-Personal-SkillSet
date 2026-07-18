# Antigravity / Gemini CLI host adapter for `/sps`

Canonical workflow: `skills/sps/SKILL.md` + [METHOD-CARD.md](../METHOD-CARD.md).

## Why this host fails often

Antigravity may prefer its own scaffolding and skip skills unless project root
mirrors and explicit `/sps` invocation are present.

## Required behavior

1. On session boot, read METHOD-CARD + `./.sps/*` before any code.
2. Ensure `GEMINI.md` and `AGENTS.md` contain the `/sps` lock block
   ([PROJECT-ROOT-MIRRORS.md](../PROJECT-ROOT-MIRRORS.md)).
3. Do **not** invent a parallel "Antigravity-native" build process.
4. Use plain-markdown discovery and approval packets.
5. CMS coupling, design gate, hygiene, and context-efficiency laws still apply.
6. If skills are missing from `~/.gemini/**/skills/sps`, tell the user to run
   `get-sps.sh` / `install.sh` and give exact commands.
7. Write `./.sps/agent.md` with Host: Antigravity / Gemini CLI and VERSION.

## Forbidden

- Skipping discovery because the host chat UI feels faster
- Storefront-only sections on CMS projects
- Claiming verification that was not run
