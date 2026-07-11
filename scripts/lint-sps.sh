#!/usr/bin/env bash
# Regression lint for /sps skill text and required files.
# Usage: bash scripts/lint-sps.sh

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL="$REPO/skills/sps/SKILL.md"
FAIL=0

pass() { echo "PASS  $*"; }
fail() { echo "FAIL  $*"; FAIL=1; }

require_file() {
  local f="$1"
  if [[ -f "$f" ]]; then pass "exists ${f#$REPO/}"
  else fail "missing ${f#$REPO/}"
  fi
}

require_text() {
  local f="$1"
  local pattern="$2"
  local label="$3"
  if grep -Eq "$pattern" "$f"; then pass "$label"
  else fail "$label (pattern: $pattern)"
  fi
}

echo "== SPS lint =="

require_file "$SKILL"
require_file "$REPO/skills/sps/VERSION"
require_file "$REPO/skills/sps/ANTI-HALLUCINATION.md"
require_file "$REPO/skills/sps/MOBILE-LOW-END.md"
require_file "$REPO/skills/sps/ASSET-BUDGET.md"
require_file "$REPO/skills/sps/AUDIT.md"
require_file "$REPO/skills/sps/MISTAKE-PROMOTION.md"
require_file "$REPO/skills/sps/EXAMPLES.md"
require_file "$REPO/skills/sps/templates/profile.md"
require_file "$REPO/skills/sps/templates/handoff.md"
require_file "$REPO/skills/sps/templates/mistakes.md"
require_file "$REPO/skills/sps/templates/agent.md"
require_file "$REPO/skills/sps/templates/audit-report.md"
require_file "$REPO/skills/sps/hosts/cursor.md"
require_file "$REPO/skills/sps/hosts/codex.md"
require_file "$REPO/skills/sps/hosts/antigravity.md"
require_file "$REPO/skills/sps/hosts/claude.md"
require_file "$REPO/scripts/bootstrap-sps.sh"
require_file "$REPO/scripts/smoke-sps.sh"
require_file "$REPO/scripts/check-powershell.ps1"
require_file "$REPO/scripts/sps-doctor.sh"
require_file "$REPO/scripts/sps-update.sh"
require_file "$REPO/get-sps.sh"
require_file "$REPO/get-sps.ps1"
require_file "$REPO/.github/workflows/sps-ci.yml"

require_text "$SKILL" '/sps.*lock|`/sps` lock' "SKILL mentions /sps lock"
require_text "$SKILL" 'hallucin' "SKILL mentions anti-hallucination"
require_text "$SKILL" 'low-end mobile|MOBILE-LOW-END' "SKILL mentions low-end mobile"
require_text "$SKILL" 'agent\.md' "SKILL mentions agent.md"
require_text "$SKILL" 'Always write memory|always write memory|Always write' "SKILL mentions always-write memory"
require_text "$SKILL" 'AUDIT|/sps audit|audit mode' "SKILL mentions audit mode"
require_text "$SKILL" 'legacy|first-contact|first contact' "SKILL mentions legacy first-contact audit"
require_text "$REPO/skills/sps/AUDIT.md" 'legacy|first contact|SPS Audit Report' "AUDIT covers legacy onboarding"
require_text "$REPO/skills/sps/AUDIT.md" '/100|100 points|Total: .*100' "AUDIT includes scored /100 checklist"
require_text "$REPO/skills/sps/AUDIT.md" 'audit-report\.md' "AUDIT requires audit-report.md write"
require_text "$SKILL" 'audit-report\.md|/100|scored' "SKILL mentions scored audit report file"
require_text "$SKILL" 'VERSION|version stamp|Skill version' "SKILL mentions version stamping"
require_text "$SKILL" 'ASSET-BUDGET|asset budget' "SKILL mentions asset budget"
require_text "$SKILL" 'MISTAKE-PROMOTION|mistake promotion' "SKILL mentions mistake promotion"
require_text "$SKILL" 'bootstrap|templates/' "SKILL mentions bootstrap/templates"

require_text "$REPO/skills/sps/APPROVAL-PACKETS.md" 'Abort conditions|abort' "Approval packets include abort conditions"
require_text "$REPO/skills/sps/MOBILE-LOW-END.md" 'ASSET-BUDGET|asset budget|200 KB' "Mobile rules reference asset budgets"
require_text "$REPO/skills/sps/templates/agent.md" 'Skill version' "agent template has version stamp"

if [[ $FAIL -ne 0 ]]; then
  echo "== SPS lint FAILED =="
  exit 1
fi

echo "== SPS lint PASSED =="
