---
status: team-shared
type: domain-context
topic: lending, products, kpi, strategy, regulatory
audience: Lending Product team @ Cake
note: Phiên bản team — đã cắt personal framing. Domain knowledge thuần.
---

# Lending — Team Context

> Context dùng chung cho Lending Product team @ Cake by VPBank. Upload vào Claude Project "Lending Hub" để mọi member dùng.
> *Last updated: 2026-05-14*

---

## 1. Sản phẩm Lending tại Cake

Team đang own 4 product lines:

| Product | Mô tả | Đặc thù |
|---|---|---|
| **OD** | Overdraft — vay thấu chi | Revolving, ticket nhỏ, retention focus |
| **Cash Loan** | Vay tiền mặt | Installment, ticket trung bình - lớn |
| **BNPL** | Buy Now Pay Later — mua trước trả sau | Embedded ở merchant/eCom, ticket nhỏ |
| **Merchant Loan** | Vay cho merchant | B2B-ish, ticket lớn, cycle dài |

**Chiến lược chung — Embedded Lending:** Nhúng sản phẩm vào hệ sinh thái lớn (ví điện tử, eCommerce, ride-hailing) song song với own channel Cake App.

---

## 2. KPIs 2026

| Chỉ tiêu | Target | Ghi chú |
|---|---|---|
| **Giải ngân** | 40,000 tỷ VND | Tổng cả 4 products |
| **PBT** | 700 tỷ VND | Profit Before Tax — north star |
| **%LG2** | ≤ 11% | Không được vượt 3 tháng liên tiếp |
| **Cake App channel** | ≥ 40% tổng giải ngân | Channel mix target |

**Nguyên tắc PBT-first:** 700 tỷ PBT không bắt buộc đến từ đủ 40k tỷ giải ngân. Team focus tối ưu yield × volume − expected loss, không chạy volume thuần.

---

## 3. Q2 2026 Plan

| Tháng | Target giải ngân |
|---|---|
| April 2026 | 2,500 tỷ |
| May 2026 | 2,700 tỷ |
| June 2026 | 3,000 tỷ |

**Strategic priorities Q2:**

- **Channel activation & expansion:** VDS (VPBank ecosystem), Cake App, ZLP (ZaloPay), MWG (Mobile World Group), Fiza (đang onboard).
- **Portfolio optimization:** yield × volume − expected loss. Không chỉ đẩy volume.
- **AI adoption:** Push AI vào workflow team, build thư viện use case thực tế.

---

## 4. Key Metrics team cần track

| Metric | Định nghĩa | Tần suất |
|---|---|---|
| **Yield** | Lãi suất hiệu dụng | Monthly |
| **Volume / Disbursement** | Giải ngân theo product × channel | Weekly |
| **CoR / Cost of Risk** | Chi phí rủi ro tín dụng | Monthly |
| **%LG2** | Delinquency rate trên bucket cụ thể | Monthly |
| **Channel mix** | Cake App vs ecosystem split | Monthly |

---

## 5. Frameworks team áp dụng

| Context | Framework |
|---|---|
| Product strategy | Jobs-to-be-done · Embedded lending flywheel |
| Prioritization | ICE / RICE · P&L impact first |
| Risk vs Growth | Second-order thinking · Pre-mortem |
| Lending / credit | Risk-adjusted return · Portfolio thinking |

---

## 6. Regulatory watch — Dự thảo sửa đổi TT39/2016/TT-NHNN

Khung pháp lý gốc cho hoạt động cho vay của TCTD. Lần sửa này ảnh hưởng trực tiếp đến **cho vay bằng phương tiện điện tử** (mảng chính của Cake). Hiệu lực dự kiến 2026.

| Điều | Thay đổi | Impact với Cake |
|---|---|---|
| **Đ.22 k.2 điểm h (mới)** | TCTD phải tự quy định giới hạn dư nợ/1 KH khi cho vay điện tử | Ban hành nội bộ cap dư nợ/KH cho CL + PD + OD + BNPL — thay cho cap cứng 100tr cũ |
| **Đ.32c, Đ.32h (bãi bỏ)** | Bỏ giới hạn cứng hiện hành cho cho vay điện tử | Mở room — chuyển sang tự quản theo Đ.22 điểm h |
| **Đ.32b (sửa)** | KH đã onboarded → TCTD tự chọn biện pháp xác minh phục vụ vay điện tử | Giảm friction repeat customer — không bắt full re-eKYC |
| **Đ.18 k.4 (sửa)** | Nợ quá hạn: gốc thu trước, lãi thu sau | Đổi waterfall thu hồi — impact collection workflow + accounting |
| **Đ.8 k.6 (sửa)** | Siết điều kiện cho vay để trả nợ TCTD khác | Ảnh hưởng sản phẩm refinance / consolidation |
| **Đ.2 k.13 (sửa)** | Nới định nghĩa "khoản cho vay giá trị nhỏ" (đặc thù Quỹ TDND) | Không impact trực tiếp |
| **Đ.1 k.3 (mới)** | Cho vay theo phương án cơ cấu lại của TCTD bị KSĐB | Không apply cho Cake |

**Action items khi TT chính thức ban hành:**

1. Risk + Legal: dự thảo nội bộ cap dư nợ/KH cho từng product (CL/PD/OD/BNPL) — submit HĐQT trước hiệu lực.
2. Product + Eng: rà soát flow eKYC repeat customer → tối ưu friction theo Đ.32b.
3. Collection + Finance: cập nhật waterfall thu nợ quá hạn (gốc trước lãi sau) trong core + GL.
4. BD: assess impact lên Cake CL refinance use case (Đ.8 k.6).

---

## 7. Channels & Partners

| Channel | Loại | Status |
|---|---|---|
| Cake App | Own channel | Active — target ≥40% volume |
| VDS | VPBank ecosystem | Active |
| ZLP (ZaloPay) | Ecosystem partner | Active |
| MWG (Mobile World Group) | Ecosystem partner | Active |
| Fiza | Ecosystem partner | Onboarding Q2 2026 |

---

## 8. Glossary nội bộ

| Term | Nghĩa |
|---|---|
| **OD** | Overdraft (sản phẩm thấu chi) |
| **CL** | Cash Loan |
| **PD** | Personal Disbursement |
| **BNPL** | Buy Now Pay Later |
| **PBT** | Profit Before Tax |
| **CoR** | Cost of Risk |
| **%LG2** | Loan Group 2 ratio (delinquency bucket) |
| **VDS** | VPBank Digital Services / ecosystem |
| **ZLP** | ZaloPay |
| **MWG** | Mobile World Group (Thế Giới Di Động) |
| **TT39** | Thông tư 39/2016/TT-NHNN (đang sửa đổi 2026) |
| **TCTD** | Tổ chức tín dụng |
| **HĐQT** | Hội đồng Quản trị |
| **NHNN** | Ngân hàng Nhà nước |

---

## 9. Output conventions

Áp dụng cho mọi deliverable từ team Lending:

- **Brand:** Cake brand guidelines (Pink-500 #FF2D71, Grape-500 #7B2FBE, Be Vietnam Pro). Xem file `brand-guidelines.md` upload kèm.
- **File format mặc định:**
  - `.md` cho doc/SOP
  - `.html` cho dashboard interactive
  - `.pptx` cho slide present
  - `.docx` cho report formal
  - `.xlsx` cho data/model
- **Ngôn ngữ:** Mix Việt + English tự nhiên. Việt cho discussion, English cho term chuyên môn (yield, CoR, embedded lending...).
- **Tone:** Concise, data-backed, action-oriented. Không fluffy.

---

## 10. Source materials

Team có thể tham chiếu (không upload vào Project — đính kèm khi cần):

- Annual plan: `Raw/Lending/Biz-Plan-2026/Lending Planning 2026.xlsx`
- Q2 disbursement roadmap: `Raw/Lending/Biz-Plan-2026/Road_to_3k_Q2.xlsx`
- Product scheme & config: `Raw/Lending/Product Scheme/Product Scheme_2025.xlsx`
- Dự thảo TT39 sửa đổi: `Raw/Lending/Policy/Du_thao_Thong_tu_*.pdf`
- Bản so sánh thuyết minh: `Raw/Lending/Policy/Ban_so_sanh_thuyet_minh_*.pdf`

---

*File này là team context — chỉ chứa domain knowledge dùng chung. Personal framing, decision protocol cá nhân, stakeholder lens cá nhân không nằm ở đây.*
