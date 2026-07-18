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
- Method card read: yes

Active agent:
- Host:

Role stack:
- Primary engineering/design role:
- ROLE-MATRIX roles:

Skills selected (router):
- Primary per domain:
- Secondary (optional):
- Missing / install plan:

This chunk covers:
- frontend / UI:
- backend / data:
- CMS / content (inventory + admin UI + wire):
- CMS round-trip proof plan:
- storefront / ERP / admin:
- accessibility:
- performance:
- responsive breakpoints:
- mobile behavior: minimal / dual / user-approved richer
- motion:
- low-end lag risks and mitigations:
- workspace hygiene notes:
- cleanup gate plan:

Design Research Packet:
- attached / summary:

Evidence:
- Known:
- Assumed:
- Unverified:

Intentionally not included:
- ...

Trade-offs:
- ...

Memory updates after approval:
- profile / handoff / content-model / section-todos / registry:

Next action after approval:
- ...
```

## Abort conditions

Do **not** start coding the chunk if any of these are true:

1. `./.sps/agent.md` is missing or has no active host
2. `/sps` lock is missing from project memory or root mirrors when required
3. Required discovery answers are still unknown for this chunk (CMS, auth,
   storefront, team/deploy when the chunk depends on them)
4. CMS-enabled project and this UI chunk has no CMS inventory + admin plan
5. UI chunk lacks Design Research Packet (or redesign research)
6. UI chunk lacks responsive + mobile behavior notes
7. UI chunk would ship fancy/laggy mobile motion without explicit approval
8. Asset budget would be exceeded without explicit approval
9. Todo list for the chunk is missing
10. ROLE-MATRIX roles are undeclared
11. The packet claims verification that has not happened
12. Known / Assumed / Unverified labels are missing on risky claims

When aborting, tell the user which condition blocked progress and what is needed.

## Rules

- Keep it short but complete on CMS + mobile + roles.
- After approval, update `./.sps/handoff.md` immediately.
- After implementation, do not ask for section approval until SECTION-DOD passes
  including cleanup gate and CMS round-trip when applicable.
