	.file	"main.c"
	.text
	.globl	char_type
	.type	char_type, @function
char_type:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$96, -4(%rbp)
	jle	.L2
	cmpb	$122, -4(%rbp)
	jg	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	cmpb	$64, -4(%rbp)
	jle	.L4
	cmpb	$90, -4(%rbp)
	jg	.L4
	movl	$2, %eax
	jmp	.L3
.L4:
	cmpb	$47, -4(%rbp)
	jle	.L5
	cmpb	$57, -4(%rbp)
	jg	.L5
	movl	$3, %eax
	jmp	.L3
.L5:
	movl	$4, %eax
.L3:
	popq	%rbp
	ret
	.size	char_type, .-char_type
	.section	.rodata
.LC0:
	.string	"  - Use at least 8 characters"
.LC1:
	.string	"  - Add a lowercase letter"
.LC2:
	.string	"  - Add an uppercase letter"
.LC3:
	.string	"  - Add a digit"
	.align 8
.LC4:
	.string	"  - Add a special character (! @ # $ ...)"
	.text
	.globl	analyze_password
	.type	analyze_password, @function
analyze_password:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L7
.L12:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	char_type
	movl	%eax, -28(%rbp)
	cmpl	$1, -28(%rbp)
	jne	.L8
	movl	$1, -4(%rbp)
	jmp	.L9
.L8:
	cmpl	$2, -28(%rbp)
	jne	.L10
	movl	$1, -8(%rbp)
	jmp	.L9
.L10:
	cmpl	$3, -28(%rbp)
	jne	.L11
	movl	$1, -12(%rbp)
	jmp	.L9
.L11:
	movl	$1, -16(%rbp)
.L9:
	addl	$1, -24(%rbp)
.L7:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L12
	cmpl	$7, -24(%rbp)
	jle	.L13
	addl	$1, -20(%rbp)
	jmp	.L14
.L13:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L14:
	cmpl	$0, -4(%rbp)
	je	.L15
	addl	$1, -20(%rbp)
	jmp	.L16
.L15:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L16:
	cmpl	$0, -8(%rbp)
	je	.L17
	addl	$1, -20(%rbp)
	jmp	.L18
.L17:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L18:
	cmpl	$0, -12(%rbp)
	je	.L19
	addl	$1, -20(%rbp)
	jmp	.L20
.L19:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L20:
	cmpl	$0, -16(%rbp)
	je	.L21
	addl	$1, -20(%rbp)
	jmp	.L22
.L21:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L22:
	movl	-20(%rbp), %eax
	leave
	ret
	.size	analyze_password, .-analyze_password
	.section	.rodata
	.align 8
.LC5:
	.string	"PASSWORD STRENGTH CHECKER\nRules (1 point each):\n  1. At least 8 characters\n  2. A lowercase letter\n  3. An uppercase letter\n  4. A digit\n  5. A special character (! @ # $ ...)"
	.align 8
.LC6:
	.string	"Enter a password (no spaces, max 64 chars): "
.LC7:
	.string	"%64s"
.LC8:
	.string	"%*[^\n]"
	.align 8
.LC9:
	.string	"No spaces allowed (and max 64 characters). Please try again."
	.align 8
.LC10:
	.string	"Too short! Use at least %d characters.\n"
.LC11:
	.string	"Result : WEAK"
.LC12:
	.string	"Result : MODERATE"
.LC13:
	.string	"Result : STRONG"
.LC14:
	.string	"\nPress Enter to close..."
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	cmpl	$1, %eax
	jne	.L25
	call	getchar@PLT
	cmpl	$10, %eax
	je	.L26
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	call	getchar@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L25
.L26:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$3, %rax
	ja	.L27
	leaq	.LC10(%rip), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L25
.L27:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	analyze_password
	movl	%eax, -4(%rbp)
	cmpl	$2, -4(%rbp)
	jg	.L28
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L25
.L28:
	cmpl	$4, -4(%rbp)
	jg	.L29
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L25
.L29:
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L25:
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	getchar@PLT
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
