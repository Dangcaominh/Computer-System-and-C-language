; Ví dụ về sử dụng con trỏ trong LC3
; Minh họa cách dùng lệnh LDI để lấy giá trị từ con trỏ
; Author: dangcaominh
; Release Date: 06-10-2024
; Revision: 06-10-2024

.ORIG x3000
    ; Khởi tạo con trỏ
    LEA R1, X       ; Nạp địa chỉ của X vào R1
    ST R1, POINTER ; Lưu địa chỉ vào POINTER 
    LDI R3, POINTER ; Lưu giá trị từ POINTER vào R3 (deference)
    LEA R1, Y       ; Nạp địa chỉ của Y vào R1
    ST R1, POINTER ; Lưu địa chỉ vào POINTER
    LDI R4, POINTER ; Lưu giá trị từ POINTER vào R4 (deference)
    HALT
; Khai báo các biến
POINTER .BLKW 1
X       .FILL 1
Y       .FILL 2
.END