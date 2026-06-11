---
status: decision-log
type: decision-log
topic: lending, cashloan, zalopay, limit-uplift
---

# 2026-05-05 — ZaloPay Cashloan: Uplift limit NTB 1-2-3

**Domain:** lending
**Mode:** data-driven (roll rate ZLP CL còn headroom vs target)
**Stakes:** medium (+10% disburse channel ZLP)
**Reversibility:** reversible per NTB band
**KPI link:** Disbursement 40k / PBT 700 / %LG2 ≤11%

## Situation

ZaloPay CL roll rate Total **3.80% vs target 4.90%** → channel có headroom risk. NTB 1-2-3 chiếm **84% disbursement** (40% + 12% + 32%) nhưng avg ticket vẫn dưới max cap (NTB1 18.1M < 50M, NTB2 16.4M < 50M, NTB3 14.4M < 40M). Tăng cap để khai thác đầy đủ tier KH tốt nhất, giữ tier NTB 5-6 không action vì roll rate đã cao (7.83% và 8.39%, lệch xa target).

## Decision

**Apply ZaloPay Cashloan limit policy từ tuần đầu T5/2026:**

| NTB band | Current cap | **New cap** | Δ |
|---|---|---|---|
| NTB 1 | 50 triệu | **70 triệu** | +20M |
| NTB 2 | 50 triệu | **60 triệu** | +10M |
| NTB 3 | 40 triệu | **50 triệu** | +10M |
| NTB 4-6 | Giữ nguyên | — | — |

## Reasoning

- **Data point chính — ZLP CL Roll rate & Disbursement mix:**

| NTB | Roll rate | %Disbursement | Avg Ticket (triệu) |
|---|---|---|---|
| 1 | 2.14% | 40% | 18.1 |
| 2 | 3.77% | 12% | 16.4 |
| 3 | 4.89% | 32% | 14.4 |
| 4 | 5.77% | 4% | 11.2 |
| 5 | 7.83% | 5% | 8.7 |
| 6 | 8.39% | 7% | 6.80 |
| **Total** | **3.80%** | **100%** | **14.0** |
| Target | 4.90% | | |

→ NTB1-3 (84% mix) có roll rate 2.14-4.89% — tất cả dưới target 4.90%. Có room push ticket size.

- **Mental model áp dụng:**
  - **Risk-adjusted return** — uplift ticket NTB tốt thì doanh thu/loan tăng mà risk/loan không tăng tương ứng (NTB1-3 historical stable).
  - **Portfolio thinking** — chỉ action 3 band có headroom rõ, không touch NTB 4-6 vì roll rate đã sát/vượt target.
  - **Munger Inversion** — "what kills this rollout?" → NTB5-6 push limit thì blow up roll rate. Strip out trước.
- **Impact dự kiến:**
  - **Disbursement: +10%** (focus uplift trên 84% mix NTB1-3)
  - **Risk: expect unchanged** (NTB1-3 roll rate vẫn dưới target sau uplift)

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| Risk | aligned (data roll rate support, NTB4+ giữ nguyên) | ✓ approved |
| Product (Lending team) | aligned | ✓ chốt policy |
| BD (ZLP owner) | aligned (push volume) | ✓ comms với ZaloPay partner |
| CRO | aligned (within ZLP target) | ✓ informed via T5 Risk Committee track |

## Outcome (update sau)

- [ ] 2 tuần (19/5): first signal — avg ticket NTB1-3 actual, %disbursement mix shift
- [ ] 1 tháng (5/6): KPI dịch chuyển — disburse +10% confirmed? Roll rate NTB1-3 spike không?
- [ ] 3 tháng (5/8): final — uplift cap further (NTB1 lên 80M, NTB2 lên 70M)?

## Lesson (rút ra sau outcome)

*[Sẽ fill sau Outcome review]*

---

**Link:**
- Source: ZaloPay CL roll rate analysis · [Risk Committee T5-2026.pdf](../../Raw/Risk/Risk%20Committee%20T5-2026.pdf)
- Cross-reference: Universal flow live ZLP 13/03 (uplift 1.3x conv), relax policy 13/04 (cell 20→40/30/10)
