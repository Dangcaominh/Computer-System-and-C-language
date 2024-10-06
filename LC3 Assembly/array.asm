; Ví dụ về sử dụng con trỏ trong LC3
; Author: dangcaominh
; Revision: 06-10-2024
.ORIG x3000
        ; Khởi tạo con trỏ mảng
        LEA R1, ARRAY   ; Nạp địa chỉ của mảng vào R1

        ; Khởi tạo biến đếm
        AND R2, R2, #0  ; Xóa R2
        ADD R2, R2, #5  ; Đặt R2 = 5 (kích thước mảng)

        ; Khởi tạo tổng
        AND R3, R3, #0  ; Xóa R3 (R3 sẽ lưu tổng)

LOOP    
        LDR R4, R1, #0  ; Nạp giá trị từ địa chỉ trong R1 vào R4
        ADD R3, R3, R4  ; Cộng giá trị vào tổng
        ADD R1, R1, #1  ; Tăng con trỏ mảng
        ADD R2, R2, #-1 ; Giảm biến đếm
        BRp LOOP        ; Lặp lại nếu R2 > 0

        ; Kết quả tổng nằm trong R3
        HALT

; Khai báo mảng
ARRAY   .FILL #10
        .FILL #20
        .FILL #30
        .FILL #40
        .FILL #50

        .END