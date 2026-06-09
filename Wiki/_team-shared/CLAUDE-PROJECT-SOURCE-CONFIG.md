---
status: team-shared
type: config-reference
audience: Đạm (project owner) + team-lending-cake
maintained_by: Đạm (update khi thêm file/folder mới)
last_updated: 2026-06-09
---

# Claude Project — GitHub Source Config

> Reference cho Đạm khi setup GitHub source ở Claude project Lending Hub (team-facing).
> Sync repo `damholending/damcake-work-wiki` qua GitHub Integration với path filter dưới.

---

## Quick paste (copy → dán vào Claude project source filter)

### Include paths (team-safe)

```
Wiki/_team-shared/**
Wiki/domains/**
Wiki/brand-guidelines.md
Wiki/stakeholders.md
HTML-Reports/**
Projects/Finance-Tracking/team-hub/**
Projects/LLM-KB-Framework/**
Projects/AI-Applied-Use-Cases/**
Projects/Lending-Insight-Engine/**
Raw/Lending/Monthly Report/**
Raw/Lending/Product Scheme/**
Raw/Lending/Policy/**
Raw/Risk/**
Raw/ZLP/**
Raw/OD/**
```

### Exclude paths (Đạm-only — KHÔNG sync team)

```
Wiki/aboutme.md
Wiki/00-core.md
Wiki/voice/**
Wiki/decisions/**
Wiki/way-of-working.md
Raw/Finance/**
Raw/Lending/Biz-Plan-2026/**
Raw/Lending/Lending-Org/**
Drafts/**
inbox/**
staging/**
.agents/**
.claude/**
CLAUDE.md
.gitignore
```

---

## Rationale theo nhóm

### 🟢 Include (team query được)

| Path | Lý do |
|---|---|
| `Wiki/_team-shared/**` | Designed cho team — onboarding, project instructions, decisions tracker |
| `Wiki/domains/**` | Domain knowledge: lending, finance, risk, ai-at-cake — reference cho mọi member |
| `Wiki/brand-guidelines.md` | Pink/Grape/Amber palette, font, layout cho artifact |
| `Wiki/stakeholders.md` | Map C-level + cross-team — team biết ai phụ trách gì |
| `HTML-Reports/**` | Dashboard + analysis HTML — team query insight |
| `Projects/Finance-Tracking/team-hub/**` | lending-pl-data.json + guide + dashboard — designed cho team |
| `Projects/LLM-KB-Framework/**` | AI framework docs — Loki initiative |
| `Projects/AI-Applied-Use-Cases/**` | AI use cases reference |
| `Projects/Lending-Insight-Engine/**` | BRD Loki MVP1 + Tiktok analysis — team build follow-up |
| `Raw/Lending/Monthly Report/**` | Monthly P&L review — team biết portfolio health |
| `Raw/Lending/Product Scheme/**` | Product scheme docs — team design product |
| `Raw/Lending/Policy/**` | Lending policy — team triển khai |
| `Raw/Risk/**` | Risk Committee notes — team biết risk decisions |
| `Raw/ZLP/**`, `Raw/OD/**` | Channel-specific data |

### 🔴 Exclude (Đạm-only)

| Path | Lý do exclude |
|---|---|
| `Wiki/aboutme.md` | Đạm personal identity, KPI commitment, family context |
| `Wiki/00-core.md` | AI boot sequence — internal navigation |
| `Wiki/voice/**` | Đạm voice patterns + REAL Teams messages C-level — quá personal |
| `Wiki/decisions/**` | Decision logs nội bộ (1-1 với Đạm) |
| `Wiki/way-of-working.md` | Đạm working preferences + Cake culture observations candid |
| `Raw/Finance/**` (P&L, UE raw, KPI) | Raw P&L cả Cake — finance-level data, team chỉ cần processed ở team-hub |
| `Raw/Lending/Biz-Plan-2026/**` | Biz plan candid analysis (40k tỷ / 700 tỷ PBT working assumptions) |
| `Raw/Lending/Lending-Org/**` | Org chart / org changes — sensitive |
| `Drafts/**` | Draft chưa polish |
| `inbox/**`, `staging/**` | Working files chưa stable |
| `.agents/**` | Skill source infra (virtual-dam-work, teams-decision-scan cron) |
| `.claude/**` | Project AI config (settings, hooks) |
| `CLAUDE.md` | Project-level AI BIOS |

---

## Workflow

1. **Setup 1 lần**: Đạm vào Claude project Lending Hub → Knowledge / Sources / Add GitHub → repo `damholending/damcake-work-wiki` → paste include/exclude trên.
2. **Mỗi T2 sau review decisions**: skill auto commit + push tracker → Claude project sync trong vài phút.
3. **Khi thêm folder/file mới**:
   - Nếu team-safe → add path vào Include block của file này + push update
   - Nếu Đạm-only → add path vào Exclude block
   - Bump `last_updated` ở frontmatter

---

## Backup option (nếu Claude UI không hỗ trợ exclude pattern)

Tạo separate repo public/team `damholending/lending-team-kb`:
- Symlink hoặc git subtree từ Include paths trên
- Claude project team sync từ repo đó (full repo, no filter cần)
- Đạm push selectively → team không thấy private files

Hiện tại assume Claude project UI hỗ trợ cả include + exclude. Nếu chỉ include → dùng include block trên (đã loại private).

---

## Maintained by

Đạm — update khi structure repo đổi. Skill `/teams-decision-scan` không tự update file này.
