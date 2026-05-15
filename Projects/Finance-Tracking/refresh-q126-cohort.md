# Refresh Q1.26 cohort UE cache

`q126_cohort_ue_cache.json` chứa per-channel cohort UE cho Q1.26, extract bằng Excel automation
(vì file Q126 là combined file — dropdown sub-segment, openpyxl không recalc được formula).

## Khi nào cần refresh

- Khi Q126 source files update (`Raw/Finance/Unit Economic/Q126/{CashLoan,Payday,PL}_Q1_26.xlsx`)
- Khi thêm quarter mới (Q226...) — tạo cache tương tự

## Cách refresh (macOS + Microsoft Excel)

Chạy osascript dưới đây trong terminal. Nó mở từng file, loop qua mỗi channel trong dropdown,
recalc, đọc output Leadsheet, close không lưu (không đụng file gốc).

```bash
osascript <<'EOF'
set base to "/Users/dam.ho/Desktop/Work/damcake-work-wiki/Raw/Finance/Unit Economic/Q126/"
set output to ""
tell application "Microsoft Excel"
    -- CashLoan: Leadsheet!C6 selector, output N11/N12/N16/N17/N22
    set wb to open workbook workbook file name (base & "CashLoan_Q1_26.xlsx")
    set ws to worksheet "Leadsheet" of wb
    repeat with ch in {"All","BE","Cake","MWG","VNPOST","VDS","VNPAY","ZALOPAY"}
        set value of range "C6" of ws to (ch as string)
        calculate
        set output to output & "CL|" & (ch as string) & "|" & (value of range "N11" of ws) & "|" & (value of range "N12" of ws) & "|" & (value of range "N16" of ws) & "|" & (value of range "N17" of ws) & "|" & (value of range "N22" of ws) & linefeed
    end repeat
    close wb saving no
    -- Payday: Leadsheet!C6, same output rows
    set wb to open workbook workbook file name (base & "Payday_Q1_26.xlsx")
    set ws to worksheet "Leadsheet" of wb
    repeat with ch in {"All","Cake","VDS","VNPAY","ZALOPAY"}
        set value of range "C6" of ws to (ch as string)
        calculate
        set output to output & "PD|" & (ch as string) & "|" & (value of range "N11" of ws) & "|" & (value of range "N12" of ws) & "|" & (value of range "N16" of ws) & "|" & (value of range "N17" of ws) & "|" & (value of range "N22" of ws) & linefeed
    end repeat
    close wb saving no
    -- Paylater: SAP_Leadsheet!C8 selector, output N49/N50/N66/N67/N82
    set wb to open workbook workbook file name (base & "PL_Q1_26.xlsx")
    set ws to worksheet "SAP_Leadsheet" of wb
    repeat with ch in {"All","BE","VDS","MWG","VNPAY"}
        set value of range "C8" of ws to (ch as string)
        calculate
        set output to output & "PL|" & (ch as string) & "|" & (value of range "N49" of ws) & "|" & (value of range "N50" of ws) & "|" & (value of range "N66" of ws) & "|" & (value of range "N67" of ws) & "|" & (value of range "N82" of ws) & linefeed
    end repeat
    close wb saving no
end tell
return output
EOF
```

Output format mỗi dòng: `PRODUCT|channel|ANR|TOI|PROVISION|OPEX|PBT`

⚠️ Excel locale có thể dùng dấu phẩy thập phân (`5,07` = `5.07`) — convert sang dấu chấm khi paste vào `q126_cohort_ue_cache.json`.

## Sau khi có output

1. Parse → update `q126_cohort_ue_cache.json` (giữ nguyên cấu trúc, `provision`/`opex` lưu signed như model trả về)
2. Rerun `python3 lending_pl_html_report.py` → JSON + HTML regen với Q1.26 full channel
3. Copy bundle: `cp /tmp/lending-pl-{report.html,data.json} team-hub/`

## Selector cell reference

| File | Sheet | Selector cell | Valid channels | Output rows (col N) |
|---|---|---|---|---|
| CashLoan_Q1_26 | Leadsheet | C6 | All, BE, Cake, MWG, VNPOST, VDS, VNPAY, ZALOPAY | ANR=11, TOI=12, PROV=16, OPEX=17, PBT=22 |
| Payday_Q1_26 | Leadsheet | C6 | All, Cake, VDS, VNPAY, ZALOPAY | same |
| PL_Q1_26 | SAP_Leadsheet | C8 | All, BE, VDS, MWG, VNPAY | ANR=49, TOI=50, PROV=66, OPEX=67, PBT=82 |
