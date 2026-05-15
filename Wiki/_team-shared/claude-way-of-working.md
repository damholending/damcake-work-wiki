# Claude Way of Working — Cake Team

> **Mục đích**: Wiki nội bộ hướng dẫn team cách dùng Claude (Projects + Skills + Memory) một cách đơn giản, hiệu quả, không over-engineer.
>
> **Đối tượng**: Mọi thành viên Cake đang/sẽ dùng Claude trong công việc.
>
> **Phiên bản**: v1.0 — Cập nhật lần cuối: 2026-05-14
>
> **Owner**: Đạm (dam.ho@cake.vn)

---

## TL;DR (đọc 30 giây)

1. **Triết lý**: 80/20, không cầu toàn. Bắt đầu từ pain point lớn nhất.
2. **3 lớp**: Project (context tĩnh) → Skill (workflow lặp lại) → Memory (cá nhân hóa).
3. **Rule duy nhất cần enforce**: *Lặp 3 lần thì tạo Skill*.
4. **Cadence**: Skill Friday 30 phút/tuần.
5. **Metric duy nhất**: Time-to-good-output cho 3-5 task phổ biến nhất.

---

## 1. Tại sao cần WoW này?

Hiện tại nhiều member đang dùng Claude theo kiểu "prompt từ đầu mỗi lần". Hệ quả:

- Mất thời gian re-explain context cho mỗi task.
- Output chất lượng không đồng đều giữa các member.
- Knowledge nằm rải rác ở chat history, không reuse được.
- Khi member mới join, không có chỗ học "cách team mình dùng Claude".

WoW này giải quyết bằng việc **codify** ngữ cảnh và workflow lặp lại — nhưng theo hướng *vừa đủ*, không biến thành dự án documentation khổng lồ.

---

## 2. Triết lý cốt lõi

### Nguyên tắc 1 — 80/20

Đừng cố build KB "hoàn hảo". Bắt đầu từ thứ **đau nhất, dùng nhiều nhất**. Tất cả đều là draft v1 và sẽ tự tiến hóa qua usage.

### Nguyên tắc 2 — Living over Comprehensive

KB và skill là tài sản sống. Cái nào không dùng trong 1 tháng → xóa hoặc gộp. Không có "ngày tổng vệ sinh KB" — chỉ có vòng lặp ngắn liên tục.

### Nguyên tắc 3 — Curate, đừng accumulate

Claude đọc context tốt, nhưng noise nhiều hơn signal sẽ làm output **tệ đi**. Mỗi lần thêm vào KB, hỏi: "Cái này có giúp Claude trả lời tốt hơn 80% câu hỏi của team không?". Nếu không → đừng thêm.

### Nguyên tắc 4 — Avoid bikeshedding

Skill là code dùng nội bộ, không phải production system. Không cần approval workflow, không cần template chuẩn ngay từ đầu. Cứ làm, rồi rút pattern sau.

---

## 3. Cấu trúc 3 lớp

```
┌─────────────────────────────────────────────┐
│ Lớp 3: Memory cá nhân (CLAUDE.md)           │  ← Optional, từng người
│   Tên người, viết tắt, shorthand            │
├─────────────────────────────────────────────┤
│ Lớp 2: Skills (workflow lặp lại)            │  ← Shared, team owns
│   Quy trình ≥3 lần lặp lại                  │
├─────────────────────────────────────────────┤
│ Lớp 1: Claude Projects (context tĩnh)       │  ← Shared, team owns
│   Team là ai, làm gì, output style           │
└─────────────────────────────────────────────┘
```

### Lớp 1 — Claude Projects

**Là gì**: Workspace dùng chung, có instructions + knowledge files đính kèm. Claude sẽ tự đọc khi bạn chat trong project đó.

**Nguyên tắc thiết kế**:

- Mỗi team/domain có **1 Project duy nhất**. Không tạo 5 project cho 5 sub-domain.
- Instructions chỉ chứa **3 thứ**:
  1. Team này làm gì (1-2 câu)
  2. Cách giao tiếp (tone, format output, ngôn ngữ)
  3. Link tới 5-7 file nguồn quan trọng nhất
- Đọc xong instructions trong **2 phút**. Nếu dài hơn → đang nhồi nhét.

**Cái gì KHÔNG nên cho vào Project**:

- Toàn bộ Confluence của team (noise quá nhiều)
- Dữ liệu sensitive (PII, account number, credential)
- File >50 trang nếu không thực sự cần

### Lớp 2 — Skills

**Là gì**: Một file `SKILL.md` mô tả workflow lặp lại, kèm 1-2 file reference nếu cần. Claude tự trigger khi user yêu cầu task khớp với description của skill.

**Quy tắc Rule of 3**:

> Khi bạn phải prompt cùng một workflow **3 lần** → bắt buộc tạo skill.

Đây là rule **duy nhất** trong WoW này cần enforce cứng.

**Một skill tốt trông như thế nào**:

- `SKILL.md` ngắn (50-150 dòng): mô tả + 3-7 bước + ví dụ input/output
- Description rõ ràng để Claude tự trigger đúng lúc
- Có ít nhất 1 ví dụ đã work
- Không quá 2 reference file

**Anti-pattern**: Skill 500 dòng cố cover mọi edge case. Skill như vậy không ai maintain nổi.

### Lớp 3 — Memory cá nhân (Optional)

**Là gì**: File `CLAUDE.md` riêng của mỗi member, chứa:

- Tên người trong team (để Claude hiểu khi bạn nói "Trang", "Hùng")
- Viết tắt nội bộ ("CC" = Cake Card, "OB" = Onboarding...)
- Brand guideline áp dụng cho output cá nhân
- Preference cá nhân (tone, format mặc định)

**Không cần enforce**. Ai dùng Claude sâu sẽ tự build. Người mới chưa cần.

---

## 4. Step-by-step Setup

### 📅 Tuần 0 — Chuẩn bị (Team Lead)

**Mục tiêu**: Xác định domain đầu tiên để bootstrap.

**Step 1.1** — Liệt kê 5 task team làm nhiều nhất với Claude/AI hiện tại. Ví dụ:

- Viết PRD
- Review PR
- Tổng hợp meeting note
- Trả lời câu hỏi về quy trình onboarding
- Draft email comms nội bộ

**Step 1.2** — Chọn **1 domain** đau nhất để làm pilot. Đừng làm cả 5 cùng lúc.

**Step 1.3** — Identify **2 file/tài liệu** nguồn quan trọng nhất của domain đó (ví dụ: PRD template, guideline gần nhất). Tải xuống dạng `.md` hoặc `.pdf`.

---

### 📅 Tuần 1 — Project đầu tiên

**Mục tiêu**: Có 1 Project chạy được cho domain pilot.

**Step 2.1** — Vào Claude → Projects → New Project.

**Step 2.2** — Đặt tên Project rõ ràng: `Cake — [Domain]` (ví dụ: `Cake — Product Specs`).

**Step 2.3** — Paste instructions theo template bên dưới (xem [Phụ lục A](#phụ-lục-a--project-instructions-template)).

**Step 2.4** — Upload 2-3 file nguồn quan trọng nhất (đã chuẩn bị ở Tuần 0).

**Step 2.5** — Test với 3 prompt thực tế. Tinh chỉnh instructions cho đến khi output ổn.

**Step 2.6** — Share project với 2-3 power user của team. Cho họ dùng 1 tuần, lấy feedback.

✅ **Acceptance criteria**: Power user xác nhận output từ project tốt hơn rõ rệt so với "prompt từ scratch".

---

### 📅 Tuần 2-4 — Skill đầu tiên

**Mục tiêu**: Có 1-2 skill chạy được, team biết cách tạo skill.

**Step 3.1** — Mở Skill Friday đầu tiên (30 phút). Mỗi member kể 1 thứ họ đã làm với Claude tuần qua. Pick 1 workflow lặp lại nhiều nhất.

**Step 3.2** — Pair 1 power user + 1 newbie cùng tạo skill đầu tiên. Dùng template ở [Phụ lục B](#phụ-lục-b--skill-template).

**Step 3.3** — Test skill với 3 user khác nhau trong team. Skill phải work cho cả người chưa từng làm task đó.

**Step 3.4** — Commit skill vào shared repo / wiki / folder team.

**Step 3.5** — Lặp lại cho skill thứ 2 ở Skill Friday tiếp theo.

✅ **Acceptance criteria**: 2 skill được dùng bởi ≥3 người khác nhau trong 2 tuần.

---

### 📅 Tháng 2+ — Vận hành

**Mục tiêu**: WoW tự chạy, không cần Team Lead đẩy.

**Cadence cố định**:

- **Skill Friday** (30 phút mỗi thứ Sáu): show & tell + tạo skill mới nếu có.
- **Quarterly cleanup** (1 giờ mỗi quý): review toàn bộ skill, xóa cái không dùng, gộp cái trùng.
- **Onboarding new member**: pair với buddy đi qua wiki này + 1 project + 1 skill thực tế.

**Tự nhiên scale**:

- Khi có 2-3 domain ổn định → tạo thêm Project cho domain khác.
- Khi có ≥10 skill → tổ chức thành folder theo domain.
- Khi có ≥3 team dùng → cân nhắc shared skills repo.

---

## 5. Rules of Engagement

| # | Rule | Mức độ |
|---|------|--------|
| 1 | Lặp 3 lần → tạo Skill | **Bắt buộc** |
| 2 | Skill Friday 30 phút mỗi tuần | **Bắt buộc** |
| 3 | Project instructions ≤2 phút đọc | **Bắt buộc** |
| 4 | Skill không dùng 1 tháng → xóa | **Bắt buộc** |
| 5 | Pair khi tạo skill đầu tiên | **Khuyến nghị** |
| 6 | Memory cá nhân (CLAUDE.md) | **Optional** |

> **Không có Rule #7 trở đi**. Mọi quy định khác đều over-engineer.

---

## 6. Anti-patterns (đừng làm)

### ❌ "Skill Governance Framework"

Tạo approval workflow 3 bước cho mỗi skill mới. Skill là code nội bộ — review nhẹ là đủ.

### ❌ KPI "X skills/người/tháng"

Chất lượng sẽ tệ ngay. Skill ra đời từ **pain thực**, không từ deadline.

### ❌ Documentation marathon

Dành 2 tuần "build KB chuẩn" trước khi cho team dùng. Đến khi xong thì context đã cũ. Build trong khi dùng.

### ❌ One Project to rule them all

Nhồi tất cả tài liệu vào 1 project khổng lồ. Claude sẽ rối, output tệ.

### ❌ Skill cố cover mọi edge case

Skill 500 dòng with 20 if-then branch. Không ai maintain nổi. Tách thành skill nhỏ riêng.

### ❌ Template chuẩn hóa quá sớm

Bắt member dùng template skill cứng nhắc từ skill đầu tiên. Để 5-10 skill ra đời tự nhiên, rồi mới rút template từ pattern thực tế.

### ❌ Wiki khổng lồ

Wiki này quá 2000 dòng → không ai đọc. Giữ ngắn, cập nhật thường xuyên.

---

## 7. Metric duy nhất đáng track

**Time-to-good-output** cho 3-5 task phổ biến nhất của team.

**Cách đo** (mỗi quý):

1. Pick 5 task mẫu (cùng các task đã chọn ở Tuần 0).
2. Đo trung bình thời gian từ "bắt đầu prompt" → "output đủ tốt để dùng" (ước lượng OK, không cần stopwatch).
3. So sánh quý này vs quý trước.

**Diễn giải**:

- Giảm rõ rệt → WoW đang work, giữ nguyên.
- Không giảm → Có vấn đề ở Project context hoặc Skill quality. Đập đi rà soát, **không tô vẽ thêm process**.

**Tuyệt đối không track**:

- Số skill mỗi người tạo (sẽ ra skill rác)
- Số lần dùng Claude (vanity metric)
- Độ dài KB (càng dài càng tệ)

---

## 8. FAQ

### Q: Em mới vào team, bắt đầu từ đâu?

1. Đọc wiki này (15 phút).
2. Join Project của team mình, thử prompt 3 task quen thuộc.
3. Xem 2-3 skill đã có, đọc SKILL.md để hiểu pattern.
4. Dự Skill Friday gần nhất, hỏi buddy nếu chưa rõ.

### Q: Khi nào nên tạo Project mới vs thêm vào Project cũ?

Tạo Project mới khi: **domain hoàn toàn khác** (audience khác, output style khác, knowledge nguồn khác). Còn lại → thêm vào Project hiện có.

### Q: Khi nào nên tạo Skill vs chỉ prompt?

Trigger Rule of 3: bạn đã prompt cùng workflow 3 lần với cùng pattern → tạo skill. Chưa đủ 3 lần → cứ prompt thường.

### Q: Skill có cần code không?

Không bắt buộc. Đa số skill chỉ là markdown mô tả quy trình. Chỉ thêm code/script khi thật sự cần (ví dụ: parse data theo format cụ thể).

### Q: Nếu skill của em mâu thuẫn với skill của team khác?

Skill local thắng. Mỗi team tự own skill của mình. Chỉ promote lên "shared skill" khi ≥3 team confirm pattern giống nhau.

### Q: Có cần backup/version control cho Project và Skill?

Khuyến nghị: lưu bản gốc của Project instructions và Skill files trong Git/SharePoint của team. Claude UI là live copy, nhưng nguồn truth nên ở repo team.

### Q: Em không phải dev, có làm được skill không?

Có. Skill chủ yếu là viết hướng dẫn bằng tiếng Việt/Anh cho Claude. Không cần code. Pair với 1 dev nếu cần xử lý file phức tạp.

---

## Phụ lục A — Project Instructions Template

> Copy template này, điền vào dấu `[...]`. Mục tiêu: ≤200 từ, đọc trong 2 phút.

```markdown
# Project: Cake — [Domain Name]

## Team này làm gì
[1-2 câu mô tả mục đích team / domain]

## Cách giao tiếp với Claude
- Ngôn ngữ: [Tiếng Việt / Tiếng Anh / cả hai]
- Tone: [chuyên nghiệp / casual / formal]
- Format mặc định: [bullet point / prose / table]
- Độ dài: [ngắn gọn / chi tiết theo yêu cầu]

## Tài liệu nguồn quan trọng nhất
1. [Tên file 1] — dùng khi [tình huống]
2. [Tên file 2] — dùng khi [tình huống]
3. [Tên file 3] — dùng khi [tình huống]

## Quy ước nội bộ
- [Viết tắt hay dùng, ví dụ: "CC = Cake Card"]
- [Tên hệ thống nội bộ, ví dụ: "Core = hệ thống core banking"]

## Brand guideline (nếu áp dụng)
Áp dụng Cake brand theme khi tạo slide/report/HTML:
- Pink-500 #FF2D71 cho CTA chính
- Font: Be Vietnam Pro
- (Xem thêm wiki Cake Brand)

## Không làm
- [Việc Claude tuyệt đối không nên làm trong context team này]
```

---

## Phụ lục B — Skill Template

> Tạo file `SKILL.md` trong folder skill của team. Mục tiêu: 50-150 dòng.

```markdown
---
name: [skill-name-ngắn-gọn-dạng-kebab-case]
description: [1-2 câu mô tả khi nào skill này nên trigger. Càng cụ thể càng tốt — đây là cái Claude đọc để quyết định có dùng skill hay không.]
---

# [Tên skill dạng đọc được]

## Khi nào dùng skill này
- Trigger 1: [tình huống cụ thể]
- Trigger 2: [tình huống cụ thể]
- KHÔNG dùng khi: [tình huống không apply]

## Input cần có
- [Thông tin 1 user phải cung cấp]
- [Thông tin 2 user phải cung cấp]

## Quy trình
1. **Bước 1**: [Mô tả bước]
2. **Bước 2**: [Mô tả bước]
3. **Bước 3**: [Mô tả bước]
4. **Bước 4**: [Mô tả bước]

## Output format
[Mô tả format output mong muốn — bullet/prose/file gì]

## Ví dụ
**Input**: [ví dụ thực tế]

**Output**: [ví dụ output đã work]

## Reference (optional)
- `template.md` — template dùng cho bước 3
- `examples/` — folder chứa 2-3 ví dụ đã work
```

---

## Phụ lục C — Checklist Tuần đầu (cho member mới)

- [ ] Đọc wiki này (15 phút)
- [ ] Cài Claude Desktop / vào claude.ai
- [ ] Join Project của team
- [ ] Thử 3 prompt với task quen thuộc, so sánh với cách cũ
- [ ] Đọc 2 SKILL.md hiện có của team
- [ ] Dự Skill Friday gần nhất
- [ ] (Optional) Tạo CLAUDE.md cá nhân với 5 viết tắt mình hay dùng
- [ ] Có 1 buddy để hỏi khi vướng

---

## Phụ lục D — Liên hệ & Đóng góp

- **Owner wiki**: Đạm (dam.ho@cake.vn)
- **Đề xuất chỉnh sửa**: PR trực tiếp vào repo `damcake-work-wiki` hoặc nhắn Đạm.
- **Skill Friday host**: rotate theo tháng — xem lịch trong channel team.
- **Channel hỗ trợ**: `#claude-help` (nếu chưa có thì tạo, ping Đạm).

---

*Wiki này được thiết kế để ngắn. Nếu bạn thấy thiếu thông tin gì — hỏi trong channel trước khi viết thêm. Đa số "thông tin thiếu" thực ra là chi tiết đặc thù từng team, nên ở Project instructions của team đó, không phải ở wiki chung này.*
