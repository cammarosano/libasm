extern __errno_location
global	ft_write

section .text
ft_write:
	mov rax, 1	; sys_call write number is 1
	; registers rdi, rsi and rdx are already set
	syscall
	; check if rax is negative
	cmp rax, 0
	jl error
	ret

error:
	; invert rax and set errno global variable to it
	neg rax
	push rax	; to preserve it
	call __errno_location ; returns pointer to errno
	pop rdi
	mov [rax], edi	; errno is an int
	mov rax, -1	; return value in case of error is -1
	ret
