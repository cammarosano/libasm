global ft_strlen

section .text
ft_strlen:	
	mov rax, 0		; counter, index and return value
loop:
	cmp byte [rdi + rax], 0	; rdi is the 1st (and only) parameter. compare the byte pointed by it to 0.
	je end
	inc rax
	jmp loop
end:
	ret
