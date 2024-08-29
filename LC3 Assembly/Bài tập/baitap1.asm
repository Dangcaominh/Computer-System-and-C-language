    ; Cho 3 số X, Y, Z trong các thanh ghi lần lượt R0, R1, R2. 
    ; Viết chương trình dùng ngôn ngữ giả lập LC-3 tìm giá trị Min, Max của 3 số và 
    ; lưu vào thanh ghi R3, R4 tương ứng.

    .ORIG 0x3050

    LEA R0, INPUT_X
    PUTS

    GETC
    ST R0, STORE_R0

    LEA R0, INPUT_Y
    PUTS
    AND R0, R0, #0
    GETC
    ADD R1, R0, #0

    LEA R0, INPUT_Z
    PUTS

    GETC
    ADD R2, R0, #0
    LD R0, STORE_R0

    ; Hoàn thành nhập dữ liệu
    ; Chuyển dữ liệu ASCII sang số
    ; Lưu vào R0, R1, R2
    ; Đoạn code này optional, nếu bạn không muốn chuyển dữ liệu từ ASCII sang số thì bỏ qua


    ADD R3, R0, #0
    LD R4, ASCII_OFFSET
    JSR SUBTRACT
    ADD R0, R5, #0   ; R0 = R0 - ASCII_OFFSET


    ADD R3, R1, #0
    LD R4, ASCII_OFFSET
    JSR SUBTRACT
    ADD R1, R5, #0   ; R1 = R1 - ASCII_OFFSET


    ADD R3, R2, #0
    LD R4, ASCII_OFFSET
    JSR SUBTRACT
    ADD R2, R5, #0   ; R2 = R2 - ASCII_OFFSET

    ; Hoàn thành chuyển dữ liệu
    ; Tìm min, max

    ADD R6, R0, #0 ; R6 lưu min
    ADD R7, R0, #0 ; R7 lưu max

        ADD R3, R1, #0
        ADD R4, R6, #0
    JSR SUBTRACT        ; So sánh R1 và R6
        ADD R7, R7, #3
        ADD R5, R5, #0
    BRn MIN

        ADD R3, R2, #0
        ADD R4, R6, #0
    JSR SUBTRACT        ; So sánh R2 và R6
        ADD R7, R7, #3
        ADD R5, R5, #0
    BRn MIN

    ST R6, STORE_R6
    ADD R6, R0, #0

        ADD R3, R1, #0
        ADD R4, R6, #0
    JSR SUBTRACT        ; So sánh R1 và R6
        ADD R7, R7, #3
        ADD R5, R5, #0
    BRp MAX

        ADD R3, R2, #0
        ADD R4, R6, #0
    JSR SUBTRACT        ; So sánh R2 và R6
        ADD R7, R7, #3
        ADD R5, R5, #0
    BRp MAX

    ADD R7, R6, #0
    LD R6, STORE_R6


    ; Hoàn thành tìm min, max
    ; Hiển thị kết quả
        LD R0, ASCII_OFFSET
        ADD R0, R6, R0
    OUT
        LD R0, ASCII_OFFSET
        ADD R0, R7, R0
    OUT

    HALT

    ; Load sẵn dữ liệu vào R3 R4 trước khi gọi subroutine này
    ; Subroutine này trả về R5 = R3 - R4
    ; Subroutine này không khôi phục lại giá trị của R3, R4
    SUBTRACT
        NOT R4, R4
        ADD R4, R4, #1
        ADD R5, R3, R4
        RET
    MIN    
        ADD R6, R3, #0
        RET
    MAX 
        ADD R6, R3, #0
        RET
    STORE_R0 .BLKW 1
    STORE_R6 .BLKW 1
    INPUT_X .STRINGZ "Nhap X: \n"
    INPUT_Y .STRINGZ "Nhap Y: \n"
    INPUT_Z .STRINGZ "Nhap Z: \n"
    ASCII_OFFSET .FILL x30
    .END