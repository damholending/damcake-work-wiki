---
name: lending-pl-refresh
description: Regenerate Lending P&L + Unit Economics bundle (HTML report + ground-truth JSON) khi Finance close số P&L tháng mới. Run generator → auto-detect tháng đóng sổ → copy outputs về team-hub + HTML-Reports → nhắc upload Claude project (Lending Hub). Trigger - /lending-pl-refresh (manual, Đạm gõ khi có số mới).
---

# Lending P&L Refresh — Monthly

> **Mục đích**: Finance close P&L tháng mới (overwrite Excel trong `Raw/Finance/P&L/`) → Đạm gõ `/lending-pl-refresh` → AI chạy generator, verify, copy bundle, nhắc upload Claude project. **Số tháng YTD tự detect — KHÔNG sửa tay.**

## Trigger

```
/lending-pl-refresh
```

Đạm gõ khi Finance đã đóng sổ tháng mới. Pure manual — P&L close không cố định ngày nên không launchd.

## Pre-condition (Đạm làm trước khi gõ)

1. Overwrite Excel mới vào `Raw/Finance/P&L/` **ĐÚNG TÊN cố định** (script đọc theo path cứng):
   - `P&L_2025_final.xlsx` · `P&L_2026_Actual.xlsx` · `P&L-Budget-2026.xlsx`
2. **Mở file → Save lại trong Excel** trước khi feed (script cần cached values; file chưa recalc → cell trả `None`).

## Flow AI chạy

### 1. Verify source files
```bash
ls -la "Raw/Finance/P&L/"
```
- 3 file đúng tên + báo `mtime` file nào mới update. Thiếu file / sai tên → **DỪNG**, báo Đạm rename.

### 2. Run generator
```bash
cd Projects/Finance-Tracking && python3 lending_pl_html_report.py
```
- In dòng `→ 2026 Actual closed through month N (YTD-<Mon>); annualize ×X` — **AI đọc N này, confirm với Đạm đúng tháng mong đợi** (vd close T5 → phải thấy `month 5 (YTD-May)`).
- Generator tự: auto-detect N từ disbursement anchor · derive risk column + annualize · build sections 1-8 · **carry forward section_9** từ bundle cũ · ghi `/tmp/lending-pl-report.html` + `/tmp/lending-pl-data.json`.

**Nếu FAIL LOUD** (`row X col Y expected '...' got '...'`): Finance đổi layout file. **DỪNG** — báo Đạm + sửa `OVERALL_CFG` / `load_*()` row-col mapping trong `lending_pl_html_report.py` rồi rerun. KHÔNG copy bundle hỏng.

### 3. Verify output (sanity, không cần diff đầy đủ)
```bash
python3 -c "import json;d=json.load(open('/tmp/lending-pl-data.json'));print('sections:',len(d));print('YTD months:',d['_meta']['actuals_2026_complete_through_month']);print('section_9:','section_9_ue_q126_per_channel_extracted' in d)"
```
- Expect: `sections: 17` · `YTD months` = N đúng · `section_9: True` (carried forward).
- section_9 = `False` → bundle cũ thiếu hoặc path sai → báo Đạm trước khi copy.

### 4. Copy bundle về repo
```bash
cp /tmp/lending-pl-data.json   Projects/Finance-Tracking/team-hub/lending-pl-data.json
cp /tmp/lending-pl-report.html Projects/Finance-Tracking/team-hub/lending-portfolio-tracking.html
cp /tmp/lending-pl-report.html HTML-Reports/lending-portfolio-tracking.html
```

### 5. Bump docs
- `Projects/Finance-Tracking/team-hub/lending-pl-guide.md` + `data-schema.md` → frontmatter `last_updated` = ngày hôm nay.
- `_meta.generated_date` trong JSON tự cập nhật (script set theo currentDate).

### 6. Nhắc Đạm upload Claude project
> Bundle mới ở `Projects/Finance-Tracking/team-hub/` — upload `lending-pl-data.json` + `lending-pl-guide.md` + `data-schema.md` lên **Claude project Lending Hub** để team query số mới. (Key period là `2026 YTD` — month-agnostic, team query bằng natural language không đổi.)

### 7. Summary cho Đạm
In ngắn: tháng nào mới close, Disbursement + PBT YTD (Actual vs Budget delta), channel nào miss nặng nhất. Pull từ `section_1_overall_pnl` + `section_4_channel_deep_dive`.

## Edge cases / gotchas

| Tình huống | Xử lý |
|---|---|
| Excel chưa recalc (cell = `' - '`/None) | Tháng đó không được đếm vào N. Nếu N thấp hơn mong đợi → Đạm mở file Save lại, rerun. |
| File sai tên (`..._v2.xlsx`) | Script không thấy → rename đúng chuẩn cố định. |
| Finance đổi layout | FAIL LOUD → sửa row-col mapping, KHÔNG copy bundle hỏng. |
| `section_9` mất (`False`) | Carry-forward đọc từ `team-hub/lending-pl-data.json` cũ. Nếu bundle cũ bị xoá → restore từ git trước khi rerun (`git checkout <commit> -- <path>`). |
| **Sang QUÝ mới** (Q2.26+) | section_8 cache + section_9 là dữ liệu cohort theo QUÝ — KHÔNG tự refresh. Phải chạy AppleScript trong [`refresh-q126-cohort.md`](../../../Projects/Finance-Tracking/refresh-q126-cohort.md) tạo cache quý mới, rồi mới rerun generator. |
| TOI/PBT leak draft tháng N+1 | Anchor = disbursement (đóng sổ sau cùng) nên không bị over-count. Đã handle trong `detect_complete_months()`. |

## Tại sao auto-detect (không hardcode tháng)

Trước đây `ACTUAL_2026_COMPLETE_MONTHS` + label `YTD-Apr` hardcode → mỗi tháng sửa tay 2+ chỗ, dễ lệch. Giờ:
- **Count N** tự detect từ disbursement anchor (`detect_complete_months()`).
- **Period dict-key** = `2026 YTD` (month-agnostic) → KHÔNG đổi tên theo tháng → contract ổn định, không re-doc.
- **Label hiển thị** (`YTD_LABEL`) + **annualize** (`ANNUALIZE = 12/N`) derive động trong `main()`.

→ Skill chạy monthly = zero hand-edit code.

## Files

- Generator: [`Projects/Finance-Tracking/lending_pl_html_report.py`](../../../Projects/Finance-Tracking/lending_pl_html_report.py)
- Output bundle: `Projects/Finance-Tracking/team-hub/` (`lending-pl-data.json` + `lending-portfolio-tracking.html` + guide + schema)
- Mirror HTML: `HTML-Reports/lending-portfolio-tracking.html`
- Quarterly cache: `q126_cohort_ue_cache.json` (+ refresh doc) — chỉ đụng khi sang quý mới.
