---
status: wiki
type: index
topic: cake-work-wiki entry point
---

# Cake Work Wiki — Core Index

> Entry point cho work knowledge base. File này là **index** — không embed content, chỉ trỏ tới atomic file.
> Pattern theo Karpathy LLM OS: skill = compiler, Wiki = filesystem, Raw = disk, Projects = deliverable.
> *Last updated: 2026-05-12*

## Architecture

```
Layer 1 — virtual-dam-work skill              (.agents/skills/virtual-dam-work/SKILL.md)
          Pure compiler — mapping context → file. Không chứa knowledge.

Layer 2 — Wiki/way-of-working.md              ← CORE SOP (rules sống ở đây)
          Wiki/aboutme.md                     ← Identity (who Đạm is at work)

Layer 3 — Wiki/{stakeholders, domains/*}/     ← On-demand reference
          Gọi vào khi cần kiến thức cụ thể.

Layer 4 — Projects/                           ← Active deliverables
          docx, pptx, xlsx hoàn thiện theo project.

Layer 5 — Raw/                                ← Source materials
          Files thô (xlsx, pptx, pdf) chưa curate.
```

## Boot sequence (cho virtual-dam-work)

1. **Always read first:**
   - [`aboutme.md`](aboutme.md) — role, team, KPIs, scope
   - [`way-of-working.md`](way-of-working.md) — **all rules sống ở đây**

2. **Read on demand** theo mapping trong `SKILL.md`.

## Core files

| File | Vai trò |
|---|---|
| [`aboutme.md`](aboutme.md) | Identity tại Cake — role, team, KPIs, work cadence |
| [`way-of-working.md`](way-of-working.md) | **Core SOP** — decision protocol, modes, behavioral rules, voice, anti-patterns, external-thinker protocol |
| [`stakeholders.md`](stakeholders.md) | Map CEO/CRO/CFO/CTO/BD/Legal/Tech + team trực tiếp + external partners |
| [`brand-guidelines.md`](brand-guidelines.md) | Cake brand theme — colors, fonts, gradients |
| [`decisions/`](decisions/) | Decision log work — append-only, theo `_TEMPLATE.md`. Stake medium+ |
| [`voice/`](voice/) | Voice corpus — MS Teams team, email C-level, meeting talking points (Cake-specific) |

## Domain mental models

| File | Khi nào đọc |
|---|---|
| [`domains/lending.md`](domains/lending.md) | OD/CashLoan/BNPL/Merchant, KPIs 2026, channel strategy, embedded lending |
| [`domains/risk.md`](domains/risk.md) | Risk Committee, CoR, %LG2, SBV regulatory |
| [`domains/finance.md`](domains/finance.md) | P&L logic, Biz Plan, communicate với CFO |
| [`domains/ai-at-cake.md`](domains/ai-at-cake.md) | LLM KB Framework, AI use cases, frameworks |

## Active Projects

→ Xem [`../Projects/`](../Projects/)

| Project | Status | Folder |
|---|---|---|
| LLM Knowledge Base Framework | v1.0 shipped May 2026 | [LLM-KB-Framework](../Projects/LLM-KB-Framework/) |
| AI Applied Use Cases | tracking | [AI-Applied-Use-Cases](../Projects/AI-Applied-Use-Cases/) |
| Finance Tracking (Lending P&L tracker) | active | [Finance-Tracking](../Projects/Finance-Tracking/) |

## Raw Materials

→ Xem [`../Raw/`](../Raw/) · tổ chức theo domain: Lending · Risk · Finance · OD · ZLP · _archive

## Reading Order khi AI load context

Khi virtual-dam-work skill được kích hoạt:

1. **Always:** `aboutme.md` + `way-of-working.md` (~3 phút đọc)
2. **If lending decision:** + `domains/lending.md` + `stakeholders.md`
3. **If risk decision:** + `domains/risk.md`
4. **If finance/P&L:** + `domains/finance.md`
5. **If AI/product:** + `domains/ai-at-cake.md`
6. **If need brand visual:** + `brand-guidelines.md`
7. **If need source data:** scan `Raw/<domain>/`
8. **If need precedent:** scan `decisions/` theo domain prefix
9. **If drafting Teams/email/talking points:** đọc `voice/<category>.md` samples trước
10. **If cần external thinker frame:** đọc Personal `mental-models/` hoặc `Naval-Ravikant/` (xem `way-of-working.md` §14)

## Relationship với Personal Wiki

`~/Desktop/Personal/Dam-Wiki/` là **canonical** cho:
- `identity.md` (foundation về Đạm)
- `principles.md` (general decision rules)
- `stakeholders.md` (mapping general)
- `work-context.md` (Cake context — duplicated một phần ở Work)
- `finance.md`, `personal-life.md` (personal)

Work wiki là **work-domain-specific extension** với:
- `aboutme.md` (work-flavored identity)
- `way-of-working.md` (work-flavored principles, Cake-specific)
- `domains/*.md` (lending/risk/finance/ai-at-cake — chỉ có ở work)
- `brand-guidelines.md` (Cake-specific)

**Rule:** Khi update fact tồn tại cả 2 nơi → update Personal trước, sync sang Work sau.

## Open Questions cần feed

- [ ] Stakeholders: phone numbers + cách contact preferred (Teams/Zalo/email)?
- [ ] Risk: SBV thông tư nào đang theo dõi?
- [ ] Risk: lessons từ Risk Committee gần nhất?
- [ ] Finance: chi tiết cách Biz Plan track (rolling vs static)?
- [ ] AI at Cake: AI budget tháng/quý? Vendor approved?
- [ ] Lending: roadmap product mới Q3/Q4 2026?
- [ ] Voice samples: cần Đạm drop 3+ samples mỗi category (teams-team-lending, email-c-level-cake, meeting-talking-points-cake) để AI bắt pattern
