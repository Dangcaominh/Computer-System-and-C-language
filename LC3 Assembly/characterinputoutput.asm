; Author: dangcaominh
; Revision: 06-10-2024

.ORIG x3050
    ; Nhập một kí tự và in ra
    LEA R0, STRING1
    PUTS
    GETC


    ST R0, STORE_R0
    OUT

    LEA R0, LINESKIP
    PUTS

    LEA R0, STRING2
    PUTS

    LD R0, STORE_R0
    OUT

    LEA R0, LINESKIP
    PUTS

    HALT
LINESKIP    .STRINGZ "\n"
STRING1     .STRINGZ "Enter a character: "
STRING2     .STRINGZ "Character entered: "
STORE_R0    .BLKW 1
    .END