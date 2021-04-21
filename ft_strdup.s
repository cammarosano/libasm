extern malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy
global ft_strdup

section .text
ft_strdup:
	cmp rdi, 0	; protection agains NULL pointer
	je null_ptr
	push rdi	; preserve parameter s
	call ft_strlen	; s is in rdi
	mov rdi, rax	; store len in rdi (arg for malloc call)
	inc rdi		; make room for '\0'
	call malloc
	cmp rax, 0	; rax contains the pointer to allocated memory
	je error
	mov rdi, rax	; 1st arg for ft_strcpy
	pop rsi		; 2nd arg for ft_strcpy (recovered from the stack)
	call ft_strcpy
	ret		; rax contains the pointer returned by ft_strcpy (dest)

error:
	call __errno_location
	mov dword [rax], 12	; 12 is code for ENOMEM

null_ptr:
	mov rax, 0
	ret
