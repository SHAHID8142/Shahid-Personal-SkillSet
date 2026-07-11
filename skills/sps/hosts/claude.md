# Claude Code host adapter for `/sps`

This is a thin host note for Claude Code. The canonical workflow is still
`skills/sps/SKILL.md`. The Claude plugin entrypoint is
`universal-build-orchestrator`.

## Claude notes

- Plugins and MCP can enhance `/sps`, but must not replace the portable core.
- Write `./.sps/agent.md` with Host: Claude Code and the current SPS version.
- Use Claude enhancers only when they do not conflict with project rules.

## Required behavior

1. Follow canonical `/sps` steps.
2. Keep project memory authoritative over global Claude preferences.
3. Fall back to the portable workflow if a plugin/MCP is missing.
