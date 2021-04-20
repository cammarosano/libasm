global ft_strcpy

section .text
ft_strcpy:
	mov rax, rdi	; rdi holds the 1st arg: char *dest
	mov 