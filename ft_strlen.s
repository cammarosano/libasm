global ft_strlen

section .text
ft_strlen:	
	mov rax, -1				; index and return value
loop:
	inc rax
	cmp byte [rdi + rax], 0	; rdi is the argument. Compare the byte to 0.
	jne loop
	ret
