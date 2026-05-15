---
status: team-facing
type: ground-truth-bundle
audience: team-lending-cake
last_updated: 2026-05-14
---

# Lending P&L + Unit Economics — Team Ground Truth

Bundle này chứa số liệu **canonical** cho team Lending Cake query qua Claude (Lending Hub project). Update mỗi khi Finance close monthly/quarterly data.

## Files trong bundle

| File | Mục đích | Ai dùng |
|---|---|---|
| `lending-pl-data.json` | **Ground truth structured data** — tất cả số extract từ Raw P&L + UE files | Claude khi team query |
| `lending-pl-report.html` | Snapshot HTML report — mở browser để xem trực quan | Team đọc nhanh, không cần query |
| `lending-pl-guide.md` | File này — guide đọc data & cách query | Onboarding |

## Scope dữ liệu

**Periods:**
- 2025 Actual (FY full, monthly Jan-Dec)
- 2026 Actual (YTD Jan-Apr — chưa finalize tháng 5+)
- 2026 Budget (FY full, monthly)
- UE quarterly: Q3.25, Q4.25, Q1.26

**Metrics tracking:**
- **P&L absolute (Tỷ VND):** Disbursement, TOI, Provision, Profit Before Overhead (PBO), PBT
- **Unit Economics:** Balance/ANR, OPEX, NPL%, Loan group 2 %, %TOI ratios
- **Per-loan cohort UE (mVND/loan):** ANR, TOI, NII, NFI, Provision, OPEX (5 sub-categories), PBT, PBSC
- **Channel inputs Q1.26:** IR, COF, NIM, AVG Ticket size, AVG Tenor, Approval rate, Signed rate, Insurance penetration

**Breakdowns:**
- By Product: CashLoan (CL), Overdraft (OD), Payday (PD), Paylater (PL)
- By Channel: CAKE · VDS (incl. VDS-PR merged) · ZLP · MWG · Others
- Channel × Product matrix
- **Paylater per-channel Q1.26**: Total / VDS / VDS-EPASS / BE / VNPAY / FPT / MWG

## Section index trong report

| Section | Mô tả |
|---|---|
| 1 | Overall Lending P&L (monthly + YTD + FY × 3 periods) |
| 2 | By Product (CL/OD/PD/PL) Disb-TOI-PBO |
| 3 | Channel × Product matrix 2025 FY |
| 4 | Channel Deep Dive — CAKE / VDS / ZLP / MWG / Others (4.1 channel split, 4.2 per-channel detail with Budget compare, 4.3 yield/margin, **4.3.5 Channel Risk Profile NPL CAKE + NPL CIC + LG2**, 4.3.6 Net Yield + Sharing, 4.4 insights) |
| 5.1 | UE Aggregate Lending trend Q3.25 → Q1.26 (Disb, ANR, TOI, Provision, OPEX, PBT, NPL, LG2 + ratios %ANR + %Disb) |
| 5.2 | UE By Product trend (CL/PD/OD/PL) — flow metrics + risk metrics (NPL/LG2) per product per quarter |
| 5.2.1 | CL Cohort per-loan UE by Channel (mVND/loan, Q3.25 vs Q4.25) |
| **5.2.2** | **Term Loan pricing inputs Q1.26 (CL + PD aggregate)** — IR/COF/NIM/Ticket/Tenor/Approval/Signed/Insurance pen |
| **5.2.3** | **Paylater specific metrics Q1.26 (Top-level)** — New issued / Accumulated / Active / %Active rate / Spending / Balance / Spending per active / Avg balance per active |
| **5.2.4** | **Paylater Channel breakdown Q1.26** — same metrics × 6 channels |
| 5.3 | Q1.26 Channel snapshot CL + PD with **dropdown selector** to highlight 1 channel |
| 5.4 | Trend reads / insights |
| 4.3.6 | **Net Yield (TOI − Risk) by Channel + Partner Sharing** — so sánh fair giữa channels |
| **6** | **MASTER QUERY TABLE — comprehensive channel × product matrix** (xem dưới) |
| **7** | **Partner sharing params** per channel — context cho Net Yield |

## Net Yield & Partner Sharing (Section 4.3.6 + JSON section 7)

**Vấn đề:** raw TOI comparison giữa các channel bị misleading vì mỗi partner có cấu trúc sharing khác nhau.

**Net Yield = TOI − Risk (Provision)** — metric so sánh fair, có sẵn trong Section 6 mỗi entry:
- `net_yield_toi_minus_risk_bil_vnd`
- `net_yield_per_disb_pct`
- `net_yield_per_anr_pct`

**Partner sharing params (JSON section 7)** — `{product: {channel: {param: value}}}`:
- `sharing_toi_risk_dpd90` / `sharing_toi_risk_dpd180` — % TOI+Risk shared with partner từ DPD90+/DPD180+
- `sharing_cof_only` / `sharing_nfi_only` / `sharing_cii_only` / `sharing_risk_dpd90_only` / `sharing_risk_dpd180_only` — component-specific sharing
- None = không share, Cake giữ 100%

**Examples thực tế:**
- **VDS CL**: share 50% TOI+Risk từ DPD180+
- **MWG CL**: share 35% TOI+Risk từ DPD90+
- **ZALOPAY / VNPAY / VNPOST CL**: không share
- **CAKE PD / VDS PD**: share ~52% Risk DPD180+ + nhỏ COF/Risk DPD90

→ Khi so sánh channel: dùng Net Yield, KHÔNG dùng raw TOI. Và check sharing params để biết Cake thực giữ bao nhiêu.

## Section 6 — Master Query Table (dùng cho mọi câu hỏi channel × product)

`section_6_comprehensive_channel_product_matrix` trong JSON là **bảng tra cứu chính**. Flat structure:

```
{period: {"<product>_<channel>": {tất cả metrics}}}
```

- **Periods:** `2025 FY`, `2026 YTD-Apr` (Jan-Apr), `2026 Budget YTD-Apr`, `2026 Budget FY`
- **Keys:** `<product>_<channel>` — vd `CL_CAKE`, `CL_VDS` (đã gồm VDS-PR), `CL_ZLP`, `CL_MWG`, `OD_CAKE`, `Payday_CAKE`, `Payday_VDS`, `Payday_ZLP`, `PL_VDS`, `PL_VDS-EPASS`, `PL_BE`, `PL_VNPAY`, `PL_FPT`, `PL_MWG` ... + các raw channel khác từ 2025 matrix (`CL_BEG`, `CL_NGS`, `CL_VNPAY`, `CL_VNPOST`, `CL_MISA`)
- **Metrics mỗi entry** (None nếu data không có):
  - P&L: `disb_bil_vnd`, `toi_bil_vnd`, `provision_bil_vnd`, `pbo_bil_vnd`
  - Risk: `balance_bil_vnd`, `npl_cake`, `npl_cic`, `lg2`
  - Ratios %Disb: `yield_toi_per_disb_pct`, `cor_provision_per_disb_pct`, `pbo_margin_per_disb_pct`
  - Ratios %ANR: `yield_toi_per_anr_pct`, `cor_provision_per_anr_pct`, `pbo_per_anr_pct`
  - Pricing (Q1.26 CL+PD only): `ir_pct`, `cof_pct`, `nim_pct`, `avg_ticket_mvnd`, `avg_tenor_months`, `approval_rate`, `signed_rate`, `insurance_penetration`
  - Paylater specific: `accumulated_account`, `active_account`, `active_rate`, `new_issued_q1`, `spending_per_active_mar_vnd`, `avg_balance_per_active_vnd`

**Data coverage matrix:**

| Channel group | P&L + Risk | Pricing inputs | Periods |
|---|---|---|---|
| CL/PD: CAKE, VDS (incl VDS-PR), ZLP, MWG | ✓ full | CAKE+VDS only (Budget) | 2025 FY + 2026 YTD + Budget |
| CL: MWG, VNPAY, ZALOPAY, BE, MISA, VNPOST, BEG, NGS | Disb/TOI/PBO (2025 FY only) | ✓ Q1.26 | 2025 FY + 2026 YTD (inputs) |
| PD: VNPAY, ZALOPAY | partial | ✓ Q1.26 | 2026 YTD (inputs) |
| OD: CAKE | ✓ full | — | all |
| PL: VDS, VDS-EPASS, BE, VNPAY, FPT, MWG | ✓ full (Q1.26) | — | 2026 YTD |

## Metric definitions

| Metric | Định nghĩa | Đơn vị | Note |
|---|---|---|---|
| Disbursement | Tổng tiền giải ngân trong kỳ | Tỷ VND | Volume metric — không phản ánh profit |
| ANR (Balance) | Average Net Receivable = average outstanding balance | Tỷ VND (aggregate) hoặc mVND/loan (cohort) | Q1.26 ANR = avg(Dec25 EOP, Mar26 EOP) balance ENR |
| TOI | Total Operating Income = NII + NFI + Other income | Tỷ VND | Top-line revenue Lending segment |
| NII | Net Interest Income = Interest income − COF | Tỷ VND | |
| NFI | Net Fee Income (Insurance + Early termination + others) | Tỷ VND | |
| Provision | Expected loss expense | Tỷ VND (positive magnitude trong report) | Source files mixed sign convention — đã normalize abs value |
| OPEX | Operating expense = Variable + Overhead | Tỷ VND | Variable = Acquisition + UW + Collection + Aftersale + ... |
| PBO (Profit Before Overhead) | TOI − Provision − Variable expenses | Tỷ VND | Operating profit chưa trừ allocated overhead |
| PBT | TOI − Provision − OPEX (= PBO − Allocated overhead) | Tỷ VND | Bottom-line Lending — KPI tracking |
| NPL CAKE % | Non-Performing Loan ratio — định nghĩa nội bộ Cake (DPD90+) | % | `npl_cake` |
| NPL CIC % | Non-Performing Loan ratio — định nghĩa CIC (Credit Information Center) | % | `npl_cic` — thường cao hơn NPL CAKE |
| Loan group 2 % | Early delinquency = balance DPD 10-90 days / total balance | % | Leading indicator — báo trước NPL |
| Yield (TOI/ANR) | Quarterly rate, NOT annualized | % | Annualized = ×4 (rough) |
| Cost of Risk (Provision/ANR) | Quarterly rate | % | |
| Insurance penetration | % accounts mua bảo hiểm | % | |
| Approval rate | % applications approved | % | Funnel stage 1 |
| Signed rate | % approved → disbursed | % | Funnel stage 2 |
| AVG Ticket size | Disbursement amount / number of loans | mVND | |
| AVG Tenor | Loan tenor average | months | |

## Channel mapping (quan trọng để đọc Section 4 + 5)

**Channel grouping (theo Đạm define 2026-05-14):** CAKE / VDS / ZLP / MWG / Others
- **CAKE** = CAKE direct (Budget Lending sheet: R94 CL, R318 PD, R426 OD)
- **VDS** = VDS direct **+ VDS-PR merged** (Viettel). Budget = channel "0.5" (R166 CL, R353 PD)
- **ZLP** = ZaloPay channel
- **MWG** = Mobile World channel (CL only)
- **Others** = computed = Overall − CAKE − VDS − ZLP − MWG. Gồm: BEG, NGS, VNPAY, VNPOST, MISA, leadgen, xsale, IR-tier, Paylater channels
- Budget chỉ map riêng CAKE + VDS → ZLP/MWG/Others budget hiển thị '-' (Others budget = Overall − CAKE − VDS)

## Pending data gaps (TBD — note cho team)

1. **CL/PD Pricing Q3.25 + Q4.25 trend** — chỉ có Q1.26 hiện tại. Cần extract historical pricing/funnel từ Q325/Q425 channel files.
3. **Paylater LG2 per channel** — cells trong source file = 0 (data bug). Chưa hiển thị.
4. **Paylater Avg Limit chính xác** — file P&L không có direct Limit metric. Hiện dùng Balance/Active làm proxy. Real avg limit từ Lending Operations team.
5. **Credit Card (CC)** — out of Lending scope, không bundle.

## Cách team query

Khi cần số liệu, hỏi Claude trong Finance Tracking project trực tiếp:

```
"Cho biết Disbursement YTD 2026 vs Budget" → Section 1 Overall
"VDS Channel performance Q1.26" → Section 4 + 5
"Cohort yield CashLoan VDS Q4.25" → Section 5.2.1
"Channel nào miss budget nặng nhất?" → Section 4 deep dive
"Trend NPL 3 quý gần nhất" → Section 5.1 + 5.2 (per product)
"IR vs COF từng channel CL Q1.26" → Section 5.3 + 5.2.2
"Paylater MWG channel performance" → Section 5.2.4
"NPL CAKE Payday vs Lending overall" → Section 5.2 + 4.3.5
"Active rate Paylater các channel" → Section 5.2.4
"AVG Ticket size CL aggregate Q1.26" → Section 5.2.2
"New issued Paylater Q1.26" → Section 5.2.3
```

Claude sẽ tự pull đúng dữ liệu từ `lending-pl-data.json`.

## Update cadence

- **Monthly**: Đạm regenerate bundle khi Finance close monthly P&L (Jan, Feb, Mar... close → re-run script → upload bundle mới)
- **Quarterly**: Khi UE files mới close (Q325, Q425, Q126, Q226...), refresh `Raw/Finance/Unit Economic/QXXY/` rồi re-run

Bundle generator: `Projects/Finance-Tracking/lending_pl_html_report.py` (in personal repo, không upload).

## Confidentiality

⚠️ **Internal Cake — không share ngoài team Lending + Finance.** Số liệu P&L + budget chi tiết.

---

**Maintainer:** Đạm (Head of Lending Product) · cake.vn
