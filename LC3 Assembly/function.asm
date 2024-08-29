.ORIG x3050
    LD R1, VALUE1       ; Load VALUE1 into R1
    LD R2, VALUE2       ; Load VALUE2 into R2
    JSR ADD_TWO_NUMBERS ; Jump to subroutine to add R1 and R2
    HALT                ; Halt the program

ADD_TWO_NUMBERS         ; Simulate function to add two numbers
    ADD R3, R1, R2      ; Add R1 and R2, store result in R3
    RET                 ; Return from subroutine

VALUE1  .FILL 1
VALUE2  .FILL 2
.END