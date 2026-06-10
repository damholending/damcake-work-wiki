---
status: team-shared
type: onboarding-guide
audience: Lending Product team — chưa xài git
purpose: Setup repo damcake-work-wiki từ zero + daily workflow
last_updated: 2026-06-09
estimated_time: 30 phút setup + 5 phút mỗi lần work
---

# Git Onboarding — Lending Team

> Doc này cho team chưa xài git. Đọc top→bottom, làm theo từng bước. Stuck chỗ nào ping Đạm.

---

## Why git?

- **Source of truth** = GitHub repo `damholending/damcake-work-wiki`. File nào không trong đó = không tồn tại.
- **Version control** — mọi thay đổi đều log lại, rollback được khi sai.
- **Collaborate** — team cùng edit file mà không ghi đè lẫn nhau.
- **Auto-sync Claude project** — push xong, Claude project tự pull → query được ngay.

---

## Part 1 — Setup (1 lần, ~30 phút)

### Step 1.1 — Tạo GitHub account (skip nếu đã có)

1. Vào https://github.com/signup
2. Đăng ký bằng email **cá nhân** (Gmail OK, không dùng email Cake)
3. Pick free plan
4. Verify email

📝 **Note**: dùng GitHub username dễ nhớ, viết hoa-thường rõ. Vd: `lamnguyen-cake`, `cuonglychi`.

### Step 1.2 — Accept invite từ Đạm

1. Check email inbox — tìm mail từ `noreply@github.com` tiêu đề **"@damholending added you as a collaborator on damcake-work-wiki"**
2. Click **View invitation** → **Accept invitation**
3. Sẽ redirect tới repo page → bookmark URL

### Step 1.3 — Install Git + GitHub CLI

Mở Terminal (Spotlight `Cmd+Space` → gõ "Terminal" → Enter).

```bash
# Check git có sẵn chưa
git --version
# Nếu không có → install:
xcode-select --install

# Install gh CLI (GitHub command line)
brew install gh
# Nếu chưa có brew: vào https://brew.sh copy install command
```

Verify:
```bash
git --version          # phải show v2.x+
gh --version           # phải show v2.x+
```

### Step 1.4 — Auth với GitHub

```bash
gh auth login
```

Chọn theo prompt:
- `GitHub.com`
- `HTTPS`
- `Y` (authenticate Git with your GitHub credentials)
- `Login with a web browser` → copy code → mở browser → paste → authorize

Verify:
```bash
gh auth status
# Phải show: ✓ Logged in to github.com account <YOUR_USERNAME>
```

### Step 1.5 — Set Git identity

```bash
git config --global user.name "Tên Của Bạn"
git config --global user.email "your.email@gmail.com"
```

⚠️ Email **PHẢI MATCH** với email GitHub account (Step 1.1). Nếu sai, commit sẽ không show tên bạn.

### Step 1.6 — Clone repo về máy

```bash
mkdir -p ~/Desktop/Work
cd ~/Desktop/Work
git clone https://github.com/damholending/damcake-work-wiki.git
cd damcake-work-wiki
```

Xong! Bạn đã có full repo về máy. Browse trong Finder / Antigravity IDE để xem.

---

## Part 2 — Daily workflow (5 phút mỗi lần work)

### Rule vàng — TRƯỚC khi work

```bash
cd ~/Desktop/Work/damcake-work-wiki
git pull origin main
```

Đây là **bắt buộc** — pull latest từ server trước khi edit, tránh conflict với người khác.

### Workflow chuẩn

```bash
# 1. Pull latest
git pull origin main

# 2. Edit file bằng editor yêu thích (Antigravity, VSCode, Cursor, etc.)
#    Hoặc tạo file mới trong folder thích hợp

# 3. Check những gì đã đổi
git status

# 4. Stage file muốn commit (chỉ add file bạn edit)
git add Wiki/_team-shared/your-file.md
# Hoặc add nhiều file:
git add file1.md file2.md folder/

# 5. Commit với message rõ ràng
git commit -m "Cập nhật BE Cashloan funnel T6/2026"

# 6. Push lên server
git push origin main
```

---

## Part 3 — Convention (must follow)

### Commit message

Format: `<verb> <object>` (Tiếng Việt OK, ngắn gọn, descriptive)

✅ Good:
- `Cập nhật product scheme ZLP Q2/2026`
- `Add BE funnel analysis T6`
- `Fix typo trong lending-pl-guide`
- `Refactor risk policy template`

❌ Bad:
- `update`
- `fix`
- `wip`
- `asdf`

### File location (đặt file đâu)

| Loại file | Folder | Ví dụ |
|---|---|---|
| Team-shared doc / process | `Wiki/_team-shared/` | onboarding, project instructions, weekly tracker |
| Domain knowledge | `Wiki/domains/` | lending.md, finance.md, risk.md |
| Decision log | `Wiki/decisions/` | `YYYY-MM-DD_<topic>_<decision>.md` |
| Project work | `Projects/<project-name>/` | BRD, design doc, code |
| Monthly report | `Raw/Lending/Monthly Report/` | `{Mon}-Cake Monthly Report 2026.pptx` |
| HTML report | `HTML-Reports/` | `BE_Funnel_T6_2026.html` |
| Source data | `Raw/<category>/` | Excel, PDF, source files |

### File naming

- Snake-case hoặc kebab-case: `lending-team-context.md`, `risk_policy_q2.md`
- Tiếng Việt OK nhưng tránh dấu trong path (vd: `Risk Committee T5-2026 - Risk Note.pdf` OK; tránh `Báo Cáo Tháng.pdf` trong path)
- Date format: `YYYY-MM-DD` đầu hoặc cuối tên file (vd: `2026-06-09_decision_x.md`)

### TUYỆT ĐỐI KHÔNG commit

- Password, API key, token (xem `.gitignore` đã exclude `.env`, `*.log`, `.claude/settings.local.json`)
- File excel/word có chứa số liệu CHƯA APPROVE
- Personal data của khách hàng (CCCD, số tài khoản, etc.)
- File large >50MB (image/video raw)

Nếu lỡ commit nhạy cảm → ping Đạm NGAY, đừng push.

---

## Part 4 — Common mistakes (đừng làm)

### ❌ DON'T 1: Force push

```bash
git push --force   # NEVER
```

Sẽ overwrite history, mất commit của người khác. Nếu sai → revert thay vì force.

### ❌ DON'T 2: `git add .` hoặc `git add -A` không nhìn

```bash
git add .   # Add MỌI thay đổi, dễ commit nhầm file local-only
```

→ Luôn dùng path cụ thể: `git add Wiki/_team-shared/yourfile.md`

### ❌ DON'T 3: Push lên main trực tiếp khi không sure

Nếu sửa file lớn / sensitive → hỏi Đạm trước, hoặc push lên branch riêng:
```bash
git checkout -b draft/your-feature
git push origin draft/your-feature
# Sau đó mở PR trên GitHub, Đạm review
```

### ❌ DON'T 4: Commit file editor temp

VD: `.DS_Store`, `.vscode/`, `__pycache__/`. `.gitignore` đã exclude rồi, nhưng cẩn thận file lạ.

### ❌ DON'T 5: Push khi conflict chưa resolve

Nếu `git pull` báo conflict → đừng push. Resolve trước (Part 5).

---

## Part 5 — Troubleshooting

### Conflict khi pull

Khi pull và có conflict (do bạn edit file mà người khác cũng đã push):

```bash
git pull origin main
# CONFLICT (content): Merge conflict in Wiki/_team-shared/xxx.md
```

Mở file conflict — sẽ thấy:
```
<<<<<<< HEAD
Phiên bản của bạn
=======
Phiên bản từ server
>>>>>>> origin/main
```

Edit để giữ phiên bản đúng (xóa các marker `<<<<`, `====`, `>>>>`), rồi:
```bash
git add Wiki/_team-shared/xxx.md
git commit -m "Resolve conflict"
git push origin main
```

Nếu không tự xử được → ping Đạm.

### Push bị reject

```bash
! [rejected]        main -> main (fetch first)
```

→ Có người khác push trước bạn. Fix:
```bash
git pull origin main      # pull về
# resolve conflict nếu có
git push origin main
```

### Lỡ commit file không muốn (chưa push)

```bash
git reset HEAD~1   # undo commit cuối, giữ file edit
# remove file khỏi staging:
git restore --staged <file>
# commit lại đúng:
git add <correct-files>
git commit -m "..."
```

### Lỡ push file nhạy cảm

→ **STOP**, ping Đạm ngay. Đừng tự delete + commit lại — history vẫn còn.

---

## Part 6 — Quick reference cheatsheet

```bash
# Bắt đầu work
git pull origin main

# Xem trạng thái
git status                    # files changed
git log --oneline -10         # 10 commit gần nhất
git diff <file>               # xem changes trong file

# Commit + push
git add <files>
git commit -m "message"
git push origin main

# Undo
git restore <file>            # discard changes (chưa add)
git restore --staged <file>   # unstage (đã add chưa commit)
git reset HEAD~1              # undo commit cuối (chưa push)

# Branch (advanced)
git checkout -b draft/xxx     # tạo branch mới
git push origin draft/xxx     # push branch
git checkout main             # về main
```

---

## Part 7 — Help

- **Stuck với git**: ping Đạm Teams DM
- **GitHub UI**: https://github.com/damholending/damcake-work-wiki
- **Issue tracking**: tạm thời chưa setup, dùng Teams thay
- **What can I query in repo**: xem [team-knowledge-map.md](team-knowledge-map.md)

---

## Part 8 — Onboarding checklist (tick khi xong)

- [ ] Có GitHub account
- [ ] Accepted invite từ Đạm
- [ ] Install git + gh CLI
- [ ] Run `gh auth login` thành công
- [ ] Run `git config --global user.name` + `user.email` (match GitHub)
- [ ] Clone repo thành công về `~/Desktop/Work/damcake-work-wiki/`
- [ ] Đọc xong Part 3 (Convention)
- [ ] Test workflow: edit 1 file nhỏ trong `Wiki/_team-shared/_team-test/<your-name>.md` (tạo nếu chưa có) → add → commit → push
- [ ] Verify trên GitHub web → thấy commit của mình

Done? Sẵn sàng work. Welcome to the team. 🎉
