global ft_strcmp

section .text
ft_strcmp:
	mov rcx, -1		; index
loop:
	inc rcx
	mov rax, [rdi + rcx]	; rdi holds 1st arg, s1
	; test if both are zero
	mov rdx, [rsi + rcx]
	or rdx, rax
	jz end
	sub rax, [rsi + rcx]	; rsi holds 2nd arg, s2
	jz loop
end:
	ret

; gotta analyse BYTE by byte...