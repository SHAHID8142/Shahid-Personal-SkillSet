# Workspace Hygiene

## Law

Keep the working directory clean, intentional, and free of duplicate assets.

## When the user drops a file / folder / link into the project

1. Identify type: doc, image, video, font, data, note, secret (never commit secrets)
2. Move it to the dedicated folder for that type (project convention; if unclear,
   propose a folder map and get a quick approval)
3. Use the **canonical path** — do not copy the file into a second location for
   "usage" while leaving clutter at the drop site
4. Update imports/references to the canonical path
5. If the asset becomes CMS/media content, register it in CMS/media memory
6. Remove empty leftover clutter from the drop location when safe

## Folder defaults (propose if project lacks them)

- `docs/` or `director/` — briefs and documents
- `public/` or project media roots — images/videos for the site
- `src/assets/` — bundled assets when the stack requires it
- `.sps/` — SPS memory only (not binary dumps)

## Forbidden

- Duplicate copies "just in case"
- Leaving large binaries in repo root
- Committing `.env` or credential files
