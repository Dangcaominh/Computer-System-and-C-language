; Chương trình in ra một string từ một số nguyên lưu trong R2
.ORIG x3000
    LD  R2  INTEGER
    LEA R5, PRINT_QUEUE
    QUEUE_LOOP
        JSR DIVIDE_BY_10_AND_FLOOR
        ADD R0, R4, #0
        LD R1, ASCII_OFFSET
        ADD R0, R0, R1
        STR R0, R5, #0
        ADD R5, R5, #1
        ADD R2, R3, #0
        BRp QUEUE_LOOP
    PRINT_LOOP
        ADD R5, R5, #-1
        LDR R0, R5, #0
        OUT
        LEA R1, PRINT_QUEUE
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R5, R1
        BRp PRINT_LOOP
    LEA R0, LINESKIP
    PUTS
    HALT

; Subroutine definition
DIVIDE_BY_10_AND_FLOOR
; Load n into R2
; Return floor(n/10) in R3
; Return n mod 10 in R4
; Run this subroutine change value of R0
    LEA R0, STORE_R
    STR R2, R0, #2
    AND R3, R3, #0
    AND R4, R4, #0
    LOOP
        ADD R3, R3, #1
        ADD R2, R2, #-10
        BRz BREAK
        BRn BREAK_NEGATIVE
        BR LOOP
    BREAK_NEGATIVE
        ADD R2, R2, #10
        ADD R4, R2, #0
        ADD R3, R3, #-1
    BREAK
        ADD R3, R3, #0
    LDR R2, R0, #2
    RET



; Variable definition
LINESKIP .STRINGZ   "\n"
PRINT_QUEUE   .BLKW   10
ASCII_OFFSET .FILL   x30
INTEGER .FILL   11239
STORE_R .BLKW   8
    .END