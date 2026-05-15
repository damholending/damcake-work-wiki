---
status: logged
type: decision-log
topic: ai-workflow-architecture, team-tooling
---

# [2026-05-14] Cowork-first cho cá nhân, drop shared Claude Project cho team

**Domain:** ai
**Mode:** time-to-market
**Stakes:** medium
**Reversibility:** reversible (re-activate shared project trong 5 phút khi cần)
**KPI link:** indirect — productivity multiplier cho output cá nhân + scale team

## Situation

Setup Claude Project "Lending Hub" shared cho team (5 PM) với 6 file knowledge curated (lending context, product scheme, P&L bundle, brand). Sau khi audit setup, phát hiện 2 vấn đề structural:

1. Team xài **shared Claude account** (1 account cho cả team) → sidebar chat hỗn loạn, không có individual memory, brainstorm conflict, naming convention dễ vỡ.
2. Đạm đã có **Cowork** với full file system + skill + MCP + bash → Project shared **redundant cho cá nhân**, chỉ có giá trị nếu team chủ động adopt.

Team chưa show signal pull. Push adoption sẽ tốn 4-6 tuần effort cho upside không chắc.

## Options considered

1. **A — Giữ shared Project + push team adoption** (kế hoạch ban đầu)
   cost: 4-6 tuần effort training + maintain Instructions/JSON refresh + risk death yểu
   benefit: nếu team adopt → asymmetric tool cho cả team

2. **B — Drop shared Project, Đạm dùng Cowork solo, team consume output** (Lối B)
   cost: ~0 (Cowork đã active); team không có self-service AI access
   benefit: output quality cao hơn cho cả team; không waste effort push; pull có thể emerge organic

3. **C — Đầu tư cá nhân Claude seats cho team** (~$100/tháng)
   cost: budget approval + onboarding overhead
   benefit: loại friction shared account + Project hoạt động đúng cách
   blocked: chưa có org buy-in, chưa có evidence team pull

## Decision

**Pick B — Cowork-first, drop shared Project (idle, không xóa).**

## Reasoning

- **Data point chính:** Team chưa có 1 member nào chủ động hỏi *"setup Claude thế nào"* — 0 pull signal.
- **Mental model áp dụng:**
  - Pre-mortem: nhiều kịch bản chết yểu (SPOF Đạm, friction shared account, JSON stale, value chưa asymmetric)
  - Asymmetric leverage: output Đạm tạo ra qua Cowork có thể distribute passive; effort tập trung 1 chỗ
  - Pull > Push: adoption sustainable chỉ khi team tự cảm thấy pain được giải
- **2nd order consequence:** Nếu push thành công 30% → vẫn cần maintain shared project khi chỉ 1-2 user → maintenance cost cao per active user. Better drop, re-activate sau khi có pull.
- **Why not A:** Push không bền với team busy đang focus delivery Q2 — adding tool friction sẽ backfire.
- **Why not C:** Chưa có evidence để justify budget; muốn pull trước, infra sau.

## Stakeholders

| Stakeholder | Stance | Action |
|---|---|---|
| Team Lending (5 PM) | neutral (chưa engage) | Không tự ý announce; output Cowork share dần qua Slack/file |
| CEO | neutral (no awareness) | Không cần loop khi chưa có outcome rõ |
| Future-self | aligned | Re-evaluate sau 6 tuần khi có/không pull signal |

## Outcome (update sau)

- [ ] 2 tuần (28 May): có member nào tự nhắc Lending Hub / Claude project chưa?
- [ ] 1 tháng (14 Jun): có ai forward output Cowork qua Slack/team chưa? Có ai propose skill chưa?
- [ ] 3 tháng (14 Aug): final verdict — pull đã emerge → activate Project; hoặc confirmed Cowork-only model.

## Lesson (rút ra sau outcome)

> *Để trống — update sau khi có signal.*

**Tentative lesson trước outcome:**
- Trước khi build infrastructure cho team, stress test *"team có pull không"* — không phải *"team nên dùng không"*.
- Cowork ≠ Claude Project shared. Hai paradigm khác cho 2 nhu cầu khác.
