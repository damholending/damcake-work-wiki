---
status: wiki
type: domain-knowledge
topic: ai, llm, frameworks, automation
source: synced from courses/vibe-coding-pm.md + work-context.md
---

# AI at Cake — Mental Model

> Domain note về cách AI được áp dụng tại Cake và cách Đạm tư duy về AI.
> *Last updated: 2026-05-11*

## Stance cá nhân

- **AI-native** — push AI vào cả công việc lẫn cá nhân, không tách biệt
- **Generalist + AI leverage** — depth lending + breadth BD/Risk/Product/AI
- **Strategic priority Q2 2026:** Push AI vào workflow team, build thư viện use cases thực tế

## Active Projects

| Project | Status | Folder |
|---|---|---|
| **LLM Knowledge Base Framework** | v1.0 shipped May 2026 | [`Projects/LLM-KB-Framework/`](../../Projects/LLM-KB-Framework/) |
| **AI Applied Use Cases** | Tracking | [`Projects/AI-Applied-Use-Cases/`](../../Projects/AI-Applied-Use-Cases/) |

## Framework: LLM OS (Karpathy)

Áp dụng cho KB tại Cake. 5 lớp:

```
Layer 5 — Orchestration (Kernel)
Layer 4 — Tools & Actions (Peripherals)
Layer 3 — Context Assembly (RAM / Memory Manager)
Layer 2 — Indexing & Retrieval (Filesystem)
Layer 1 — Storage (Disk)
```

Chi tiết: [`Projects/LLM-KB-Framework/LLM-KB-Framework-Cake.docx`](../../Projects/LLM-KB-Framework/)

## Frameworks AI cho Product (course synthesis)

### Double Diamond (Kim cương kép)

Quy trình làm sản phẩm = luân phiên Divergent (mở rộng) ↔ Convergent (thu hẹp):
- Kim cương 1: tìm đúng **vấn đề**
- Kim cương 2: tìm đúng **giải pháp**

### 4 Risks cần check trước launch

| Risk | Question |
|---|---|
| Value | Người dùng có cần không? |
| Usability | Có dùng được không? |
| Feasibility | Build được không? |
| Viability | Kinh doanh được không? |

### CREATE — Framework brief AI

| Yếu tố | Ý nghĩa |
|---|---|
| **C**haracter | Gán vai trò AI |
| **R**equest | Yêu cầu cụ thể |
| **E**xamples | Đưa ví dụ output |
| **A**djustments | Giới hạn, điều chỉnh |
| **T**ype of Output | Định dạng (bảng, code, đoạn văn) |
| **E**xtras | Bổ sung (ngôn ngữ, tone) |

### Cấu tạo AI Agent ("chú bạch tuộc")

| Phần | Tương đương |
|---|---|
| **Brain** | LLM (Claude, GPT, Gemini) — suy luận |
| **Hands** | Tools / MCP — thực thi |
| **Memory** | Trí nhớ session |
| **Knowledge** | Context files, PRD, KB |

### Elon's Automation (5 bước có thứ tự)

1. **Nghi ngờ** mọi yêu cầu
2. **Xóa** mọi phần thừa
3. **Đơn giản hoá** + tối ưu (sau khi đã xóa)
4. **Đẩy nhanh** vòng lặp
5. **Tự động hoá** (chỉ làm khi đã qua 4 bước trên)

## Use Case Pipeline tại Cake

- (cần feed chi tiết) — proposed → POC → Production
- Use cases hiện tại tracking ở: [`Projects/AI-Applied-Use-Cases/AI Applied Use Case - Final.xlsx`](../../Projects/AI-Applied-Use-Cases/)
- Archive bản cũ Mar 31: [`Raw/_archive/AI_Use_Case_Final_Apr_2026-03-31.xlsx`](../../Raw/_archive/)

## Stack cá nhân (đã validate qua course)

- **PRD → Stitch → Claude Code → Vercel deploy** (chuẩn solo builder)
- **Skills + MCP architecture** (đang dùng cho Dam-Wiki cá nhân)
- **Side products:** Budget Tracker, Place Tracker (2 active)

## Concerns / Constraints

- (cần feed) — data sensitivity, SBV compliance, vendor risk khi gửi data ra LLM cloud
- (cần feed) — budget AI

## Decisions / Lessons

- **May 2026:** Ship LLM KB Framework v1.0 — đề xuất pattern "Wiki/Raw/Projects" + 5-layer architecture cho Cake
- (sẽ feed thêm)

---

**Related:**
- LLM KB Framework: [`Projects/LLM-KB-Framework/`](../../Projects/LLM-KB-Framework/)
- AI Use Cases tracking: [`Projects/AI-Applied-Use-Cases/`](../../Projects/AI-Applied-Use-Cases/)
- Course notes (Personal): `~/Desktop/Personal/Dam-Wiki/Wiki/courses/vibe-coding-pm.md`
