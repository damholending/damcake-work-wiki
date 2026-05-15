---
status: team-shared
type: product-config
topic: lending, product-scheme, rate, tenor, ticket, eligibility
audience: Lending Product team @ Cake
source: Raw/Lending/Product Scheme/Product Scheme_2025.xlsx (sheets "Product Scheme (CL, PD)" + "Product Scheme (PL)")
last_updated: 2025-12-04
---

# Product Scheme — Cake Lending (snapshot 2025-12-04)

> Cấu hình **active product scheme** đang triển khai trên các channel. Dùng làm reference khi viết PRD, đề xuất thay đổi product, hoặc compare cross-channel.
> Status có 3 giá trị: `Active` (đang chạy) · `on hold` (tạm dừng) · `MVP` (đang thử nghiệm).
> Khi cần update → cập nhật trong file gốc `Raw/Lending/Product Scheme/Product Scheme_2025.xlsx` rồi re-export file này.

---

## 1. Cashloan (CL)

### 1.1 Quick reference — Cashloan active schemes

| # | Scheme | Partner | PiC | Platform | Ticket (mVND) | Tenor | IR | Insurance | ETF | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | [BE] Cashloan | Be | Cường | D.O.P | 10–50 | 3–24 tháng | 25–54% | 5% | 8% (<3M) / 5% (≥3M) | Active |
| 2 | [Cake] Cashloan | Cake | Duyên | CAKE APP | Mass: 5–40 · WL: 5–50 | 6–48 tháng | NTB 48–59% · ETB 38–48% | 7% | 8% (<3M) / 5% (≥3M) | Active |
| 3 | [MWG POS] Cashloan | MWG | Lâm | D.O.P | Mass: 5–50 · Salary: 10–70 | 6–48 tháng | Mass 48–53% · Salary 39–44% | 7% | 8% (<3M) / 5% (≥3M) | Active |
| 4 | [MWG QTV] Cashloan | MWG | Lâm | D.O.P | Mass: 5–50 | 6–48 tháng | Mass 48–53% | 7% | 8% (<3M) / 5% (≥3M) | Active |
| 5 | [VDS] Cashloan | VDS | Lâm | API Native (App VTM) | S-Gold/Plat/Std/Upsell: 8–40 · XS-Gold: 15–50 | 6–48 tháng (Upsell 9–48) | 43–60% | 7% | 8% (<3M) / 5% (≥3M) | Active |
| 6 | [VDS] O2O | VDS | Lâm | API Native (App VTM) | — | — | — | — | — | Active |
| 7 | [VDS] Payroll Cashloan | VDS | Lâm | API Native (App VTM) | Staff: 10–70 · Other: 10–20 | 6–48 tháng | Staff w/ins 25%, w/o ins 29% · Other w/ins 35%, w/o ins 39% | 5% | 8% (<3M) / 5% (≥3M) | Active |
| 8 | [VNPAY] Cashloan | VNPAY | Cường | D.O.P | 5–40 | 30 ngày | 45–50% | 7% | 8% (<3M) / 5% (≥3M) | Active |
| 9 | [ZaloPay] Cashloan | ZaloPay | Định | API Native (App ZLP) | 2–50 | 3–48 tháng | 50–55% | 7% | 3% trên dư nợ còn lại | Active |
| 10 | [Misa] Cashloan | Misa | Cường | API Native | 2–50 | 6–36 tháng | 48% | 7% | 3% trên dư nợ còn lại | Active |

### 1.2 On hold — Cashloan

| # | Scheme | Partner | PiC | Note |
|---|---|---|---|---|
| 1 | [VDS] Cashloan LP (VDS) | VDS | Lâm | Lead partner channel — chưa launch |
| 2 | [VDS] Cashloan LP (VTPOST) | VDS | Lâm | Lead partner channel — chưa launch |
| 3 | [VDS] Cashloan LP (VTT) | VDS | Lâm | Lead partner channel — chưa launch |
| 4 | [VNPOST] Cashloan | VNPOST | Cường | Ticket 10–50 · Tenor 6–36 tháng · IR 48–53% · Insurance 5% |
| 5 | [VNPOST] Cashloan — Tệp Hưu trí | VNPOST | Cường | Ticket 10–300 · Tenor 6–60 tháng · IR 13.5–16.5% · Insurance 3% · MVP1 đến 65 tuổi (ràng bảo hiểm). E-wallet Postpay. eKYC + sinh trắc học + NFC. |

### 1.3 Scoring model — Cashloan

| Scheme | Scoring stack |
|---|---|
| [BE], [VNPAY], [MWG POS/QTV] | Be Score / NTB Score + DTN Score |
| [Cake] | NTB Score + DTN Score |
| [VDS] (all) | CIC Score + CAKE Score + DTN Score |

### 1.4 Eligibility highlights — Cashloan

| Scheme | Tuổi | Thu nhập | Điều kiện đặc thù |
|---|---|---|---|
| [BE] | 20–60 | Kê khai > 5tr | KH là user Be |
| [Cake] | 20–50 | ≥ 5tr/tháng | CAKE user đang active |
| [MWG POS] | 20–50 | ≥ 5tr (kê khai) | Đăng ký vay trên app MWG tại chuỗi TGDĐ |
| [MWG QTV] | 20–50 | ≥ 5tr (kê khai) | Đăng ký vay trên app MWG tại chuỗi TGDĐ |
| [VDS] mainstream | 20–60 | ≥ 3tr/tháng | Thuê bao Viettel chính chủ ≥6 tháng · Viettel credit score ≥550 |
| [VDS] Payroll | — | — | Thuộc DS chi lương qua ViettelPay · Telco score ≥550 |
| [VNPAY] | 20–50 | ≥ 5tr/tháng | User ví VNPAY · Ví mở ≥3 tháng · ≥2 GD bất kỳ · Không thay đổi KYC 3 tháng gần nhất · Không thiết bị jailbreak/root · ≤5 user/device tháng gần nhất · ≤5 lần đổi device |

---

## 2. Payday (PD)

### 2.1 Quick reference — Payday active schemes

| # | Scheme | Partner | PiC | Platform | Ticket (mVND) | Tenor | IR | Insurance | ETF | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | [Cake] Payday | Cake | Duyên | CAKE APP | New: 3–4 · Repeat: 3–5 | New 30d · Repeat 30–45d | 55% | 8% | 0 | Active |
| 2 | [MWG QTV] Payday | MWG | Lâm | D.O.P | New: 2–3 · Repeat: 2–5 | 30d, 45d | 60% | 8% | n/a | Active |
| 3 | [VDS] Payday | VDS | Lâm | D.O.P | New: 3–5 · Repeat: 3–7 | 30d, 45d | 60% | 8% | n/a | Active |
| 4 | [VDS] Payroll Payday | VDS | Lâm | API Native (App VTM) | Staff: 2–30 · Other: 2–10 | 6–48 tháng | 0% (cả staff & other) | Staff 3% · Other 5% | n/a | Active |
| 5 | [ZaloPay] Payday | ZaloPay | Định | API Native (App ZLP) | — | — | — | — | — | Active |

### 2.2 Scoring & Eligibility — Payday

| Scheme | Scoring | Tuổi | Thu nhập | Điều kiện đặc thù |
|---|---|---|---|---|
| [Cake] | NTB + DTN | 18–50 | ≥ 5tr/tháng | CAKE user active |
| [MWG QTV] | NTB + DTN | 20–50 | ≥ 5tr (kê khai) | Đăng ký trên app MWG tại chuỗi TGDĐ |
| [VDS] | CIC + CAKE + DTN | — | — | Thuê bao Viettel + VTM định danh CMND/CCCD · sim ≥3M hoặc VTM ≥1M · Score: VDS CAKE ≥700 hoặc <700 + Telco ≥450 · Không jailbreak/root |
| [VDS] Payroll | CIC + CAKE + DTN | — | — | Thuộc DS chi lương qua ViettelPay · Telco ≥550 |

---

## 3. Overdraft (OD)

### 3.1 Active Overdraft schemes

| # | Scheme | Partner | PiC | Platform | Ticket (mVND) | Tenor | IR | Insurance | ETF | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | [Cake] Overdraft | Cake | Duyên | CAKE APP | 5–20 | 12 tháng | 40% | n/a | n/a | Active |

**Eligibility:** CAKE user active ≥ 15 ngày.

---

## 4. Paylater (PL / BNPL)

### 4.1 Quick reference — Paylater active schemes

| # | Scheme | Partner | PiC | Platform | Hạn mức (mVND) | Thời hạn cấp | IR | Subscription/tháng | Status |
|---|---|---|---|---|---|---|---|---|---|
| 1 | [BE] Paylater | Be | Cường | D.O.P | 1–3 | 60 tháng | 40% | 30,000 VNĐ | Active |
| 2 | [FPT] Paylater | FPT | Cường | API Native (App FPT) | 3–5 | 60 tháng | 0% | Allow | Active |
| 3 | [MWG] Paylater | MWG | Định | D.O.P | 1–10 | 60 tháng | 55% | 20,000 VNĐ | Active |
| 4 | [VDS] Paylater | VDS | Định | API Native (App VTM) | 0.5–5 | 60 tháng | 39% | 30,000 VNĐ | Active |
| 5 | [VNPAY] Paylater | VNPAY | Cường | D.O.P | 1–3 | 60 tháng | 39% | 30,000 VNĐ | Active |

### 4.2 Fee structure — Paylater

| Scheme | Lãi phạt gốc QH | Phí phạt chậm TT | Installment Fee (Hàng) | Installment Fee (Cash) | Subvention | Tất toán sớm |
|---|---|---|---|---|---|---|
| [BE] | 100% × IR × dư nợ QH × số ngày QH | 50,000 VNĐ | 3% × dư nợ trả góp × số kỳ | n/a | n/a | Cho phép, phí n/a |
| [FPT] | 100% × IR × dư nợ QH × số ngày QH | — | — | — | — | Cho phép, phí n/a |
| [MWG] | 100% × IR × dư nợ QH × số ngày QH | DPD1–4: 50k · DPD5–9: 100k · DPD10–14: 150k · ≥DPD15: 200k | **Nhóm 1** (SKU thuộc CT subvention MWG): 0% × dư nợ × kỳ. **Nhóm 2** (SKU ≤3tr & tenor ≤3M, không overlap nhóm 1): 0% × dư nợ × kỳ. **Còn lại**: 3% × dư nợ × kỳ. | 4% × số tiền rút × số kỳ | 7% / đơn hàng | Cho phép, phí n/a |
| [VDS] | 100% × IR × dư nợ QH × số ngày QH | DPD1–4: 50k · DPD5–9: 100k · DPD10–14: 150k · ≥DPD15: 200k | 3% × dư nợ × kỳ | n/a | n/a | Cho phép, phí n/a |
| [VNPAY] | 100% × IR × dư nợ QH × số ngày QH | DPD1–4: 50k · DPD5–9: 100k · DPD10–14: 150k · ≥DPD15: 200k | 3% × dư nợ × kỳ | n/a | n/a | Cho phép, phí n/a |

### 4.3 Phương thức thanh toán — Paylater

| Scheme | Thanh toán tối thiểu | Thanh toán toàn bộ |
|---|---|---|
| [BE] | 5% × dư nợ sao kê (gốc + lãi + phí) — **áp dụng 10% từ sao kê 20/5** | 100% × dư nợ sao kê |
| [MWG] | 10% × dư nợ sao kê (gốc + lãi + phí) | 100% × dư nợ sao kê (gốc + lãi + phí) |
| [VDS] | 5% × dư nợ sao kê — áp dụng từ sao kê 20/5 | 100% × dư nợ sao kê |
| [VNPAY] | 5% × dư nợ sao kê (gốc + lãi + phí) — **áp dụng 10% từ sao kê 20/5** | 100% × dư nợ sao kê (gốc + lãi + phí) |

---

## 5. Quick stats

**Active product schemes:** Cashloan (10) · Payday (5) · Overdraft (1) · Paylater (5) = **21 active schemes**.

**On hold:** 5 (4 VDS LP + VNPOST + VNPOST Hưu trí MVP).

**Partner coverage (Cashloan):** Be, Cake, MWG (POS + QTV), VDS, VNPAY, ZaloPay, Misa, VNPOST (on hold).

**Partner coverage (Paylater):** Be, FPT, MWG, VDS, VNPAY.

**Highest IR ceiling:** [VDS] Cashloan + [Cake] Cashloan NTB — up to 59–60%.

**Lowest IR:** [VDS] Payroll Payday — 0% (subsidized) · [FPT] Paylater — 0% · [VNPOST] Hưu trí MVP — 13.5–16.5%.

---

## 6. Conventions

- **IR (Interest Rate):** annualized %, trừ khi note rõ.
- **Tenor:** đơn vị `tháng` hoặc `ngày` — đã ghi rõ trong từng row.
- **Ticket / Hạn mức:** đơn vị mVND (triệu VND).
- **Insurance:** % trên principal hoặc giá trị tuyệt đối — note rõ trong cell.
- **ETF (Early Termination Fee):** phí tất toán sớm — note rõ phạm vi thời gian áp dụng.
- **DPD:** Days Past Due — số ngày quá hạn.
- **D.O.P** = Direct on Partner platform · **API Native** = nhúng API trong app partner.
- **NTB / ETB:** New-to-Bank / Existing-to-Bank · **DTN:** Debt-To-Income score.

---

## 7. Maintenance

- **Owner:** Đạm + PiC từng partner.
- **Source of truth:** `Raw/Lending/Product Scheme/Product Scheme_2025.xlsx` — file gốc team edit.
- **Re-export this MD:** mỗi khi scheme có thay đổi (rate, tenor, ticket, eligibility, status) → update xlsx → re-export `product-scheme-2025.md` → upload lên Lending Hub project.
- **Update cadence:** ad-hoc theo product change. Suggest review monthly.
- **KHÔNG paste customer data, traffic numbers, conversion rates** vào file này — chỉ giữ config tĩnh.
