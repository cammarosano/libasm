extern __errno_location
global ft_read

section .text
ft_read:
	mov rax, 0				; syscall read number is 0
	syscall					; registers rdi, rsi and rdx are already set
	cmp rax, 0				; check if return value is negative
	jl error
	ret

error:
	neg rax					; invert sign
	push rax				; preserve it
	sub rsp, 8				; align stack to 16-Bytes boundary
	call __errno_location	; return pointer to errno global variable
	add rsp, 8				; recover stack
	pop rdi
	mov [rax], edi			; errno is an int
	mov rax, -1				; return value in case of error is -1
	ret
