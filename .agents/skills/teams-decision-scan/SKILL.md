---
name: teams-decision-scan
description: Scan MS Teams group chats → extract decisions/action items → walk Đạm chốt-từng-câu → append vào Wiki/_team-shared/decisions-tracker.md → notify upload Claude project. Trigger: /teams-decision-scan (manual) hoặc auto launchd T2 sáng (multi-slot 9/10/11/12/14h, first awake wins).
---

# Teams Decision Scan — Weekly

> **Mục đích**: T2 sáng Đạm bật máy → launchd auto fire reminder → Đạm gõ `/teams-decision-scan` → AI scan full week + Đạm review chốt → append tracker → upload Claude project KB.

## Why manual-driven (không headless auto)

M365 MCP gắn với account claude.ai (OAuth web). Headless `claude -p` CLI dùng `~/.claude/mcp.json` local — KHÔNG có M365. → Scan PHẢI chạy trong VSCode Claude Code session (inherits claude.ai MCPs).

launchd chỉ làm 2 việc:
1. **Reminder**: macOS notification "Time to scan Teams"
2. **Open VSCode**: workspace mở sẵn để Đạm gõ slash command

## Trigger

```
/teams-decision-scan
```

Đạm gõ T2 sáng sau notification.

## Auto-reminder (launchd)

Plist: `com.dam.teams-decision-scan.plist`. Fires Monday 9/10/11/12/14h. Marker file `LAST-FIRED.txt` đảm bảo chỉ chạy 1 lần/tuần (first awake fire wins).

| Mac state T2 sáng | Behavior |
|---|---|
| Awake từ 9h | Fire 9h slot → notification + open VSCode |
| Sleep tới 11h | Fire 11h slot khi user wake (launchd catch-up) |
| Sleep cả ngày | No fire → Đạm manual gõ slash command khi nhớ |

## Input files

- **Group config**: [`groups.txt`](groups.txt) — danh sách chat ID + alias, 1 dòng/group, format: `<alias> | <chatId>`. Đạm maintain file này.
- **Live tracker**: [`Wiki/_team-shared/decisions-tracker.md`](../../../Wiki/_team-shared/decisions-tracker.md) — file canonical decision history.

## Process (AI follow strictly)

### Step 1. Boot context (~30s)

1. Read `groups.txt` → loop chat IDs
2. Read `Wiki/_team-shared/decisions-tracker.md` → tìm last weekly section, lấy `last_scan_date`. Nếu file empty → fallback 7 ngày trước.
3. Báo Đạm: "Scan từ {last_scan_date} → today, {N} groups: <list alias>"

### Step 2. Scan chat messages (M365 MCP)

Cho mỗi chat ID:

- Run sequential queries (KHÔNG parallel — Graph rate limit 100 RPM):
  - Broad keywords thay đổi theo chat topic. Mặc định try: `team`, `cutoff`, `score`, `deploy`, `chốt`, `quyết định`, `sprint`, `ZLP`, `VDS`, `MWG`, `BE`, `precheck`, `Hà Cao Vinh`, `risk`, `LOS`.
  - `afterDateTime` = `last_scan_date`
  - `limit` = 25
- Filter results theo chatId match
- Khi gặp 429 rate limit → wait 65s background → resume
- Use `read_resource` cho message dài bị truncate

**Rate limit budget**: ~5-10 broad queries/min. Plan accordingly.

### Step 3. Build draft table

Format: markdown table giống decisions-tracker.md schema:

| # | Decision / Item | Date | Status | Owner next | Next action | Deadline |
|---|---|---|---|---|---|---|

**Extraction rules**:
- ✅ DECISIONS (chốt): action explicit, rule mới, deploy mới, scheme mới
- ✅ OPEN ITEMS (chờ chốt): question pending response, blocker
- ❌ SKIP: small talk, status report ko có decision implication, social

**Anti-conflate rule**: 
- Mỗi decision **chỉ từ 1 chat** — không merge cross-chat (vì context khác).
- Nếu topic xuất hiện 2 chat → tạo 2 entry riêng, note overlap.

### Step 4. Interactive review (chốt-từng-câu)

Walk Đạm từng D1, D2... Pattern:

```
**D{N} — {short title}**
- Context: {1-2 sentence summary với date + người}
- Pending: {what's open}

Chốt gì?
```

Đợi Đạm reply. Possible responses:
- **Chốt + detail** → update entry, status="confirmed"
- **Hold-on / chưa quyết** → entry mark `⏸️ Hold-on`, status pending
- **Delete / bỏ** → drop entry
- **Follow up với X** → entry với next action = "follow up X"
- **OK** → accept proposed status

Sau mỗi response → tiếp D{N+1}, KHÔNG batch.

### Step 5. Finalize + append + sync

Sau khi chốt hết:

1. Show final consolidated table (re-numbered).
2. Append vào `Wiki/_team-shared/decisions-tracker.md`:
   ```
   ## Week of YYYY-MM-DD → YYYY-MM-DD
   
   *Scanned: {list groups}. Last reviewed: {today}.*
   
   {table}
   
   ---
   ```
3. **Delete `.agents/skills/teams-decision-scan/REVIEW-PENDING.txt`** — clears SessionStart hook reminder.
4. **Auto-commit + push to GitHub** (Claude project KB tự sync qua GitHub Integration):
   ```bash
   gh auth switch -u damholending   # ensure work account
   git add Wiki/_team-shared/decisions-tracker.md
   git commit -m "Decisions tracker: Week of YYYY-MM-DD"
   git push origin main
   gh auth switch -u hodinhdam       # switch back personal
   ```
5. Báo Đạm:
   > Final list pushed. Claude project KB sẽ auto-sync trong vài phút qua GitHub Integration.

### Step 6. (Optional) Reminder cho item pending

Nếu có decision Hold-on hoặc deadline next week → flag riêng cuối message:

```
⚠️ Cần follow-up trong tuần:
- D{N}: ... (deadline {date})
- D{M}: ... (hold-on, re-visit khi có data {X})
```

## Anti-patterns (DON'T)

- ❌ DON'T merge decisions từ multiple chats vào 1 entry
- ❌ DON'T tự suggest decision Đạm chưa say — chỉ list pending state
- ❌ DON'T parallel M365 queries — chắc chắn rate limit
- ❌ DON'T fabricate dates/names — chỉ dùng dữ liệu từ message thật
- ❌ DON'T skip Step 4 (chốt-từng-câu) — đây là core value, Đạm own quyết định

## Future extensions

- Cron auto-trigger via `CronCreate` (T2 sáng 9:00) → AI scan + save draft → Đạm review manual sau
- Multi-week diff: compare current week vs prior → flag items recurring (chưa chốt 2+ weeks)
- Auto-tag decision theo product/channel (BE / VDS / ZLP / MWG)

---

*Skill created: 2026-06-09 (based on first manual scan session). Update khi flow đổi.*
