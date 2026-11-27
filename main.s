"char_type":
        push    rbp
        mov     rbp, rsp
        mov     BYTE PTR [rbp-1], dil
        cmp     BYTE PTR [rbp-1], 96
        jle     .L2
        cmp     BYTE PTR [rbp-1], 122
        jg      .L2
        mov     eax, 1
        jmp     .L3
.L2:
        cmp     BYTE PTR [rbp-1], 64
        jle     .L4
        cmp     BYTE PTR [rbp-1], 90
        jg      .L4
        mov     eax, 2
        jmp     .L3
.L4:
        cmp     BYTE PTR [rbp-1], 47
        jle     .L5
        cmp     BYTE PTR [rbp-1], 57
        jg      .L5
        mov     eax, 3
        jmp     .L3
.L5:
        mov     eax, 4
.L3:
        pop     rbp
        ret
.LC0:
        .string "  - Use at least 8 characters"
.LC1:
        .string "  - Add a lowercase letter"
.LC2:
        .string "  - Add an uppercase letter"
.LC3:
        .string "  - Add a digit"
.LC4:
        .string "  - Add a special character (! @ # $ ...)"
"analyze_password":
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        mov     DWORD PTR [rbp-12], 0
        mov     DWORD PTR [rbp-16], 0
        mov     DWORD PTR [rbp-20], 0
        mov     DWORD PTR [rbp-24], 0
        jmp     .L7
.L12:
        mov     eax, DWORD PTR [rbp-24]
        movsxd  rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     edi, eax
        call    "char_type"
        mov     DWORD PTR [rbp-28], eax
        cmp     DWORD PTR [rbp-28], 1
        jne     .L8
        mov     DWORD PTR [rbp-4], 1
        jmp     .L9
.L8:
        cmp     DWORD PTR [rbp-28], 2
        jne     .L10
        mov     DWORD PTR [rbp-8], 1
        jmp     .L9
.L10:
        cmp     DWORD PTR [rbp-28], 3
        jne     .L11
        mov     DWORD PTR [rbp-12], 1
        jmp     .L9
.L11:
        mov     DWORD PTR [rbp-16], 1
.L9:
        add     DWORD PTR [rbp-24], 1
.L7:
        mov     eax, DWORD PTR [rbp-24]
        movsxd  rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        test    al, al
        jne     .L12
        cmp     DWORD PTR [rbp-24], 7
        jle     .L13
        add     DWORD PTR [rbp-20], 1
        jmp     .L14
.L13:
        mov     edi, OFFSET FLAT:.LC0
        call    "puts"
.L14:
        cmp     DWORD PTR [rbp-4], 0
        je      .L15
        add     DWORD PTR [rbp-20], 1
        jmp     .L16
.L15:
        mov     edi, OFFSET FLAT:.LC1
        call    "puts"
.L16:
        cmp     DWORD PTR [rbp-8], 0
        je      .L17
        add     DWORD PTR [rbp-20], 1
        jmp     .L18
.L17:
        mov     edi, OFFSET FLAT:.LC2
        call    "puts"
.L18:
        cmp     DWORD PTR [rbp-12], 0
        je      .L19
        add     DWORD PTR [rbp-20], 1
        jmp     .L20
.L19:
        mov     edi, OFFSET FLAT:.LC3
        call    "puts"
.L20:
        cmp     DWORD PTR [rbp-16], 0
        je      .L21
        add     DWORD PTR [rbp-20], 1
        jmp     .L22
.L21:
        mov     edi, OFFSET FLAT:.LC4
        call    "puts"
.L22:
        mov     eax, DWORD PTR [rbp-20]
        leave
        ret
"clear_input":
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        call    "getchar"
        mov     DWORD PTR [rbp-4], eax
        jmp     .L25
.L27:
        call    "getchar"
        mov     DWORD PTR [rbp-4], eax
.L25:
        cmp     DWORD PTR [rbp-4], 10
        je      .L28
        cmp     DWORD PTR [rbp-4], -1
        jne     .L27
.L28:
        nop
        leave
        ret
.LC5:
        .string "PASSWORD STRENGTH CHECKER\nRules (1 point each):\n  1. At least 8 characters\n  2. A lowercase letter\n  3. An uppercase letter\n  4. A digit\n  5. A special character (! @ # $ ...)"
.LC6:
        .string "\n1. Check a password\n2. Exit\nYour choice: "
.LC7:
        .string " %c"
.LC8:
        .string "Enter a password (no spaces, max 63 chars): "
.LC9:
        .string "%63s"
.LC10:
        .string "No spaces allowed (and max 63 characters). Please try again."
.LC11:
        .string "Too short! Use at least %d characters.\n"
.LC12:
        .string "Result : WEAK"
.LC13:
        .string "Result : MODERATE"
.LC14:
        .string "Result : STRONG"
.LC15:
        .string "Goodbye!"
.LC16:
        .string "Invalid choice, please enter 1 or 2."
"main":
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     DWORD PTR [rbp-4], 0
        mov     edi, OFFSET FLAT:.LC5
        call    "puts"
.L40:
        mov     edi, OFFSET FLAT:.LC6
        mov     eax, 0
        call    "printf"
        lea     rax, [rbp-81]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    __isoc23_scanf
        cmp     eax, 1
        jne     .L42
        call    "clear_input"
        movzx   eax, BYTE PTR [rbp-81]
        cmp     al, 49
        jne     .L32
        mov     edi, OFFSET FLAT:.LC8
        mov     eax, 0
        call    "printf"
        lea     rax, [rbp-80]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC9
        mov     eax, 0
        call    __isoc23_scanf
        cmp     eax, 1
        jne     .L43
        call    "getchar"
        cmp     eax, 10
        je      .L34
        call    "clear_input"
        mov     edi, OFFSET FLAT:.LC10
        call    "puts"
        jmp     .L35
.L34:
        lea     rax, [rbp-80]
        mov     rdi, rax
        call    "strlen"
        cmp     rax, 3
        ja      .L36
        mov     esi, 4
        mov     edi, OFFSET FLAT:.LC11
        mov     eax, 0
        call    "printf"
        jmp     .L35
.L36:
        lea     rax, [rbp-80]
        mov     rdi, rax
        call    "analyze_password"
        mov     DWORD PTR [rbp-8], eax
        cmp     DWORD PTR [rbp-8], 2
        jg      .L37
        mov     edi, OFFSET FLAT:.LC12
        call    "puts"
        jmp     .L35
.L37:
        cmp     DWORD PTR [rbp-8], 4
        jg      .L38
        mov     edi, OFFSET FLAT:.LC13
        call    "puts"
        jmp     .L35
.L38:
        mov     edi, OFFSET FLAT:.LC14
        call    "puts"
        mov     DWORD PTR [rbp-4], 1
        jmp     .L35
.L32:
        movzx   eax, BYTE PTR [rbp-81]
        cmp     al, 50
        jne     .L39
        mov     edi, OFFSET FLAT:.LC15
        call    "puts"
        mov     DWORD PTR [rbp-4], 1
        jmp     .L35
.L39:
        mov     edi, OFFSET FLAT:.LC16
        call    "puts"
.L35:
        cmp     DWORD PTR [rbp-4], 0
        je      .L40
        jmp     .L31
.L42:
        nop
        jmp     .L31
.L43:
        nop
.L31:
        mov     eax, 0
        leave
        ret
