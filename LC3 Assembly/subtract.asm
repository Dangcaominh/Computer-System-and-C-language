.ORIG x3000

; Nạp giá trị 5 vào R1
AND R1, R1, #0  ; Clear R1
ADD R1, R1, #5  ; R1 = 5

; Nạp giá trị 3 vào R2
AND R2, R2, #0  ; Clear R2
ADD R2, R2, #3  ; R2 = 3

; Tính R1 - R2
NOT R2, R2      ; Đảo bit R2
ADD R2, R2, #1  ; R2 = -R2 (số bù 2) 2's complement
ADD R3, R1, R2  ; R3 = R1 - R2
BRn NEGATIVE    ; Nếu kết quả âm thì nhảy tới nhãn NEGATIVE

; In kết quả
ADD R0, R3, #0  ; Chuyển kết quả vào R0 để in
LD R1, ASCII_OFFSET
ADD R0, R0, R1  ; Chuyển đổi số thành ký tự ASCII
;OUT             ; In ký tự
TRAP x21       ; Tương tự lệnh trên

; Xuống dòng
LEA R0, NEWLINE
;PUTS
TRAP x22       ; Tương tự lệnh trên
HALT            ; Kết thúc chương trình

NEGATIVE
; In dấu trừ
LEA R0, NEGATIVE_INFO
PUTS
ADD R0, R3, #0  ; Chuyển kết quả vào R0 để in
LD R1, ASCII_OFFSET
ADD R0, R0, R1  ; Chuyển đổi số thành ký tự ASCII
OUT             ; In ký tự
HALT

NEGATIVE_INFO .STRINGZ "So am: -"
NEWLINE .STRINGZ "\n"; Ký tự xuống dòng
ASCII_OFFSET .FILL x30  ; Offset để chuyển đổi số thành ký tự ASCII

.END