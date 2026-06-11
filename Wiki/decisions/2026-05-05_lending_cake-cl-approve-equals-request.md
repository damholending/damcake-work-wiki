---
status: decision-log
type: decision-log
topic: lending, cashloan, underwriting, cake-channel
---

# 2026-05-05 — Cake CL Approve=Request Rollout

**Domain:** lending
**Mode:** data-driven (sau pilot VDS đã chứng minh impact rõ)
**Stakes:** medium (impact giải ngân ~1.2x cho channel CAKE — channel có KPI ≥40% volume FY)
**Reversibility:** reversible (có thể rollback policy theo NTB band bất cứ lúc nào)
**KPI link:** Disbursement 40k / Cake App ≥40% / PBT 700

## Situation

VDS Cashloan Approve=Request pilot (start 17/3) chứng minh impact rõ trong Risk Committee T4: ticket 16M→21M, sign rate 84%→90%, uplift 1.3-1.5x, **+3-5 Bil/daily**. T5 plan: scale full sang Cake CL. Sau khi chốt với Biz, Cake CL có policy riêng để cân bằng risk:

- NTB12 risk dưới target → push toàn bộ
- NTB3 risk đã cao hơn target tổng port → giới hạn pilot 10% để theo dõi

## Options considered

1. **Option A — Full Approve=Request all NTB 1-6 (giống VDS):** Cost: NTB3+ risk có thể spike (NTB3 đã > portfolio target). Benefit: max uplift sale (~1.4-1.5x).
2. **Option B — Approve=Request NTB12 only, NTB3+ giữ nguyên Approve<Request:** Cost: bỏ lỡ uplift NTB3 (segment lớn). Benefit: zero risk addition.
3. **Option C (chosen) — NTB12 100% + NTB3 pilot 10% randomly:** Cost: chậm hơn Option A. Benefit: capture phần lớn uplift NTB12, đồng thời có data NTB3 để decide scale tháng sau.

## Decision

**Apply Cake CL Approve=Request từ 05/05/2026:**
- NTB12: rollout 100%
- NTB3: pilot 10% randomly
- NTB4-6: giữ nguyên (chưa apply)

## Reasoning

- **Data point chính:** VDS pilot ticket 16M→21M, sign rate 84%→90%, uplift 1.3-1.5x (Risk Committee T4 slide 12). Cake CL Risk Committee T5 báo NPL 5.8% Apr-26, vẫn dưới target Dec-26 5.9%.
- **Mental model áp dụng:**
  - **Portfolio thinking** — segment-level policy thay vì blanket policy. NTB12 vs NTB3+ là 2 tier risk khác nhau.
  - **Pre-mortem** — "nếu fail thì fail vì gì?" → NTB3 risk spike vì base đã cao → cap pilot 10% để giới hạn downside.
  - **2nd order** — nếu pilot NTB3 OK sau 1-3 tháng → scale full; nếu fail → rollback, NTB12 không bị ảnh hưởng.
- **Impact dự kiến:**
  - Sale: **1.2x uplift giải ngân** (thấp hơn VDS 1.3-1.5x vì NTB3+ giới hạn)
  - Risk: expect unchanged (NTB12 base risk thấp, NTB3 chỉ 10% sample)
- **Why not Option A:** NTB3 risk > target nên blanket policy là blow up portfolio risk. CRO không buy-in.
- **Why not Option B:** Bỏ lỡ uplift NTB3 = giảm volume + miss cơ hội học data NTB3 behavior.

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| CRO | aligned (data từ VDS đủ thuyết phục) | ✓ approved trước 5/5 |
| Risk Manager | aligned with caution (NTB3 cap) | ✓ briefed, monitor weekly |
| Lending team (Lâm CL owner) | aligned | ✓ kicked off 5/5 |
| BD | aligned (push volume) | ✓ informed |
| Finance | informed | ✓ impact +1.2x vào forecast |

## Outcome (update sau)

> *Để trống khi log. Append `Update YYYY-MM-DD:` thay vì sửa.*

- [ ] 2 tuần (19/5): first signal — sale uplift đo được + NTB3 pilot %FPD10 đầu tiên
- [ ] 1 tháng (5/6): KPI dịch chuyển — Cake CL disbursement vs Apr, NTB3 vintage FPD chưa spike?
- [ ] 3 tháng (5/8): final — model confirm? Có nên scale NTB3 lên 100% hoặc tăng pilot ratio không?

## Lesson (rút ra sau outcome)

*[Sẽ fill sau Outcome review]*

---

**Link:**
- Source decision context: [Risk Committee T4-2026 — slide 12 VDS pilot](../../Raw/Risk/Risk%20Committee%20T4-2026.pdf) · [T5 Cake CL portfolio status](../../Raw/Risk/Risk%20Committee%20T5-2026.pdf)
- Cross-reference: VDS CL Approve=Request rollout (Risk Committee T4 action plan)
