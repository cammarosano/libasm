extern __errno_location
global	ft_write

section .text
ft_write:
	mov rax, 1				; sys_call write number is 1
	syscall					; registers rdi, rsi and rdx are already set
	cmp rax, 0				; check if rax is negative
	jl error
	ret

error:
	; set errno global variable to -rax
	neg rax					; invert sign
	push rax				; preserve it
	call __errno_location 	; returns pointer to errno
	pop rdi
	mov [rax], edi			; errno is an int
	mov rax, -1				; return value in case of error is -1
	ret
