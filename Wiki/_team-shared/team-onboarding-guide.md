---
status: team-shared
type: onboarding-guide
audience: Lending Product team @ Cake (members mới + members hiện tại)
note: Đọc 10 phút. Làm theo từng bước. Hỏi Đạm khi vướng.
last_updated: 2026-05-14
---

# Hướng dẫn dùng Claude "Lending Hub" — cho team Lending

> Mục đích: giúp bạn dùng Claude nhanh hơn cho công việc lending hàng ngày, không cần là dân kỹ thuật.

---

## 🎯 Tóm tắt 30 giây

Bạn vừa được mời vào một **Project** tên **Lending Hub** trong Claude.

Hãy hình dung nó như một "phòng làm việc riêng" của team Lending mình. Trong phòng này, Claude đã biết sẵn:

- 4 sản phẩm của mình (OD, Cash Loan, BNPL, Merchant Loan).
- KPIs 2026 và kế hoạch Q2.
- Số liệu P&L mới nhất (Disbursement, TOI, PBT, NPL…).
- Cấu hình của 21 product scheme đang chạy.
- Brand của Cake (màu, font).

→ Bạn không cần copy/paste context mỗi lần hỏi. Tiết kiệm thời gian, output đúng style team.

---

## ✅ Trước khi bắt đầu — checklist

- [ ] Bạn có tài khoản Claude với email `@cake.vn`.
- [ ] Đạm đã add bạn vào project Lending Hub (kiểm tra email/Slack).
- [ ] Bạn có 30 phút yên tĩnh cho lần đầu (không cần hơn).

> Chưa có gì ở trên? Nhắn Đạm trên Slack.

---

## 📍 Bước 1 — Mở project (1 phút)

1. Mở Claude:
   - Web: vào **claude.ai**
   - Hoặc app: mở **Claude Desktop**
2. Đăng nhập bằng email Cake.
3. Bên trái màn hình có menu, tìm mục **Projects**.
4. Trong danh sách, click vào **Lending Hub**.

Vậy là xong. Bạn đang ở trong "phòng" của team.

---

## 📚 Bước 2 — Nhìn lướt knowledge có sẵn (5 phút)

Phía trên project, có phần **Project knowledge** — sẽ thấy 6 file. **Bạn không cần đọc hết**, chỉ cần biết file nào dùng vào việc gì:

| File | Dùng khi nào | Có cần đọc trước không? |
|---|---|---|
| `lending-team-context.md` | Strategy, KPIs, regulatory, glossary | **Đọc lướt** 5 phút |
| `product-scheme-2025.md` | Tra cấu hình product (IR, tenor, ticket, eligibility) | Tra khi cần |
| `finance-pl-bundle-guide.md` | Hiểu thuật ngữ P&L (TOI, PBT, ANR…) | Đọc khi hỏi số |
| `lending-pl-data.json` | Số liệu P&L thuần | **Không cần đọc** — Claude tự pull |
| `lending-pl-report.html` | Báo cáo P&L dạng visual | Mở browser xem nhanh |
| `brand-guidelines.md` | Brand Cake | **Không cần đọc** — Claude tự áp khi tạo slide/HTML |

→ Chỉ cần đọc lướt `lending-team-context.md`. Còn lại để Claude lo.

---

## 💬 Bước 3 — Hỏi Claude 3 câu đầu tiên (5 phút)

Copy 3 câu sau, paste vào ô chat trong project, gửi từng câu:

**Câu 1 — test query số liệu:**
```
Disbursement YTD 2026 vs Budget, gap còn lại bao nhiêu? Pacing có ổn không?
```

**Câu 2 — test query product config:**
```
Compare IR, ticket size, và eligibility giữa [Cake] Cashloan và [VDS] Cashloan. Scheme nào "đắt" hơn cho khách?
```

**Câu 3 — test query của RIÊNG bạn:**
Nghĩ 1 task bạn hay làm tuần này, hỏi Claude. Ví dụ:
- "Outline PRD cho feature [X] cho [partner]"
- "Pre-mortem launch scheme mới [Y] — risk lớn nhất?"
- "So sánh performance BNPL [BE] vs [MWG] Q1.26"

**Sau đó tự hỏi:** Output có **nhanh hơn** cách cũ không? Có **đúng style** team mình không? Có dùng được luôn không hay phải sửa nhiều?

---

## 🗂️ Bước 4 — Cheat sheet — hỏi sao cho hiệu quả

Khi bạn cần... → Hỏi như mẫu sau:

| Bạn cần | Mẫu câu hỏi |
|---|---|
| Số liệu tháng / YTD | *"Disbursement [tháng] 2026 cho [product] — compare vs Budget"* |
| Drill-down 1 channel | *"VDS Channel CashLoan Q1.26 performance — top issue?"* |
| Trend nhiều quý | *"Trend NPL 3 quý gần nhất cho [product]"* |
| Compare 2 scheme | *"Compare IR, tenor, eligibility scheme [A] vs scheme [B]"* |
| Suy nghĩ chiến lược | *"Pre-mortem launch [scheme mới] — risk lớn nhất là gì?"* |
| Hiểu regulatory | *"Impact TT39 Đ.[X] với [product / flow]"* |
| Draft cho sếp | *"Draft 5 bullet update tuần này cho [stakeholder] về [topic], tone concise"* |
| Tạo slide / HTML | *"Tạo slide 1 trang cho [topic], dùng Cake brand"* |

**Mẹo:** Nếu output dài quá hoặc lệch hướng — đừng làm lại từ đầu. Reply trực tiếp: *"Ngắn hơn"*, *"Table-first"*, *"Bỏ phần X"*, *"Apply Cake brand"*… Claude sẽ refine.

---

## 🛡️ Bước 5 — Quy tắc dùng project chung (quan trọng!)

Bạn có quyền **edit** trong project. Để khỏi "đông tay vỗ nên kêu":

**✅ Làm thoải mái:**
- Hỏi/chat — chat của bạn riêng, không ảnh hưởng người khác.
- Fix typo trong Project Instructions.
- Thêm "common prompt" hay vào Instructions.
- Flag số liệu trông cũ — nhắn Đạm.

**⚠️ Hỏi trước khi làm:**
- **Add file** mới vào knowledge → đem ra Skill Friday propose.
- **Xóa file** khỏi knowledge → đừng tự ý.
- Sửa section *Numbers Discipline / Routing / Brand* → ping Đạm.

**❌ Tuyệt đối đừng làm:**
- Đừng share project ra **ngoài team Lending + Finance**.
- Đừng output PII khách hàng (CCCD, số tài khoản, SĐT) trong chat.
- Đừng paste P&L bundle / số liệu chi tiết ra ngoài Cake.

---

## 🚨 Bước 6 — Khi gặp vấn đề

| Vấn đề | Làm gì |
|---|---|
| Claude trả số có vẻ **cũ** | Note xuống, raise ở Skill Friday. Có thể JSON cần refresh. |
| Claude **không hiểu term** nội bộ | Glossary có thể thiếu → đề xuất bổ sung vào `lending-team-context.md`. |
| Output **không đúng style** | Reply ngay trong chat: *"Output table-first, concise, Cake brand"*. |
| Bạn thấy mình **hỏi lặp lại 3+ lần** cùng 1 pattern | Đây là candidate cho **Skill** — đem ra Skill Friday. |
| Không chắc **có được share** info này không | Default = KHÔNG share. Hỏi Đạm. |
| Tất cả các vấn đề khác | Slack Đạm hoặc hỏi buddy. |

---

## 🗓️ Bước 7 — Tham gia Skill Friday

- Thứ Sáu hàng tuần, 30 phút.
- Mỗi người kể **1 thứ đã làm với Claude tuần qua**.
- Pattern nào lặp ≥3 lần → cùng nhau biến thành **Skill** (pair với 1 power user).
- Cách này giúp team improve dần — bạn **không cần học hết trong ngày đầu**.

---

## 🧭 TL;DR — đường tắt ngắn nhất

1. Mở Claude → Projects → **Lending Hub**.
2. Đọc lướt `lending-team-context.md` (5 phút).
3. Hỏi Claude 3 câu thực tế của task bạn đang làm.
4. So sánh với cách cũ — nhanh hơn không?
5. Có gì hay/lặp lại → đem ra **Skill Friday**.

---

## 👥 Liên hệ

- **Owner project:** Đạm (dam.ho@cake.vn) — hỏi gì Slack trực tiếp.
- **Channel hỗ trợ:** `#claude-help` (nếu chưa có, ping Đạm tạo).
- **Buddy onboard:** Pair với 1 power user tuần đầu (Đạm sẽ assign).

---

*Tài liệu này dài có vẻ nhiều nhưng thật ra chỉ là check-list. Bạn không cần nhớ hết — bookmark lại, khi cần thì tra. Quan trọng nhất là Bước 1-3: mở project, đọc lướt, hỏi 3 câu. Phần còn lại học dần qua dùng thật.*
