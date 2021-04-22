global ft_strcpy

section .text
ft_strcpy:
	; protection againg NULL pointers
	cmp rdi, 0			; rdi : 1st arg (char *dest)
	je end
	cmp rsi, 0			; rsi : 2nd arg (const char *src)
	je end

	mov rax, rdi		; Store dest in rax
	mov rcx, 0			; index
loop:
	mov dl, [rsi + rcx]	; dl is a byte size (sub)register, used as buffer
	mov [rax + rcx], dl ; 
	inc rcx				; increment index
	cmp dl, 0			; rerun loop unless copied byte was '\0'
	jne loop
end:
	ret
