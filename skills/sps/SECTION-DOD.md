# Section Definition of Done (DoD)

A section may be submitted for approval only when every applicable item passes.
Mark N/A with reason when a system is disabled.

---

## 1. Standardized Code Marker Syntax (B6)

To maintain clarity across multi-agent workflows, sections must be wrapped with standardized comment markers:

```html
<!-- SPS:SECTION name="hero" -->
<!-- SPS:CMS_FIELDS ["title", "subtitle", "cta_primary", "bg_image"] -->
<!-- SPS:READS_FROM db.getPageContent('/') -->
<section id="hero">
  ...
</section>
<!-- SPS:ENDSECTION -->
```

For JSX / TypeScript components:
```tsx
// SPS:SECTION name="featured_packages"
// SPS:CMS_FIELDS ["items", "eyebrow", "title"]
// SPS:READS_FROM db.getCollectionItems('packages')
```

---

## 2. Product & CMS Requirements

1. Storefront UI matches approved direction.
2. Content inventory complete in `content-model.md`.
3. CMS fields + admin UI cover that inventory (100% surface coverage).
4. Demo/seed/media replace/hide/delete works.
5. **Round-trip proof**: admin edit → database layer → live storefront.
6. Empty / loading / error / unpublished states handled.

---

## 3. Quality & Mobile Hard Gate

7. Mobile-first responsive (320px → 1440px) + [MOBILE-LOW-END.md](MOBILE-LOW-END.md).
8. A11y AA standards + `prefers-reduced-motion` compliance.
9. SEO/meta when page-level applicable.
10. Zero lint/typecheck/build blockers.
11. Design gate laws respected (no fake dummy buttons, curated palette).

---

## 4. Engineering & Workspace Hygiene

12. Components split (modular, focused, single concern).
13. Standard agent markers present (`SPS:SECTION`, `SPS:CMS_FIELDS`, `SPS:READS_FROM`).
14. Code cleanup gate: dead code removed, imports organized.
15. Todos closed or explicitly deferred with reasons.
16. Security basics verified (input validation, traversal guards, auth check).
17. Workspace hygiene: zero duplicate assets left behind ([WORKSPACE-HYGIENE.md](WORKSPACE-HYGIENE.md)).

---

## 5. Memory Updates

18. `handoff.md`, `content-model.md`, `section-registry.md` updated.
19. Any design pivots written to `design-system.md` + `changelog-sps.md`.

---

## 6. Approval Gate

Send the appropriate Tier 1 or Tier 2 approval packet ([APPROVAL-PACKETS.md](APPROVAL-PACKETS.md)) before proceeding to the next section (unless in batch approval mode).
