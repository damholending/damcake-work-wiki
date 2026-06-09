---
status: team-shared
type: runbook
audience: Lending Product team + Portfolio Analyst — Loki Phase 1
note: Chạy Pattern Y trên Antigravity + Claude Code. Làm theo từng bước.
last_updated: 2026-06-08
---

# Runbook — Chạy Pattern Y trên Antigravity + Claude Code (Loki Phase 1)

> Mục đích: từ data thô → file JSON sạch → báo cáo, ngay trên máy bạn. Không cần dev.

---

## 0. Vì sao Antigravity, không phải claude.ai web

| | claude.ai (web) | **Antigravity + Claude Code plugin** |
|---|---|---|
| Chạy script Python | ❌ | ✅ |
| Đọc/ghi file JSON trên máy | ❌ | ✅ |
| Hợp cho Pattern Y | Không | **Có — dùng cái này** |

Antigravity là IDE (có terminal + thư mục file). Claude Code chạy trong đó → gõ tiếng Việt nhờ nó viết script, chạy, đọc file. **Phase 1 cả Analyst lẫn team làm ở đây.**

---

## 1. Cấu trúc thư mục (dựng 1 lần)

Tạo 1 folder `loki/` rồi nói Claude Code: *"tạo giúp cấu trúc thư mục này"*:

```
loki/
  raw/        ← data thô Analyst export (csv/xlsx) — CÓ PII, không share
  data/       ← JSON sạch Analyst xuất ra — đưa team
  skills/     ← SKILL.md team viết
  scripts/    ← script Python (Claude sinh)
```

---

## 2. VAI ANALYST — raw → JSON sạch

**Bước 1.** Export data thô từ dashboard/DB ra `loki/raw/` (vd `raw_disbursement.csv`, cột `cccd, channel, product, amount`).

**Bước 2.** Trong Claude Code, gõ (copy):
```
Đọc raw/raw_disbursement.csv. Viết script Python:
tính tổng disbursement, top tăng/giảm theo channel×product,
xuất ra data/disbursement_T-1.json.
KHÔNG đưa cột cccd/sđt vào output.
```

**Bước 3.** Claude sinh script ở `scripts/` + chạy. Mở `data/disbursement_T-1.json` kiểm số. Xong → đưa team.

> Đã verify chạy được (2026-06-08): 12 dòng raw có cccd → JSON 4 con số, **không lọt PII**.

JSON sạch trông như vầy:
```json
{
  "total_disb_ty": 111.1,
  "top_tang": "VDS×CashLoan +30.0 tỷ",
  "top_giam": "Others×Paylater 1.9 tỷ"
}
```

---

## 3. VAI TEAM — JSON → báo cáo (skill)

**Bước 1.** Bỏ file `SKILL.md` vào `loki/skills/` (mẫu ở §4). Hoặc nhờ Claude: *"viết skill đọc data/disbursement_T-1.json, xuất báo cáo sáng giọng Cake"*.

**Bước 2.** Gõ:
```
Dùng skill bao-cao-sang, đọc data/disbursement_T-1.json, viết báo cáo.
```

**Bước 3.** Claude đọc JSON → báo cáo tiếng Việt. **Kiểm số trước khi gửi** (Thay đổi 3).

---

## 4. Mẫu SKILL.md (copy vào skills/)

```markdown
---
name: bao-cao-sang
description: Đọc JSON disbursement đã tính sẵn, viết báo cáo sáng giọng Cake. Trigger khi user xin báo cáo disbursement.
---

# Skill: Báo cáo Disbursement sáng

## Đầu vào
- 1 file JSON aggregate (vd data/disbursement_T-1.json) — đã có sẵn số tổng.

## Việc cần làm
1. Đọc file JSON (KHÔNG tự tính lại số — chỉ dùng số trong file).
2. Viết báo cáo gồm: tổng disbursement + top tăng + top giảm.
3. Giọng: Cake, tiếng Việt, gọn, bullet.

## KHÔNG làm
- Không bịa số ngoài file.
- Không tự cộng/tính — đó là việc của script Analyst.
```

---

## 5. Kỷ luật (3 điều, không bỏ)

1. **Analyst lo TÍNH, team lo VIẾT** — không ai làm cả hai.
2. **Skill chỉ đọc `data/*.json`** — Phase 2 đổi nguồn sang MCP, skill giữ nguyên, không viết lại.
3. **Luôn kiểm số trước khi gửi** — AI tự tin ≠ AI đúng.

---

## 6. Lên Phase 2 (sau)

Bỏ bước Analyst export tay: IT dựng MCP server nối thẳng DB. Skill `bao-cao-sang` đổi 1 dòng "đọc file" → "query MCP", phần viết giữ nguyên. Đó là lý do làm đúng từ Phase 1 không phí.
