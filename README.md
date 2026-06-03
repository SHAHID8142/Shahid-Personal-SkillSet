# Shahid-Personal-SkillSet

A universal **build orchestrator** for AI coding agents, packaged as a Claude Code marketplace.
Install it once on any machine. Then, whenever you say *"build / design / animate / debug X for me,"*
it figures out which specialized skill the task needs, **installs that skill automatically** if it's
missing, and uses it — across any project, any stack.

It doesn't copy other people's skills into this repo. It holds the orchestrator + a **vetted catalog**
and installs each skill from its **official source** on demand, so everything stays current and
properly licensed. See `CATALOG.md` for the full "what skill for what" list.

## How it works

1. You install this marketplace once and install the orchestrator skill.
2. You optionally install the whole catalog upfront (`scripts/install-catalog.sh`).
3. When you ask Claude Code to build something, the orchestrator matches the request to the catalog,
   auto-installs any missing skill, runs `/reload-plugins`, and builds using it.

The catalog covers: design (hallmark, ui-ux-pro-max, frontend-design), animation (GSAP, Framer
Motion, Lenis, Anime.js, three.js), backend & deploy (Stripe, Cloudflare, Netlify), debug & security
(Sentry, Trail of Bits), SEO & content (SEO/Ads + marketing skills), and research (graphify, Context7).

## Install (Claude Code)

```bash
# 1. add this repo as a marketplace
claude plugin marketplace add <your-username>/Shahid-Personal-SkillSet

# 2. install the orchestrator
claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope user

# 3. install the whole catalog upfront (best-effort; Claude Code can verify/fix per-repo)
bash scripts/install-catalog.sh

# 4. inside Claude Code:
/reload-plugins
```

Then just talk to Claude Code normally: *"build me an animated SaaS landing page"* → it pulls the
design + animation skills and builds. The skills auto-activate from their descriptions.

## Use across machines

This git repo is the sync mechanism. On a new machine: clone it, `claude plugin marketplace add ./`,
install the orchestrator, run the catalog script. To update: `git pull`.

## Structure

```
Shahid-Personal-SkillSet/
├── .claude-plugin/marketplace.json      # makes this repo a Claude Code marketplace
├── plugins/universal-build-orchestrator/
│   ├── .claude-plugin/plugin.json
│   └── skills/universal-build-orchestrator/SKILL.md   # the router + catalog + auto-install logic
├── CATALOG.md                           # what skill for what (human reference)
├── scripts/install-catalog.sh           # install the whole catalog upfront
└── README.md
```

## Safety note

Every catalogued skill is third-party code that runs on your machine. They're pre-selected from
reputable sources, but the orchestrator only ever installs from this catalog — never from arbitrary
web results. Review a source if it looks changed or abandoned. This is the standard caution for any
plugin marketplace.
