# /sps Examples

Short worked rhythms. Copy the process, not the product details.

## Example 1: Marketing landing page

User: `/sps design a landing page for a dental clinic`

1. Boot `.sps/`, write `agent.md` + version, lock `/sps`
2. Discovery: audience, pages, CMS need?, booking?, brand, mobile = minimal
3. Options: static Astro vs Next CMS vs Framer-like builder → recommend one
4. Role: design director + frontend engineer
5. Build sections with approvals: navbar → hero → services → CTA → footer
6. Each UI chunk includes responsive + low-end + asset budget notes
7. Verify breakpoints and handoff with Known / Assumed / Unverified

## Example 2: SaaS dashboard section

User: `/sps build the billing settings section`

1. Read handoff; skip full rediscovery if profile already answers it
2. Map chunk: UI table, API, auth roles, empty/error states, mobile table behavior
3. Approval packet: dual path if desktop table is dense, simplified mobile cards
4. Implement one approved chunk
5. Update handoff after approval
6. Verify with full-stack recipe + mobile checklist

## Example 3: Production bug fix

User: `/sps fix mobile menu not closing on route change`

1. Boot memory; do not invent the bug cause
2. Brief discovery: repro device, browser, expected behavior
3. Role: debugger
4. Reproduce / inspect evidence before patching
5. Small fix chunk + approval if behavior change is broad
6. Verify on narrow mobile widths; log mistake if a prior assumption caused it

## Example 4: Audit only

User: `/sps audit`

1. Read-only mode from `AUDIT.md`
2. Score every checklist item toward `/100`
3. Write full report to `./.sps/audit-report.md`
4. Show Pass / Fail / Warnings + score band
5. Do not implement unless asked

## Example 5: Old project that never used `/sps`

User: `/sps improve this website` on a repo with no `.sps/`

1. Detect legacy/first-contact status
2. Bootstrap `.sps/` + lock `/sps` + stamp host/version
3. Inspect existing codebase against SPS rules
4. Produce scored SPS Audit Report and write `./.sps/audit-report.md`
5. Stop and ask: remediate Fail items, continue original request, audit-only,
   or ask discovery questions first
6. Only after the user chooses, continue section-by-section
