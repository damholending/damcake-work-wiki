---
status: summary
type: risk-committee-summary
period: 2026-04
source: Raw/Risk/Risk Committee T4-2026.pdf
generated: 2026-05-23
---

# Risk Committee T4/2026 — Summary

Tóm tắt 41 slides Risk Committee T4/2026. Source: [`Risk Committee T4-2026.pdf`](Risk%20Committee%20T4-2026.pdf).

---

## Page 1 — Portfolio & Products

### Tổng quan rủi ro toàn danh mục (T3-2026)

| KPI | Target | Mar-26 | Feb-26 | Jan-26 |
|---|---|---|---|---|
| NPL | 5.8% | **6.4%** | 5.8% | 5.7% |
| Provision%ANR | 25.3% | 26.3% | 24.9% | 20.0% |
| LG2% (CIC) | 11.17% | **11.6%** | 11.2% | 10.6% |

- **EOP Balance**: 9,885 Bil (T3) → forecast 10,030 (T4)
- **LG2% (CIC) / LG2% (Only Cake) = 1.38x** — khoảng cách giảm vs 1.49x T2
- LG2% (Only Cake) tăng mạnh lên **8.39%** T3 — tín hiệu xấu nội tại
- ΔLG2 T3: +78 Bil, ΔBalances: +321 Bil
- **Vintage FPD5%**: cải thiện từ T1/2026 về mốc trước pilot mở chính sách Q4-25
- Forecast: nếu maintain risk, monthly provision giảm 17 Bil trong 3M tới, 27 Bil trong 6M

### Portfolio breakdown — Universal flow

- Universal flow go-live T3-2026 → X/Up/Repeat APP% lên **60% T4** (target 70%)
- Approve%: New 41% / Repeat 45% / Xsell+Upsell 14% (T4)

### Rủi ro theo sản phẩm (T3-2026)

| Sản phẩm | Balance (Bil) | NPL% | Provision%ANR | Target |
|---|---|---|---|---|
| Credit Card | 2,054 | 5.0% | 19.3% | 16.2% ⚠ |
| Overdraft | 104 | **15.7%** | 35.1% | 49.4% |
| Payday | 808 | 9.0% | 6.1%* | 5.3% ⚠ |
| Cashloan | 6,694 | 6.1% | 26.4% | 26.3% |
| Paylater | 225 | **12.7%** | 20.9% | 25.0% |
| **Total** | **9,885** | **6.4%** | **26.6%** | **25.3%** |

(*) Payday đổi methodology sang Provision%Disbursement do chỉ có 1 payment

- ⚠ Payday & Credit Card Provision%ANR cao hơn target
- Payday roll rate RFR B0-B4 T3 = 4.3% (giảm từ 6.4% T2)

---

## Page 2 — Partners, Actions, Fraud, Collection, AML, OPS Risk

### Rủi ro theo đối tác trọng điểm

| Partner | Trạng thái | Highlight |
|---|---|---|
| **VDS** | ⚠ CC & Payday RFR cao | CL/PL cải thiện về target. CC roll rate vượt target tất cả NTB band. Payday cắt VDS Cake<700 + DTN<700 → impact -3% sale volume |
| **Cake app** | ✓ All RFR trong target | Universal flow live T3. AR upsell/xsell T4: Mass 5.4%, VDS 18.8%, ETB 23.2%, Total 9.1%. CC NTB V2 deploy T5 |
| **BE** | ✓ All trong KH | Convert sang BeCake score V2 → AR 14% → **22%** (do dịch chuyển No-score sang band B345) |
| **VNPAY** | ✓ All trong target | RFR thấp, opportunity scale |
| **ZLP** | ✓ RFR thấp hơn KH | Universal flow live 13/03, uplift conv 1.3x. Action relax policy 13/04 (NTB 1&2 cell 20→40, NTB3 cell 20→30, NTB 5&6 cell 8→10) |
| **MWG** | ✓ All trong target | CL: relax combo ETB/NTB chưa impact đáng kể. Salary earner hit rate thấp (5%). PL T4 MTD 4.7% (best), convert sang instalment. Airtime cap 3M/tháng |

### Tổng hợp action chính (slide 26) — biggest impact

| Product | Partner | Action | Impact | Timeline |
|---|---|---|---|---|
| **Cashloan** | **VDS** | Maximize segment Approve=Request | **+3-5 Bil/daily** | T4 |
| **Cashloan** | Cake/ZLP/MWG/VNPay/Be | Maximize Approve=Request | **+3-6 Bil/daily** | T5 |
| Cashloan | Cake | Optimize Universal flow | +0.5 Bil/daily | T5 |
| Cashloan | Be | Convert score v2 | +7% AR, +0.13 Bil/daily | T4 |
| Cashloan | ZLP/MWG | Optimize matrix score | TBD | T4 |
| Payday | VDS | Optimize matrix score | -1% roll rate | T4 |
| Payday | Cake | Optimize repeat | TBD | T4 |
| Paylater | MWG | Transaction scoring + matrix | AR 70% / RR B0 -0.5% Q2 | — |
| Credit Card | Mass/Be/VDS | Convert score v2 | AR new +5-7% | T5 |

### VDS Cashloan — Approve=Request pilot (slide 12)

- Pilot: 10% random cấp approved = requested. Start 17-Mar
- Result: Ticket size 16M → **21M**, sign rate 84% → 90%, uplift **1.3-1.5x**
- Plan T5: full impact cho VDS CL & Cake CL

### Fraud Risk Management

- Casa fraud: combined defense 2% rejected, RBA System + Pulse Liab Core
- **Scam/Fraud transactions giảm từ ~4B (12/2025) → ~0.7B (03/2026)**
- Credit products fraud: KS01 reject 4.54% mismatch info, KS03 blacklist/high risk reject 23.26%
- **VNPost fraud (đầu nậu sale)**:
  - Risk customers/ngày: 20 → 2 (-90%)
  - Hồ sơ/ngày: 150 → 20 (-87%)
  - Transactions to brokers/ngày: 9 → 2 (-80%)
  - Vẫn còn rủi ro do 2.9% sale tập trung kéo

### Collection — AI Agent rollout

| Metric | AI Agents | Human |
|---|---|---|
| Dial T3 (call) | 3.47M | 12.87M |
| Connected rate | 4.5% | 2.9% |
| PTP rate | 13.8% | 10.7% |
| Kept PTP | 38.6% | 40.8% |
| Abandon rate | **11.7%** ↓ từ 29.2% | 16.3% |
| Avg talktime | 38s | 32s |

- AI dial volume = **25% của Human**
- CC pilot T4 (KH qua 3 invoice + chưa quá hạn): %unpaid Due+11 = 1.4% (AI) vs 1.2% (Human) — gap nhỏ
- Per agent thu được 2.3 Bil/tháng (B1-B3), 60 agents HC
- B4+: 7 agents onboard T3, ROR% 2 tuần đầu T4 = 1% (791tr/79 Bil)

### AML

- Daily monitor suspicious transaction, processing case_id, report STR cho VPB
- Plan Q2: build HDNV/HDQT, connect world-check VPBank
- **X-border issues** (16/3 - 13/4):
  - 4 case không có nội dung GD, tổng 455M
  - Case 1 LINH TRƯỜNG SƠN/PHẠM THU ANH: chuyển từ Revolut, nghi crypto cash-out
  - Case 2: nhận DT từ VINACAPITAL INVESTMENT (đầu tư), nội dung "Director Fee" — không match TCSP

### OPS Risk (T4 deck only — không có trong T5)

- **2026 chưa phát sinh SKRRHĐ cần báo cáo**, không có tổn thất
- YTD 2026 (Feb-26): 1 hồ sơ tín dụng gian lận (vs 31 in 2024), 13 hồ sơ eKYC gian lận (vs 18 in 2024)
- KYC error rate: 0.16% do hệ thống, 0.35% do NV (Feb-26)
- Gián đoạn hệ thống phê duyệt Feb-26: 0.75%
- CBS/CMS không gián đoạn

---

## Comparison T4 vs T5

| Metric | T4 deck (T3 data) | T5 deck (T4 data) | Delta |
|---|---|---|---|
| NPL | 6.4% | 6.6% | +0.2pp |
| LG2% (CIC) | 11.6% | 10.84% | -0.76pp ✓ |
| LG2% Payday | — | 14.6% | improving |
| ΔLG2 | +78 Bil | **-23 Bil** | flip negative ✓ |
| ΔBalances | +321 Bil | +457 Bil | +136 Bil |
| Universal flow APP% X/Up/Rep | 60% T4 | 60% T4 | stable |
| **New sections T5** | — | Fraud trends inject (5.3 Bil loss) | new |
| **Sections dropped T5** | OPS Risk | — | — |
