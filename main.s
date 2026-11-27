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
	.section	.data.rel.local,"aw"
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
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L14:
	cmpl	$0, -4(%rbp)
	je	.L15
	addl	$1, -20(%rbp)
	jmp	.L16
.L15:
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L16:
	cmpl	$0, -8(%rbp)
	je	.L17
	addl	$1, -20(%rbp)
	jmp	.L18
.L17:
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L18:
	cmpl	$0, -12(%rbp)
	je	.L19
	addl	$1, -20(%rbp)
	jmp	.L20
.L19:
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L20:
	cmpl	$0, -16(%rbp)
	je	.L21
	addl	$1, -20(%rbp)
	jmp	.L22
.L21:
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L22:
	movl	-20(%rbp), %eax
	leave
	ret
	.size	analyze_password, .-analyze_password
	.globl	shift_password
	.type	shift_password, @function
shift_password:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$40, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L25
.L30:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	char_type
	movl	%eax, -8(%rbp)
	cmpl	$1, -8(%rbp)
	jne	.L26
	movl	-4(%rbp), %eax
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
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L27
.L26:
	cmpl	$2, -8(%rbp)
	jne	.L28
	movl	-4(%rbp), %eax
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
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L27
.L28:
	cmpl	$3, -8(%rbp)
	jne	.L29
	movl	-4(%rbp), %eax
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
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	jmp	.L27
.L29:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
.L27:
	addl	$1, -4(%rbp)
.L25:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L30
	movl	-4(%rbp), %eax
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	leaq	.LC15(%rip), %rdx
	leaq	.LC16(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L34
	movl	$0, %eax
	jmp	.L37
.L36:
	leaq	.LC17(%rip), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	movb	$0, -80(%rbp,%rax)
	leaq	-80(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L34
	movl	$1, -4(%rbp)
.L34:
	movq	-16(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L36
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	-4(%rbp), %eax
.L37:
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	.LC18(%rip), %rdx
	leaq	.LC16(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L40
	movq	-24(%rbp), %rdx
	leaq	.LC19(%rip), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L40:
	nop
	leave
	ret
	.size	save_password, .-save_password
	.globl	clear_input
	.type	clear_input, @function
clear_input:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	nop
.L43:
	call	getchar@PLT
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	je	.L44
	cmpl	$-1, -4(%rbp)
	jne	.L43
.L44:
	nop
	leave
	ret
	.size	clear_input, .-clear_input
	.globl	to_lowercase
	.type	to_lowercase, @function
to_lowercase:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L46
.L48:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L47
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$90, %al
	jg	.L47
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
.L47:
	addl	$1, -4(%rbp)
.L46:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L48
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
.L56:
	leaq	-16(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	cmpl	$1, %eax
	je	.L50
	movl	$0, %eax
	jmp	.L57
.L50:
	call	clear_input
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	to_lowercase
	leaq	.LC21(%rip), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L52
	leaq	.LC22(%rip), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L53
.L52:
	movl	$1, %eax
	jmp	.L57
.L53:
	leaq	.LC23(%rip), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L54
	leaq	.LC24(%rip), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L55
.L54:
	movl	$0, %eax
	jmp	.L57
.L55:
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L56
.L57:
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	movl	$0, %edi
	call	time@PLT
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
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	-4(%rbp), %ecx
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
	leaq	0(,%rax,8), %rdx
	leaq	base_passwords(%rip), %rax
	movq	(%rdx,%rax), %rax
	movl	-4(%rbp), %edx
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	shift_password
	jmp	.L59
.L61:
	movl	-4(%rbp), %ecx
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
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %ecx
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
	leaq	0(,%rax,8), %rdx
	leaq	base_passwords(%rip), %rax
	movq	(%rdx,%rax), %rax
	movl	-4(%rbp), %edx
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	shift_password
	addl	$1, -8(%rbp)
.L59:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	password_is_taken
	testl	%eax, %eax
	je	.L60
	cmpl	$24, -8(%rbp)
	jle	.L61
.L60:
	leaq	-80(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	ask_yes_no
	testl	%eax, %eax
	je	.L62
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	analyze_password
	cmpl	$5, %eax
	jne	.L63
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L63:
	leaq	-80(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	save_password
	movl	$1, %eax
	jmp	.L65
.L62:
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L65:
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
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movl	$0, -4(%rbp)
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L75:
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-81(%rbp), %rax
	leaq	.LC33(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	call	clear_input
	movzbl	-81(%rbp), %eax
	cmpb	$49, %al
	jne	.L67
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	leaq	.LC35(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	call	getchar@PLT
	cmpl	$10, %eax
	je	.L68
	call	clear_input
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L69
.L68:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$3, %rax
	ja	.L70
	leaq	.LC37(%rip), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L69
.L70:
	movl	$10, %edi
	call	putchar@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	analyze_password
	movl	%eax, -8(%rbp)
	cmpl	$2, -8(%rbp)
	jg	.L71
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L69
.L71:
	cmpl	$4, -8(%rbp)
	jg	.L72
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L69
.L72:
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, -4(%rbp)
	jmp	.L69
.L67:
	movzbl	-81(%rbp), %eax
	cmpb	$50, %al
	jne	.L73
	call	suggest_password
	movl	%eax, -4(%rbp)
	jmp	.L69
.L73:
	movzbl	-81(%rbp), %eax
	cmpb	$51, %al
	jne	.L74
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, -4(%rbp)
	jmp	.L69
.L74:
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L69:
	cmpl	$0, -4(%rbp)
	je	.L75
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
