# Cake Work Wiki

> Knowledge base công việc tại Cake Digital Bank của Hồ Đình Đạm.
> Cấu trúc theo **Karpathy LLM OS** pattern (xem `Projects/LLM-KB-Framework/`):
> skill = compiler, Wiki = filesystem, Raw = disk, Projects = deliverable.

## Architecture

```
Layer 1 — .agents/skills/virtual-dam-work/SKILL.md   (compiler — pure mapping)
Layer 2 — Wiki/way-of-working.md                      (CORE SOP — rules sống ở đây)
Layer 2 — Wiki/aboutme.md                             (identity)
Layer 3 — Wiki/{stakeholders, domains, brand}/        (on-demand reference)
Layer 3 — Wiki/{voice, decisions}/                    (style + judgment corpus)
Layer 3 — Wiki/_team-shared/                          (docs cho team, không chỉ Đạm)
Layer 4 — Projects/                                   (active deliverables)
Layer 5 — Raw/                                        (source materials, by domain)
```

## Structure

```
damcake-work-wiki/
├── .agents/skills/
│   └── virtual-dam-work/SKILL.md   ★ Pure compiler — mapping context → wiki file
│
├── Wiki/                          ─ Curated markdown
│   ├── 00-core.md                 # Index
│   ├── aboutme.md                 # Identity tại Cake (role, team, KPIs)
│   ├── way-of-working.md          ★ CORE — SOP, decision protocol, all rules
│   ├── stakeholders.md            # C-level + cross-functional + team trực tiếp + external
│   ├── brand-guidelines.md        # Cake brand theme
│   ├── domains/                   # On-demand domain knowledge
│   │   ├── lending.md
│   │   ├── risk.md
│   │   ├── finance.md
│   │   └── ai-at-cake.md
│   ├── voice/                     # Voice corpus — pattern Đạm dùng trên MS Teams
│   │   ├── _voice-pattern-notes.md   # 12 templates + markers
│   │   ├── teams-team-lending.md
│   │   ├── teams-cross-functional.md
│   │   ├── email-c-level-cake.md
│   │   ├── meeting-talking-points-cake.md
│   │   ├── chemgio-banter.md
│   │   └── money-team.md
│   ├── decisions/                 # Append-only log judgment Đạm @ Cake
│   │   ├── _TEMPLATE.md
│   │   └── 2026-05-14_*.md            # AI co-work, team-shared folder, pull-not-push
│   └── _team-shared/              # Docs để share team (không chỉ riêng Đạm)
│       ├── team-onboarding-guide.md
│       ├── claude-way-of-working.md
│       ├── lending-hub-project-instructions.md
│       ├── finance-hub-project-instructions.md
│       ├── lending-team-context.md
│       └── product-scheme-2025.md
│
├── Projects/                      ─ Active deliverables
│   ├── LLM-KB-Framework/          # docx + pptx + diagrams (v1.0 May 2026)
│   ├── AI-Applied-Use-Cases/      # tracking xlsx
│   ├── Finance-Tracking/          # Lending P&L tracker (Python) + Q1'26 cohort
│   └── Team-Claude-Project-Setup/ # Hub setup pack + cheat sheet cho team
│
├── Raw/                           ─ Source files thô, theo domain
│   ├── Lending/  Policy + Product Scheme + Monthly Report + Biz-Plan-2026 + Lending-Org
│   ├── Risk/     Risk Committee outputs
│   ├── Finance/  P&L + KPI + Unit Economic
│   ├── OD/       Overdraft analytics
│   ├── ZLP/      Zalo Pay analytics + CEO brief
│   └── _archive/ Old versions, superseded
│
├── inbox/                         # (chưa setup) Drop file → auto-convert
└── staging/                       # (chưa setup) Converted .md, chờ review
```

## Virtual Dam Work — How it works

Skill `virtual-dam-work` ở `.agents/skills/virtual-dam-work/SKILL.md` là **compiler thuần** — chỉ chứa mapping table "if conversation about X, read Wiki/Y". Knowledge thật sự sống trong Wiki files.

**Boot sequence khi skill activate:**

1. Đọc `Wiki/aboutme.md` + `Wiki/way-of-working.md` (always)
2. Tùy context, đọc thêm Wiki domain file theo mapping
3. Nếu cần raw data → đọc `Raw/<domain>/`
4. Nếu cần precedent → scan `Wiki/decisions/` (judgment log Đạm @ Cake)
5. Nếu cần draft message Teams/email → đọc `Wiki/voice/` match audience
6. Nếu wiki entry thiếu hoặc cũ → name gap, không fabricate

## Team-shared layer

`Wiki/_team-shared/` là docs viết cho team Lending dùng chung — onboarding guide, hub project instructions, team context. Khác với Wiki còn lại (private notes của Đạm), folder này có thể đẩy thẳng cho members hoặc dùng làm system prompt cho Claude Projects team-level.

## Relationship với Personal Wiki

`~/Desktop/Personal/Dam-Wiki/` là canonical cho identity/principles/general stakeholders. Work wiki là work-domain-specific extension. Khi cùng 1 fact tồn tại 2 nơi → update Personal trước, sync sang Work sau.

Skill `virtual-dam` (Personal) và `virtual-dam-work` (Work) có thể load song song khi context overlap.

## Nguyên tắc

1. **Wiki/** chỉ chứa file `.md` đã suy nghĩ + có quan điểm. Không dump dữ liệu.
2. **way-of-working.md** là CORE — mọi rule/SOP/decision protocol đều ở đây.
3. **SKILL.md** là pure compiler — không duplicate knowledge từ Wiki.
4. **decisions/** append-only — không sửa decision cũ, chỉ append `Update YYYY-MM-DD:` khi có outcome mới.
5. **Projects/** chứa deliverable hoàn thiện theo project.
6. **Raw/** là kho source thô, AI đọc nhưng không tự sửa.
7. **_archive/** giữ file cũ — không xoá, để tham chiếu lịch sử.

## Cập nhật gần nhất

- **14–15 May 2026:**
  - Add `Wiki/_team-shared/` — onboarding guide + hub project instructions cho team Lending
  - Add `Wiki/voice/` — voice corpus 7 files, distill từ 153 messages Teams
  - Activate `Wiki/decisions/` — log 3 quyết định AI/team đầu tháng 5
  - Add `Projects/Finance-Tracking/` — Lending P&L tracker (Python) + Q1'26 cohort cache
  - Add `Projects/Team-Claude-Project-Setup/` — hub setup pack + cheat sheet
  - Init Git remote (private GitHub repo)
- **11 May 2026:**
  - Reorganize 39 files từ cấu trúc Analytics-heavy sang Wiki/Projects/Raw
  - Feed Wiki từ Personal — stakeholders, lending, finance, risk, ai-at-cake
  - Build `virtual-dam-work` skill — compiler thuần, map context → wiki
  - Refactor `way-of-working.md` thành CORE SOP (canonical rules)

---

**Owner:** Đạm (dam.ho@cake.vn)
