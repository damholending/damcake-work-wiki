---
status: decision-log
type: decision-log
topic: lending, cashloan, vds, underwriting, scenario-analysis
---

# 2026-05-25 — VDS Cashloan Approve=Request: Chốt Scenario S2 (post-pilot scoping)

**Domain:** lending
**Mode:** data-driven (3 scenario phân tích, cashflow + SAP model)
**Stakes:** high (VDS là channel volume lớn nhất CL, mỗi 0.1x uplift = ~44 tỷ GN/tháng)
**Reversibility:** reversible per scenario
**KPI link:** Disbursement 40k / PBT 700 / %LG2 ≤11%

## Situation

VDS CL pilot 10% Approve=Request (start 17/3, báo cáo T4) cho gross potential **uplift ticket 16M→21M, sign rate 84%→90%, 1.3-1.5x sale** (theo Risk Committee T4 slide 12). Tuy nhiên khi phân tích kỹ correlation **ticket size ↑ vs risk ↑** trên port Cake → **độ nhạy rất cao trên overall**, không thể blanket rollout. Sau khi chốt với biz, đã phân tích 3 scenarios + filter segment xấu, **chọn S2**.

## Options considered

3 scenarios analyzed (chi tiết slide 5):

1. **S1 — Conservative:** [details TBD] — uplift thấp hơn S2, risk thấp hơn
2. **S2 (chosen) — Optimal:** GN +1.09x, risk +1.05x. Cashflow + SAP model → vẫn LN dương.
3. **S3 — Aggressive:** uplift cao hơn S2, risk vượt threshold → reject

**Filter segment xấu (apply across all scenarios):** Exclude **HSSV / Worker / Unemployed** (risk rất cao) → tradeoff: max uplift giảm từ **1.26x → 1.12x**.

## Decision

**Apply Scenario S2 cho VDS CL Approve=Request:**
- **Uplift sale dự kiến:** GN +1.09x
- **Risk dự kiến:** +1.05x (vẫn LN dương)
- **Exclude segments:** HSSV, Worker, Unemployed (zero action)
- **Hạn chế:** Không full rollout 1.3x được — sensitivity ticket↑ → risk↑ trên Cake port quá cao.

## Reasoning

- **Data point chính (theo T3/2026 doanh thu share qua VDS):**

| Metric | Baseline (T3) | S2 forecast | Delta |
|---|---|---|---|
| GN | 498 tỷ | **542 tỷ** | **+44 tỷ (+9%)** |
| Doanh thu | 120 tỷ | **131 tỷ** | **+11 tỷ (+9%)** |
| Risk | 41 tỷ | **43 tỷ** | **+2 tỷ (+5%)** |

- **Mental model áp dụng:**
  - **Risk-adjusted return** — chấp nhận risk +5% nếu doanh thu +9% (delta margin ~+9 tỷ ròng).
  - **Portfolio thinking** — sensitivity heterogeneous theo NTB band: **NTB5-6 (bad band)** mới là contributor chính của correlation ticket↑/risk↑. NTB1-4 sensitivity thấp.
  - **Munger inversion** — "what kills rollout 1.3x?" → answer là HSSV/Worker/Unemployed + NTB5-6 → strip out trước khi scale.
  - **2nd order** — uplift gross 1.26x sau filter còn 1.12x, sau S2 còn 1.09x. Đây là chi phí của risk control, nhưng còn dương đáng kể về absolute.
- **Why not S3:** risk +X% vượt threshold sản phẩm, blow up trade-off.
- **Why not S1:** quá conservative, bỏ lỡ ~½ uplift available.

## Key Insights (từ pilot này)

> Đây là lần đầu **quantify** sensitivity correlation ticket↑/risk↑ trên port Cake.

1. **Cake port có độ nhạy cao giữa ticket size và risk overall** → KHÔNG thể blanket rollout 1.3x. Đây là correction quan trọng vs initial T4 expectation.
2. **Sensitivity chỉ thể hiện ở NTB5-6 (bad band).** NTB1-4 vẫn behave well → policy nên segment theo NTB band thay vì blanket (giống như approach Cake CL: NTB12 100% + NTB3 pilot 10%).
3. **Segment HSSV/Worker/Unemployed là tail rất xấu** — cost +14pp uplift (1.26x → 1.12x) chỉ để exclude segment này → confirm decision exclude là đúng.

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| CRO | aligned (S2 fit risk-adjusted return frame) | ✓ approved |
| Risk Manager | aligned (segment exclusion + NTB band logic) | ✓ approved |
| BD (VDS owner) | aligned with reduced uplift expectation | ✓ comms với VDS partner reset 1.09x (was 1.3x communicated) |
| Lending team (CL owner) | aligned | ✓ rollout |
| Finance | informed | ✓ forecast adjusted: +44 tỷ GN/month, +11 tỷ doanh thu, +2 tỷ risk |

## Outcome (update sau)

> *Để trống khi log. Append `Update YYYY-MM-DD:` thay vì sửa.*

- [ ] 2 tuần: first signal — GN actual vs +1.09x expectation, NTB band split confirmed
- [ ] 1 tháng: KPI dịch chuyển — risk +1.05x actualized? Doanh thu +9%?
- [ ] 3 tháng: final — model confirm (sensitivity heuristic NTB5-6 only)? Có thể test mở NTB5-6 nhỏ?

## Lesson (rút ra sau outcome)

*[Sẽ fill sau Outcome review]*

**Working hypothesis cần verify:**
> Sensitivity ticket↑/risk↑ là **NTB-band specific** chứ không phải port-wide. Nếu confirm → tương lai mọi quyết định liên quan ticket size cần phải pivot ra view NTB band trước, không blanket port view.

---

**Link:**
- Source: VDS pilot result Risk Committee T4 slide 12 → [Risk Committee T4-2026.pdf](../../Raw/Risk/Risk%20Committee%20T4-2026.pdf)
- Final scenario S2 chốt biz: [Risk Committee T5-2026.pdf](../../Raw/Risk/Risk%20Committee%20T5-2026.pdf)
- Cross-reference: [2026-05-05 Cake CL Approve=Request](2026-05-05_lending_cake-cl-approve-equals-request.md) — cùng family policy, segment logic khác (NTB12 100% + NTB3 pilot 10%)
