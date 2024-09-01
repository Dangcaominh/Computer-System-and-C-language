; Nhập vào một string, chuyển sang int và lưu vào R2
; Thanh ghi trong LC3 là thanh ghi 16 bit trong đó có 1 bit dùng cho dấu nên chỉ còn 15 bit giá trị
; Các thanh ghi chỉ chứa được số dương có giá trị tối đa là 2^15 - 1 = 32768
; Nên số nguyên nhập vào không được vượt quá 32768
.ORIG x3000
    LEA R0, INPUT_PROMPT
    PUTS
    LEA R1, DATA    ; R1 là con trỏ đến phần tử đầu của mảng DATA
    ; Nhập một số nguyên và lưu vào thanh ghi R0
GET_DATA    
    GETC
    OUT
    LD R2, LINESKIP
    NOT R2, R2
    ADD R2, R2, #1
    ADD R2, R2, R0
    BRz CONTINUE
    JSR ASCII_TO_INT
    STR R0, R1, 0
    ADD R1, R1, #1  ; R1 trỏ đến phần tử kế tiếp
    JSR GET_DATA
CONTINUE
    ; Lấy số digit
    LEA R2, DATA
    NOT R2, R2
    ADD R2, R2, #1
    ADD R1, R1, R2
    ST  R1, STRING_LENGTH
    AND R2, R2, #0
    LEA R1, DATA
    LD R3, STRING_LENGTH
    ADD R1, R1, R3
    ADD R1, R1, #-1
    AND R5, R5, #0
    ADD R5, R5, #1
LOOP
    LDR R4, R1, #0
    JSR MULTIPLY_R4_R5
    ADD R2, R2, R4
    ADD R1, R1, #-1
    JSR MULTIPLY_10     ; Tăng R5 lên 10 lần
    ADD R3, R3, #-1
    BRp LOOP
    HALT

ASCII_TO_INT
    LD R2, ASCII_OFFSET
    NOT R2, R2
    ADD R2, R2, #1
    ADD R0, R0, R2
    RET

; Load dữ liệu vào R5
; Trả về 10 * R5 tại R5
MULTIPLY_10
    ADD R6, R5, #0
    ADD R6, R6, R6
    ADD R5, R6, #0
    ADD R6, R6, R6
    ADD R6, R6, R6
    ADD R5, R6, R5
    RET
MULTIPLY_R4_R5
    ADD R6, R4, #0
    AND R4, R4, #0
ADDITION
    ADD R4, R4, R5
    ADD R6, R6, #-1
    BRp ADDITION
    RET


INPUT_PROMPT .STRINGZ "Enter an integer: "
STRING_LENGTH   .BLKW   1
ASCII_OFFSET .FILL x30
LINESKIP .STRINGZ "\n"
DATA .BLKW 100
    .END