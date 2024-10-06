; Ví dụ nhập một số nguyên và lưu vào thanh ghi R2
; Author: dangcaominh
; Revision: 06-10-2024
.ORIG x3000
    LEA R0, STRING1
    PUTS
    GETC
    ADD R2, R0, #0
    OUT
    LEA R0, LINESKIP
    PUTS
    LD R1, ASCII_OFFSET
    NOT R1, R1
    ADD R1, R1, #1
    ADD R2, R1, R2
    HALT
ASCII_OFFSET .FILL x30
STRING1 .STRINGZ "Enter a number: "
LINESKIP .STRINGZ "\n"
    .END