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
	.globl	get_score
	.type	get_score, @function
get_score:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$40, %rsp
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
.L13:
	cmpl	$0, -4(%rbp)
	je	.L14
	addl	$1, -20(%rbp)
.L14:
	cmpl	$0, -8(%rbp)
	je	.L15
	addl	$1, -20(%rbp)
.L15:
	cmpl	$0, -12(%rbp)
	je	.L16
	addl	$1, -20(%rbp)
.L16:
	cmpl	$0, -16(%rbp)
	je	.L17
	addl	$1, -20(%rbp)
.L17:
	movl	-20(%rbp), %eax
	leave
	ret
	.size	get_score, .-get_score
	.section	.rodata
.LC0:
	.string	"Enter a password: "
.LC1:
	.string	"%63s"
.LC2:
	.string	"Score  : %d / 5\n"
.LC3:
	.string	"Result : WEAK"
.LC4:
	.string	"Result : MODERATE"
.LC5:
	.string	"Result : STRONG"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc23_scanf
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	get_score
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	cmpl	$2, -4(%rbp)
	jg	.L20
	movl	$.LC3, %edi
	call	puts
	jmp	.L21
.L20:
	cmpl	$4, -4(%rbp)
	jg	.L22
	movl	$.LC4, %edi
	call	puts
	jmp	.L21
.L22:
	movl	$.LC5, %edi
	call	puts
.L21:
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
