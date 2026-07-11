# /sps Audit Mode

Use this file for:

1. explicit `/sps audit` requests
2. **legacy project onboarding** when a project has never used `/sps` before
3. any read-only compliance check against SPS rules

## Goal

Inspect the current project, compare it to SPS rules, score alignment out of
100, write the full report to `./.sps/audit-report.md`, and show the same
report to the user. Do not implement fixes until the user approves a
remediation path.

## When audit is mandatory

Treat the project as **legacy / first SPS contact** when any of these are true:

- `./.sps/` does not exist
- `./.sps/profile.md` exists but has no real project identity / rules filled in
- handoff shows the project has never completed an SPS discovery or audit
- the user says this is an old project and wants SPS alignment

On first SPS contact:

1. Bootstrap `./.sps/` from templates (or `scripts/bootstrap-sps.sh`)
2. Write active host + SPS version into `./.sps/agent.md`
3. Lock `/sps` as required for this project
4. Run the full scored alignment audit below
5. Write the full report to `./.sps/audit-report.md`
6. Save a short summary + score into `./.sps/handoff.md`
7. **Stop and show the report before building anything**

Even if the user asked to “build X”, the first response on a legacy project is
the audit report plus a choice of next actions.

## Required investigation

Do not invent the project. Read evidence from:

1. repo structure (package manifests, app folders, CMS/config files)
2. main UI entry routes / layouts / components when present
3. styling / motion / asset usage patterns
4. existing README or docs if present
5. `./.sps/` memory after bootstrap

If something cannot be verified, mark it **Unverified** and do not award full
points for that item.

## Scored checklist (100 points)

Score every item as:

- **Pass** = full points
- **Warning** = half points (rounded down)
- **Fail** or **Unverified with risk** = 0 points

| ID | Category | Check | Points |
|---|---|---|---|
| A1 | Memory | `.sps/` bootstrapped | 4 |
| A2 | Memory | `/sps` lock present | 4 |
| A3 | Memory | `agent.md` has host + version stamp | 4 |
| A4 | Memory | profile / handoff usable for ongoing work | 3 |
| B1 | Understanding | project type inferred with evidence | 5 |
| B2 | Understanding | stack detected with evidence | 5 |
| B3 | Understanding | CMS / storefront / ERP / admin checked | 5 |
| B4 | Understanding | deployment clues checked | 3 |
| C1 | Honesty | no fake certainty in the report | 4 |
| C2 | Honesty | Known / Assumed / Unverified filled | 4 |
| D1 | Mobile | responsive approach present or clearly planned | 8 |
| D2 | Mobile | no hover-only critical action risk (or mitigated) | 6 |
| D3 | Mobile | no heavy / laggy mobile motion risk (or mitigated) | 8 |
| D4 | Mobile | dual path decision recorded when needed | 4 |
| E1 | Assets | image/video/Lottie/3D risks reviewed | 6 |
| E2 | Assets | autoplay media policy reviewed | 4 |
| E3 | Assets | font / animation library weight reviewed | 4 |
| F1 | Quality | lint/test/build scripts exist or absence noted | 5 |
| F2 | Quality | no obvious deployability blockers unstated | 5 |
| F3 | Quality | accessibility basics reviewed | 4 |
| G1 | Workflow | remediation can continue section-by-section | 3 |
| G2 | Workflow | top remediation chunks ordered by risk | 2 |

**Total = 100**

### Score bands

| Score | Band | Meaning |
|---|---|---|
| 90–100 | Strong | Aligned enough to proceed carefully |
| 70–89 | Mixed | Proceed only with explicit remediation plan |
| 40–69 | Weak | Fix Fail items before major feature work |
| 0–39 | Critical | Stabilize basics first |

## Output + file write (required)

1. Show the report in chat.
2. Write the **same full report** to `./.sps/audit-report.md` (overwrite latest).
3. Update `./.sps/handoff.md` with score, band, date, and waiting choice.

```markdown
## SPS Audit Report

Date:
Project status: legacy first contact | existing SPS project
Scope: full alignment | focused
Active agent:
SPS version:

### Score
- Total: 72/100
- Band: Mixed
- Pass points:
- Warning points:
- Fail / unpaid points:

### Scored checklist
| ID | Result | Points awarded | Notes |
|---|---|---|---|
| A1 | Pass | 4 | ... |
| D3 | Fail | 0 | ... |

### Project snapshot
- Type:
- Stack (Known/Assumed/Unverified):
- CMS / storefront / ERP / admin:
- UI surfaces reviewed:

### Pass
- ...

### Fail
- ...

### Warnings
- ...

### Evidence
- Known:
- Assumed:
- Unverified:

### Recommended remediation order
1. ...
2. ...
3. ...

### Choose next step
1. Remediate Fail items section-by-section under `/sps`
2. Continue my original request after accepting this baseline
3. Audit only — do nothing else yet
4. Ask discovery questions before any remediation
```

## Rules

- Read-only until the user chooses a next step
- Prefer evidence over opinion
- Always compute and show the `/100` score
- Always write `./.sps/audit-report.md`
- Mark Unverified items clearly
- Do not silently start coding after the report
- Update `./.sps/handoff.md` with:
  - audit date
  - score + band
  - project status
  - top Fail / Warning counts
  - path to `./.sps/audit-report.md`
  - waiting-for-user choice
- For explicit `/sps audit` on an already-SPS project, still produce the scored
  report and write `audit-report.md`
