# BRD — Lending Insight Agent Loki — MVP 1

**Status**: DRAFT v1.1 | **Owner**: Head of Lending Product | **Updated**: 2026-06-08
**Scope**: 6 AI Skills · Total: 11 tuần (W2 June → W4 Aug 2026)

---

## Mục lục

**Body** (5 phút scan)
1. Architecture
2. Roadmap
3. 6 Skills Summary
4. PIC Matrix
5. Delivery Detail
6. Tentative Timeline (fill)

**Appendix** (review offline meeting)
- A. Metrics Calculation (canonical)
- B. Skill #1 Mgmt Daily Pulse — detail
- C. Skill #2 Lending Daily Pulse — detail
- D. Skill #3 Anomaly Scan — detail
- E. Skill #4-6 — brief
- F. Skill Sample (markdown template)

---

> **Đọc nhanh thuật ngữ**:
> - **Skill** = AI template markdown — 1 use case · **Skill Library** = folder centralized chứa skill files
> - **Cron** = scheduler auto-trigger skill theo lịch (vd 7:00 AM mỗi sáng)
> - **Pattern Y** = Cách viết skill an toàn + tiết kiệm: **code Python tính trước số liệu tổng hợp** (vd "tổng Disb hôm qua 1,247 tỷ", "Top Drivers là Cell A, B, C") → **AI chỉ thấy số tổng + viết báo cáo bằng tiếng Việt**, KHÔNG thấy data khách hàng cá nhân. Lợi ích: an toàn (không leak PII) + tiết kiệm chi phí token ~90%
> - **T** = hôm nay · **T-1** = hôm qua · **SDLW** = Same Day Last Week
> - **Cell** = ô trong matrix Channel × Product
> - **RBAC** = Role-Based Access Control — phân quyền truy cập theo vai trò. Vd BD-VDS chỉ thấy data channel VDS, không thấy CAKE/ZLP/MWG
> - **CRO** = Chief Risk Officer · **LOS** = Loan Origination System

> **Cách đọc BRD này**:
> - **Body** (§1-§6): 5 phút hiểu tổng thể
> - **Appendix** (§A-§F): chi tiết từng skill + Metrics Calculation + Skill Sample · review offline meeting riêng

---

## 1. Architecture

```
┌──────────────────────────────────────────────────────────────────────────────┐
│  [Data Engineering]        [Lending Product]         [IT]                    │
│  DB ready                  Skills 100%               Infra                   │
│  • 7 raw count             • Metric calculation      • Power Automate        │
│  • Daily + hourly          • Trigger rules           • Email/Teams send      │
│  • Permissions             • Mockup output           • MCP server            │
│  • Performance review      • List recipients         • Compliance + audit    │
└──────────────────────────────────────────────────────────────────────────────┘
                          ↓              ↓              ↓
                        6 Skills running via cron + on-demand
                        → Email + Teams card + HTML SharePoint
```

**Skill-led, no deterministic service.** Tất cả tính toán + format báo cáo chạy trong skill: code Python tính trước số liệu tổng hợp, AI viết phần văn bản tiếng Việt (theo Pattern Y — xem glossary).

---

## 2. Roadmap

| Phase | Duration *(to be confirmed)* | Scope |
|---|---|---|
| **Kick off + align scope** | 1 tuần | BRD review + stakeholder sign-off · Commit timeline + PIC từng team |
| **Phase 0** | 2 tuần | Lending Product team draft Appendix A + workshop validate · IT setup Power Automate + MCP + compliance |
| **MVP 1a** | 3-4 tuần | Skill #1 Mgmt Pulse + Skill #2 Lending Pulse · cron + email/Teams |
| **MVP 1b** | 3-4 tuần | Skill #3 Anomaly + #4 Weekly + #5 Drill + #6 NL Query · Teams channel + shadow 2 tuần |
| MVP 2 (out) | TBD | Mass adoption — add users Claude Cowork (BD/Marketing/Risk). Không build thêm engineering |
| MVP 3 (out) | TBD | Closed-loop workflow với LOS: skill phát hiện thay đổi cần thiết (policy / threshold / rule) → redirect proposal qua **CRO review** → CRO approve → **auto triển khai vào LOS** · Skill monitor impact post-implementation |

**Total MVP 1: 9-11 tuần** *(to be confirmed)*.

---

## 3. 6 Skills Summary

| # | Skill | Trigger | Audience | Output | Detail |
|---|---|---|---|---|---|
| **1** | Mgmt Daily Pulse | Cron 7:00 AM | CEO + Mgmt | Email + Teams card | Appendix B |
| **2** | Lending Daily Pulse | Cron 7:00 AM | Lending Product team + BD scoped | HTML SharePoint + Teams link | Appendix C |
| **3** | Anomaly Scan | Cron hourly 8AM-8PM | Teams channel subscribers | Teams channel push | Appendix D |
| **4** | Weekly Summary | Manual / Mon 7:30 AM | Lending Product team | HTML + Teams | Appendix E |
| **5** | Cell Drill-down | Ad-hoc | Lending Product team + BD | Markdown chat | Appendix E |
| **6** | NL Query | Ad-hoc | All users | Markdown chat | Appendix E |

---

## 4. PIC Matrix

| Team | Vai trò MVP 1 |
|---|---|
| **Data Engineering** | Cấp data + đảm bảo performance |
| **Lending Product team** | **Own 6 skill** + define metric calculation + trigger rules + mockup output + list of recipients |
| **IT / Internal Tools** | Setup cron + gửi email/Teams + compliance + cấp Anthropic license |

---

## 5. Delivery Detail

| | Skill #1 | Skill #2 Full | Skill #2 BD Scoped | Skill #3 | Skill #4-6 |
|---|---|---|---|---|---|
| Audience | CEO + Mgmt | Lending Product team | BD per channel | Channel subscribers | Lending Product team + BD |
| Format | Email HTML + Teams card | HTML SharePoint + Teams link | HTML scoped URL + Teams link | Teams channel push | Markdown / HTML |
| Cadence | Daily 7:00 AM | Daily 7:00 AM | Daily 7:00 AM | Hourly 8AM-8PM | On-demand / weekly |
| Failure handling | Retry 3x + fallback last-known | Retry 3x + fallback | Retry 3x | Retry, miss 1 scan OK | Best-effort |
| RBAC | 1 view Mgmt | Lending Product team full | Server-side filter per channel | Channel subscribers | Per user |

---

## 6. Tentative Timeline

| Step | Duration | Target Start | Target End | PIC | Key Milestone |
|---|---|---|---|---|---|
| **Kick off + align scope** | 1 tuần | W2 June | W2 June | Lending Product (Owner) + all stakeholders | BRD sign-off · Commit timeline + PIC từng team |
| **Phase 0** | 2 tuần | W3 June | W4 June | Lending Product + Data Eng + IT | Appendix A locked · IT setup ready · Compliance approved |
| **MVP 1a** | 3-4 tuần | W1 July | W4 July | Lending Product + IT | Skill #1 + #2 production-ready · Cron + delivery live |
| **MVP 1b** | 3-4 tuần | W1 Aug | W4 Aug | Lending Product + IT | Skill #3 + #4 + #5 + #6 ready · Shadow 2 tuần · Go-live |

**Total: 11 tuần** — W2 June → W4 Aug 2026.

**Gantt visual**:

```
                       W2-Jun  W3-Jun  W4-Jun  W1-Jul  W2-Jul  W3-Jul  W4-Jul  W1-Aug  W2-Aug  W3-Aug  W4-Aug
Kick off + align       ██
Phase 0                        ██      ██
MVP 1a                                          ██      ██      ██      ██
MVP 1b                                                                          ██      ██      ██      ██
```

---

*v1.1 DRAFT — Body 1-pager · Detail trong Appendix · Offline meeting review*

---

# Appendix

## Appendix A — Metrics Calculation (canonical)

> Lending Product team own draft trong Phase 0. Workshop với Data Eng + Lending Eng validate. Source-of-truth cho cả 6 skills.

### Raw counts (Daily × Channel × Product cho Skill #1/#2; Hourly cho Skill #3)

- App-in count
- Pass-precheck count
- LOS submission count
- Approved count
- Signed count
- Disbursed count
- Disbursed amount (VND)

### Derived metrics

| Derived | Công thức |
|---|---|
| %Precheck-pass | Pass-precheck / App-in |
| %LOS-submission | LOS submission / Pass-precheck |
| **%AR** | Approved / LOS submission |
| %Sign rate | Signed / Approved |
| %Disb rate | Disbursed / Signed *(compute only)* |
| Avg ticket size | Disbursed amount / Disbursed count |

### Dimensions

- Product (4): Cash Loan, Credit Card, Paylater, Overdraft
- Channel (5): VDS, CAKE, ZLP, MWG, Others

### Items cần chốt qua workshop

- **App-in count**: step nào? Dedup unique customer/day hay raw event?
- **Pass-precheck count**: precheck gồm check nào (KYC / eligibility / anti-fraud)?
- **LOS submission count**: user complete step nào?
- **Approved count**: instant scoring vs delayed manual review?
- **Signed count**: e-signature timestamp?
- **Disbursed count + amount**: release fund? Date = release vs signed? Amount principal vs total contract?
- **Channel attribution**: first-touch / last-touch / partner tag?
- **Product master mapping**: define category cho 4 product
- **Daily cutoff**: T-1 timezone (UTC+7)?
- **Intra-day timestamp accuracy** cho Skill #3
- **Edge cases**: cancel sau approved? Reverse sau disbursed?
- **"Others" channel scope**: cover gì cụ thể?

---

## Appendix B — Skill #1 Mgmt Daily Pulse (detail)

**Trigger**: Cron Power Automate 7:00 AM daily · **Audience**: CEO + Management · **Delivery**: Email HTML + Teams card

### Output mockup

```
┌────────────────────────────────────────────────────────────┐
│ DISBURSEMENT                              31/05/2026 (T-1) │
│                                                              │
│              1,247 tỷ VND                                    │
│                                                              │
│   vs hôm trước (30/05)         +5.2%  ↑                      │
│   vs 7-day rolling avg         −2.1%  ↓                      │
│   vs 30-day rolling avg        +8.4%  ↑                      │
│                                                              │
│ ── TOP DRIVERS (vs 7-day rolling avg) ─────────────────────  │
│   ⊕ Credit Card × MWG       +120 tỷ                         │
│       ▸ App-in +18%, %Sign +12pp                            │
│   ⊕ Cash Loan × ZLP          +85 tỷ                         │
│       ▸ Ticket size +12%                                    │
│   ⊖ Cash Loan × VDS         −180 tỷ                         │
│       ▸ App-in −35%  ← root cause                           │
│   ⊖ Paylater × Others        −42 tỷ                         │
│       ▸ %AR −8pp                                            │
└────────────────────────────────────────────────────────────┘
```

### Display rules

- 3 baselines: T-2, 7-day rolling, 30-day rolling
- Top Drivers: 2 ⊕ + 2 ⊖ cell Channel × Product, vs 7d rolling
- Funnel diagnosis: 6 stages; top 1 stage nếu ≥60% Δ, else top 2
- "← root cause" label khi 1 stage chiếm ≥60% Δ
- Cell exclusion: baseline 7d <1 tỷ HOẶC \|Δ\| <5 tỷ

### Skill behavior

- Pattern Y: Python tool query DB → compute baselines + Top Drivers + funnel decomposition → return aggregate dict
- LLM render HTML template với aggregate (no raw data in context)

---

## Appendix C — Skill #2 Lending Daily Pulse (detail)

**Trigger**: Cron 7:00 AM daily · **Audience**: Lending Product team (full) + BD/Channel owner (scoped, RBAC) · **Delivery**: HTML SharePoint + Teams card link

### Output mockup — Full view

```
═══════════════════════════════════════════════════════════════════════
LENDING DAILY PULSE                                  31/05/2026 (T-1)
═══════════════════════════════════════════════════════════════════════

▓ TOP LINE
  Total Disb T-1: 1,247 tỷ | vs T-2 +5.2% | 7d −2.1% | 30d +8.4%

▓ CHANNEL HEALTH SNAPSHOT
  Channel    Disb T-1   Δ vs 7d   Share    Top issue
  VDS         285 tỷ    −28% ↓    22.8%    App-in collapse từ 14:00
  CAKE        412 tỷ    +12% ↑    33.0%    —
  ZLP         298 tỷ    +18% ↑    23.9%    Healthy ramp
  MWG         185 tỷ     +5% ↑    14.8%    —
  Others       67 tỷ     −3%       5.4%    —

▼ VDS                                       Disb: 285 tỷ (−28%)
  Product       App-in        %Pre        %LOS         %AR         %Sign      Ticket         Disb Δ
  Cash Loan     8,050 (−35%)  85% (−2pp)  72% (−8pp↓)  68% (−3pp)  89% (+1)  15.2tr (+4%)    −180t ⊖
  Credit Card   3,200 (−10%)  90% (=)     85% (=)      73% (=)     92% (=)    8.2tr (=)       −25t ⊖
  Paylater      5,800 (−8%)   78% (−1pp)  75% (=)      62% (−6pp↓) 88% (=)    2.5tr (=)       −18t ⊖
  Overdraft       820 (=)     85% (=)     82% (=)      71% (=)     93% (=)   18.5tr (=)        +5t

  Key drivers:
  ⊖ Cash Loan: App-in collapse −35% từ 14:00 30/05
  ⊖ Paylater: %AR drop −6pp

▼ CAKE / ZLP / MWG / Others — cùng cấu trúc

▓ ACTIVE ALERTS — T-1 review (synced từ Skill #3)
  🔴 [R1] VDS × Cash Loan App-in collapse
  🟡 [R3] VDS × Paylater %AR drop
```

### 4 blocks

- **Block 1 Top line**: Total Disb + 3 baselines
- **Block 2 Channel Health Snapshot**: 5 row × 4 col
- **Block 3 Per-channel detail**: 5 collapsible section, funnel matrix 4 product × 7 col + key drivers
- **Block 4 Active Alerts**: 3 critical alert recap từ Skill #3

### BD Scoped view

Skill với parameter `channel=VDS` → output filtered cho 1 channel. URL HTML khác per BD, server-side RBAC check.


---

## Appendix D — Skill #3 Anomaly Scan (detail)

**Trigger**: Cron hourly 8 AM - 8 PM · **Audience**: Teams channel subscribers (`#clie-anomaly-alerts`) · **Delivery**: Push real-time message

### Output mockup — Teams channel

```
[#clie-anomaly-alerts — Tuesday 04/06/2026]

┌─────────────────────────────────────────────────────────────────┐
│ 09:05 │ 🔴 CRITICAL │ [R10] System uptime                         │
│ LOS Scoring Engine uptime 98.2% rolling 24h (trigger: <99%)       │
│ 🎯 Engineering review latency spike                                │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ 10:05 │ 🔴 CRITICAL │ [R1] App-in collapse                        │
│ VDS × Cash Loan                                                   │
│ Today 00:00-10:00 = 4,200 đơn vs SDLW = 7,500 đơn (56%, <70%)     │
│ 🎯 BD-VDS investigate partner API                                  │
└─────────────────────────────────────────────────────────────────┘

[Info logged only, not pushed]

┌─────────────────────────────────────────────────────────────────┐
│ 20:05 │ 📊 DAILY SUMMARY                                          │
│ Today: 🔴 Critical: 2 · 🟡 Warning: 3 · 🔵 Info: 4 (logged)        │
│ Persistent (>4h): R1 VDS × Cash Loan                              │
└─────────────────────────────────────────────────────────────────┘
```

### 11 Rules

> **Examples to be finalized** — rules + threshold values dưới đây là draft. Sẽ chốt offline meeting với stakeholders trong Phase 0.

| # | Rule | Severity | Trigger |
|---|---|---|---|
| R1 | App-in collapse | 🔴 Critical | Cell App-in <70% SDLW same cumulative window |
| R2 | App-in spike | 🟡 Warning | Cell App-in >150% SDLW |
| R3 | %AR sudden drop | 🟡 Warning | Cell %AR drop >5pp vs SDLW |
| R4 | %Sign drop | 🟡 Warning | Cell %Sign drop >5pp vs SDLW |
| R5 | %LOS-submission drop | 🟡 Warning | Cell %LOS-sub drop >5pp vs SDLW |
| R6 | Ticket size shift | 🟢 Info | Cell ticket Δ >±15% vs 30d avg |
| R7 | NTB Band 4-5 mix shift | 🟡 Warning | % approved Band 4-5 > threshold (TBD) |
| R8 | Channel volume drop sustained | 🔴 Critical | Channel Disb <70% SDLW sustained 2h |
| R9 | Channel share shift | 🟢 Info | Channel share Δ >±5pp vs 30d avg |
| R10 | System uptime | 🔴 Critical | LOS/Scoring/Disb <99% rolling 24h |
| R11 | Failed disbursement spike | 🔴 Critical | Failed disb >0.5% in rolling 1h |

### Operational rules

- Scan cadence: Hourly đầu giờ, 8 AM - 8 PM (12 scan/day)
- Comparison baseline: Cumulative window 00:00 → current hour today vs cùng window SDLW
- Severity push policy: Critical + Warning push channel · Info chỉ log
- Dedup: Same anomaly fire trong 4h → KHÔNG push lại
- Daily summary: 20:05 PM
- Threshold config: Hard-coded trong skill, PR review trước thay đổi


---

## Appendix E — Skill #4-6 (brief)

### Skill #4 Weekly Summary

- **Trigger**: Manual / Cron Mon 7:30 AM · **Audience**: Lending Product team · **Delivery**: HTML + Teams
- Skill query last 7 days → trend, top movers, funnel health, partner alerts → 1-page narrative

### Skill #5 Cell Drill-down

- **Trigger**: Ad-hoc (param `cell=Cash Loan × VDS`) · **Audience**: Lending Product team + BD · **Delivery**: Markdown chat
- Query 1 cell channel × product → historical context + hypothesis + comparable past events

### Skill #6 NL Query

- **Trigger**: Ad-hoc · **Audience**: All skill users · **Delivery**: Markdown chat
- Catch-all — AI compose SQL từ NL question → execute → summarize

---

---

## Appendix F — Skill Sample (markdown template)

> Template tham khảo cho Lending Product team viết skill mới. Sample = Skill #1 Mgmt Daily Pulse.

````markdown
---
name: mgmt-daily-pulse
description: Generate Mgmt Daily Pulse (Disbursement Tile #1) — daily 7:00 AM cron
owner: Lending Product team
version: 1.0
last_updated: 2026-06-08
---

# Skill: Mgmt Daily Pulse

## Purpose
Generate báo cáo sáng cho CEO + Management với:
- Tổng disbursement T-1 (VND)
- 3 baselines: T-2, 7-day rolling, 30-day rolling
- Top Drivers: 2 ⊕ + 2 ⊖ cell Channel × Product + funnel diagnosis

## Inputs
- `date` (default: T-1 = hôm qua, UTC+7)
- `products` (default: all 4 — Cash Loan, Credit Card, Paylater, Overdraft)
- `channels` (default: all 5 — VDS, CAKE, ZLP, MWG, Others)

## Process

**Step 1**: Call Python tool `compute_mgmt_pulse(date, products, channels)`
- Tool query DB qua MCP → compute baselines + Top Drivers + funnel stage decomposition
- Return aggregate dict (no row-level PII):
  ```python
  {
      "date": "2026-05-31",
      "total_disb_vnd": 1247000000000,
      "baselines": {
          "vs_t2": {"delta_pct": 5.2, "direction": "up"},
          "vs_7d_rolling": {"delta_pct": -2.1, "direction": "down"},
          "vs_30d_rolling": {"delta_pct": 8.4, "direction": "up"}
      },
      "top_drivers": [
          {
              "sign": "⊕",
              "channel": "MWG",
              "product": "Credit Card",
              "delta_vnd": 120000000000,
              "top_stages": [
                  {"name": "App-in", "delta_pct": 18, "is_root_cause": false},
                  {"name": "%Sign", "delta_pp": 12, "is_root_cause": false}
              ]
          },
          # ... 3 more drivers
      ]
  }
  ```

**Step 2**: Reference Appendix A canonical metric formulas — đảm bảo consistency cross-skill

**Step 3**: Generate narrative tiếng Việt theo Output Template

**Step 4**: Render HTML email (1-page) + MS Teams card

## Output Template

```
┌────────────────────────────────────────────────────────────┐
│ DISBURSEMENT                              {date} (T-1)     │
│                                                              │
│              {total_disb_vnd_formatted} tỷ VND               │
│                                                              │
│   vs hôm trước                 {vs_t2.delta_pct} {arrow}     │
│   vs 7-day rolling avg         {vs_7d.delta_pct} {arrow}     │
│   vs 30-day rolling avg        {vs_30d.delta_pct} {arrow}    │
│                                                              │
│ ── TOP DRIVERS (vs 7-day rolling avg) ─────────────────────  │
│ {for each driver:}                                           │
│   {sign} {channel} × {product}     {delta_vnd_formatted} tỷ │
│       ▸ {stage_name} {stage_delta}{root_cause_label}        │
└────────────────────────────────────────────────────────────┘
```

Display rules (xem Appendix B):
- Cell exclusion: baseline 7d <1 tỷ HOẶC \|Δ\| <5 tỷ → loại
- "← root cause" label khi 1 stage chiếm ≥60% Δ disb
- Top 1 stage nếu ≥60% Δ, else top 2 stages

## Voice/Tone
- Direct, bullet, không hedge
- Tiếng Việt natural
- Match Cake brand

## Compliance
- Pattern Y enforce: Python tool output **aggregate only** (no row-level PII)
- LLM context size: <2000 tokens
- Audit log: invoke timestamp + user + output size

## Failure Handling
- Retry 3x với exponential backoff
- Fallback: gửi pulse với số liệu lần cuối có (last-known) nếu retry fail
- Alert pre-7:15 AM nếu skill chưa done

## Reference
- Appendix A: Metrics Calculation (canonical formula)
- Appendix B: Tile #1 detail (display rules)
- Skill Library: `/skills/mgmt-daily-pulse.md`
````

---

*Appendix sections sẽ review offline meeting riêng. Body 1-pager đủ cho high-level alignment.*
