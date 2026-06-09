---
status: meeting-notes
type: risk-committee-action
period: 2026-05
date: 2026-05-25
updated: 2026-05-26
---

# Risk Committee T5/2026 — Meeting Notes & Initiatives

> 2 initiatives chính + Build Credit Balance discussion. Scope: **Cake Cashloan**.
> Source data: Risk Committee T5/2026 PDF (35 slides), MOM Risk Committee T5-2026 (Risk Note), VDS Action Plan 2026 (107 slides), Apr Monthly Report (168 slides), Lending Portfolio Review May'26, Road to 3k Q2.

---

## Stakeholder Discussion — Build Credit Balance (from MOM)

> CRO Vinh Hà đề xuất discuss xây dựng credit balance. Trung bình 500 tỷ dư nợ tăng lên → tháng liền kế số tiền trả nợ (1a+1b+1c) tăng ~50 tỷ.

**Credit Balance Rundown data (Bil):**

| Component | Aug-25 | Sep-25 | Oct-25 | Nov-25 | Dec-25 | Jan-26 | Feb-26 | Mar-26 | Apr-26 |
|---|---|---|---|---|---|---|---|---|---|
| 1a. Closed As Scheduled | (11) | (14) | (16) | (17) | (19) | (20) | (15) | (20) | (23) |
| 1b. Early Terminate | (142) | (162) | (208) | (220) | (252) | (262) | (204) | (281) | (273) |
| 1c. Paydown | (205) | (223) | (255) | (277) | (312) | (331) | (350) | (406) | (386) |
| WO | (47) | (56) | (63) | (70) | (90) | (102) | (102) | (119) | (135) |
| New booking | 770 | 1,051 | 1,115 | 1,206 | 1,229 | 1,208 | 860 | 1,038 | 1,136 |
| **Sum** | **366** | **596** | **573** | **622** | **557** | **493** | **188** | **212** | **318** |
| Δ(1) | | 42 | 80 | 35 | 69 | 30 | (43) | 137 | (25) |

**Stakeholder positions:**

- **CRO Vinh Hà**: pilot tăng tenor (5% KH tăng 1.2x + 5% tăng 1.4x trong 1-2 năm) → phân loại KH tốt/xấu, tăng relationship KH tốt, giảm exposure KH xấu, giảm tốc độ portfolio drain down
- **HOL Đạm Hồ**: đồng thuận hướng CRO. Momo cũng đang áp dụng mô hình tất toán sớm → vay lại. Cần phân tích kỹ từng phân khúc. Đề xuất triển khai score-based offer cho existing customer trên Cake App
- **HOF Hương Thiều**: kéo dài tenor ảnh hưởng tỷ trọng phí bảo hiểm + financial metrics → pilot trước với nhóm score cao
- **CTO Hiển Từ**: đặt vấn đề policy khi KH tất toán cũ để mở mới. Đề xuất nghiên cứu giải pháp chủ động kéo dài tenor cho khoản vay hiện hữu
- **CEO Quang**: yêu cầu Risk + Product phân tích sâu, benchmark Momo/FE Credit, chạy financial model → **meeting chiều T5 28/05/2026 (15-20 phút) để ra quyết định**

---

## Initiative #1: Early Settlement → Repeat Offer

### Layer A (reactive): KH tự tất toán sớm → offer repeat

**Concept:** KH Cake Cashloan tất toán sớm → 1-2 ngày sau gửi offer repeat với limit tốt hơn + IR discount 1-2pp.

**Tại sao:**
- KH tất toán sớm = best risk signal trong portfolio (prove ability + willingness to pay ahead of schedule)
- Timing 1-2 ngày chặn trước khi KH vay nơi khác (CIC/Cake ratio 1.37x = multi-platform phổ biến)
- Zero CAC, không partner share, 100% margin

**Key numbers:**

| Metric | Số liệu | Source |
|---|---|---|
| % tất toán sớm / tháng | **26%** | Risk/Ops data |
| Pool đủ điều kiện | ~1,716 Bil/tháng | Balance chưa đáo hạn ~6,600 Bil × 26% |
| Avg tenor | **14 tháng** | Đạm confirm |
| 60% KH tất toán ở tháng 6 | Mới trả 43% gốc, dư nợ còn ~10.9M/17M | Đạm confirm |
| IR | **50%/năm**, dư nợ giảm dần | Đạm confirm |
| IR discount | **1-2pp** | Đạm confirm |
| Cake CL margin sau discount | 4.1-5.1% (vs hiện tại 6.1%) | Apr Monthly slide 9 |

**Impact estimate:**
- True incremental = Pool × Conversion × (1 - Cannibalization rate)
- Best case: 1,716 × 5% × 70% = **60 Bil/tháng**
- Worst case: 1,716 × 2% × 50% = **17 Bil/tháng**
- **Range: 17-60 Bil/tháng**
- Conversion estimate source: **Đạm (Head of Lending)**

### Layer B (proactive): Cake chủ động push KH tất toán sớm → offer repeat

**Concept:** Không chờ KH tự tất toán — Cake push offer cho KH eligible: "tất toán sớm ngay, nhận limit cao hơn + IR thấp hơn".

**Incentive package:**
- ✅ Tăng limit (≤1.5x khoản trước)
- ✅ Giảm IR (1-2pp)
- ❌ Không waive prepayment fee — giữ fee revenue + tránh moral hazard

**Trade-off (IR 50% dư nợ giảm dần, avg tenor 14 tháng):**

| Scenario | Nhóm tháng 6 (60% KH) | Nhóm tháng 10 (40% KH) | Weighted avg |
|---|---|---|---|
| Dư nợ còn lại | 10.9M | ~4.9M | ~8.5M |
| Lãi mất nếu tất toán | 2.2M | ~0.6M | **~1.6M** |
| Lãi khoản mới (21M, 14m) | 7.1M | 7.1M | **7.1M** |
| Net gain nếu repeat | **+4.9M/KH** | **+6.5M/KH** | **+5.5M/KH** |
| Break-even (% KH phải repeat) | **31%** | **8%** | **~22%** |

**Guardrail chống gaming/adverse selection:**
- **NTB score 1-2-3 + 0 DPD ever** (dùng risk profile thay vì tenure cutoff)
- Max 1 lần proactive offer / 12 tháng
- Limit cap ≤1.5x khoản trước
- Vintage tracking riêng: proactive vs reactive vs organic

**Timeline:**
- Phase 1 / Layer A (reactive): Pilot **T6** Cake CL → track 1 tháng
- Phase 2 / Layer B (proactive): Kick **T7-T8** sau khi có Phase 1 data (conversion + cannibalization)
- Scale decision: **T7** (Layer A), **T9** (Layer B)

**Open items:**

| # | Data cần | Owner | Due |
|---|---|---|---|
| 1 | Historical repeat rate sau tất toán sớm (có vs không offer) | Data team | T6W1 |
| 2 | % KH tất toán sớm đã quay lại repeat hiện tại (cannibalization) | Data team | T6W1 |
| 3 | Avg time tất toán → vay lại hiện tại | Data team | T6W1 |
| 4 | IR floor confirm | CRO + Đạm | T6W1 |

---

## Initiative #2: ETB Score-based Pre-approved Offer + EMI-driven Tenor

### Layer A: Pre-approved offer với EMI optimization

**Concept:** KH Cake app có behavior data → filter eligible pool → Score ETB → Pre-approved limit → KH nhận offer + chọn limit → vào UW rule bình thường (approve/reject, **không counter offer**). Tenor chạy theo limit KH chọn để giữ EMI ở fixed band by NTB.

**Hiện trạng vs initiative:**
- **Hiện tại:** đã comm approved limit cho pool 200k KH, nhưng EMI chưa được tối ưu
- **Initiative:** thêm tầng EMI optimization by NTB band → tenor auto-adjust → improve conversion + risk control

**Key numbers:**

| Metric | Số liệu | Source |
|---|---|---|
| Pool eligible | **200k KH** | Đạm confirm (đã có eligible rules) |
| Cake CL AR ETB hiện tại | **23.2%** | Risk T4 slide 14 |
| Cake CL AR Mass | 5.4% | Risk T4 slide 14 |
| ETB vs Mass AR gap | **4.3x** | ETB duyệt 4.3x hơn Mass |
| Cake CL Repeat/Xsell/Upsell % disb T4 | **81%** | Risk T4 slide 14 |

**Impact range:**
- Monthly push: 50k offer (25% pool, rotate quarterly)
- CTR: 3-5% (cần validate với data thực)
- AR ETB: 23.2% (có thể thấp hơn vì pool là KH chưa tự apply)
- **Incremental disbursement: ~5-10 Bil/tháng** (conservative)
- **Uplift vs hiện tại:** EMI optimization kỳ vọng tăng sign rate + giảm roll rate B0→B1

### Layer B: EMI-driven tenor by NTB score

**Concept:** NTB score quyết định limit range + tenor range, EMI giữ ở fixed band.

| NTB Band | Risk | Limit | Tenor | EMI | Logic |
|---|---|---|---|---|---|
| **1-2** (tốt nhất) | Thấp | Cao | **Dài** | Band TBD | Exposure dài nhưng risk thấp → yield cao, KH trả thoải mái |
| **3** (trung bình) | TB | Trung bình | **Trung bình** | Band TBD | Baseline |
| **4-5** (xấu hơn) | Cao | Thấp | **Ngắn** | Band TBD | Giảm exposure, payback nhanh, LG2 impact thấp hơn |

> Lưu ý NTB: score thấp = risk thấp = KH tốt. Band 1-2-3 là tier tốt nhất.

**Measurement — A/B test current (comm limit only) vs EMI-optimized:**

| Level | Metric | Đọc được sau |
|---|---|---|
| **Primary** | **PBT per khoản** = (NII + Fee - Provision - Variable cost) per loan | 3 tháng → scale decision |
| Secondary — Funnel | CTR → Sign rate → FPD10% | CTR/Sign: 2 tuần, FPD10: 1.5 tháng |
| Secondary — Product | Avg ticket size, Avg tenor, RFR B0→B1 | RFR: 2-3 tháng |

**Timeline:**
- Define EMI bands: **T6W1**
- Pilot EMI-optimized offer: **T7**
- A/B test vs current (comm limit only): T7-T9
- Scale decision: **T10**

**Open items:**

| # | Data cần | Owner | Due |
|---|---|---|---|
| 1 | **EMI fixed band by NTB** — con số cụ thể | Đạm + Risk | T6W1 |
| 2 | **In-app offer CTR hiện tại** (comm approved limit) | Data team | T6W1 |
| 3 | **Sign rate + roll rate hiện tại** của pool 200k đã nhận offer | Data team | T6W1 |
| 4 | **AR cho pool 200k** — so sánh vs 23.2% ETB self-select | Risk/Data | T6W2 |

---

## Summary — 2 Initiatives, 4 Layers

| Initiative | Layer | Concept | Impact/tháng | Timeline |
|---|---|---|---|---|
| **#1** | **A. Reactive** | KH tự tất toán sớm → offer repeat 1-2 ngày | **17-60 Bil** | Pilot T6 |
| | **B. Proactive** | Cake push KH eligible tất toán → offer repeat | +4.9M NII/KH, BE 31% | T7-T8 (sau #1A data) |
| **#2** | **A. Pre-approved** | ETB score → pre-approved limit → no counter offer | **5-10 Bil** (scalable) | Pilot T7 |
| | **B. EMI tenor** | NTB tốt = tenor dài, NTB xấu = tenor ngắn, EMI fixed band | Improve sign rate + RFR | Integrated vào #2A |

---

---

## Partner Highlights (from MOM)

### VDS
- VDS CL No score chỉ đang duyệt NTB 1-2-3 (FPD10% 2.3% vs Mass 4.6%) → **Next action: mở rộng NTB 4,5 + áp dụng Payday (CL trước)**
- CEO nhấn mạnh: VDS cạnh tranh quyết liệt, chưa đạt mục tiêu 20K tỷ giải ngân. Paylater + CC performance rất tệ (lỗi cả 2 bên). VDS đang đưa VietCredit vào luồng mới
- **CEO directive: Hương Lưu (BD) + Đạm Hồ (HOL) focus Paylater cùng Risk.** VDS target onboarding 10 triệu KH mobile Money → Cake offer Paylater, target approve 70%+
- CEO: Cashloan kiếm tiền ngay, CC + Paylater về lâu dài để upsell/xsell

### Cake
- Tất cả RFR trong target T3. Cashloan NFR T4 cao hơn KH (B0-B1 5.9%, B0-B4 4.1%)
- **CEO cảnh báo giải ngân Cake CL hàng ngày xuống thấp** → Đạm giải thích: shift portfolio sang nhóm tốt hơn → CRO: do cắt NTB 5,6, nếu cho lại tăng 14-15 tỷ/ngày

### Be
- CC + Paylater NFR ổn. Cashloan NFR cao hơn KH T4, expect tăng do mở rộng
- Trùng tệp Cake CL / VDS CL nhiều → commit 18% approve **chỉ đạt ~10%**
- Lâm Phạm CDSAIO đề xuất deep dive riêng
- **CEO: Hương Lưu làm việc nhanh với nội bộ ngày 26/05/2026**

### ZLP
- No score small volume, overall risk cao hơn Normal (FPD10% 5.83% vs 2.97%). Risk đang detect nguyên nhân

---

## Fraud (from MOM)

- Trọng tâm: CASA Fraud
- **Trend "Hunter"**: nhắm KH có nhu cầu đi nước ngoài/làm Visa → gửi link giả mạo qua Zalo → chiếm thiết bị + OTP. Thiệt hại ~750 triệu VNĐ
- Action đã triển khai: NFC auth khi đăng nhập thiết bị mới, báo cáo NHNN, monitoring + preventive controls
- **Next**: 3 mạng lưới lọc từ CBO (a Khoa) + AML + Fraud management team

---

## Collection (from MOM)

- T5 random 10% Auto callbot: Human tốt hơn callbot ~0.4% tại DPD10. Callbot %kept PTP kém hơn
- **NTB score range 1: Bot tốt hơn/ngang Human. Các range khác: Human tốt hơn**
- Cost: callbot thấp hơn Human 4x
- **Action: làm việc với AI team optimize callbot → T6 nâng tỷ lệ sử dụng**
- Collection tố tụng: **bắt đầu từ năm nay**

---

## AML (from MOM)

- Cross-border ổn định, chưa ghi nhận rủi ro AML đáng kể
- Reject chủ yếu do hard rules đã thống nhất với Legal + VPBank
- Continue: xử lý audit findings, tăng monitoring/compliance, phối hợp Fraud Team

---

## Consolidated Follow-up Items

### Data / Analysis items (from Đạm's initiative analysis)

| # | Action | Owner | Due | Status |
|---|---|---|---|---|
| 1 | Historical repeat rate + cannibalization + avg time tất toán → vay lại | Data team | T6W1 | 🔴 Cần data |
| 2 | IR floor confirm cho early-settlement offer | CRO + Đạm | T6W1 | 🔴 Pending |
| 3 | EMI fixed band by NTB — con số cụ thể | Đạm + Risk | T6W1 | 🔴 Pending |
| 4 | In-app offer CTR hiện tại (comm approved limit) | Data team | T6W1 | 🔴 Cần data |
| 5 | Sign rate + roll rate hiện tại của pool 200k | Data team | T6W1 | 🔴 Cần data |
| 6 | AR cho pool 200k vs 23.2% ETB self-select | Risk/Data | T6W2 | 🟡 Pending |
| 7 | Pilot design #1A: trigger logic, offer template, limit rule | Product Squad | T6W2 | 🟡 Chờ #1 #2 |

### Official Action Items (from MOM)

| # | Action | Owner | Due | Status |
|---|---|---|---|---|
| 1 | Benchmark FE Credit/Momo/VPBank + đề xuất tenor & loan size cho CL | Risk + Product | **Chiều T5 28/05/2026** | 🔴 |
| 2 | VDS No score: mở rộng NTB 4,5 (CL trước, rồi Payday) | Risk Team | T6/2026 | 🔴 |
| 3 | Họp nội bộ action plan Payday & CC với VDS | Hương Lưu + Đạm + Vinh Hà | 31/05/2026 | 🔴 |
| 4 | Deep dive Be: tăng CR, đảm bảo 18% approve (hiện 10%) | Hương Lưu + Đạm + Vinh Hà | **26/05/2026** | 🔴 Urgent |
| 5 | Bổ sung DPD 30/60/90 + KPI Collection vào báo cáo | Risk Team | RCM T6/2026 | 🟡 |
| 6 | Xử lý audit findings AML + phát triển Cross-border | AML Team | Ongoing → RCM T6 | 🟡 |
