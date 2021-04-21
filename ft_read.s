extern __errno_location
global ft_read

section .text
ft_read:
	mov rax, 0	; syscall read number is 0
	; registers rdi, rsi and rdx are already set
	syscall
	cmp rax, 0 ; check if return value is negative
	jl error
	ret

error:
	neg rax			; invert sign
	push rax		; preserve it
	call __errno_location	; return pointer to errno global variable
	pop rdi
	mov [rax], edi		; errno is an int
	mov rax, -1		; return value in case of error is -1
	ret
