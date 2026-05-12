---
status: wiki
type: domain-knowledge
topic: finance, p&l, biz-plan, unit-economics
---

# Finance — Mental Model

> Domain note về P&L, Biz Plan, Unit Economics tại Cake.
> *Last updated: 2026-05-11*

## Cadence

| Tần suất | Meeting | Host | Vai trò Đạm |
|---|---|---|---|
| Monthly | P&L Review | Finance team | Input/proposal cho mảng Lending khi cần |
| Monthly | Risk Committee | CRO | Input/proposal khi cần |
| Quarterly | Biz Plan review | Finance/CEO | Owner cho phần Lending |

## P&L của Lending

**Công thức tâm trí (mental model):**

```
PBT_lending = Σ (yield × volume) - operating cost - expected loss
```

- **Yield** = effective interest rate trên dư nợ
- **Volume** = dư nợ trung bình (không phải disbursement) — quan trọng cho yield calc
- **Expected loss** = CoR × volume — phải đối chiếu với reserve

**Target 2026:**
- PBT: **700 tỷ VND**
- Disbursement: 40,000 tỷ (mặc dù PBT-first, không nhất thiết hit volume mới hit PBT)

## Key Reports cần track

| Report | Tần suất | Raw |
|---|---|---|
| P&L Q1 26 | Quarterly | `Raw/Finance/P&L/PL_Q1_26.xlsx` |
| Revenue report 2025 | Annual | `Raw/Finance/P&L/0. Revenue report Cake 2025_final.xlsx` |
| Monthly Report | Monthly | `Raw/Finance/P&L/Cake Monthly Report Mar 2026_1.pptx` |
| Unit Economics Q1 26 | Quarterly | `Raw/Finance/P&L/Unit Economics_Q1_26.pptx` |
| P&L Lending Actual | Monthly | `Raw/Lending/Analytics/P&L Lending_Actual 2026.xlsx` |
| Sub-P&L theo product | Quarterly | UPL_Q1_26, CashLoan_Q1_26, Payday_Q1_26, OD_Q1_26 |

## Biz Plan 2026

- North Star: **Road to 3K** (May) → **4K** (Q3) — đo bằng disbursement (?)
- Cake - Plan & Budget 2026 tracking — file canonical mới nhất ở [`Biz-Plan-2026/Cake - Plan & Budget 2026_tracking_update.xlsx`](../../Raw/Finance/Biz-Plan-2026/)
- Lending plan riêng: [`Lending Cake 2026.xlsx`](../../Raw/Finance/Biz-Plan-2026/Lending%20Cake%202026.xlsx)
- Action plan ZLP 4K: [`Action plan ZLP4k_2026_v2.xlsx`](../../Raw/Finance/Biz-Plan-2026/)

## Communicate với Finance/CFO

- **Style:** Aggressive, thẳng thắn, hay challenge
- **Cần ready:** số chính xác, anticipate câu hỏi, đừng vague về cost/revenue
- **Frame:** weighted pros/cons + numbers, không đếm số lượng

## Decisions / Lessons

- (cần feed)

---

**Raw materials:** [`../../Raw/Finance/`](../../Raw/Finance/)
