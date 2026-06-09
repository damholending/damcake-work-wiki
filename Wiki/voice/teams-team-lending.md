---
status: wiki
type: voice-sample
topic: voice, teams, team-lending
audience: Lâm, Cường, Định, Duyên, Tiên, Chi, Kiệt
source: real Đạm MS Teams messages 5 May–9 Jun 2026 (M365 MCP scan 2026-06-09)
---

# Voice — MS Teams với Team Lending Product

> Samples thật của Đạm khi chat với team trực tiếp. AI match pattern khi draft.
> *Last updated: 2026-06-09*

## Markers cho audience này

- **Self-ref:** "anh"
- **Other-ref:** "em" + tên/title hoặc bare tên
- **Trailing:** "nha em", bare
- **Length:** 5–15 từ, observational + directive
- **Tone:** direct, không politeness padding, có khi banter nhẹ

---

## Sample 1 — Tag multi member + 1 ask

```
Lưu Vũ Thanh Hương (Business Development Director) Nguyễn Hoàng Hiệp (Business Development Associate Director) BD backup mấy câu
```

**Khi nào:** cần backup nhanh từ multiple people trong meeting hoặc thread đang heat.
**Pattern:** [tag tag] [verb ngắn] [object ngắn].

---

## Sample 2 — Direct directive cho IT/admin role

```
Giờ account cũ anh Thương cho tụi em hết hôm nay. nhé để download history về cái rồi off
```

**Khi nào:** confirm với IT về timeline + reason. Politeness "nhé" + giải thích "để..." → mềm hơn nhưng vẫn directive.

---

## Sample 3 — Status update tự info team

```
Hôm nay đang migrate core mới 2 con cake cl & vds cl nên có thể impact, để em check thêm có thể do update database thôi ạ, số approve vẫn ổn
```

**Khi nào:** team hỏi về anomaly số liệu, Đạm explain + reassure. Note: dùng "em" với senior, "ạ" trailing.

```
Hôm nay đang migrate vds nên số mới update tới 5hAM thôi nha anh
```

**Khi nào:** trả lời câu hỏi từ stakeholder senior về số liệu chậm. Short + reason + "nha anh".

---

## Sample 4 — Observation/insight thả vào thread

```
Chỗ này VDS CL có effect rồi. Ticket size tăng hẳn lên
```

**Khi nào:** drop fact trong thread đang discuss, không cần thêm explain.

```
Nó có 2 port chính là vds và momo
```

```
Vds thì ko biết nhưng chắc ko quá tệ
```

**Khi nào:** trả lời câu hỏi về portfolio mix. Hedge với "ko biết nhưng chắc..." → có quan điểm nhưng không claim certainty.

---

## Sample 5 — Quick directive 1 dòng

```
mà trên cake app rồi
```

**Khi nào:** correct/clarify previous statement trong thread đang nhanh. 1 fragment.

```
để share cái phân tích vds đọc
```

**Khi nào:** offer share content. "để" = "let me", action-first.

---

## Sample 6 — Conditional suggestion (escalate ý lên BD)

```
nên nếu có làm thì chị nói chuyện thêm với mwg có thể chạy chương trình mở mới cho ai từng có CD thì nó sẽ spending CD luôn
```

**Khi nào:** đề xuất với BD lead. "nên nếu... có thể..." soft pattern.

---

## Sample 7 — Tag single + ask trực tiếp (probe CRO)

```
Anh Hà Cao Vinh (CRO) xem cake CL còn room gì chỗ eligible pool ko
```

**Khi nào:** ask CRO probe data. Verb trực tiếp "xem", không "kindly check".

---

## Sample 8 — Update senior FYI

```
Tụi em mới gặp xong với tiktok, team mới làm cash loan, đang setup để sớm gặp offline thảo luận về product nha anh
```

**Khi nào:** FYI senior về deal pipeline. "Tụi em" → đại diện team, không cá nhân.

```
em có báo group đợt present management rồi đấy
```

**Khi nào:** confirm với senior rằng action item đã done. "đấy" trailing.

---

## Templates rút ra (cho AI draft)

| Mục đích | Template |
|---|---|
| Tag + backup ask | `[@person1] [@person2] [verb ngắn] mấy câu` |
| Update status tự thân | `Hôm nay [đang/vừa] [verb] nên có thể [impact], [explain hedge] ạ/nha anh` |
| Observation thả thread | `[Subject] [verb] [data]. [optional 2nd]` (no dấu chấm cuối) |
| Probe data từ CRO/Risk | `Anh/Chị [name + title] xem [thing] [open question] ko` |
| Conditional suggestion | `nên nếu [condition] thì [subject + verb], [outcome]` |
| FYI senior | `Tụi em [verb] với [partner], [next step] nha anh` |

---

## Sample — Team Lending group chat (Jun 2026)

> Group chat ID `19:88e0ecad9e33415d89792e8e96916a04` (team Lending: Lâm, Cường, Định, Duyên, Tiên, Chi, Kiệt + Đạm).
> Topic: Road to 3K disbursement tracking · ZLP submit spike · dashboard cleanup · CR analysis.
> Source: M365 MCP scan 2026-06-09 (90 ngày).

```
2026-06-05 02:36 — Đạm (broadcast to team, push decision firm):
Everyone team coi review cần thêm gì, plan là team chỉ cần 1 dash thôi, drop dần mấy dash khác

2026-06-05 02:52 — Đạm (specify what team must own):
Ar by score, score distribution team cg phải nắm để xem có shift ko

2026-06-08 03:13 — Đạm (tag PM Định, observation + implicit ask để Định explain):
zlp làm gì new submit tăng đột biến á Nguyễn Võ Minh Định (Lending Product Manager)

2026-06-08 03:43 — Đạm (short directive, ép action):
team follow up bỏ vào nhé

2026-06-08 05:04 — Đạm (share material, ép team đọc):
team đọc qua để thấm nhé
```

**Context (team members trong cùng chat):**
```
Nguyễn Phạm Tuyết Tiên (Sr. Lending Portfolio Specialist) 06-08 03:41:
  "Mọi người update dùm em status các action trong file road to 3k (sheet 3k_Jun_tracking) nha.
  Hoàn thành giúp e trong sáng nay luôn nha mng, để e kịp slide chiều nộp ạ"

Nguyễn Võ Minh Định (Lending Product Manager) 06-08 04:33:
  "E tổng hợp lại nha:
  Nhìn high-level CR end to end thì ko thấy có vấn đề gì => nghĩa là sp đang ổn,
  CR duy trì mức cao gần 11%
  Nếu như nhóm new tăng do các nhóm upsell/xsell/repeat giảm thì CR của 3 nhóm kia phải giảm
  => không phải lý do này..."

Nguyễn Phạm Tuyết Tiên 06-03 13:09:
  "Mai đi một nửa nha mng"
```

**Voice markers (team chat):**
- **"team [verb] nhé/nha"** = command broadcast — short, firm, no preamble ("team đọc qua để thấm nhé", "team follow up bỏ vào nhé").
- **"Everyone team [verb]"** = explicit broadcast for all-team attention.
- **Decision firm**: "plan là team chỉ cần 1 dash thôi, drop dần mấy dash khác" — drop the unnecessary, no soften.
- **Tag PM + observation-as-question**: "[topic] làm gì [pattern] á [@PM]" — ép PM tự explain mà không cộc.
- **Specify ownership**: "team cg phải nắm" — explicit team must own, không leave gì ambiguous.
- **No "ạ"** với team direct — only "nhé"/"nha"/bare.

---

## Sample — Team DMs + Đạm-convened team meeting (Jun 2026)

> 3 DMs 1-1 với team members (Lâm, Tiên, Định/Lâm bundle) + 1 meeting Đạm convene.
> Source: M365 MCP scan 2026-06-09.

### DM 1-1 với Tiên (`_fa103093`)

```
2026-06-05 04:43 — "Ohm follow tiếp nha"
2026-06-05 04:45 — "Chốt Tiên nha anh"
2026-06-05 04:53 — "Nếu ko đc nữa thì request nha"
2026-06-05 10:08 — "T2 nhờ cto nha =))"
```
→ Marker: very short directive, "Chốt [name] nha anh" — confirm decision + use "anh" self-ref khi delegate (peer-down).

### DM 1-1 với Lâm (`_2bb18490`)

```
2026-06-08 02:08 — "Kick off cái mobile money luôn nha anh"
2026-06-06 11:28 — Lâm gửi đề xuất pilot PD chương trình WC (mở rộng product)
2026-06-06 11:29 — Lâm: "Để làm cái phân tích nhanh. Nhưng 1 tuần nữa ỉà hơi cận WC r"
```
→ Marker: short tell-and-go ("luôn nha anh") khi push action.

### DM 1-1 / small group `_8186c5c3` (likely Lâm/Định bundle về score-based offer)

```
2026-06-04 03:41 — "oki chốt vậy nha"
2026-06-09 02:15 — Cường: "chỗ con BE CL, làm hướng score based offer thì em nghĩ phải dùng key là be score..."
2026-06-09 02:17 — Đạm: "Score ko shift nhiều"
2026-06-09 02:18 — Đạm: "Be score thì risk ko tự tin"
2026-06-09 02:26 — Đạm: "Còn để đơn giản thì lát thảo luận với risk dùng be score là the best"
2026-06-09 02:37 — Đạm: "vậy ngon để risk comment chốt nhanh còn làm"
```
→ Marker: **thinking-out-loud** chain — short observation messages ("Score ko shift nhiều", "Be score thì risk ko tự tin", "đơn giản thì... be score là the best") rồi end với decisive "ngon để risk comment chốt nhanh còn làm". Đây là pattern Đạm **think while typing** với người team thân.

### Meeting chat Đạm convene — AI/KB skills (`19:meeting_OGJiNTky...`)

> Đạm convene team Lending về AI native build (xem chi tiết trong [`teams-cross-functional.md`](teams-cross-functional.md) Sample N+1 phần meeting_OGJiNTky — duplicate ở 2 file vì meeting có cả team + cross-functional members).

Key Đạm prompts:
```
"nên team study qua cowork 101; build LLM OS theo karpathy concept"
"ví dụ cho anh em 1 skills có thể automate đc à"
"Tưởng tượng anh em có sẵn KB (lending knowledge base) anh em sẽ tạo skills gì để mình được tự do, rảnh hơn"
```
→ Marker: **thinking-prompt mode** với team — không tell answer mà give starting frame ("Tưởng tượng có sẵn X thì..."), let team brainstorm.

**Voice patterns DMs với team:**

| Pattern | Sample |
|---|---|
| "Chốt [name] nha anh" — confirm decision direct | "Chốt Tiên nha anh" |
| Very short tell-and-go (3-5 từ) | "Ohm follow tiếp nha" · "Kick off cái mobile money luôn nha anh" |
| Thinking-out-loud chain | "Score ko shift nhiều" → "Be score thì risk ko tự tin" → "Còn để đơn giản... be score là the best" |
| Decisive close after chain | "vậy ngon để risk comment chốt nhanh còn làm" |
| Conditional fallback delegate | "Nếu ko đc nữa thì request nha" |
| Thinking-prompt cho team (meeting) | "Tưởng tượng anh em có sẵn KB anh em sẽ tạo skills gì..." |

---

**Drop sample mới:** khi Đạm vừa gửi 1 message hay, paste vào đây + bump timestamp. Append-only, không xóa cũ.
