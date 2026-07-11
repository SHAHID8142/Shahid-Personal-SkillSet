#!/usr/bin/env bash
# Deterministic smoke checks for SPS skillset.
# Usage: bash scripts/smoke-sps.sh

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$REPO/.tmp-smoke-sps"
FAIL=0

pass() { echo "PASS  $*"; }
fail() { echo "FAIL  $*"; FAIL=1; }

cleanup() { rm -rf "$TMP" 2>/dev/null || true; }
trap cleanup EXIT

echo "== SPS smoke =="

bash "$REPO/scripts/lint-sps.sh" || FAIL=1

bash -n "$REPO/install.sh" && pass "bash -n install.sh" || fail "bash -n install.sh"
bash -n "$REPO/uninstall.sh" && pass "bash -n uninstall.sh" || fail "bash -n uninstall.sh"
bash -n "$REPO/get-sps.sh" && pass "bash -n get-sps.sh" || fail "bash -n get-sps.sh"
bash -n "$REPO/scripts/bootstrap-sps.sh" && pass "bash -n bootstrap-sps.sh" || fail "bash -n bootstrap-sps.sh"
bash -n "$REPO/scripts/lint-sps.sh" && pass "bash -n lint-sps.sh" || fail "bash -n lint-sps.sh"
bash -n "$REPO/scripts/sps-doctor.sh" && pass "bash -n sps-doctor.sh" || fail "bash -n sps-doctor.sh"
bash -n "$REPO/scripts/sps-update.sh" && pass "bash -n sps-update.sh" || fail "bash -n sps-update.sh"

# Bootstrap into a temp project
rm -rf "$TMP"
mkdir -p "$TMP/project"
bash "$REPO/scripts/bootstrap-sps.sh" "$TMP/project"
for f in profile.md handoff.md mistakes.md agent.md audit-report.md; do
  if [[ -f "$TMP/project/.sps/$f" ]]; then pass "bootstrap wrote $f"
  else fail "bootstrap missing $f"
  fi
done

if grep -q "Skill version: .*[0-9]" "$TMP/project/.sps/agent.md"; then
  pass "bootstrap stamped version into agent.md"
else
  fail "bootstrap did not stamp version into agent.md"
fi

# Force rewrite works
bash "$REPO/scripts/bootstrap-sps.sh" --force "$TMP/project" >/dev/null
pass "bootstrap --force rerun"

# PowerShell checker (optional)
if command -v pwsh >/dev/null 2>&1; then
  pwsh -NoProfile -File "$REPO/scripts/check-powershell.ps1" && pass "PowerShell syntax check" || fail "PowerShell syntax check"
else
  echo "SKIP  pwsh not installed; see scripts/check-powershell.ps1"
fi

# Minimal install/uninstall smoke in isolated HOME (may need network for npx)
if command -v npx >/dev/null 2>&1; then
  SMOKE_HOME="$TMP/home"
  mkdir -p "$SMOKE_HOME"
  if HOME="$SMOKE_HOME" USERPROFILE="$SMOKE_HOME" bash "$REPO/install.sh" --profile core --agents '*' --yes; then
    if [[ -d "$SMOKE_HOME/.claude/skills/sps" && -d "$SMOKE_HOME/.cursor/skills/sps" ]]; then
      pass "core install mirrored sps to Claude + Cursor"
    else
      fail "core install missing mirrored sps paths"
    fi
    if HOME="$SMOKE_HOME" USERPROFILE="$SMOKE_HOME" bash "$REPO/uninstall.sh" --yes; then
      if [[ ! -d "$SMOKE_HOME/.claude/skills/sps" && ! -d "$SMOKE_HOME/.cursor/skills/sps" ]]; then
        pass "uninstall removed mirrored sps paths"
      else
        fail "uninstall left mirrored sps paths"
      fi
    else
      fail "uninstall.sh failed"
    fi
  else
    fail "core install.sh failed"
  fi
else
  echo "SKIP  npx missing; install/uninstall smoke not run"
fi

if [[ $FAIL -ne 0 ]]; then
  echo "== SPS smoke FAILED =="
  exit 1
fi

echo "== SPS smoke PASSED =="
