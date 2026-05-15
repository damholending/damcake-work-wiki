# Step-by-Step Setup Guide — Claude Project cho Team Lending Product

> Estimated time: 25–35 phút cho project đầu tiên. Project sau (Product Spec, P&L, Risk) sẽ nhanh hơn vì có template rồi.
> *Last updated: 11 May 2026*

---

## Pre-flight checklist (5 phút)

Trước khi vào claude.ai, check:

- [ ] Bạn login claude.ai với account `dam.ho@cake.vn` (account Cake Team)
- [ ] Bạn có quyền **Edit project** (Team plan members default có)
- [ ] Có sẵn danh sách email của 7 team members
- [ ] Folder `~/Desktop/Work/damcake-work-wiki/Wiki/` accessible (chuẩn bị upload)
- [ ] Đã đọc `01_Lending-Team-Hub_setup-pack.md` — biết sẽ paste gì

---

## Step 1 — Tạo Project (3 phút)

1. Mở claude.ai, sidebar trái → click **Projects**
2. Click **Create new project** (góc phải trên)
3. Điền:
   - **Project name:** `Lending Product — Team Hub`
   - **Description:** Copy từ `01_Lending-Team-Hub_setup-pack.md` § 1
4. Click **Create**

✅ Done step 1 khi: thấy project mới ở Project list, đang trong project page rỗng.

---

## Step 2 — Cấu hình Custom Instructions (5 phút)

1. Trong project, click **Set custom instructions** (hoặc icon ⚙️ Settings)
2. Mở `01_Lending-Team-Hub_setup-pack.md` § 2
3. Copy **toàn bộ block code** giữa 2 dòng ``` của § 2
4. Paste vào ô **Custom instructions** trên claude.ai
5. Click **Save**

✅ Done step 2 khi: thấy preview hiển thị "Custom instructions: Active" (hoặc tương tự).

**Tip:** Nếu instructions quá dài bị truncate → ưu tiên giữ phần VOICE, DECISION PROTOCOL, KPIs, STAKEHOLDER. Phần BRAND có thể trim nếu cần (đã có trong knowledge `brand-guidelines.md`).

---

## Step 3 — Upload Knowledge files (10 phút)

1. Trong project, scroll xuống section **Project knowledge**
2. Click **Add content** → **Upload files**
3. Navigate đến `~/Desktop/Work/damcake-work-wiki/`
4. Upload **10 files** (cùng lúc nếu được, hoặc từng cái):

**8 file Wiki — domain knowledge:**

```
Wiki/aboutme.md
Wiki/way-of-working.md
Wiki/stakeholders.md
Wiki/brand-guidelines.md
Wiki/domains/lending.md
Wiki/domains/risk.md
Wiki/domains/finance.md
Wiki/domains/ai-at-cake.md
```

**2 file team guide — để team đọc khi onboard:**

```
Projects/Team-Claude-Project-Setup/02_Huong-Dan-Cho-Team_Cach-Dung-Claude.md
Projects/Team-Claude-Project-Setup/03_Cheat-Sheet_1-trang.md
```

5. Đợi parse xong (vài giây mỗi file)
6. Verify: mỗi file hiển thị icon ✓, không có error

✅ Done step 3 khi: section Project knowledge hiển thị **10 files**, status all green.

### Step 3b — Tạo "Welcome chat" pinned ở top (3 phút)

Sau khi 10 file upload xong:

1. Click **Start new chat** trong project
2. Paste prompt sau:

```
Tóm tắt 5 việc team cần biết khi vào project này lần đầu,
dựa trên file 02_Huong-Dan-Cho-Team. Output format friendly,
dùng emoji, đầu mỗi điểm có icon. Cuối bài kèm 1 dòng:
"Đọc full hướng dẫn ở file 02_Huong-Dan-Cho-Team trong
Project Knowledge bên phải."
```

3. Đợi Claude trả lời → chat sẽ chứa welcome message
4. Đặt tên chat: **"📖 START HERE — Đọc trước khi dùng"** (click vào tiêu đề chat để rename)
5. Pin chat: click **dấu 3 chấm** cạnh tên chat → **Star** hoặc **Pin to top**

✅ Done khi: chat "START HERE" nằm ở top danh sách chat trong project.

**Quan trọng:**
- Nếu Claude báo "knowledge base near limit" → check lại có upload nhầm file lớn không. 8 file Wiki tổng < 50KB, còn rất nhiều room.
- KHÔNG upload file Excel/PowerPoint trực tiếp — chuyển sang `.md` hoặc `.txt` trước. Lý do: parse xlsx vào context tốn token + chất lượng kém.

---

## Step 4 — Test setup trước khi invite team (5 phút)

**Quan trọng — đừng skip step này.** Test trước, fix bug, rồi mới invite. Tránh team nhận project broken.

1. Trong project, click **Start new chat**
2. Mở `01_Lending-Team-Hub_setup-pack.md` § 5
3. Chạy lần lượt 3 test prompts:

**Test 1:** `Tóm tắt KPI lending 2026 trong 5 dòng`
→ Check: có 40k/700/11%/40% không, bullet ngắn không?

**Test 2:** `Tôi cần draft Slack ngắn cho CRO về việc OD %LG2 tháng này tăng lên 12.5%. Voice của tôi.`
→ Check: direct không, data-first không, có hypothesis không?

**Test 3:** `Tạo HTML slide title cho team meeting: "Q2 Mid-month Review"`
→ Check: dùng Pink #FF2D71 không, font Be Vietnam Pro không?

**Nếu fail bất kỳ test nào:**
- Custom instructions có thể không load đúng → review Step 2
- Knowledge có thể chưa parse → wait thêm 1–2 phút, retry
- Test 3 fail → có thể Claude không generate HTML mặc định, ok skip

✅ Done step 4 khi: 2/3 test pass (test 3 optional).

---

## Step 5 — Invite team members (5 phút)

1. Trong project, click **Manage access** (icon người + dấu cộng)
2. Add từng email member:

```
nguyenthanhlam@cake.vn       → Permission: Can edit  (Senior PM)
lychicuong@cake.vn           → Permission: Can edit  (Senior PM)
nguyenvominhdinh@cake.vn     → Permission: Can use
phanthanhduyen@cake.vn       → Permission: Can use
nguyenphamtuyettien@cake.vn  → Permission: Can use   (Portfolio)
phankhanhchi@cake.vn         → Permission: Can use   (Staff)
hogiakiet@cake.vn            → Permission: Can use   (Staff)
```

(Email thực tế bạn confirm lại — placeholder theo họ tên)

3. Click **Send invites**
4. Members nhận email → click link → access project

✅ Done step 5 khi: Manage access list hiển thị 7 members, status "Accepted" hoặc "Invited".

**Permission logic:**
- **Can edit** cho 2 Senior PM (Lâm, Cường) — họ có thể update knowledge khi cần
- **Can use** cho 5 còn lại — họ chat, không sửa knowledge (tránh accidental modification)

---

## Step 6 — Send welcome message (3 phút)

1. Mở Slack/email/Zalo nhóm team
2. Copy welcome message từ `01_Lending-Team-Hub_setup-pack.md` § 4
3. Paste + send

Nội dung message giải thích:
- Khi nào dùng project này vs chat cá nhân
- Cách dùng hiệu quả
- Chất liệu trong knowledge base
- Cách feedback nếu thấy thiếu/sai

---

## Step 7 — Monitor + iterate (ongoing)

**Tuần đầu sau rollout:**

- [ ] Check Activity feed mỗi 2 ngày — xem ai dùng, dùng cho gì
- [ ] Pin 2–3 chat "good example" để team học cách prompt
- [ ] Note câu hỏi nào Claude trả lời sai/thiếu → update knowledge

**Tháng đầu:**

- [ ] Survey nhanh team — Claude có giúp không? Tiết kiệm bao nhiêu thời gian?
- [ ] Update Wiki ở `~/Desktop/Work/damcake-work-wiki/Wiki/` khi knowledge gap được phát hiện
- [ ] **Re-upload** file lên project (Claude Projects không auto-sync với local — phải upload lại sau khi update)
- [ ] Spin up project thứ 2 (Product Spec) sau khi team quen với pattern

**Re-upload workflow** (quan trọng):

```
1. Update file local ở ~/Desktop/Work/damcake-work-wiki/Wiki/<file>.md
2. Git commit + push lên Cake Org
3. Trên claude.ai project → Knowledge → click file cũ → Delete
4. Add content → Upload file mới
5. Verify trong chat: "What's the last updated date of <file>?"
```

Bí quyết: chỉ re-upload khi có thay đổi material. Tweak typo không cần.

---

## Step 8 — Roadmap 4 projects còn lại

Sau khi Team Hub stable (2 tuần), spin up theo thứ tự ưu tiên:

| # | Project | Members | Knowledge | Khi nào tạo |
|---|---|---|---|---|
| 2 | **Lending — Product Spec** | 4 Senior/Mid PM (Lâm, Cường, Định, Duyên) | + PRD template, lending policy, product docs | Khi team có PRD mới sắp viết |
| 3 | **Lending — P&L & Analytics** | Bạn + Tiên (Portfolio) | + P&L Q1, Unit Economics, Biz Plan tracking (convert sang md) | Trước Monthly P&L Review tháng 6 |
| 4 | **Lending — Risk Review** | Bạn + Lâm + Cường + Tiên | + Risk Committee outputs, SBV thông tư, %LG2 framework | Trước Risk Committee tháng 6 |

Mỗi project sau dùng cùng pattern, chỉ thay knowledge + custom instructions phần domain-specific.

---

## Troubleshooting

| Issue | Cause | Fix |
|---|---|---|
| Claude trả lời generic, không match voice | Custom instructions chưa load | Re-paste instructions, refresh project |
| Claude không citation file knowledge | File chưa parse xong | Wait 1–2 phút, retry |
| File upload báo "too large" | xlsx/pptx | Convert sang md trước upload |
| Member báo "không access được" | Email chưa khớp Cake Team | Check email exact, re-invite |
| Knowledge base bị nói "outdated" | Đã sửa file local nhưng chưa re-upload | Delete file cũ trên project + upload bản mới |
| Claude trả lời quá dài | Voice rules không pick up | Add prompt "trong 5 dòng" hoặc "bullet only" |

---

## Quick reference (bookmark)

- **Setup pack file 1:** [`01_Lending-Team-Hub_setup-pack.md`](01_Lending-Team-Hub_setup-pack.md)
- **Source Wiki:** `~/Desktop/Work/damcake-work-wiki/Wiki/`
- **Claude.ai Projects:** https://claude.ai/projects
- **Help docs:** https://support.claude.com/en/articles/9519177

---

**Câu hỏi gặp lại nhiều → update file này.**
