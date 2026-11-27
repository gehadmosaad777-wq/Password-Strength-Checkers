	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	char_type
	.def	char_type;	.scl	2;	.type	32;	.endef
	.seh_proc	char_type
char_type:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	eax, ecx
	mov	BYTE PTR 16[rbp], al
	cmp	BYTE PTR 16[rbp], 96
	jle	.L2
	cmp	BYTE PTR 16[rbp], 122
	jg	.L2
	mov	eax, 1
	jmp	.L3
.L2:
	cmp	BYTE PTR 16[rbp], 64
	jle	.L4
	cmp	BYTE PTR 16[rbp], 90
	jg	.L4
	mov	eax, 2
	jmp	.L3
.L4:
	cmp	BYTE PTR 16[rbp], 47
	jle	.L5
	cmp	BYTE PTR 16[rbp], 57
	jg	.L5
	mov	eax, 3
	jmp	.L3
.L5:
	mov	eax, 4
.L3:
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "  - Use at least 8 characters\12\0"
.LC1:
	.ascii "  - Add a lowercase letter\12\0"
.LC2:
	.ascii "  - Add an uppercase letter\12\0"
.LC3:
	.ascii "  - Add a digit\12\0"
	.align 8
.LC4:
	.ascii "  - Add a special character (! @ # $ ...)\12\0"
	.text
	.globl	analyze_password
	.def	analyze_password;	.scl	2;	.type	32;	.endef
	.seh_proc	analyze_password
analyze_password:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -20[rbp], 0
	mov	DWORD PTR -24[rbp], 0
	jmp	.L7
.L12:
	mov	eax, DWORD PTR -24[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	ecx, eax
	call	char_type
	mov	DWORD PTR -28[rbp], eax
	cmp	DWORD PTR -28[rbp], 1
	jne	.L8
	mov	DWORD PTR -4[rbp], 1
	jmp	.L9
.L8:
	cmp	DWORD PTR -28[rbp], 2
	jne	.L10
	mov	DWORD PTR -8[rbp], 1
	jmp	.L9
.L10:
	cmp	DWORD PTR -28[rbp], 3
	jne	.L11
	mov	DWORD PTR -12[rbp], 1
	jmp	.L9
.L11:
	mov	DWORD PTR -16[rbp], 1
.L9:
	add	DWORD PTR -24[rbp], 1
.L7:
	mov	eax, DWORD PTR -24[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L12
	cmp	DWORD PTR -24[rbp], 7
	jle	.L13
	add	DWORD PTR -20[rbp], 1
	jmp	.L14
.L13:
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	__mingw_printf
.L14:
	cmp	DWORD PTR -4[rbp], 0
	je	.L15
	add	DWORD PTR -20[rbp], 1
	jmp	.L16
.L15:
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	__mingw_printf
.L16:
	cmp	DWORD PTR -8[rbp], 0
	je	.L17
	add	DWORD PTR -20[rbp], 1
	jmp	.L18
.L17:
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	__mingw_printf
.L18:
	cmp	DWORD PTR -12[rbp], 0
	je	.L19
	add	DWORD PTR -20[rbp], 1
	jmp	.L20
.L19:
	lea	rax, .LC3[rip]
	mov	rcx, rax
	call	__mingw_printf
.L20:
	cmp	DWORD PTR -16[rbp], 0
	je	.L21
	add	DWORD PTR -20[rbp], 1
	jmp	.L22
.L21:
	lea	rax, .LC4[rip]
	mov	rcx, rax
	call	__mingw_printf
.L22:
	mov	eax, DWORD PTR -20[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "PASSWORD STRENGTH CHECKER\12Rules (1 point each):\12  1. At least 8 characters\12  2. A lowercase letter\12  3. An uppercase letter\12  4. A digit\12  5. A special character (! @ # $ ...)\12\0"
	.align 8
.LC6:
	.ascii "Enter a password (no spaces, max 64 chars): \0"
.LC7:
	.ascii "%64s\0"
.LC8:
	.ascii "%*[^\12]\0"
	.align 8
.LC9:
	.ascii "No spaces allowed (and max 64 characters). Please try again.\12\0"
	.align 8
.LC10:
	.ascii "Too short! Use at least %d characters.\12\0"
.LC11:
	.ascii "Result : WEAK\12\0"
.LC12:
	.ascii "Result : MODERATE\12\0"
.LC13:
	.ascii "Result : STRONG\12\0"
.LC14:
	.ascii "\12Press Enter to close...\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	call	__main
	lea	rax, .LC5[rip]
	mov	rcx, rax
	call	__mingw_printf
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	__mingw_printf
	lea	rax, -80[rbp]
	lea	rcx, .LC7[rip]
	mov	rdx, rax
	call	__mingw_scanf
	cmp	eax, 1
	jne	.L25
	call	getchar
	cmp	eax, 10
	je	.L26
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	__mingw_scanf
	call	getchar
	lea	rax, .LC9[rip]
	mov	rcx, rax
	call	__mingw_printf
	jmp	.L25
.L26:
	lea	rax, -80[rbp]
	mov	rcx, rax
	call	strlen
	cmp	rax, 3
	ja	.L27
	lea	rax, .LC10[rip]
	mov	edx, 4
	mov	rcx, rax
	call	__mingw_printf
	jmp	.L25
.L27:
	lea	rax, -80[rbp]
	mov	rcx, rax
	call	analyze_password
	mov	DWORD PTR -4[rbp], eax
	cmp	DWORD PTR -4[rbp], 2
	jg	.L28
	lea	rax, .LC11[rip]
	mov	rcx, rax
	call	__mingw_printf
	jmp	.L25
.L28:
	cmp	DWORD PTR -4[rbp], 4
	jg	.L29
	lea	rax, .LC12[rip]
	mov	rcx, rax
	call	__mingw_printf
	jmp	.L25
.L29:
	lea	rax, .LC13[rip]
	mov	rcx, rax
	call	__mingw_printf
.L25:
	lea	rax, .LC14[rip]
	mov	rcx, rax
	call	__mingw_printf
	call	getchar
	mov	eax, 0
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 15.2.0"
	.def	getchar;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
