# Profile Scoping

The entire `/sps` memory model depends on strict scoping.

## Priority order

1. Session-only instruction
2. Project profile: `./.sps/profile.md`
3. Personal defaults: `~/.sps/personal-defaults.md`

Project rules always beat global defaults.

## Scope types

### Project-only

Use for anything that belongs to one repo, product, or client only:
- fonts
- spacing scale
- brand colors
- section order
- CMS choice
- storefront choice
- ERP choice
- animation style
- mobile simplifications
- deployment constraints

### Personal default

Use only when the user explicitly says the rule should apply across future
projects:
- preferred package manager
- preferred commit style
- preferred review style
- frequently preferred stacks

### Session-only

Use for temporary directions that should not be written into long-term memory:
- "keep this task minimal"
- "skip animation for now"
- "focus on mobile first in this chat"

## Write rules

- Do not write to `~/.sps/personal-defaults.md` without explicit approval.
- Do not copy one project's design or stack rules into another project.
- When in doubt, treat the rule as project-only.

## Suggested project profile shape

```markdown
# SPS Project Profile

## Project identity
- Name:
- Goal:
- Users:

## Project-only rules
- Typography:
- Colors:
- Motion:
- Stack:
- CMS:
- Storefront:
- ERP / admin:

## Explicit approvals
-

## Explicit rejections
-
```
