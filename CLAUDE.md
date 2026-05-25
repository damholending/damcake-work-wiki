---
status: project-instructions
type: claude-md
owner: dam.ho@cake.vn
last_updated: 2026-05-25
---

# CLAUDE.md — damcake-work-wiki

> BIOS / bootloader cho repo này. Theo Karpathy LLM OS: file này **chỉ load Wiki + enforce tripwires fire-trước-Wiki**. Mọi rule body sống ở Wiki (kernel).
> SSoT: `Wiki/way-of-working.md`. Duplicate vào đây = anti-pattern.

---

## 1. Identity (1 dòng)

Đạm — Head of Lending Product @ Cake by VPBank. KPIs 2026: 40k tỷ disbursement / 700 tỷ PBT / %LG2 ≤ 11%. Full: [`Wiki/aboutme.md`](Wiki/aboutme.md) · personal `~/Desktop/Personal/Dam-Wiki/Wiki/identity.md`.

## 2. Boot sequence — page table

Substantive Q → load theo thứ tự:

1. [`Wiki/00-core.md`](Wiki/00-core.md) — full reading order theo context
2. [`Wiki/way-of-working.md`](Wiki/way-of-working.md) — kernel (mọi rule)
3. [`Wiki/aboutme.md`](Wiki/aboutme.md) — work identity

On-demand mapping per `Wiki/00-core.md` §"Reading Order khi AI load context". Không duplicate ở đây.

---

## 3. Pre-load tripwires — fire TRƯỚC khi Wiki load

> Lý do tồn tại: nếu chỉ pointer, Claude có thể respond/generate trước khi đọc Wiki → miss. 4 rule dưới phải enforce ngay từ first token.

- 🔴 **Visual artifact** (`.html`/`.pptx`/chart/UI mockup) → **ĐỌC [`Wiki/brand-guidelines.md`](Wiki/brand-guidelines.md) TRƯỚC khi generate**. Không phải sau khi bị nhắc.
- **Language**: mix Việt-Anh, match language Đạm gõ.
- **Voice**: direct, bullet > prose, skip pleasantries, end-of-turn 1-2 dòng.
- **Workflow**: hỏi 2-3 câu clarify trước task substantive. Edit nhỏ / fix / format → làm luôn.

Toàn bộ rule khác (decision protocol, anti-patterns, mode shifts, external-thinker scan, update protocol) → pointer `Wiki/way-of-working.md`. Không lift vào đây.

---

## 4. Repo kernel patches — chỉ repo này

Facts không có ở Wiki/Personal-wiki, cũng không phải running facts (MEMORY job).

### Git
- Push → account `damholending` (work). Personal → `hodinhdam`. **Check `gh auth status` trước push**.
- **KHÔNG `git config` persistent** không hỏi. Dùng `git -c <key>=<val>` one-shot.
- Vietnamese filename trên macOS (Unicode NFD) → `git -c core.precomposeunicode=true add "<path>"`.

### File naming
- Monthly reports: `Raw/Lending/Monthly Report/{Mon}-Cake Monthly Report 2026.pptx` (Jan/Feb/Mar). Không suffix `_1` / `_v2`.
- Risk Committee: `Raw/Risk/Risk Committee T{N}-2026.pdf` + sibling `Risk-Committee-T{N}-2026-summary.md`.

### Canonical split (Personal vs Work)
- Personal canonical (`~/Desktop/Personal/Dam-Wiki/Wiki/`): `identity.md`, `principles.md`, `stakeholders.md`, `work-context.md`, `finance.md`, `personal-life.md`.
- Work canonical (this repo): `Wiki/aboutme.md`, `Wiki/way-of-working.md`, `Wiki/domains/*.md`, `Wiki/brand-guidelines.md`.
- Conflict → Personal trước, sync Work sau.

---

## 5. Layer model — LLM OS

| Layer | Vai trò OS | Ai viết | Khi nào load |
|---|---|---|---|
| **CLAUDE.md** (this) | BIOS / bootloader | Đạm | Auto, mỗi conversation |
| **Wiki/** | Filesystem (kernel + libs) | Đạm | On-demand theo §2 page table |
| **MEMORY.md** | Running notes / cache | AI | Auto, mỗi conversation |
| **Raw/** | Disk | mixed | Khi cần source data |
| **virtual-dam-work skill** | Compiler | Đạm | Khi skill được invoke |

Conflict resolution: **Wiki > CLAUDE.md > MEMORY** (Wiki canonical, Memory có thể stale).

---

*Update file này khi: (a) thêm tripwire mới phải fire trước Wiki, (b) thêm repo kernel patch. KHÔNG update khi Wiki rule đổi — pointer tự catch.*
