---
status: wiki
type: domain-knowledge
topic: finance, p&l, biz-plan, unit-economics
---

# Finance — Mental Model

> Domain note về P&L, Biz Plan, Unit Economics tại Cake.
> *Last updated: 2026-05-13*

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

| KPI | Số | Scope | Source |
|---|---|---|---|
| PBT | **710 tỷ VND** | CAKE-wide (toàn công ty) | `Raw/Finance/KPI/2026/KPI.png` |
| PBT | **653 tỷ VND** | Lending segment only — committed budget | `P&L-Budget-2026.xlsx` sheet `Lending` R47 |
| Disbursement | **40,024 tỷ VND** | Lending segment | `P&L-Budget-2026.xlsx` sheet `Lending` R7 |

Lưu ý: 700 trước đây ghi nhầm là Lending — đó là CAKE-wide. Lending budget committed = 653.

## Key Reports cần track

| Report | Tần suất | Raw |
|---|---|---|
| P&L Actual 2025 | Annual (closed) | `Raw/Finance/P&L/P&L_2025_final.xlsx` |
| P&L Actual 2026 | Monthly (YTD) | `Raw/Finance/P&L/P&L_2026_Actual.xlsx` |
| P&L Budget 2026 | Annual (locked) | `Raw/Finance/P&L/P&L-Budget-2026.xlsx` |
| KPI 2026 | Quarterly | `Raw/Finance/KPI/` |
| Unit Economics | Quarterly | `Raw/Finance/Unit Economic/` |

## Lending P&L Performance Tracking

Tracking 4 metric chính cho mảng Lending: **Disbursement** (giải ngân) · **TOI** · **Profit before overhead** · **PBT** (Profit after allocation cost).

**Metric definitions:**

| Metric | Định nghĩa | Mental model |
|---|---|---|
| Disbursement | Tổng tiền giải ngân trong kỳ (tỷ VND). Khác với balance/ENR. | Volume metric — không phản ánh profit |
| TOI | Total Operating Income = Net interest income + Net fee income + Other TOI | Top-line revenue Lending segment |
| Profit before overhead | TOI − Provision − Variable expenses. Chưa trừ allocated overhead. | Operating profit per đồng giải ngân |
| PBT | Profit before overhead − Allocated overhead (HR, system, support cost) | Bottom-line Lending — số dùng trong Biz Plan track |

**File → Row mapping** (cho AI khi đọc 3 file P&L thẳng):

| Source file | Sheet | Disb | TOI | Profit before overhead | PBT |
|---|---|---|---|---|---|
| `P&L_2025_final.xlsx` | `Lending` | R7 C12 | R19 C12 | R46 C12 (`Profit before allocation cost`) | R45 C12 (`Profit after allocation cost`) |
| `P&L_2026_Actual.xlsx` | `Total` | R6 C2 | R17 C2 | R52 C2 (`Profit before allocation cost`) | R53 C2 (`Profit after allocation cost`) |
| `P&L-Budget-2026.xlsx` | `Lending` | R7 C6 (`disburse/spend`) | R11 C6 | R45 C6 (`profit_before_overhead`) | R47 C6 (`profit_after_overhead`) |

**Unit conventions:**
- 2025 Actual + 2026 Actual: raw VND → chia 1e9 ra Tỷ VND
- 2026 Budget: đã là Tỷ VND (Bil VND) sẵn

**Month columns:**
- 2025 Actual: C16 (Jan 25) → C27 (Dec 25)
- 2026 Actual: C6 (Jan 26) → C17 (Dec 26)
- 2026 Budget: C62 (Jan 26) → C73 (Dec 26)

**Cách regenerate tracking table:**

```bash
# Console output
python3 Projects/Finance-Tracking/lending_pl_tracker.py

# Markdown output (paste vào doc/Slack)
python3 Projects/Finance-Tracking/lending_pl_tracker.py --md

# Compare YTD up to May (sau khi May data hoàn chỉnh)
python3 Projects/Finance-Tracking/lending_pl_tracker.py --ytd-months 5
```

Script tự validate label match — nếu Finance team đổi cấu trúc file, script fail loud với message chỉ rõ row/col cần update trong `CONFIG`.

**Numbers KHÔNG paste vào wiki** — luôn regenerate từ Raw để tránh stale data. Raw files là single source of truth.

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
