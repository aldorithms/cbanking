.LC0:
        .string "Enter account number: "
.LC1:
        .string "%d"
.LC2:
        .string "Enter account holder's name: "
.LC3:
        .string "%s"
.LC5:
        .string "Account created successfully!"
createAccount:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, QWORD PTR [rbp-8]
        pxor    xmm0, xmm0
        movss   DWORD PTR [rax+104], xmm0
        mov     edi, OFFSET FLAT:.LC5
        call    puts
        nop
        leave
        ret
.LC6:
        .string "Enter amount to deposit: "
.LC7:
        .string "%f"
.LC8:
        .string "Amount deposited successfully! New balance: %.2f\n"
deposit:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, OFFSET FLAT:.LC6
        mov     eax, 0
        call    printf
        lea     rax, [rbp-4]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, QWORD PTR [rbp-24]
        movss   xmm1, DWORD PTR [rax+104]
        movss   xmm0, DWORD PTR [rbp-4]
        addss   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-24]
        movss   DWORD PTR [rax+104], xmm0
        mov     rax, QWORD PTR [rbp-24]
        movss   xmm0, DWORD PTR [rax+104]
        pxor    xmm2, xmm2
        cvtss2sd        xmm2, xmm0
        movq    rax, xmm2
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC8
        mov     eax, 1
        call    printf
        nop
        leave
        ret
.LC9:
        .string "Enter amount to withdraw: "
.LC10:
        .string "Insufficient balance!"
.LC11:
        .string "Amount withdrawn successfully! New balance: %.2f\n"
withdraw:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, OFFSET FLAT:.LC9
        mov     eax, 0
        call    printf
        lea     rax, [rbp-4]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, QWORD PTR [rbp-24]
        movss   xmm1, DWORD PTR [rax+104]
        movss   xmm0, DWORD PTR [rbp-4]
        comiss  xmm0, xmm1
        jbe     .L8
        mov     edi, OFFSET FLAT:.LC10
        call    puts
        jmp     .L9
.L8:
        mov     rax, QWORD PTR [rbp-24]
        movss   xmm0, DWORD PTR [rax+104]
        movss   xmm1, DWORD PTR [rbp-4]
        subss   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-24]
        movss   DWORD PTR [rax+104], xmm0
        mov     rax, QWORD PTR [rbp-24]
        movss   xmm0, DWORD PTR [rax+104]
        pxor    xmm2, xmm2
        cvtss2sd        xmm2, xmm0
        movq    rax, xmm2
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC11
        mov     eax, 1
        call    printf
.L9:
        nop
        leave
        ret
.LC12:
        .string "Account Balance: %.2f\n"
checkBalance:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        movss   xmm0, DWORD PTR [rax+104]
        pxor    xmm1, xmm1
        cvtss2sd        xmm1, xmm0
        movq    rax, xmm1
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC12
        mov     eax, 1
        call    printf
        nop
        leave
        ret
.LC13:
        .string "\nAccount Details:"
.LC14:
        .string "Account Number: %d\n"
.LC15:
        .string "Account Holder's Name: %s\n"
displayAccount:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     edi, OFFSET FLAT:.LC13
        call    puts
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC14
        mov     eax, 0
        call    printf
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 4
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC15
        mov     eax, 0
        call    printf
        mov     rax, QWORD PTR [rbp-8]
        movss   xmm0, DWORD PTR [rax+104]
        pxor    xmm1, xmm1
        cvtss2sd        xmm1, xmm0
        movq    rax, xmm1
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC12
        mov     eax, 1
        call    printf
        nop
        leave
        ret
.LC16:
        .string "a"
.LC17:
        .string "accounts.txt"
.LC18:
        .string "Error opening file!"
.LC19:
        .string "%d %s %.2f\n"
.LC20:
        .string "Account details saved to file."
saveToFile:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     esi, OFFSET FLAT:.LC16
        mov     edi, OFFSET FLAT:.LC17
        call    fopen
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L13
        mov     edi, OFFSET FLAT:.LC18
        call    puts
        jmp     .L12
.L13:
        mov     rax, QWORD PTR [rbp-24]
        movss   xmm0, DWORD PTR [rax+104]
        pxor    xmm1, xmm1
        cvtss2sd        xmm1, xmm0
        movq    rcx, xmm1
        mov     rax, QWORD PTR [rbp-24]
        lea     rsi, [rax+4]
        mov     rax, QWORD PTR [rbp-24]
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        movq    xmm0, rcx
        mov     rcx, rsi
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rax
        mov     eax, 1
        call    fprintf
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    fclose
        mov     edi, OFFSET FLAT:.LC20
        call    puts
.L12:
        leave
        ret
.LC21:
        .string "r"
.LC22:
        .string "No account data found."
.LC23:
        .string "%d %s %f"
loadFromFile:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     esi, OFFSET FLAT:.LC21
        mov     edi, OFFSET FLAT:.LC17
        call    fopen
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L18
        mov     edi, OFFSET FLAT:.LC22
        call    puts
        jmp     .L15
.L19:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    displayAccount
.L18:
        mov     rax, QWORD PTR [rbp-24]
        lea     rsi, [rax+104]
        mov     rax, QWORD PTR [rbp-24]
        lea     rcx, [rax+4]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-8]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC23
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        cmp     eax, -1
        jne     .L19
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    fclose
.L15:
        leave
        ret
.LC24:
        .string "\n--- Banking System ---"
.LC25:
        .string "1. Create Account"
.LC26:
        .string "2. Deposit"
.LC27:
        .string "3. Withdraw"
.LC28:
        .string "4. Check Balance"
.LC29:
        .string "5. Display Account Details"
.LC30:
        .string "6. Save Account to File"
.LC31:
        .string "7. Load Account from File"
.LC32:
        .string "8. Exit"
.LC33:
        .string "Enter your choice: "
.LC34:
        .string "Exiting..."
.LC35:
        .string "Invalid choice. Please try again."
main:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
.L32:
        mov     edi, OFFSET FLAT:.LC24
        call    puts
        mov     edi, OFFSET FLAT:.LC25
        call    puts
        mov     edi, OFFSET FLAT:.LC26
        call    puts
        mov     edi, OFFSET FLAT:.LC27
        call    puts
        mov     edi, OFFSET FLAT:.LC28
        call    puts
        mov     edi, OFFSET FLAT:.LC29
        call    puts
        mov     edi, OFFSET FLAT:.LC30
        call    puts
        mov     edi, OFFSET FLAT:.LC31
        call    puts
        mov     edi, OFFSET FLAT:.LC32
        call    puts
        mov     edi, OFFSET FLAT:.LC33
        mov     eax, 0
        call    printf
        lea     rax, [rbp-116]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        mov     eax, DWORD PTR [rbp-116]
        cmp     eax, 8
        ja      .L21
        mov     eax, eax
        mov     rax, QWORD PTR .L23[0+rax*8]
        jmp     rax
.L23:
        .quad   .L21
        .quad   .L30
        .quad   .L29
        .quad   .L28
        .quad   .L27
        .quad   .L26
        .quad   .L25
        .quad   .L24
        .quad   .L22
.L30:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    createAccount
        jmp     .L31
.L29:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    deposit
        jmp     .L31
.L28:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    withdraw
        jmp     .L31
.L27:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    checkBalance
        jmp     .L31
.L26:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    displayAccount
        jmp     .L31
.L25:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    saveToFile
        jmp     .L31
.L24:
        lea     rax, [rbp-112]
        mov     rdi, rax
        call    loadFromFile
        jmp     .L31
.L22:
        mov     edi, OFFSET FLAT:.LC34
        call    puts
        mov     edi, 0
        call    exit
.L21:
        mov     edi, OFFSET FLAT:.LC35
        call    puts
.L31:
        jmp     .L32