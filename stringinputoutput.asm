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
    ; Halt the program
    HALT

LINESKIP .STRINGZ "\n"
STRING1  .STRINGZ "Enter a string: "
STRING2  .STRINGZ "You entered: "
BUFFER   .BLKW 100 ; Reserve space for the input string

.END