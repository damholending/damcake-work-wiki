---
status: team-shared
type: knowledge-map
audience: Lending Product team @ Cake (Lâm, Cường, Định, Duyên, Tiên, Chi, Kiệt + cross-team)
purpose: Paste-ready cho Claude Project Instructions — team biết query gì
last_updated: 2026-06-09
---

# Lending Hub — Team Knowledge Map

> Welcome team Lending! Claude project này sync auto từ GitHub repo. Hỏi gì cũng được — Claude sẽ trace tới file gốc.

---

## 📚 Team query được gì?

### 1. 📊 P&L Performance
**Bạn hỏi**: *"Lending YTD T4-2026 so vs budget bao nhiêu?"* · *"Channel nào yield cao nhất Q1?"* · *"NPL Cake vs CIC từng channel?"*
- `Projects/Finance-Tracking/team-hub/lending-pl-data.json` — 14 section ground truth, 4 period × ~48 entry
- `Projects/Finance-Tracking/team-hub/lending-pl-guide.md` — schema + cách query
- `Projects/Finance-Tracking/team-hub/lending-portfolio-tracking.html` — interactive dashboard
- `Raw/Lending/Monthly Report/` — monthly P&L review pptx

### 2. 🏪 Channel × Product
**Bạn hỏi**: *"CAKE Cashloan T4 disbursement?"* · *"VDS Payday cohort UE Q1.26?"* · *"MWG Paylater active rate?"*
- Section 6 trong `lending-pl-data.json` — master `{period: {<product>_<channel>: {25 metric}}}`
- 5 channel group: CAKE · VDS · ZLP · MWG · Others
- 4 product: CL (Cashloan) · OD (Overdraft) · PD (Payday) · PL (Paylater)

### 3. ⚠️ Risk & Policy
**Bạn hỏi**: *"Risk Committee T5/2026 chốt gì?"* · *"Policy cutoff VDS hiện tại?"* · *"Loki AI guild evaluation?"*
- `Raw/Risk/Risk-Committee-T5-2026-full.md` — full minutes
- `Raw/Risk/Risk-Committee-T5-2026-meeting-notes.md` — meeting notes
- `Raw/Lending/Policy/` — policy docs
- `Wiki/domains/risk.md` — risk domain knowledge

### 4. 📐 Product Scheme
**Bạn hỏi**: *"Product scheme 2025 cho Cashloan?"* · *"BNPL design current?"*
- `Wiki/_team-shared/product-scheme-2025.md` — scheme clean
- `Raw/Lending/Product Scheme/` — scheme docs gốc

### 5. 🎯 Decisions Tracker (auto-updated weekly)
**Bạn hỏi**: *"Tuần trước Đạm chốt gì với CRO?"* · *"BE score-based offer status?"* · *"ZLP timeline pool A?"*
- `Wiki/_team-shared/decisions-tracker.md` — weekly snapshot từ MS Teams scan
- Source group: Risk-Product-BD, Lending Leaders 3, Lending Team, ZLP Channel, BD-Lending Channels, BE Channel, Cake Channel

### 6. 🤖 AI Use Cases & Loki Initiative
**Bạn hỏi**: *"Loki Agent MVP1 BRD?"* · *"AI use case cho lending?"* · *"LLM KB framework?"*
- `Projects/Lending-Insight-Engine/BRD-Lending Insight Agent Loki-MVP1.md` — BRD chính thức
- `Projects/LLM-KB-Framework/` — KB framework docs
- `Projects/AI-Applied-Use-Cases/` — AI use case catalog
- `Wiki/domains/ai-at-cake.md` — AI strategy Cake-wide

### 7. 📈 HTML Reports (interactive)
**Bạn hỏi**: *"BE Cashloan funnel T5?"* · *"ZLP road to 4K?"* · *"Payday simulator?"*
- `HTML-Reports/BE_CashLoan_Funnel_T5_2026_Final.html`
- `HTML-Reports/ZLP — Road to 4K Final Analysis.html`
- `HTML-Reports/Payday-Simulator.html`
- `HTML-Reports/Unit-Economics-Simulator.html`
- `HTML-Reports/Road to 3K — Q2 2026 _ CAKE.html`
- `HTML-Reports/lending-portfolio-tracking.html`
- `HTML-Reports/becl-dop-04052026.html`
- `HTML-Reports/ai-bootcamp.html`

### 8. 🎨 Brand Guidelines (cho artifact)
**Bạn hỏi**: *"Cake brand color?"* · *"Font cho slide?"* · *"Template chart?"*
- `Wiki/brand-guidelines.md` — Pink-500 #FF2D71, Grape-500 #7B2FBE, Amber-500 #FF7A2F, Be Vietnam Pro font

### 9. 👥 Stakeholders Map
**Bạn hỏi**: *"Ai phụ trách Risk?"* · *"CRO là ai?"* · *"BD Director Cake?"*
- `Wiki/stakeholders.md` — C-level + cross-team map

### 10. 📖 Domain Knowledge
**Bạn hỏi**: *"Embedded lending model Cake?"* · *"Finance segment Cake?"*
- `Wiki/domains/lending.md` · `finance.md` · `risk.md` · `ai-at-cake.md`

### 11. 🚀 Team Onboarding & SOP
**Bạn hỏi**: *"Cách team work với Claude?"* · *"Loki runbook?"*
- `Wiki/_team-shared/team-onboarding-guide.md`
- `Wiki/_team-shared/claude-way-of-working.md`
- `Wiki/_team-shared/loki-phase1-antigravity-runbook.md`
- `Wiki/_team-shared/lending-team-context.md`

---

## 💡 Tip query

1. **Cứ hỏi tự nhiên** — Claude sẽ trace tới đúng file.
2. **Specific better**: thay vì "NPL channel" → "NPL CAKE vs CIC từng channel Q1.26 từ section 4 data".
3. **Quote số yêu cầu** — Claude trả lời format giống team-hub guide.
4. **Multi-file synthesis** — Claude tự cross-ref nhiều file nếu cần (vd: policy + monthly report + decisions).
5. **Khi không sure**: hỏi "Có file nào trong project liên quan tới X không?"

---

## 🔄 Update cadence

- **Daily**: HTML reports + processed data update khi Đạm push
- **Weekly**: `decisions-tracker.md` update T2 sáng (auto scan MS Teams 7 group)
- **Monthly**: Risk Committee notes + Monthly P&L review
- **Quarterly**: P&L data + Unit Economics

---

## ⚠️ Không có gì trong project này

Để tránh expect sai:
- ❌ Đạm's personal voice samples / private 1-1 emails với C-level
- ❌ Raw Finance P&L Excel (chỉ có processed JSON)
- ❌ Biz plan 2026 raw analysis (chỉ có high-level numbers trong P&L data)
- ❌ Working drafts chưa polish
- ❌ Skill internal infrastructure (cron, hook)

Nếu cần thông tin trên → hỏi Đạm trực tiếp.

---

## 🛠 Maintained by

Đạm. Sync auto via GitHub Integration. Update file này khi structure repo đổi (vd: thêm new project / new raw category).
