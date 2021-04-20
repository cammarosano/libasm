global ft_strcpy

section .text
ft_strcpy:
	mov rax, rdi	; rdi holds the 1st arg: char *dest. Store it in rax

	cmp rax, 0		; protection againg NULL pointers
	je end
	cmp rsi, 0		; rsi holds the 2nd arg: const char *src
	je end

	mov rcx, 0		; index
loop:
	mov dl, [rsi + rcx]	; rsi holds the 2nd arg: const char *src
	mov [rax + rcx], dl ; dl has size of 1 byte
	inc rcx				; increment index
	cmp dl, 0
	jne loop
end:
	ret

; idea to make it faster: call ft_strlen, store result, compare to 8, if
; smaller of equal to, run qword loop, copying 8 bytes at a time, inc index by 8
; and decrementing len by 8