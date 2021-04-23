extern malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy
global ft_strdup

section .text
ft_strdup:
	cmp rdi, 0				; protection against NULL pointer
	je null_ptr
	push rdi				; preserve parameter s
	sub rsp, 8				; align stack to 16-Byte boundary
	call ft_strlen			; s is in rdi
	mov rdi, rax			; store len in rdi (arg for malloc call)
	inc rdi					; make room for '\0'
	call malloc
	cmp rax, 0				; rax contains the pointer to allocated memory
	je error
	mov rdi, rax			; 1st arg for ft_strcpy
	add rsp, 8				; recover stack
	pop rsi					; 2nd arg for ft_strcpy (recovered from the stack)
	call ft_strcpy
	ret						; rax contains pointer returned by ft_strcpy (dest)

error:
	call __errno_location	; get pointer to errno
	mov dword [rax], 12		; 12 is code for ENOMEM (errno is an int)
	add rsp, 16				; recover stack

null_ptr:
	mov rax, 0
	ret
