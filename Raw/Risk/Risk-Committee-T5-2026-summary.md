---
status: summary
type: risk-committee-summary
period: 2026-05
source: Raw/Risk/Risk Committee T5-2026.pdf
generated: 2026-05-23
---

# Risk Committee T5/2026 — Summary

Tóm tắt 35 slides Risk Committee T5/2026. Source: [`Risk Committee T5-2026.pdf`](Risk%20Committee%20T5-2026.pdf).

---

## Page 1 — Portfolio & Products

### Tổng quan rủi ro toàn danh mục (T4-2026)

| KPI | Target Dec-26 | Apr-26 | Mar-26 | Feb-26 |
|---|---|---|---|---|
| NPL | 5.9% | **6.6%** | 6.4% | 5.8% |
| Provision%ANR | 26.87% | 26.2% | 26.3% | 24.9% |
| LG2% Payday | 15.5% | **14.6%** | 15.7% | 14.9% |
| LG2% Other products | 10.01% | 10.5% | 11.2% | 10.5% |

- **EOP Balance**: 10,342 Bil (T4) → forecast 10,792 (T5)
- **ΔLG2 T4: −23 Bil** trong khi balance tăng +457 Bil → growth không đi kèm risk
- LG2% (CIC) / LG2% (Only Cake) = 1.37x stable
- NPL trend: 5.5% (Aug-25) → 6.6% (Apr-26), tăng 8 tháng liên tiếp

### Portfolio breakdown — Universal flow impact

- Universal flow go-live **T3-2026** → X/Up/Repeat APP% lên **60% T4** (target 70%)
- Approve%: New 41% / Repeat 49% / Xsell+Upsell 10% (T4)
- Segment giải ngân mới (từ Feb-26) chỉ bằng **3/4 risk** portfolio cũ, chiếm **43% balance**
- Forecast: LG2% Other products → 10.0% cuối Q2-26 (= Base KPI), 8.5% cuối Q4
- Roll rate B0→B1: 5.0% → 3.5% (giảm)

### Rủi ro theo sản phẩm (T4-2026)

| Sản phẩm | Balance (Bil) | NPL% | Provision%ANR | Target |
|---|---|---|---|---|
| Credit Card | 2,185 | 4.1% | 17.5% | 16.3% ⚠ |
| Overdraft | 89 | **14.8%** | 31.4% | 50% |
| Payday | 820 | 8.8% | 5.6%* | 5.4% ⚠ |
| Cashloan | 7,018 | 5.8% | 26.3% | 26.8% |
| Paylater | 230 | **10.9%** | 17.8% | 23.4% |
| **Total** | **10,342** | **6.6%** | **26.2%** | **25.8%** |

(*) Payday đổi methodology sang Provision%Disbursement do chỉ có 1 payment

- **Payday NFR cải thiện** về sát target (4.1% T4) sau action plan
- Roll rate các sản phẩm còn lại đều trong target
- ⚠ Provision%ANR Payday và Credit Card cao hơn kế hoạch

---

## Page 2 — Partners, Fraud, Collection, AML

### Rủi ro theo đối tác trọng điểm

| Partner | Trạng thái | Highlight |
|---|---|---|
| **VDS (Viettel Money)** | ✓ Trong target | VDS CL No-score FPD10 **2.3% vs Mass 4.6%** — chỉ duyệt NTB 1-2-3 (tier tốt nhất) |
| **Cake app** | ✓ All RFR trong ngưỡng | Cashloan/CC/OD/Payday đều OK |
| **BE** | ⚠ Cashloan NFR cao hơn KH | 3 đợt action: BeCake score V2 (16.04), open active #3 (25.04), precheck filter (17.05). %active_loan lên 8% |
| **VNPAY** | ✓ All trong target | Risk thấp, có thể mở rộng |
| **ZLP** | ✓ NFR thấp hơn KH | ZLP No-score FPD10 **5.83% vs Normal 2.97%** — chưa scale được |
| **MWG** | ✓ All trong target | 1tr PL AR ~75%, utilization 28% vs Normal 35%. Profile NTB 1-2-3 = 45% vs Normal 75% (tier KH tốt ít hơn) |

> **Lưu ý NTB**: NTB score thấp = risk thấp = tốt. NTB band 1-2-3 là tier tốt nhất.

### Fraud Risk Management

- Fraud rate T4 giảm vs T3 nhờ control MWG_QTV
- **MWG_QTV CL**: giảm xuống 6.98% (vẫn là tệp lớn nhất)
- **VPO_cashloan**: tăng 3.7% do tụ điểm mới
- Casa: 65,230 rule triggered, 35,122 fraud confirmed (98% high-risk manual check)
- **2 trend mới T4-5**:
  - Mở tài khoản inject Face Auth: 17 client, loss 3.88 Bil
  - Change device + scam: 32 client, loss 1.4 Bil
- Action: SSIM model, block device, Liab Risk tool

### Collection & AI Callbot

| Metric | Cashloan B0 | Credit Card B0 |
|---|---|---|
| Callbot %unpaid DPD10 | 5.3% | 5.2% |
| Human %unpaid DPD10 | 4.9% | 5.4% |
| Gap | +0.4pp Human win | Callbot ngang/tốt hơn |

- **Unit economics**: Callbot 882đ/1tr thu được vs Human 3,444đ (= **26%** cost)
- Unit cost/phút: Callbot 2,200đ vs Human 7,004đ
- MOB 1 (KH mới): Human tốt hơn hẳn → keep Human
- NTB score range 1 (KH tốt): Callbot ngang/tốt hơn Human
- Chi phí thu hồi T4 = 4.7 Bil (+103% MoM, do incentive 2025 + mua máy)

### AML

- Case Nguyễn Thị Thúy Sơn: 560tr GD nhận tiền, cần collect chứng từ
- 91 trans total, 21 reject (23.08%): 71.43% do product_compliance_rule (thiếu info), 14.29% rule CCL, 14.29% other
- ⚠ **246 KH trong danh sách PCRT chưa xử lý** — trong đó 16 KH đã GD, 4 KH có credit product
- Compliance gap nghiêm trọng, cần SLA cleanup + owner
