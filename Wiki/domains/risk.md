---
status: wiki
type: domain-knowledge
topic: risk, credit-risk, sbv, compliance
---

# Risk — Mental Model

> Domain note về risk management tại Cake. Cadence, framework, key concern.
> *Last updated: 2026-05-25*

## Stakeholder chính

- **CRO** — Aggressive, data-driven, biz oriented, thân thiết với Đạm. Lead với data + P&L impact, nói thẳng.
- **Risk Manager** — Cautious. Cần data-driven, scenario-based khi communicate.

## Risk Committee

- **Cadence:** Monthly
- **Host:** CRO
- **Vai trò Đạm:** Input/proposal khi cần — đặc biệt khi mảng Lending có exposure mới, policy mới, hoặc thay đổi underwriting
- **Output gần nhất:**
  - T5/2026: [`Risk Committee T5-2026.pdf`](../../Raw/Risk/Risk%20Committee%20T5-2026.pdf) — [Summary](../../Raw/Risk/Risk-Committee-T5-2026-summary.md)
  - T4/2026: [`Risk Committee T4-2026.pdf`](../../Raw/Risk/Risk%20Committee%20T4-2026.pdf) — [Summary](../../Raw/Risk/Risk-Committee-T4-2026-summary.md)

## Risk Framework cho Lending

**Background lợi thế:** Đạm từng làm Risk role → nhìn được từ góc Risk + góc Product.

**Mental model áp dụng:**
- **Risk-adjusted return** — không chỉ yield, mà yield - CoR
- **Portfolio thinking** — diversify theo product, channel, segment
- **Second-order thinking** — push volume nay = CoR mai
- **Pre-mortem** — trước khi launch policy mới, hỏi "nếu fail thì fail vì gì?"

## Key Metrics

- **%LG2** — target ≤ 11%, không vượt 3 tháng liên tiếp
- **CoR by product** — UPL, CashLoan, Payday, OD, BNPL
- **Vintage analysis** — performance theo cohort tháng giải ngân
- **Concentration risk** — % exposure theo channel, segment

## Policy notes

- Lending policy cho vay > 100M VND: [`Raw/Lending/Policy/Lending_Policy_Vay trên 100M.pptx`](../../Raw/Lending/Policy/)
- OD Low IR Analysis: [`Raw/OD/OD_Low IR Analysis.xlsx`](../../Raw/OD/)

## SBV / Regulatory

- (cần feed) — thông tư đang theo dõi
- (cần feed) — interaction với SBV như thế nào

## Communicate với Risk team

- **Frame "làm sao để làm được"** với Risk khi push proposal — không hỏi "có được không"
- **Always data-driven** — không cảm tính
- **Show 2nd order** — "nếu approve, sau 3 tháng số đó về đâu?"

## Decisions / Lessons

> Index decision logs liên quan Risk/Underwriting. Mỗi decision có outcome review timeline 2 tuần / 1 tháng / 3 tháng — track follow-up trong từng file.

### Q2 2026 — Underwriting policy expansion

| Date | Decision | Channel/Product | Status |
|---|---|---|---|
| 2026-04-24 | [MWG CL: Mở 20M cho ETB_D/E + NTB_5/6](../decisions/2026-04-24_lending_mwg-cl-etb-ntb-tail-expansion.md) | MWG Cashloan | golive 24/04 |
| 2026-05-05 | [Cake CL Approve=Request (NTB12 100% + NTB3 pilot 10%)](../decisions/2026-05-05_lending_cake-cl-approve-equals-request.md) | Cake Cashloan | golive 5/5 |
| 2026-05-05 | [Cake Payday: uplift limit Repeat](../decisions/2026-05-05_lending_cake-payday-limit-uplift.md) | Cake Payday | tuần đầu T5 |
| 2026-05-05 | [ZaloPay CL: uplift limit NTB1-3](../decisions/2026-05-05_lending_zalopay-cl-limit-uplift.md) | ZaloPay Cashloan | tuần đầu T5 |
| 2026-05-25 | [VDS CL Approve=Request: Chốt Scenario S2](../decisions/2026-05-25_lending_vds-cl-approve-equals-request-scenario-s2.md) | VDS Cashloan | post-pilot scoping |

### Patterns / Lessons (working hypotheses)

> Distilled từ multi-decision patterns. Confirm sau khi 3+ decision cùng family hit outcome review (1-3 tháng).

1. **Segment policy theo NTB band, không blanket port.** Mọi decision Q2/2026 đều split NTB1-3 push vs NTB4-6 hold/exclude. Pattern emerging — sau outcome 1 tháng (Jun 2026) nếu confirm robust → promote thành SOP cho mọi UW policy proposal.
2. **Repeat history là risk filter mạnh hơn NTB.** Cake Payday data DPD%: Repeat ≥2 lần giảm 25-50% DPD so với first repeat ở mọi NTB band → repeat behavior dominate NTB signal cho segment đã có cohort.
3. **Sensitivity ticket↑/risk↑ là NTB-band specific (working hypothesis từ VDS S2 pilot).** Overall port có correlation cao, nhưng chỉ contribute từ NTB5-6 (bad band). NTB1-4 sensitivity thấp → có thể push ticket safely. **Cần verify** từ Cake CL Approve=Request outcome trong Q3.
4. **Tail segment "HSSV / Worker / Unemployed" tốn 14pp uplift để exclude (VDS S2: 1.26x → 1.12x).** Tail demographic này confirm là wastage — exclude là correct trade-off.

### Decision protocol observed (Q2 2026)

Pattern recurring qua 5 decisions:
1. **Data: roll rate / FPD10 / DPD% by segment** — data-driven baseline
2. **Segment by NTB × Repeat × Demographic** — không blanket
3. **Cap entry ticket khi expand reject segment** — limit downside (vd: MWG 20M cap, Cake Payday NTB5-7 4M cap)
4. **Outcome review 2W/1M/3M cadence** — built-in iteration loop
5. **Reversibility per segment** — rollback chỉ band, không touch toàn policy

---

**Raw materials:** [`../../Raw/Risk/`](../../Raw/Risk/)
