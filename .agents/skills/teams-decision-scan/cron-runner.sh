#!/bin/bash
# Cron runner cho /teams-decision-scan
# Trigger: launchd fires Monday morning (multi-slot 9/10/11/12).
# Marker file ensures fire chỉ 1 lần/tuần.

set -euo pipefail

REPO="/Users/dam.ho/Desktop/Work/damcake-work-wiki"
SKILL_DIR="$REPO/.agents/skills/teams-decision-scan"
LOG="$SKILL_DIR/cron.log"
MARKER="$SKILL_DIR/LAST-FIRED.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
TODAY=$(date +%Y-%m-%d)
DOW=$(date +%u)   # 1=Mon
HOUR=$(date +%H)

# Override for testing: FORCE=1 bash cron-runner.sh
FORCE="${FORCE:-0}"

echo "[$TIMESTAMP] DOW=$DOW HOUR=$HOUR FORCE=$FORCE" >> "$LOG"

# Check: today already fired? (skip duplicate)
if [ "$FORCE" != "1" ] && [ -f "$MARKER" ]; then
  LAST=$(cat "$MARKER")
  if [ "$LAST" = "$TODAY" ]; then
    echo "[$TIMESTAMP] Already fired today ($LAST) — skip." >> "$LOG"
    exit 0
  fi
fi

# Check: Monday only (unless forced)
if [ "$FORCE" != "1" ] && [ "$DOW" != "1" ]; then
  echo "[$TIMESTAMP] Not Monday (DOW=$DOW) — skip." >> "$LOG"
  exit 0
fi

# === FIRE: notify + open VSCode ===
echo "[$TIMESTAMP] Firing T2 reminder..." >> "$LOG"

# Open Antigravity IDE workspace
open -a "Antigravity IDE" "$REPO"

# macOS notification
osascript -e 'display notification "Time to scan Teams — gõ /teams-decision-scan trong Claude Code." with title "Lending Decisions — T2 review" sound name "Glass"' 2>>"$LOG" || true

# Touch REVIEW-PENDING.txt — Đạm thấy file trong tree
echo "$TIMESTAMP — T2 scan pending. Gõ /teams-decision-scan trong Claude Code để chốt-từng-câu." > "$SKILL_DIR/REVIEW-PENDING.txt"

# Mark fired today
echo "$TODAY" > "$MARKER"

echo "[$TIMESTAMP] Fired OK. Marker set." >> "$LOG"
