.ORIG x3000
    ;Nhập một số nguyên và lưu vào thanh ghi R1
    LEA R0, STRING1
    PUTS
    GETC
    OUT
    LD R1, ASCII_OFFSET
    NOT R1, R1
    ADD R1, R1, #1
    ADD R1, R1, R0
    HALT
ASCII_OFFSET .FILL x30
STRING1 .STRINGZ "Enter a number: "
    .END