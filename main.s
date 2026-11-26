	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Nile#2026"
.LC1:
	.string	"Sky@Moon77"
.LC2:
	.string	"Tiger!Run88"
.LC3:
	.string	"Blue#Sky2026"
.LC4:
	.string	"Cairo$Star905"
.LC5:
	.string	"Falcon!Dream99"
.LC6:
	.string	"Desert@Rain64#X"
.LC7:
	.string	"Lotus$Wind382!Go"
.LC8:
	.string	"Coffee&Code15!Time"
.LC9:
	.string	"Pyramid#Giza26@Cairo"
	.data
	.align 32
	.type	base_passwords, @object
	.size	base_passwords, 80
base_passwords:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.text
	.globl	char_type
	.type	char_type, @function
char_type:
	endbr64
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
.LC10:
	.string	"  - Use at least 8 characters"
.LC11:
	.string	"  - Add a lowercase letter"
.LC12:
	.string	"  - Add an uppercase letter"
.LC13:
	.string	"  - Add a digit"
	.align 8
.LC14:
	.string	"  - Add a special character (! @ # $ ...)"
	.text
	.globl	analyze_password
	.type	analyze_password, @function
analyze_password:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L7
.L12:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	char_type
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L8
	movl	$1, -28(%rbp)
	jmp	.L9
.L8:
	cmpl	$2, -4(%rbp)
	jne	.L10
	movl	$1, -24(%rbp)
	jmp	.L9
.L10:
	cmpl	$3, -4(%rbp)
	jne	.L11
	movl	$1, -20(%rbp)
	jmp	.L9
.L11:
	movl	$1, -16(%rbp)
.L9:
	addl	$1, -8(%rbp)
.L7:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L12
	cmpl	$7, -8(%rbp)
	jle	.L13
	addl	$1, -12(%rbp)
	jmp	.L14
.L13:
	movl	$.LC10, %edi
	call	puts
.L14:
	cmpl	$0, -28(%rbp)
	je	.L15
	addl	$1, -12(%rbp)
	jmp	.L16
.L15:
	movl	$.LC11, %edi
	call	puts
.L16:
	cmpl	$0, -24(%rbp)
	je	.L17
	addl	$1, -12(%rbp)
	jmp	.L18
.L17:
	movl	$.LC12, %edi
	call	puts
.L18:
	cmpl	$0, -20(%rbp)
	je	.L19
	addl	$1, -12(%rbp)
	jmp	.L20
.L19:
	movl	$.LC13, %edi
	call	puts
.L20:
	cmpl	$0, -16(%rbp)
	je	.L21
	addl	$1, -12(%rbp)
	jmp	.L22
.L21:
	movl	$.LC14, %edi
	call	puts
.L22:
	movl	-12(%rbp), %eax
	leave
	ret
	.size	analyze_password, .-analyze_password
	.globl	shift_password
	.type	shift_password, @function
shift_password:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$40, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L25
.L30:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	char_type
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L26
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	leal	-97(%rax), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$26, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	leal	97(%rax), %ecx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L27
.L26:
	cmpl	$2, -4(%rbp)
	jne	.L28
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	leal	-65(%rax), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	imulq	$1321528399, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$26, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	leal	65(%rax), %ecx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L27
.L28:
	cmpl	$3, -4(%rbp)
	jne	.L29
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	leal	-48(%rax), %edx
	movl	-36(%rbp), %eax
	addl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	48(%rax), %ecx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L27
.L29:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
.L27:
	addl	$1, -8(%rbp)
.L25:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L30
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
	leave
	ret
	.size	shift_password, .-shift_password
	.section	.rodata
.LC15:
	.string	"r"
.LC16:
	.string	"used_passwords.txt"
.LC17:
	.string	"\n"
	.text
	.globl	password_is_taken
	.type	password_is_taken, @function
password_is_taken:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$.LC15, %esi
	movl	$.LC16, %edi
	call	fopen
	movq	%rax, -88(%rbp)
	movl	$0, -92(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L34
	movl	$0, %eax
	jmp	.L37
.L36:
	leaq	-80(%rbp), %rax
	movl	$.LC17, %esi
	movq	%rax, %rdi
	call	strcspn
	movb	$0, -80(%rbp,%rax)
	leaq	-80(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L34
	movl	$1, -92(%rbp)
.L34:
	movq	-88(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L36
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	-92(%rbp), %eax
.L37:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L38
	call	__stack_chk_fail
.L38:
	leave
	ret
	.size	password_is_taken, .-password_is_taken
	.section	.rodata
.LC18:
	.string	"a"
.LC19:
	.string	"%s\n"
	.text
	.globl	save_password
	.type	save_password, @function
save_password:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$.LC18, %esi
	movl	$.LC16, %edi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L41
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$.LC19, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L41:
	nop
	leave
	ret
	.size	save_password, .-save_password
	.globl	clear_input
	.type	clear_input, @function
clear_input:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	nop
.L44:
	call	getchar
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	je	.L45
	cmpl	$-1, -4(%rbp)
	jne	.L44
.L45:
	nop
	leave
	ret
	.size	clear_input, .-clear_input
	.globl	to_lowercase
	.type	to_lowercase, @function
to_lowercase:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L47
.L49:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L48
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L48
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	leal	32(%rax), %ecx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
.L48:
	addl	$1, -4(%rbp)
.L47:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L49
	nop
	nop
	popq	%rbp
	ret
	.size	to_lowercase, .-to_lowercase
	.section	.rodata
.LC20:
	.string	"%15s"
.LC21:
	.string	"y"
.LC22:
	.string	"yes"
.LC23:
	.string	"n"
.LC24:
	.string	"no"
	.align 8
.LC25:
	.string	"Invalid input. Please enter y or n: "
	.text
	.globl	ask_yes_no
	.type	ask_yes_no, @function
ask_yes_no:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L57:
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	__isoc23_scanf
	cmpl	$1, %eax
	je	.L51
	movl	$0, %eax
	jmp	.L58
.L51:
	call	clear_input
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	to_lowercase
	leaq	-32(%rbp), %rax
	movl	$.LC21, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L53
	leaq	-32(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L54
.L53:
	movl	$1, %eax
	jmp	.L58
.L54:
	leaq	-32(%rbp), %rax
	movl	$.LC23, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L55
	leaq	-32(%rbp), %rax
	movl	$.LC24, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L56
.L55:
	movl	$0, %eax
	jmp	.L58
.L56:
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	jmp	.L57
.L58:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L59
	call	__stack_chk_fail
.L59:
	leave
	ret
	.size	ask_yes_no, .-ask_yes_no
	.section	.rodata
.LC26:
	.string	"\nSuggested password: %s\n"
	.align 8
.LC27:
	.string	"Do you want to use it? (y/n): "
.LC28:
	.string	"\nResult : STRONG"
	.align 8
.LC29:
	.string	"Great choice! Your password is %s\n"
	.align 8
.LC30:
	.string	"\nOK. Type your own password (1) or exit (3)."
	.text
	.globl	suggest_password
	.type	suggest_password, @function
suggest_password:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time
	movq	%rax, %rcx
	movabsq	$-6640827866535438581, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	leaq	(%rdx,%rcx), %rax
	sarq	$4, %rax
	movq	%rax, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	movl	$0, -84(%rbp)
	movl	-88(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movslq	%edx, %rax
	movq	base_passwords(,%rax,8), %rax
	movl	-88(%rbp), %edx
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	shift_password
	jmp	.L61
.L63:
	movl	-88(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1374389535, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	1(%rdx), %eax
	movl	%eax, -88(%rbp)
	movl	-88(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movslq	%edx, %rax
	movq	base_passwords(,%rax,8), %rax
	movl	-88(%rbp), %edx
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	shift_password
	addl	$1, -84(%rbp)
.L61:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	password_is_taken
	testl	%eax, %eax
	je	.L62
	cmpl	$24, -84(%rbp)
	jle	.L63
.L62:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC27, %edi
	movl	$0, %eax
	call	printf
	call	ask_yes_no
	testl	%eax, %eax
	je	.L64
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	analyze_password
	cmpl	$5, %eax
	jne	.L65
	movl	$.LC28, %edi
	call	puts
.L65:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC29, %edi
	movl	$0, %eax
	call	printf
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	save_password
	movl	$1, %eax
	jmp	.L67
.L64:
	movl	$.LC30, %edi
	call	puts
	movl	$0, %eax
.L67:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L68
	call	__stack_chk_fail
.L68:
	leave
	ret
	.size	suggest_password, .-suggest_password
	.section	.rodata
	.align 8
.LC31:
	.ascii	"==========="
	.string	"==============================\n        PASSWORD STRENGTH CHECKER\n=========================================\nRules (1 point each):\n  1. At least 8 characters\n  2. A lowercase letter\n  3. An uppercase letter\n  4. A digit\n  5. A special character (! @ # $ ...)"
	.align 8
.LC32:
	.string	"-----------------------------------------\n  1. I will type my own password\n  2. Suggest a password for me\n  3. Exit\nYour choice: "
.LC33:
	.string	" %c"
	.align 8
.LC34:
	.string	"\nEnter a password (no spaces, max 63 chars): "
.LC35:
	.string	"%63s"
	.align 8
.LC36:
	.string	"\nNo spaces allowed (and max 63 characters). Please try again."
	.align 8
.LC37:
	.string	"\nToo short! Use at least %d characters, or choose 2 for a suggestion.\n"
.LC38:
	.string	"Result : WEAK"
.LC39:
	.string	"Result : MODERATE"
.LC40:
	.string	"Result : STRONG"
	.align 8
.LC41:
	.string	"Great! Your password is accepted."
.LC42:
	.string	"\nGoodbye!"
	.align 8
.LC43:
	.string	"\nInvalid choice, please enter 1, 2 or 3."
	.align 8
.LC44:
	.string	"-----------------------------------------"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -88(%rbp)
	movl	$.LC31, %edi
	call	puts
.L78:
	movl	$.LC32, %edi
	movl	$0, %eax
	call	printf
	leaq	-89(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC33, %edi
	movl	$0, %eax
	call	__isoc23_scanf
	call	clear_input
	movzbl	-89(%rbp), %eax
	cmpb	$49, %al
	jne	.L70
	movl	$.LC34, %edi
	movl	$0, %eax
	call	printf
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC35, %edi
	movl	$0, %eax
	call	__isoc23_scanf
	call	getchar
	cmpl	$10, %eax
	je	.L71
	call	clear_input
	movl	$.LC36, %edi
	call	puts
	jmp	.L72
.L71:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	$3, %rax
	ja	.L73
	movl	$4, %esi
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	jmp	.L72
.L73:
	movl	$10, %edi
	call	putchar
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	analyze_password
	movl	%eax, -84(%rbp)
	cmpl	$2, -84(%rbp)
	jg	.L74
	movl	$.LC38, %edi
	call	puts
	jmp	.L72
.L74:
	cmpl	$4, -84(%rbp)
	jg	.L75
	movl	$.LC39, %edi
	call	puts
	jmp	.L72
.L75:
	movl	$.LC40, %edi
	call	puts
	movl	$.LC41, %edi
	call	puts
	movl	$1, -88(%rbp)
	jmp	.L72
.L70:
	movzbl	-89(%rbp), %eax
	cmpb	$50, %al
	jne	.L76
	call	suggest_password
	movl	%eax, -88(%rbp)
	jmp	.L72
.L76:
	movzbl	-89(%rbp), %eax
	cmpb	$51, %al
	jne	.L77
	movl	$.LC42, %edi
	call	puts
	movl	$1, -88(%rbp)
	jmp	.L72
.L77:
	movl	$.LC43, %edi
	call	puts
.L72:
	cmpl	$0, -88(%rbp)
	je	.L78
	movl	$.LC44, %edi
	call	puts
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L80
	call	__stack_chk_fail
.L80:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
