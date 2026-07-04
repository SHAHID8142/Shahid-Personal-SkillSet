# Verification Recipes

Use the strongest realistic recipe the current host supports.

## Frontend / component change

Check:
- lint / type errors
- render correctness
- responsive states
- keyboard / focus states
- reduced-motion behavior if animated

## Full-stack feature

Check:
- lint / type errors
- critical happy path
- error / loading / empty states
- auth / permission handling
- build or runtime sanity

## CMS / content-model change

Check:
- schema or model validity
- preview / rendering path
- missing content fallback
- SEO field coverage if applicable

## Storefront / checkout change

Check:
- price / cart correctness
- checkout / payment edge states
- inventory or order assumptions
- mobile checkout flow

## Deploy / infrastructure change

Check:
- config validity
- build output
- environment variables
- rollback path
- deployment-specific smoke test

## Mobile / responsiveness

Check:
- 320px
- 768px
- laptop widths
- touch behavior
- whether hover-only interactions are removed or replaced

## Low-end performance

Check:
- animation count and weight
- image / asset weight
- layout thrash risk
- whether a simpler mobile path is needed

## Handoff summary

Always state:
- what was verified
- how it was verified
- what remains manual or unverified
