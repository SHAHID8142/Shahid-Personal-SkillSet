# Approval Packets

Before building each major section or chunk, send a compact approval packet.
Do not continue until the user approves.

## Template

```markdown
## Approval Packet

Section:
Purpose:

Required skill:
- `/sps` orchestrating: yes

Active agent:
- Host:

Role stack:
- Primary:
- Supporting:

This chunk covers:
- frontend / UI:
- backend / data:
- CMS / content:
- storefront / ERP / admin:
- accessibility:
- performance:
- responsive breakpoints:
- mobile behavior: minimal / dual / user-approved richer
- motion:
- low-end lag risks and mitigations:

Evidence:
- Known:
- Assumed:
- Unverified:

Intentionally not included:
- ...

Trade-offs:
- ...

Memory updates after approval:
- profile / handoff fields to write:

Next action after approval:
- ...
```

## Abort conditions

Do **not** start coding the chunk if any of these are true:

1. `./.sps/agent.md` is missing or has no active host
2. `/sps` lock is missing from project memory
3. Required discovery answers are still unknown for this chunk (for example CMS,
   auth model, or storefront choice when the chunk depends on them)
4. UI chunk lacks responsive + mobile behavior notes
5. UI chunk would ship fancy/laggy mobile motion without explicit approval
6. Asset budget would be exceeded without explicit approval
7. The packet claims verification that has not happened
8. Known / Assumed / Unverified labels are missing on risky claims

When aborting, tell the user which condition blocked progress and what is needed.

## Rules

- Keep it short.
- Mobile / low-end notes are required for any UI chunk.
- Asset budget notes are required when media or motion is added.
- Default mobile behavior is minimal unless the user already approved richer.
- Do not claim verification that has not happened.
- State what is intentionally not included in the chunk.
- After approval, update `./.sps/handoff.md` immediately.
