# Section Definition of Done

A section may be submitted for approval only when every applicable item passes.
Mark N/A with reason when a system is disabled (for example ERP off).

## Product / CMS

1. Storefront UI matches approved direction
2. Content inventory complete in `content-model.md`
3. CMS fields + admin UI cover that inventory (CMS projects)
4. Demo/seed/media replace/hide/delete works (CMS projects)
5. **Round-trip proof**: admin edit → API/content layer → storefront
6. Empty / loading / error / unpublished states handled

## Quality

7. Mobile-first responsive (320 → up) + [MOBILE-LOW-END.md](MOBILE-LOW-END.md)
8. A11y AA + reduced motion
9. SEO/meta when page-level applicable
10. No lint/type/build blockers for the slice
11. Design gate laws respected ([DESIGN-GATE.md](DESIGN-GATE.md))

## Engineering

12. Components split (small files, one concern)
13. Agent markers present (`SECTION`, `CMS_FIELDS`, `READS_FROM`, `NEXT_AGENT`)
14. FE + BE polish for this slice only
15. Code cleanup gate: dead code, flow, consistency checked before submit
16. Todos closed or explicitly deferred with reason
17. Security basics for the slice (authz, validation, secrets) when relevant
18. Workspace hygiene: no duplicate assets left behind

## Memory

19. `handoff.md`, `content-model.md`, section todo, `section-registry.md` updated
20. Design pivots written to `design-system.md` + `changelog-sps.md` same turn

## Approval

User approval required before the next section. Abort if any required item fails.
