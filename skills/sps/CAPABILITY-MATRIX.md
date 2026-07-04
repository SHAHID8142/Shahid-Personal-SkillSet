# Capability Matrix

Use this file to decide what `/sps` can safely assume on each host.

## Rule

If a capability is missing, fall back instead of pretending it exists.

## Support model

| Host | Skills | MCP | Shell / installs | Structured questions | Browser / runtime verification | Notes |
|---|---|---|---|---|---|---|
| Claude Code | Strong | Strong | Strong | Usually available | Strong | Best host for full `/sps` behavior, including plugin-specific enhancers. |
| Cursor | Strong | Strong | Strong | Usually available | Strong | Use host-native tools first; do not assume Claude plugin commands exist. |
| Codex | Strong | Varies | Strong | Varies | Varies | Favor portable skills and shell-based verification. |
| Antigravity / Gemini CLI | Medium | Varies | Medium | Usually conversational only | Varies | Keep the flow simple and explicit; do not rely on plugin ecosystems. |
| Other skills-compatible agents | Varies | Varies | Varies | Varies | Varies | Use the generic fallback workflow. |

## Fallback order

1. Use explicit skill invocation if the host supports it.
2. Use host-native shell, file, and planning tools if available.
3. Use MCP only when the host actually supports MCP.
4. Use plain conversational questioning if structured forms are unavailable.
5. Use manual verification notes if browser/runtime tooling is unavailable.

## Hard restrictions

- Never assume Claude plugins exist on Cursor, Codex, Antigravity, or other hosts.
- Never assume MCP is configured just because the host can theoretically support it.
- Never assume browser automation exists.
- Never assume the same skill directories exist on every runtime.
- Never claim "works identically everywhere."

## Generic fallback workflow

When the host is unknown or limited:

1. Run discovery in plain chat.
2. Present options and recommendation in plain markdown.
3. Use the best available local shell/filesystem workflow.
4. Use project-local `.sps/` memory only.
5. Handoff with a clear "verified vs not verified" summary.
