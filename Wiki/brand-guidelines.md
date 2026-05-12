# Cake Brand Guidelines

> Brand theme cho mọi visual, artifact, UI sinh ra cho Cake. Apply mà không cần được yêu cầu. Chỉ deviate khi được nói rõ.

## Typography

- **Display + Heading:** Be Vietnam Pro
  - 700 weight cho display
  - 600 weight cho heading
  - 400 weight cho body
- **Monospace:** JetBrains Mono — dùng cho account number, code, transaction ID

## Color Palette

### Primary

| Token | Hex | Vai trò |
|---|---|---|
| Pink-500 | `#FF2D71` | Primary CTA, button, active state |
| Pink-700 | `#B8154F` | Pressed / dark variant |
| Grape-500 | `#7B2FBE` | Secondary, investment surface |
| Grape-900 | `#1A1033` | Dark background, "Night Ink" |

### Semantic

| Token | Hex | Vai trò |
|---|---|---|
| Mint-500 | `#0BC76A` | Success, positive return |
| Amber-500 | `#FF7A2F` | Warning, loan product |

### Neutral / Surface

| Token | Hex | Vai trò |
|---|---|---|
| Neutral light | `#F7F7F9` | Surface 1 |
| Neutral white | `#FFFFFF` | Surface 2 |
| Page bg | `#E8E8EF` | Default page background |

## Gradients

| Tên | Stops | Vai trò |
|---|---|---|
| Hero | 135° `#FF2D71` → `#7B2FBE` | Primary CTA |
| Deep | 135° `#7B2FBE` → `#1A1033` | Investment, premium surface |
| Growth | 135° `#0BC76A` → `#059952` | Success |
| Night | 160° `#1A1033` → `#2D1B55` | Dark panel |

## Shape Tokens

### Border Radius

| Token | Value |
|---|---|
| pill | `999px` |
| 2xl | `28px` |
| xl | `20px` |
| lg | `16px` |
| md | `12px` |

### Shadow

- **Pink-glow:** `0 8px 24px rgba(255, 45, 113, 0.28)`

## Usage Rules

1. **Apply without being asked.** Đây là default cho mọi report, slide, dashboard, HTML artifact của Cake.
2. **Deviate only when explicitly told.** Nếu user yêu cầu theme khác (vd theme partner, theme regulator), mới override.
3. **One color dominates.** 60–70% visual weight cho primary, 1–2 supporting tone, 1 sharp accent. Không cho tất cả ngang nhau.
4. **Dark/light contrast.** Dark background (Night Ink) cho title slide + conclusion. Light cho content. Hoặc commit hẳn dark throughout cho premium feel.

---

**Nguồn:** Email Đạm, internal Cake brand theme. **Cập nhật:** 11 May 2026
