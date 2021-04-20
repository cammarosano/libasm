global ft_strcmp

section .text
ft_strcmp:
	xor rax, rax	; initialize rax and rdx to 0
	xor rdx, rdx
	mov rcx, -1		; index
loop:
	inc rcx
	mov al, [rdi + rcx]	; rdi holds 1st arg, s1
	mov dl, [rsi + rcx]	; rsi holds 2nd arg, s2
	; test if both are zero
	mov r8b, al
	or r8b, dl			; results zero if both chars are '\0'
	jz end
	
	sub eax, edx
	jz loop
end:
	ret
