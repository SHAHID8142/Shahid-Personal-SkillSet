#!/usr/bin/env bash
# Shahid-Personal-SkillSet — install the whole catalog upfront.
#
# These are the install commands for the vetted catalog. Claude Code can run and, where needed,
# correct these (some upstream repos document slightly different commands / plugin names — verify
# against each repo's README if one fails). Re-runnable. Requires: claude CLI, node/npx, optionally uv.
#
# Safety: every source below is a third-party skill that runs code. They are pre-selected, but
# review anything that looks changed before trusting it.

set -uo pipefail
run() { echo "+ $*"; "$@" || echo "  ! failed (verify against the repo README): $*"; }

echo "Installing Shahid-Personal-SkillSet catalog..."
echo

# --- This orchestrator (from the local repo) ---
run claude plugin marketplace add ./
run claude plugin install universal-build-orchestrator@shahid-personal-skillset --scope user

# --- Design & frontend ---
run claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
run claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill --scope user
# hallmark: installer is npx-based; verify exact command in https://github.com/Nutlope/hallmark
# frontend-design: locate path in https://github.com/anthropics/skills and install/copy

# --- Animation & motion ---
run claude plugin marketplace add freshtechbro/claudedesignskills
run claude plugin install gsap-scrolltrigger@claudedesignskills --scope user
run claude plugin install motion-framer@claudedesignskills --scope user
run claude plugin install animejs@claudedesignskills --scope user
# GSAP official: npx skills add https://github.com/greensock/gsap-skills   (verify flags)
# awwwards-animations (gsap+framer+lenis+anime in one): install per https://github.com/devmartinese/awwwards-animations-skill

# --- Backend, SEO, marketing, content, research ---
run claude plugin marketplace add alirezarezvani/claude-skills
# then install the specific plugins you want, e.g.:
#   claude plugin install <backend-or-seo-or-content-plugin>@claude-code-skills --scope user
# (browse names with: claude plugin marketplace info claude-code-skills)

# --- Official platform / debug / security skills (Stripe, Cloudflare, Netlify, Sentry, Trail of Bits) ---
# Source: https://github.com/VoltAgent/awesome-agent-skills  (find the skill path in the repo table)
#   npx skills add https://github.com/VoltAgent/awesome-agent-skills --skill <path>

# --- Research / docs / memory ---
# graphify:  uv tool install graphifyy && graphify install
# context7:  claude mcp add context7 -- npx -y @upstash/context7-mcp

echo
echo "Done. Run /reload-plugins inside Claude Code, then 'claude plugin list' to confirm."
echo "Lines marked with comments need you (or Claude Code) to pick specific plugins / verify commands."
