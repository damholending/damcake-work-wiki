---
status: team-facing
type: data-schema
audience: team-lending-cake
last_updated: 2026-05-14
---

# Data Schema — `lending-pl-data.json`

Schema reference cho ground truth file. Đọc cùng `lending-pl-guide.md`.

## Source files (Raw)

| File | Dùng cho |
|---|---|
| `Raw/Finance/P&L/P&L_2025_final.xlsx` | Actual 2025 — overall + channel×product |
| `Raw/Finance/P&L/P&L_2026_Actual.xlsx` | Actual 2026 YTD + product sheets + risk metrics |
| `Raw/Finance/P&L/P&L-Budget-2026.xlsx` | Budget 2026 — overall + channel |
| `Raw/Finance/Unit Economic/Q425/Unit Economics Q42025 Lending.xlsx` | UE aggregate Q3.25 + Q4.25 + CL cohort per-loan |
| `Raw/Finance/Unit Economic/Q126/*_Q1_26.xlsx` | UE Q1.26 channel inputs |
| `Raw/Finance/Unit Economic/Q425/{Cash Loan,Payday}/*.xlsx` | Partner sharing params per channel |

## Dimensions

| Dimension | Values |
|---|---|
| **Periods** | 2025 Actual (monthly+FY) · 2026 Actual (YTD-Apr) · 2026 Budget (monthly+FY) · UE quarters Q3.25 / Q4.25 / Q1.26 |
| **Products** | CL (CashLoan) · OD (Overdraft) · PD (Payday) · PL (Paylater) |
| **Channels (named groups)** | CAKE · VDS (incl. VDS-PR) · ZLP (ZaloPay) · MWG · **Others** (= phần còn lại: VNPAY, VNPOST, BE, MISA, BEG, NGS, leadgen, xsale, IR-tier) |
| **Channels (raw, section 3/6)** | CAKE · VDS · ZLP · MWG · VNPAY · ZALOPAY · VNPOST · BE · MISA · BEG · NGS · (PL only: VDS-EPASS, FPT) |
| **P&L metrics** | Disbursement · TOI · Provision · PBO (Profit Before Overhead) · PBT |
| **Risk metrics** | Balance/ANR · NPL% · LG2% (Loan group 2 = early delinquency DPD 10-90) |
| **UE metrics** | yield (TOI/ANR, TOI/Disb) · CoR (Provision/...) · OPEX · **net yield (TOI − Risk)** · IR · COF · NIM · Avg Ticket · Avg Tenor · Approval/Signed rate · Insurance penetration |
| **Paylater-specific** | New issued · Accumulated account · Active account · %Active rate · Spending · Spending/active · Avg balance/active (proxy avg limit) |

> ⚠️ **Channel grouping (theo Đạm 2026-05-14):** CAKE / VDS / ZLP / MWG / Others.
> - **VDS-PR đã merge hẳn vào VDS** — không còn entry `VDS-PR` riêng. VDS = VDS direct + VDS-PR (flow metrics sum, rate metrics balance-weighted).
> - **Others** = Overall − (CAKE + VDS + ZLP + MWG), computed residual.
> - Budget chỉ map được CAKE + VDS (channel "0.5" trong Budget = VDS). ZLP/MWG/Others không có budget split → hiển thị '-'.

## JSON sections (14)

| Section | Cấu trúc | Coverage |
|---|---|---|
| `_meta` | sources, generated_date, scope, actuals_complete_through_month | — |
| `section_1_overall_pnl` | `{period: {metric: [12 monthly values]}}` | 3 periods × 5 P&L metrics × 12 months |
| `section_2_by_product_pnl` | `{product: {metric: {period: [12]}}}` | 4 products × 3 metrics × 3 periods |
| `section_3_channel_x_product_2025` | `{channel: {product: {disb, toi, pbo}}}` | 2025 FY only |
| `section_4_channel_deep_dive` | `{channel: {period: {product: {disb, toi, prov, pbo, balance, npl_cake, npl_cic, lg2}}}}` | CAKE/VDS/ZLP/MWG × 4 periods × CL/OD/Payday (VDS-PR merged) |
| `section_5_1_unit_economics_aggregate` | `{q3_25, q4_25, q1_26: {disb, balance, toi, provision, opex, pbt, npl_cake, npl_cic, lg2}}` | Lending aggregate, 3 quý. UE SUM file Q3/Q4 không tách CIC → npl_cic=null |
| `section_5_2_by_product_quarterly_aggregate` | `{product: {quarter: {disb, toi, provision, pbo, balance, npl_cake, npl_cic, lg2}}}` | CL/PD/OD/PL × 3 quý |
| `section_5_2_1_cl_cohort_per_loan` | `{channel: {quarter: {metric: (value, %ANR)}}}` | CL cohort per-loan, 6 channels, Q3+Q4.25 |
| `section_5_3_q126_cl_channel_inputs` | `{channel: {ir, cof, avg_ticket, avg_tenor, approval_rate, signed_rate, insurance_rate, insurance_pen}}` | CL, 9 channels, Q1.26 |
| `section_5_3_q126_pd_channel_inputs` | same structure | PD, 5 channels, Q1.26 |
| `section_5_2_3_paylater_q126_metrics` | `{9 PL-specific metrics}` | Paylater top-level Q1.26 |
| `section_5_2_4_paylater_channels_q126` | `{channel: {14 metrics}}` | Paylater × 7 channels Q1.26 |
| `section_6_comprehensive_channel_product_matrix` | **MASTER** `{period: {<product>_<channel>: {~25 metrics}}}` | 4 periods × ~48 entries |
| `section_7_partner_sharing_params` | `{product: {channel: {7 sharing params}}}` | CL + PD channels |
| `section_8_cohort_ue_per_channel` | `{product: {quarter: {channel: {anr/toi/provision/opex/pbt mvnd + ratios + net_yield}}}}` | CL/PD/PL per-channel cohort UE (per-loan mVND), **Q3.25 + Q4.25 + Q1.26 full channel coverage** |

## Section 6 — Master Query Table (dùng đầu tiên cho mọi câu hỏi channel × product)

Flat `{period: {"<product>_<channel>": {...}}}`. Mỗi entry chứa:

- **Identity**: `product`, `channel`, `period`
- **P&L absolute (Tỷ VND)**: `disb_bil_vnd`, `toi_bil_vnd`, `provision_bil_vnd`, `pbo_bil_vnd`, `pbt_allocated_bil_vnd`
- **Risk state**: `balance_bil_vnd`, `npl_cake`, `npl_cic`, `lg2`
- **Ratios %Disb**: `yield_toi_per_disb_pct`, `cor_provision_per_disb_pct`, `pbo_margin_per_disb_pct`
- **Ratios %ANR**: `yield_toi_per_anr_pct`, `cor_provision_per_anr_pct`, `pbo_per_anr_pct`
- **Net Yield (TOI − Risk)**: `net_yield_toi_minus_risk_bil_vnd`, `net_yield_per_disb_pct`, `net_yield_per_anr_pct`
- **Pricing inputs** (Q1.26 CL+PD only): `ir_pct`, `cof_pct`, `nim_pct`, `avg_ticket_mvnd`, `avg_tenor_months`, `approval_rate`, `signed_rate`, `insurance_penetration`
- **Paylater-specific**: `accumulated_account`, `active_account`, `active_rate`, `new_issued_q1`, `spending_per_active_mar_vnd`, `avg_balance_per_active_vnd`

`None` = data không có cho combination đó.

## Coverage gaps

| Gap | Lý do |
|---|---|
| CL/PD pricing Q3.25 + Q4.25 trend | Chỉ extract Q1.26; historical chưa làm |
| Paylater LG2 per channel | Cells = 0 trong source file (data bug) |
| Paylater Avg Limit chính xác | P&L file không có — dùng Balance/Active proxy |
| NPL/LG2 cho channels ngoài CAKE/VDS/ZLP/MWG (aggregate P&L) | Chỉ 4 named groups có P&L deep extraction. Cohort UE (section 8) coverage rộng hơn. |
| Credit Card | Out of Lending scope, không bundle |

## Convention notes

- **Provision**: source files dùng sign convention khác nhau (2025 = positive, 2026 = negative) → đã normalize **ABS value** (expense magnitude, luôn dương).
- **Net Yield = TOI − Provision**. Đây là metric so sánh fair giữa channel vì raw TOI bị méo bởi partner sharing khác nhau (xem section 7).
- **NPL** có 2 định nghĩa: `npl_cake` (nội bộ Cake) và `npl_cic` (CIC — thường cao hơn). Cả 2 đều state metric, end-of-period (không sum monthly). UE SUM file Q3/Q4 chỉ có 1 NPL → map vào npl_cake, npl_cic=null.
- **LG2** = state metric, end-of-period.
- **PBT allocated** (`pbt_allocated_bil_vnd` / `pbt_allocated_by_disb_share`): allocation rule theo Đạm = `pbo_entity − overhead_segment × (disb_entity / disb_overall)`. Reason: P&L file chỉ có PBT ở Lending segment (overhead = HR + IT + Support cost allocated tổng); allocation theo disbursement share để có PBT per product/channel. Giả định: overhead phân bổ tuyến tính theo volume giải ngân. Available trong sections 4 (channel × product), 5.2 (product × quarter), 6 (master matrix). Ở Lending segment: PBT thực tế = section 1.
- **Disbursement/TOI/Provision/PBO** = flow metric, sum theo kỳ.
- Paylater **"Spending"** = disbursement-equivalent (BNPL credit drawdown).

---

**Maintainer:** Đạm (Head of Lending Product) · cake.vn
