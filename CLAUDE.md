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

### Personal wiki mount point
Personal canonical sống ở `~/Desktop/Personal/Dam-Wiki/Wiki/` (filesystem mount khác repo này). Map Personal ↔ Work + conflict rule → `Wiki/way-of-working.md` §13.

---

## 5. Layer model — LLM OS

| Layer | Vai trò OS | Ai viết | Khi nào load |
|---|---|---|---|
| **CLAUDE.md** (this) | BIOS / bootloader | Đạm | Auto, mỗi conversation |
| **Wiki/** | Filesystem (kernel + libs) | Đạm | On-demand theo §2 page table |
| **MEMORY.md** | Running notes / cache | AI | Auto, mỗi conversation |
| **Raw/** | Disk | mixed | Khi cần source data |
| **virtual-dam-work skill** | Compiler | Đạm | Khi skill được invoke |
| **Subagent** | Subprocess (isolated RAM) | built-in | Khi spawn — xem §6 |

Conflict resolution: **Wiki > CLAUDE.md > MEMORY** (Wiki canonical, Memory có thể stale).

---

## 6. Process model — khi nào spawn subagent

> Subagent = subprocess với context window riêng. Spawn để (a) tránh blow main RAM, (b) parallel độc lập, (c) focus output. Return value = IPC về parent.

**Built-in active (light-touch, không tạo custom agent file):**

| Trigger | Spawn | Prompt template |
|---|---|---|
| Search 3+ file Wiki/Raw để tìm "ai/where/which" | `Explore` | "Tìm <X> trong Wiki/ + Raw/. Trả về file path + 1-2 dòng context." |
| Design implementation cho task non-trivial (≥3 file edit) | `Plan` | "Plan: <goal>. Load `Wiki/way-of-working.md` + relevant `domains/*`. Return step-by-step + critical files." |
| Multi-task song song (independent) | `general-purpose` ×N parallel | Tách prompt rõ scope mỗi agent. Spawn 1 message, multiple tool calls. |

**KHÔNG spawn khi:**
- Read 1-2 file đã biết path → direct `Read`
- Edit nhỏ / fix / format → direct
- Conversation / clarify với Đạm

**Observation rule (tự AI flag):**
> Nếu 3+ lần spawn cùng pattern (cùng file load + cùng output style) → flag với Đạm: *"Lặp lại pattern X — đáng promote thành custom agent ở `.claude/agents/`?"*

Pattern candidates đang theo dõi (chưa đủ ngưỡng):
- Voice drafting (load `voice/<cat>.md` + draft) — 0 lần
- Lending decision check (load `domains/lending.md` + `finance.md`) — 0 lần
- Brand pre-flight (load `brand-guidelines.md` + apply) — 0 lần

---

*Update file này khi: (a) thêm tripwire mới phải fire trước Wiki, (b) thêm repo kernel patch, (c) observation §6 đạt ngưỡng 3+ → promote custom agent. KHÔNG update khi Wiki rule đổi — pointer tự catch.*
