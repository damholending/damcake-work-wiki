---
status: wiki
type: domain-knowledge
topic: lending, products, kpi, strategy
source: synced from ~/Desktop/Personal/Dam-Wiki/Wiki/work-context.md
---

# Lending — Mental Model

> Domain note về sản phẩm cho vay tại Cake. Đây là **knowledge của mình**, không phải spec.
> *Last updated: 2026-05-11*

## Role & Scope

- **Role:** Head of Lending Product @ Cake by VPBank
- **Mindset:** Mini CEO — manage P&L, act như owner
- **Báo cáo lên:** CEO

## Sản phẩm lending tại Cake (4 products)

| Product | Mô tả |
|---|---|
| **OD** | Overdraft — vay thấu chi |
| **Cash Loan** | Vay tiền mặt |
| **BNPL** | Buy Now Pay Later — mua trước trả sau |
| **Merchant Loan** | Vay cho merchant |

**Strategy:** Embedded Lending — nhúng sản phẩm vào hệ sinh thái lớn (ví, eCommerce, ride-hailing) + own channel Cake App.

## KPIs 2026

| Chỉ tiêu | Target |
|---|---|
| **Giải ngân** | 40,000 tỷ VND |
| **PBT** | 700 tỷ VND |
| **%LG2** | ≤ 11% (không vượt 3 tháng liên tiếp) |
| **Cake App channel** | ≥ 40% tổng giải ngân |

**PBT-first mindset:** 700 tỷ PBT không nhất thiết phải đến từ đủ 40k tỷ — focus yield optimization, cost of risk, product mix.

## Q2 2026 Plan

| Tháng | Target giải ngân |
|---|---|
| April 2026 | 2,500 tỷ |
| May 2026 | 2,700 tỷ |
| June 2026 | 3,000 tỷ |

## Strategic Priorities Q2 2026

**Channel activation & expansion:**
- VDS (VPBank ecosystem)
- Cake App (own channel)
- ZLP (ZaloPay)
- MWG (Mobile World Group / Thế Giới Di Động)
- Fiza (đang onboard)

**Portfolio optimization:** yield × volume - expected loss (không chỉ chạy volume).

**AI Adoption:** Push AI vào workflow team, build thư viện use cases thực tế.

## Background góc nhìn

Đã trải qua 3 role trong digital lending → nhìn lending từ 3 góc cùng lúc:

- **BD** — partnership, go-to-market
- **Risk** — credit risk, underwriting, portfolio management
- **Product** — product lifecycle, strategy

## Mental Models áp dụng

| Context | Model |
|---|---|
| Product strategy | Jobs-to-be-done · Embedded lending flywheel |
| Prioritization | ICE / RICE · P&L impact first |
| Risk vs Growth | Second-order thinking · Pre-mortem |
| Lending / credit | Risk-adjusted return · Portfolio thinking |

## Key Metrics cần track

- **Yield** (lãi suất hiệu dụng)
- **Volume / Disbursement** (giải ngân)
- **CoR / Cost of Risk** (chi phí rủi ro tín dụng)
- **%LG2** (delinquency rate trên buckets cụ thể)
- **Channel mix** (Cake App vs ecosystem)

## Regulatory watch — Dự thảo TT sửa đổi TT39/2016/TT-NHNN

> Dự thảo NHNN, hiệu lực dự kiến 2026. Đây là khung pháp lý gốc cho hoạt động cho vay của TCTD — sửa lần này ảnh hưởng trực tiếp đến **cho vay bằng phương tiện điện tử** (mảng chính của Cake).
> Raw: [`Du_thao_Thong_tu_*.pdf`](../../Raw/Lending/Policy/Du_thao_Thong_tu_78b7_836e_d21cf894.pdf) · [`Ban_so_sanh_thuyet_minh_*.pdf`](../../Raw/Lending/Policy/Ban_so_sanh_thuyet_minh_24f8_9cf8_0d87dae4.pdf)

| Điều | Thay đổi | Impact với Cake |
|---|---|---|
| **Đ.22 k.2 điểm h (mới)** | TCTD **phải tự quy định giới hạn dư nợ/1 KH** khi cho vay điện tử | Cần ban hành nội bộ cap dư nợ/KH cho CL + PD + OD + BNPL — thay cho cap cứng 100tr cũ |
| **Đ.32c, Đ.32h (bãi bỏ)** | Bỏ các giới hạn cứng hiện hành cho cho vay điện tử | Mở room — chuyển sang tự quản theo Đ.22 điểm h |
| **Đ.32b (sửa)** | KH đã onboarded tại TCTD → TCTD tự chọn biện pháp xác minh phục vụ vay điện tử | Giảm friction repeat customer — không bắt full re-eKYC |
| **Đ.18 k.4 (sửa)** | Nợ quá hạn: **gốc thu trước, lãi thu sau** | Đổi waterfall thu hồi — impact collection workflow + accounting |
| **Đ.8 k.6 (sửa)** | Siết điều kiện cho vay để trả nợ TCTD khác (định nghĩa lại "chưa cơ cấu lại") | Ảnh hưởng sản phẩm refinance / consolidation |
| **Đ.2 k.13 (sửa)** | Nới định nghĩa "khoản cho vay giá trị nhỏ" (đặc thù Quỹ TDND) | Không impact trực tiếp |
| **Đ.1 k.3 (mới)** | Cho vay theo phương án cơ cấu lại của TCTD bị kiểm soát đặc biệt | Không apply cho Cake |

**Action items khi TT chính thức:**
1. Risk + Legal: dự thảo nội bộ cap dư nợ/KH cho từng product (CL/PD/OD/BNPL) — submit cho HĐQT trước hiệu lực.
2. Product + Eng: rà soát flow eKYC repeat customer → tối ưu friction theo Đ.32b mới.
3. Collection + Finance: cập nhật waterfall thu nợ quá hạn (gốc trước lãi sau) trong core + GL.
4. BD: assess impact lên Cake CL refinance use case (Đ.8 k.6).

## Raw materials

- Policy hiện hành: [`../../Raw/Lending/Policy/Lending_Policy_Vay trên 100M.pptx`](../../Raw/Lending/Policy/)
- Dự thảo TT mới (2026): [`../../Raw/Lending/Policy/Du_thao_Thong_tu_78b7_836e_d21cf894.pdf`](../../Raw/Lending/Policy/Du_thao_Thong_tu_78b7_836e_d21cf894.pdf) + [bản so sánh thuyết minh](../../Raw/Lending/Policy/Ban_so_sanh_thuyet_minh_24f8_9cf8_0d87dae4.pdf)
- Products: [`../../Raw/Lending/Products/`](../../Raw/Lending/Products/)
- P&L lending: [`../../Raw/Lending/Analytics/`](../../Raw/Lending/Analytics/)
- Q2 disbursement roadmap: [`../../Raw/Lending/Disbursement/Road_to_3k_Q2.xlsx`](../../Raw/Lending/Disbursement/Road_to_3k_Q2.xlsx)

---

**Synced from Personal wiki — original ở `~/Desktop/Personal/Dam-Wiki/Wiki/work-context.md`.**
