---
status: wiki
type: index
topic: decisions, episodic-memory, work
---

# Decisions Log — Work (Cake)

> Append-only log các quyết định work có stake medium+ tại Cake. **Đây là chỗ AI học judgment thật của Đạm trong context Cake** — khác với Personal/finance decisions.
> Không chỉnh sửa decision cũ — chỉ append `Update YYYY-MM-DD:` ở cuối khi có outcome mới.

## Khi nào log?

| Tình huống | Log? |
|---|---|
| Decision có P&L impact ≥ 1 tỷ / tháng | ✅ |
| Decision ảnh hưởng channel/product roadmap Q+ | ✅ |
| Decision Risk Committee / Legal pushback | ✅ |
| Hire / restructure / role change trong team | ✅ |
| Reject một initiative / partnership request | ✅ |
| Trade-off PBT vs Volume vs %LG2 | ✅ |
| Operational tweak < 1 sprint (UI copy, threshold nhỏ) | ❌ |

## Naming convention

```
YYYY-MM-DD_<domain>_<short-slug>.md
```

Ví dụ:
- `2026-05-12_lending_cap-eloan-per-customer.md`
- `2026-04-15_partnership_fiza-onboard-vs-defer.md`
- `2026-05-20_risk_universal-pool-expansion.md`
- `2026-06-10_team_hire-trainee-under-cuong.md`

## Template

Copy `_TEMPLATE.md` mỗi khi log.

## Cross-reference với Personal

Decision có cả work P&L impact + impact retirement goal → log ở **cả 2 nơi**, link chéo:

- Work: `Wiki/decisions/2026-MM-DD_<...>.md`
- Personal: `~/Desktop/Personal/Dam-Wiki/Wiki/decisions/2026-MM-DD_<...>.md`

Link bằng path tuyệt đối ở cuối mỗi file.

## Index hint cho AI

Khi cần precedent: scan tên file theo domain trước → đọc 1-2 file relevant. Không load toàn folder.
