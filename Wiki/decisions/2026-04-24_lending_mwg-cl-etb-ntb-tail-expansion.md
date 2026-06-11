---
status: decision-log
type: decision-log
topic: lending, cashloan, mwg, underwriting, risk-relaxation
---

# 2026-04-24 — MWG Cashloan: Mở cấp 20M cho ETB_D/E + NTB_5/6

**Domain:** lending
**Mode:** data-driven (sau khi align Product + PD)
**Stakes:** medium (expand tail segment NTB 5-6 và ETB rating D-E — trước nay reject)
**Reversibility:** reversible (có thể rollback theo từng band)
**KPI link:** Disbursement 40k / PBT 700 / %LG2 ≤11%

## Situation

MWG Cashloan T4 muốn tăng sale (gap với target). 4 segment đang **reject 100%** (ETB rating D, ETB rating E, NTB band 5, NTB band 6) — đây là tail risk nhưng vẫn có cơ hội. Sau khi Product + PD chốt, mở cấp **20M (entry ticket)** cho 4 segment này, giả định risk B0-B4 sẽ tăng nhẹ nhưng vẫn trong target sản phẩm.

## Options considered

1. **Option A — Mở full ticket (40-50M) cho 4 segment:** Cost: risk B0-B4 dự kiến spike > target. Benefit: max uplift sale.
2. **Option B — Giữ nguyên reject 4 segment:** Cost: bỏ lỡ tail volume + signal chuyển dịch khách hàng. Benefit: zero added risk.
3. **Option C (chosen) — Mở cap 20M (entry ticket nhỏ nhất):** Cost: ticket nhỏ → uplift sale giới hạn. Benefit: contained risk (20M < average ticket MWG ~23M), enough volume để collect data risk B0-B4 actual.

## Decision

**Apply MWG Cashloan policy từ 24/04/2026:**
- **ETB_D & NTB_6:** cấp 20M (was: reject)
- **ETB_E & NTB_5:** cấp 20M (was: reject)
- Các band khác giữ nguyên

## Reasoning

- **Data point chính:** Risk Committee T5 báo MWG CL AR 48.4%, signed 90.7%, MWG CL No-score FPD10 chưa flag. ETB rating D-E và NTB 5-6 là tail bị reject → cơ hội mở rộng có giới hạn rủi ro.
- **Mental model áp dụng:**
  - **Portfolio thinking** — entry ticket 20M nhỏ → limit exposure mỗi loan.
  - **Risk-adjusted return** — accept risk tăng 0.5% B0-B4 nếu uplift AR 3-4% (math vẫn dương về P&L).
  - **2nd order** — học behavior tail segment với cap nhỏ trước khi scale ticket.
- **Impact dự kiến:**
  - **AR: +3-4%**
  - **Risk B0-B4: +0.5%** (vẫn trong target sản phẩm)
- **Why not Option A:** Risk spike > target sẽ trigger Risk Manager pushback, không sustainable.
- **Why not Option B:** Tail segment đang reject 100% là wastage — segment chuyển dịch cần baseline data.

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| Product (Lending team) | aligned | ✓ chốt policy |
| PD (Risk PD) | aligned with cap 20M | ✓ approved |
| BD (MWG owner) | aligned (push volume MWG) | ✓ comms với MWG |
| CRO | aligned (within target) | ✓ informed via T5 Risk Committee track |

## Outcome (update sau)

> *Để trống khi log. Append `Update YYYY-MM-DD:` thay vì sửa.*

- [ ] 2 tuần (8/5): first signal — AR thực tế của 4 band, %disbursement 20M ticket
- [ ] 1 tháng (24/5): KPI dịch chuyển — risk B0-B4 actual vs +0.5% expectation, vintage FPD10 4 band
- [ ] 3 tháng (24/7): final — keep cap 20M, scale ticket, hay rollback?

## Lesson (rút ra sau outcome)

*[Sẽ fill sau Outcome review]*

---

**Link:**
- Source: [Risk Committee T5-2026](../../Raw/Risk/Risk%20Committee%20T5-2026.pdf)
- Cross-reference: MWG PL transaction scoring + matrix (Risk Committee T4 action plan), MWG_QTV CL fraud control (T5)
