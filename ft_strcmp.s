global ft_strcmp

section .text
ft_strcmp:
	xor rax, rax			; initialize rax to 0
	xor rdx, rdx			; initialize rdx to 0	
	mov rcx, 0				; index
loop:
	mov al, [rdi + rcx]		; rdi holds 1st arg, s1
	mov dl, [rsi + rcx]		; rsi holds 2nd arg, s2
	cmp al, dl				; compare byte
	jne end					; if different, jump to end
	
	or al, dl				; test if both are zero
	jz end					; if so, jump to end

	inc rcx					; increment counter and restart loop
	jmp loop

end:
	sub eax, edx
	ret
