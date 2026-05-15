---
status: logged
type: decision-log
topic: team-ai-adoption, change-management
---

# [2026-05-14] Pull-not-push: team AI adoption strategy

**Domain:** team
**Mode:** time-to-market
**Stakes:** medium
**Reversibility:** reversible
**KPI link:** indirect — team productivity → contributes to PBT 653 tỷ delivery

## Situation

Team 5 PM Lending đang busy delivery Q2 (target 3K tỷ disbursement tháng 6). Cần tăng AI adoption nhưng:
- Không muốn ép (top-down sẽ backfire)
- Không có bandwidth tổ chức training formal
- Cần adoption sustainable, không phải 1 lần "everyone please try"

## Options considered

1. **Push hard:** Email all-team, mandate Skill creation/quarter, track usage stats.
   cost: team resistance, burnout, fake compliance, instant kill culture vibe
   benefit: short-term metric tăng

2. **Pull-not-push (Lối B):** Đạm là power user, output share passive, để team curious tự hỏi.
   cost: adoption rate thấp & chậm hơn
   benefit: ai adopt là real user; không waste effort push người chưa ready

3. **Hybrid:** Optional Skill Friday + buddy system + occasional demo
   cost: cần Đạm host weekly; phụ thuộc Đạm's bandwidth
   benefit: tạo ritual nhẹ, không ép

## Decision

**Pick 2 (Pull) với element nhẹ của 3** — Lối B core + Skill Friday optional khi có signal pull.

## Reasoning

- **Data point chính:** Adoption curve baseline cho team 5 PM = 1-2 regular, 2-3 occasional, 0-1 never. "Mass adoption" là illusion.
- **Mental model áp dụng:**
  - Pull > Push: change management chỉ bền khi user tự cảm thấy pain
  - Asymmetric show-don't-tell: output proof > pitch
  - Selection effect: people tự pull = self-selected high-leverage user
- **2nd order consequence:** Nếu push → 1 lần burn (output stale, missed expectation) → kill trust → never recover. Pull → mỗi member self-pace, không bị burned bởi tool chưa ready.
- **Why not A (push):** Đã hiểu rõ team culture — top-down nặng tay phản tác dụng.
- **Why not pure 3 (Skill Friday weekly):** Optional weekly meeting còn lúc không có ai pull = waste team time. Để khi có 1-2 member curious mới activate.

## Adoption playbook (concrete)

**Play 1 — Passive demo:** Khi member hỏi câu nào, trả lời + đính kèm screenshot output Cowork.
**Play 2 — 1:1 demo:** Trong 1:1, mở Cowork query 1 task liên quan trực tiếp.
**Play 3 — Pre-meeting prep share:** Trước Risk Committee/P&L review, share prep notes generate từ Cowork.
**Play 4 — Delegate kèm starter:** Giao task + "tôi đã start với AI, đây là output sơ bộ, refine và ship".
**Play 5 — Skill từ pain:** Member than việc lặp lại → "để mình ngồi 20 phút turn nó thành skill cho bạn".
**Play 6 — Surface team hero:** Pair 1 power user (Lâm/Cường) → họ tự kể win, không phải Đạm evangelize.

## Anti-patterns explicit

- ❌ Email "everyone please try Claude"
- ❌ Track usage stats so sánh public
- ❌ KPI/OKR cho Skill creation
- ❌ Force Skill Friday participation
- ❌ Hỏi *"sao chưa ai dùng"* trong meeting

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| Lâm (Senior PM) | unknown — power user candidate | Identify trong tuần này, pair private nếu phù hợp |
| Cường (Senior PM) | unknown — power user candidate | Same |
| Định, Duyên, Tiên | neutral | Wait for organic pull |

## Outcome (update sau)

- [ ] 2 tuần (28 May): 1+ member tự nhắc AI/Claude trong conversation?
- [ ] 1 tháng (14 Jun): 1+ member tự share output AI/Claude qua Slack/team channel?
- [ ] 3 tháng (14 Aug): có 1+ skill propose từ member?

Nếu sau 6 tuần 0 signal → đánh giá lại: team chưa ready hay Đạm chưa expose value đủ rõ? Nếu Đạm — adjust output quality/visibility. Nếu team — accept Lối B steady state.

## Lesson (rút ra sau outcome)

> *Để trống — update sau khi có signal.*
