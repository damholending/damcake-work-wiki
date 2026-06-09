#!/bin/bash
# SessionStart hook — check REVIEW-PENDING.txt, display reminder if exists
# Triggered automatically when Claude Code session starts in this workspace.

set -euo pipefail

MARKER="/Users/dam.ho/Desktop/Work/damcake-work-wiki/.agents/skills/teams-decision-scan/REVIEW-PENDING.txt"

if [ -f "$MARKER" ]; then
  cat <<EOF

═════════════════════════════════════════════════════════
⚠️  T2 SCAN PENDING — Teams decisions tracker chưa review
═════════════════════════════════════════════════════════

  Cron fired: $(cat "$MARKER")

  → Gõ /teams-decision-scan để chốt-từng-câu + append tracker
  → File output: Wiki/_team-shared/decisions-tracker.md
  → Sau review, upload tracker lên Claude project KB

═════════════════════════════════════════════════════════

EOF
fi

exit 0
