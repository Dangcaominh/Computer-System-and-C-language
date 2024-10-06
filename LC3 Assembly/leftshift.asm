; Perform left shift in LC3 Assembly
; Input: Nhập vào dữ liệu dưới dạng nhị phân
; Output: Left shift của số đó được lưu ở R2
; Author: dangcaominh
; Revision: 06-10-2024

.ORIG x3050
    ; Prompt the user to enter a string
    LEA R0, STRING1
    PUTS

    ; Initialize the pointer to the buffer
    LEA R1, BUFFER

READ_CHAR
    ; Read a character from the keyboard
    GETC
    ; Store the character in the buffer
    STR R0, R1, 0
    OUT
    ; Check if the character is a newline (ASCII 0x0A)
    ADD R2, R0, #-10
    BRz END_INPUT
    ; Move to the next position in the buffer
    ADD R1, R1, #1
    ; Loop to read the next character
    BRnzp READ_CHAR

END_INPUT
    ; Calculate string length
    LEA R2, BUFFER
    NOT R2, R2
    ADD R2, R2, #1
    ADD R3, R2, R1
    ST R3, STRING_LENGTH
    ; Null-terminate the string
    AND R0, R0, #0
    STR R0, R1, 0

    ; Print the entered string
    LEA R0, STRING2
    PUTS
    LEA R0, BUFFER
    PUTS
    LEA R0, LINESKIP
    PUTS
    ; Perfom left shift
    LEA R1, BUFFER
    LD R2, STRING_LENGTH
    ADD R1, R1, R2
    AND R2, R2, #0
    ADD R3, R2, #2
LOOP
    ADD R1, R1, #-1
    LDR R4, R1, #0
    LD R5, ASCII_OFFSET
    NOT R5, R5
    ADD R5, R5, #1
    ADD R5, R4, R5
    BRp IS_ONE
    JSR CONTINUE
    HALT
IS_ONE
    ADD R2, R3, R2
CONTINUE
    ADD R3, R3, R3
    ADD R4, R4, #0
    BRp LOOP
    RET

ASCII_OFFSET .FILL x30
LINESKIP .STRINGZ "\n"
STRING1  .STRINGZ "Enter a number in binary format: "
STRING2  .STRINGZ "You entered: "
STRING_LENGTH .BLKW 1
BUFFER   .BLKW 100 ; Reserve space for the input string

.END