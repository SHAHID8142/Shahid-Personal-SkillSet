---
name: universal-build-orchestrator
description: >
  Claude plugin entry point for `/sps`. Use when the user asks to build,
  design, implement, fix, refactor, test, or deploy software and wants the
  project-scoped `/sps` workflow: discovery first, role-based routing,
  section-by-section approvals, and capability-aware verification.
---

This file is the Claude-specific entry point for `/sps`.

The canonical workflow lives in `skills/sps/SKILL.md`. Follow that file as the
source of truth.

## Claude host notes

- Claude can use richer plugin and MCP integrations than many other hosts.
- Use those capabilities when available, but do not rewrite the core workflow
  around Claude-only features.
- Project-local rules still win over global defaults.
- The workflow is still: discovery -> options -> role selection -> section
  approvals -> verification.

## Required behavior

1. Load the canonical `/sps` workflow from `skills/sps/SKILL.md`.
2. Follow the scoped memory rules from `skills/sps/PROFILE-SCOPING.md`.
3. Route to the best available specialist stack without claiming that every
   host behaves the same way.
4. Use Claude-only enhancers only when they genuinely help and do not conflict
   with the chosen portable workflow.
