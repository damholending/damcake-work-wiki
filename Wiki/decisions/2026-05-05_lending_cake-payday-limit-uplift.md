---
status: decision-log
type: decision-log
topic: lending, payday, cake-channel, repeat, limit-uplift
---

# 2026-05-05 — Cake Payday: Uplift limit Repeat customer

**Domain:** lending
**Mode:** data-driven (sau khi Product team chốt với risk data từ roll rate)
**Stakes:** medium (Payday daily volume 1-2 tỷ uplift, Provision%ANR cho phép tăng nhẹ trong target)
**Reversibility:** reversible per NTB band
**KPI link:** Disbursement 40k / PBT 700 / %LG2 ≤11%

## Situation

Cake Payday đang trong target NPL/LG2 (Risk Committee T5: NPL 8.8%, LG2 14.6% trong target Payday-specific 15.5%). Repeat customer behavior data (DPD%) cho thấy headroom uplift limit: Repeat FROM2 grand total %DPD = 5.34% vs Repeat FROM0_TO1 = 6.86% → segment repeated nhiều lần có risk thấp đáng kể, có thể tăng limit để capture more disbursement.

## Decision

**Apply Cake Payday limit policy từ tuần đầu T5/2026:**

| Segment | Repeat tag | Current limit | **New limit** |
|---|---|---|---|
| NTB 1-2-3-4 | Repeat (any) | thấp hơn | **6 triệu** |
| NTB 5-6-7 | Repeat **from 2** | reject hoặc thấp | **4 triệu** |

**Conditioning:**
- CLOSED_DAY_FROM6 (sớm hơn FROM10 cũ) — bắt khách hàng repeat nhanh hơn
- NTB5-6-7 vẫn cap chặt 4M + chỉ repeat from 2 (đã ổn định cohort)

## Reasoning

- **Data point chính (Roll rate %DPD per NTB × Repeated tag):**

| NTB | REPEAT_FROM2 %DPD | REPEAT_FROM0_TO1 %DPD |
|---|---|---|
| 1 | 1.14% | 2.54% |
| 2 | 1.92% | 2.01% |
| 3 | 3.18% | 4.55% |
| 4 | 4.09% | 6.23% |
| 5 | 3.37% | 4.55% |
| 6 | 5.06% | 10.29% |
| 7 | 0% (small base) | 10.81% |
| **Grand Total** | **5.34%** | **6.86%** |

→ Repeat ≥2 lần là **proxy risk filter mạnh** — DPD giảm ~25-50% so với first repeat ở mọi NTB band.

- **Mental model áp dụng:**
  - **Risk-adjusted return** — chấp nhận Provision%ANR +3-4% nếu daily +1-2 tỷ (yield Payday cao bù được).
  - **Portfolio thinking** — segment theo NTB × Repeat history thay vì blanket.
  - **2nd order** — Repeat from 2 = self-selection của customer behave tốt qua 2 cycle → lower default risk.
- **Impact dự kiến:**
  - **Disbursement: +1-2 tỷ/daily**
  - **Provision%ANR: +3-4%** (vẫn trong ngưỡng có lời)

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| Product (Lending team) | aligned | ✓ chốt policy |
| PD / Risk | aligned (data DPD support) | ✓ approved |
| BD | aligned (push volume Payday) | ✓ informed |
| CRO | informed via Risk Committee track | — |

## Outcome (update sau)

- [ ] 2 tuần (19/5): first signal — daily disbursement uplift, NTB 5-7 repeat take-up
- [ ] 1 tháng (5/6): KPI dịch chuyển — Provision%ANR actual vs +3-4% expectation
- [ ] 3 tháng (5/8): final — keep, scale, hay rollback? Có lift cap NTB 5-7 từ 4M lên 6M không?

## Lesson (rút ra sau outcome)

*[Sẽ fill sau Outcome review]*

---

**Link:**
- Source: [Risk Committee T5-2026.pdf](../../Raw/Risk/Risk%20Committee%20T5-2026.pdf) Payday section
- Cross-reference: VDS Payday cut Cake<700 + DTN<700 (T4 action), Payday NFR cải thiện về 4.1% T4
