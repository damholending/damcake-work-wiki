---
status: personal-sop
type: monthly-checklist
owner: dam.ho@cake.vn
last_updated: 2026-05-14
---

# Checklist Ngày 15 — Refresh Lending Portfolio Tracking

> Chạy 9:00 sáng ngày 15 hằng tháng. Scheduled task `monthly-lending-portfolio-refresh` sẽ tự ping. Anh chỉ cần check theo flow dưới.

---

## ✅ Bước 1 — Confirm Finance đã close (5 phút)

- [ ] Check Slack `#finance-close` hoặc DM Finance team: tháng vừa rồi close xong chưa?
- [ ] Nếu CHƯA → reply scheduled task "Finance chưa close, dời 3 ngày" → tự bump sang 18.
- [ ] Nếu RỒI → tiếp Bước 2.

---

## ✅ Bước 2 — Drop file P&L mới (3 phút)

**File bắt buộc:**
- [ ] `Raw/Finance/P&L/P&L_2026_Actual.xlsx` ← đè file cũ bằng file Finance gửi

**File optional (chỉ khi có):**
- [ ] `Raw/Lending/Monthly Report/[Tháng]-Cake Monthly Report 2026.pptx` (download từ Risk Committee deck)
- [ ] `Raw/Risk/Risk Committee T[X]-2026.pdf` (nếu họp Risk Committee tháng đó rồi)

**File chỉ khi Budget revise (rare):**
- [ ] `Raw/Finance/P&L/P&L-Budget-2026.xlsx` ← chỉ khi CFO/Finance update budget mid-year

---

## ✅ Bước 3 — Trigger Claude refresh (1 phút)

Trong scheduled task chat, reply: **"Raw đã update, refresh dashboard nhé"**

Claude sẽ tự động:
1. So timestamp Raw vs JSON
2. Regenerate `lending-pl-data.json`
3. Update artifact `lending-portfolio-tracking`
4. Báo top 3 changes vs tháng trước
5. Flag breach: LG2 >11%, PBT pacing < 33% run-rate, NPL spike >+1pp QoQ

---

## ✅ Bước 4 — Quick review (5 phút)

- [ ] Mở artifact `lending-portfolio-tracking` trong Cowork sidebar
- [ ] Kiểm 4 KPI cards: Disbursement, PBT, TOI, PBO — pacing có healthy không?
- [ ] Kiểm Monthly trend chart: actual có còn track Budget?
- [ ] Kiểm By Product: product nào miss/beat budget?
- [ ] Kiểm Channel × Product: channel nào net yield xuống dưới 5%?

---

## ✅ Bước 5 — Share team (2 phút) — Optional

Nếu có insight quan trọng (KPI breach hoặc product big move):
- [ ] Drag artifact HTML vào Slack `#lending-team`
- [ ] Hoặc upload Drive `cake.vn` → share scope team Lending+Finance
- [ ] Note 1 dòng headline: "PBT pacing X% sau Y/12 tháng. Watch: [breach metric]"

---

## 🟠 Quarterly Addendum (Mar/Jun/Sep/Dec)

Khi tháng 15 trùng cuối Q (Mar 15, Jun 15, Sep 15, Dec 15) — chuẩn bị thêm UE files:

- [ ] Tạo folder mới `Raw/Finance/Unit Economic/Q[X][YY]/` (vd: `Q226/`)
- [ ] Drop 5 file aggregate: `Total-CashLoan-Q[X][YY].xlsx`, `Total-Payday-...xlsx`, `OD-...xlsx`, `Total-Paylater-...xlsx`, `UPL_Q[X]_[YY].xlsx`
- [ ] Drop per-channel CL/PD files vào subfolder (cho Section 5.3 pricing)
- [ ] Drop UE PPT: `Unit Economics_Q[X]_[YY].pptx`

→ Scheduled task tự detect folder mới và pull UE quarterly data.

---

## 🚨 Anti-patterns

- ❌ **Đừng paste số trực tiếp vào artifact HTML** — số chỉ sống trong JSON ground truth.
- ❌ **Đừng share Raw file ngoài team Lending+Finance** — số P&L confidential.
- ❌ **Đừng skip Bước 1** — nếu Finance chưa close mà refresh sẽ pull số preliminary, dễ lost trust.
- ❌ **Đừng annualize quarterly rate** — Yield/CoR là quarterly, anh muốn xem annual phải × 4 rough.

---

## Cadence summary

| Khi nào | Action |
|---|---|
| **Mỗi 15** | Drop P&L_2026_Actual.xlsx mới + reply task |
| **15 sau Q close** (15 Apr, 15 Jul, 15 Oct, 15 Jan) | + Drop UE folder Q mới |
| **Khi Budget revise** (rare) | + Update P&L-Budget-2026.xlsx |
| **Khi launch scheme mới** | + Update Product Scheme_2025.xlsx |

---

**Maintainer:** Đạm (dam.ho@cake.vn) · **Owner artifact:** `lending-portfolio-tracking`
