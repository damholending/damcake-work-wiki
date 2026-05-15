---
status: logged
type: decision-log
topic: wiki-architecture, knowledge-separation
---

# [2026-05-14] Tách `Wiki/_team-shared/` riêng với personal wiki

**Domain:** ai
**Mode:** time-to-market
**Stakes:** low
**Reversibility:** reversible
**KPI link:** N/A — infrastructure decision

## Situation

Wiki cá nhân của Đạm (`Wiki/domains/lending.md`, `Wiki/aboutme.md`, `Wiki/stakeholders.md`, `Wiki/way-of-working.md`) chứa personal framing:
- "Mini CEO mindset", "Báo cáo lên CEO"
- DOB members team
- Stakeholder lens cá nhân ("CRO thân thiết")
- Personal background ("3 năm BD + 2 năm Risk + 2 năm Product")

Khi cần share knowledge với team (qua Claude Project hoặc qua Confluence/Slack), cần version sạch personal framing — nhưng không muốn lose personal context (vẫn hữu ích cho Cowork solo).

## Options considered

1. **A — Sanitize trực tiếp file gốc**, mất personal context.
   cost: lose personal lens valuable cho cá nhân
   benefit: 1 single file, không duplicate

2. **B — Tạo `Wiki/_team-shared/` folder riêng** chứa team-friendly version, file gốc giữ personal.
   cost: cần maintain 2 version (sync drift risk)
   benefit: clean separation, mỗi file có audience rõ; Cowork pick đúng version theo context

3. **C — Tag/section trong file gốc** (vd: `<personal-only>...</personal-only>` blocks)
   cost: phức tạp; Claude phải parse correctly
   benefit: 1 file source

## Decision

**Pick B — `Wiki/_team-shared/` folder.**

## Reasoning

- **Data point chính:** Personal framing và team framing có tone + content rõ ràng khác — không phải case của "sanitize 10%", là "rewrite 40-60%".
- **Mental model áp dụng:**
  - Separation of concerns: 2 audience khác → 2 file khác, không cố nhồi vào 1
  - Reduce drift cost: chỉ sync khi có thay đổi material; bumping version manual OK
- **2nd order consequence:** Sau 3-6 tháng nếu personal/team version drift xa nhau → có thể signal team-shared cần evolve thành canonical (replace personal). Quan sát thêm.
- **Why not A:** Lose personal context = lose value cho cá nhân. Tool first priority cho Cowork solo.
- **Why not C:** Quá phức tạp cho Claude parse; risk inconsistency cao.

## Files đã tạo trong folder

| File | Sanitized từ | Audience |
|---|---|---|
| `lending-team-context.md` | `Wiki/domains/lending.md` | Team — domain knowledge, KPIs, regulatory |
| `product-scheme-2025.md` | `Raw/Lending/Product Scheme/Product Scheme_2025.xlsx` | Team — product config canonical |
| `team-onboarding-guide.md` | (mới) | Team member mới — how to use Claude Project |
| `lending-hub-project-instructions.md` | (mới) | Owner setup Claude Project shared |
| `finance-hub-project-instructions.md` | (mới — DEPRECATED) | Reference history |
| `claude-way-of-working.md` | (mới) | Team — Cake-wide Claude WoW |

## Sync protocol

Khi có thay đổi trong personal version (`Wiki/domains/lending.md`):
1. Update personal file trước (single-source-of-truth cho Đạm)
2. Re-sanitize relevant section sang `_team-shared/<file>.md`
3. Bump `last_updated` ở YAML frontmatter cả 2 file

Khi có thay đổi trong team-shared version:
1. Hỏi: có cần reflect lên personal không? Thường là không (team-shared = subset)
2. Update team-shared file riêng

## Stakeholders

N/A — infrastructure decision, không có stakeholder ngoài Đạm.

## Outcome (update sau)

- [ ] 3 tháng (14 Aug): drift giữa 2 version có manageable không? Có cần auto-sync tooling không?

## Lesson

**Tentative:** Khi knowledge có 2 audience rõ rệt (personal vs team), tách physical file thay vì tag/section — tradeoff sync cost < confusion cost.
