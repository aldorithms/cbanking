.LC0:
        .string "Enter account number: "
.LC1:
        .string "%d"
.LC2:
        .string "Enter account holder's name: "
.LC3:
        .string "%s"
.LC4:
        .string "Account created successfully!"
createAccount:
        stp     x29, x30, [sp, -32]!
        mov     x29, sp
        str     x0, [sp, 24]
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        bl      printf
        ldr     x0, [sp, 24]
        mov     x1, x0
        adrp    x0, .LC1
        add     x0, x0, :lo12:.LC1
        bl      __isoc99_scanf
        adrp    x0, .LC2
        add     x0, x0, :lo12:.LC2
        bl      printf
        ldr     x0, [sp, 24]
        add     x0, x0, 4
        mov     x1, x0
        adrp    x0, .LC3
        add     x0, x0, :lo12:.LC3
        bl      __isoc99_scanf
        ldr     x0, [sp, 24]
        str     wzr, [x0, 104]
        adrp    x0, .LC4
        add     x0, x0, :lo12:.LC4
        bl      puts
        nop
        ldp     x29, x30, [sp], 32
        ret
.LC5:
        .string "Enter amount to deposit: "
.LC6:
        .string "%f"
.LC7:
        .string "Amount deposited successfully! New balance: %.2f\n"
deposit:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x0, [sp, 24]
        adrp    x0, .LC5
        add     x0, x0, :lo12:.LC5
        bl      printf
        add     x0, sp, 44
        mov     x1, x0
        adrp    x0, .LC6
        add     x0, x0, :lo12:.LC6
        bl      __isoc99_scanf
        ldr     x0, [sp, 24]
        ldr     s30, [x0, 104]
        ldr     s31, [sp, 44]
        fadd    s31, s30, s31
        ldr     x0, [sp, 24]
        str     s31, [x0, 104]
        ldr     x0, [sp, 24]
        ldr     s31, [x0, 104]
        fcvt    d31, s31
        fmov    d0, d31
        adrp    x0, .LC7
        add     x0, x0, :lo12:.LC7
        bl      printf
        nop
        ldp     x29, x30, [sp], 48
        ret
.LC8:
        .string "Enter amount to withdraw: "
.LC9:
        .string "Insufficient balance!"
.LC10:
        .string "Amount withdrawn successfully! New balance: %.2f\n"
withdraw:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x0, [sp, 24]
        adrp    x0, .LC8
        add     x0, x0, :lo12:.LC8
        bl      printf
        add     x0, sp, 44
        mov     x1, x0
        adrp    x0, .LC6
        add     x0, x0, :lo12:.LC6
        bl      __isoc99_scanf
        ldr     x0, [sp, 24]
        ldr     s30, [x0, 104]
        ldr     s31, [sp, 44]
        fcmpe   s30, s31
        bmi     .L7
        b       .L8
.L7:
        adrp    x0, .LC9
        add     x0, x0, :lo12:.LC9
        bl      puts
        b       .L9
.L8:
        ldr     x0, [sp, 24]
        ldr     s30, [x0, 104]
        ldr     s31, [sp, 44]
        fsub    s31, s30, s31
        ldr     x0, [sp, 24]
        str     s31, [x0, 104]
        ldr     x0, [sp, 24]
        ldr     s31, [x0, 104]
        fcvt    d31, s31
        fmov    d0, d31
        adrp    x0, .LC10
        add     x0, x0, :lo12:.LC10
        bl      printf
.L9:
        nop
        ldp     x29, x30, [sp], 48
        ret
.LC11:
        .string "Account Balance: %.2f\n"
checkBalance:
        stp     x29, x30, [sp, -32]!
        mov     x29, sp
        str     x0, [sp, 24]
        ldr     x0, [sp, 24]
        ldr     s31, [x0, 104]
        fcvt    d31, s31
        fmov    d0, d31
        adrp    x0, .LC11
        add     x0, x0, :lo12:.LC11
        bl      printf
        nop
        ldp     x29, x30, [sp], 32
        ret
.LC12:
        .string "\nAccount Details:"
.LC13:
        .string "Account Number: %d\n"
.LC14:
        .string "Account Holder's Name: %s\n"
displayAccount:
        stp     x29, x30, [sp, -32]!
        mov     x29, sp
        str     x0, [sp, 24]
        adrp    x0, .LC12
        add     x0, x0, :lo12:.LC12
        bl      puts
        ldr     x0, [sp, 24]
        ldr     w0, [x0]
        mov     w1, w0
        adrp    x0, .LC13
        add     x0, x0, :lo12:.LC13
        bl      printf
        ldr     x0, [sp, 24]
        add     x0, x0, 4
        mov     x1, x0
        adrp    x0, .LC14
        add     x0, x0, :lo12:.LC14
        bl      printf
        ldr     x0, [sp, 24]
        ldr     s31, [x0, 104]
        fcvt    d31, s31
        fmov    d0, d31
        adrp    x0, .LC11
        add     x0, x0, :lo12:.LC11
        bl      printf
        nop
        ldp     x29, x30, [sp], 32
        ret
.LC15:
        .string "a"
.LC16:
        .string "accounts.txt"
.LC17:
        .string "Error opening file!"
.LC18:
        .string "%d %s %.2f\n"
.LC19:
        .string "Account details saved to file."
saveToFile:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x0, [sp, 24]
        adrp    x0, .LC15
        add     x1, x0, :lo12:.LC15
        adrp    x0, .LC16
        add     x0, x0, :lo12:.LC16
        bl      fopen
        str     x0, [sp, 40]
        ldr     x0, [sp, 40]
        cmp     x0, 0
        bne     .L13
        adrp    x0, .LC17
        add     x0, x0, :lo12:.LC17
        bl      puts
        b       .L12
.L13:
        ldr     x0, [sp, 24]
        ldr     w1, [x0]
        ldr     x0, [sp, 24]
        add     x2, x0, 4
        ldr     x0, [sp, 24]
        ldr     s31, [x0, 104]
        fcvt    d31, s31
        fmov    d0, d31
        mov     x3, x2
        mov     w2, w1
        adrp    x0, .LC18
        add     x1, x0, :lo12:.LC18
        ldr     x0, [sp, 40]
        bl      fprintf
        ldr     x0, [sp, 40]
        bl      fclose
        adrp    x0, .LC19
        add     x0, x0, :lo12:.LC19
        bl      puts
.L12:
        ldp     x29, x30, [sp], 48
        ret
.LC20:
        .string "r"
.LC21:
        .string "No account data found."
.LC22:
        .string "%d %s %f"
loadFromFile:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x0, [sp, 24]
        adrp    x0, .LC20
        add     x1, x0, :lo12:.LC20
        adrp    x0, .LC16
        add     x0, x0, :lo12:.LC16
        bl      fopen
        str     x0, [sp, 40]
        ldr     x0, [sp, 40]
        cmp     x0, 0
        bne     .L18
        adrp    x0, .LC21
        add     x0, x0, :lo12:.LC21
        bl      puts
        b       .L15
.L19:
        ldr     x0, [sp, 24]
        bl      displayAccount
.L18:
        ldr     x1, [sp, 24]
        ldr     x0, [sp, 24]
        add     x2, x0, 4
        ldr     x0, [sp, 24]
        add     x0, x0, 104
        mov     x4, x0
        mov     x3, x2
        mov     x2, x1
        adrp    x0, .LC22
        add     x1, x0, :lo12:.LC22
        ldr     x0, [sp, 40]
        bl      __isoc99_fscanf
        cmn     w0, #1
        bne     .L19
        ldr     x0, [sp, 40]
        bl      fclose
.L15:
        ldp     x29, x30, [sp], 48
        ret
.LC23:
        .string "\n--- Banking System ---"
.LC24:
        .string "1. Create Account"
.LC25:
        .string "2. Deposit"
.LC26:
        .string "3. Withdraw"
.LC27:
        .string "4. Check Balance"
.LC28:
        .string "5. Display Account Details"
.LC29:
        .string "6. Save Account to File"
.LC30:
        .string "7. Load Account from File"
.LC31:
        .string "8. Exit"
.LC32:
        .string "Enter your choice: "
.LC33:
        .string "Exiting..."
.LC34:
        .string "Invalid choice. Please try again."
main:
        stp     x29, x30, [sp, -144]!
        mov     x29, sp
.L31:
        adrp    x0, .LC23
        add     x0, x0, :lo12:.LC23
        bl      puts
        adrp    x0, .LC24
        add     x0, x0, :lo12:.LC24
        bl      puts
        adrp    x0, .LC25
        add     x0, x0, :lo12:.LC25
        bl      puts
        adrp    x0, .LC26
        add     x0, x0, :lo12:.LC26
        bl      puts
        adrp    x0, .LC27
        add     x0, x0, :lo12:.LC27
        bl      puts
        adrp    x0, .LC28
        add     x0, x0, :lo12:.LC28
        bl      puts
        adrp    x0, .LC29
        add     x0, x0, :lo12:.LC29
        bl      puts
        adrp    x0, .LC30
        add     x0, x0, :lo12:.LC30
        bl      puts
        adrp    x0, .LC31
        add     x0, x0, :lo12:.LC31
        bl      puts
        adrp    x0, .LC32
        add     x0, x0, :lo12:.LC32
        bl      printf
        add     x0, sp, 28
        mov     x1, x0
        adrp    x0, .LC1
        add     x0, x0, :lo12:.LC1
        bl      __isoc99_scanf
        ldr     w0, [sp, 28]
        cmp     w0, 8
        beq     .L21
        cmp     w0, 8
        bgt     .L22
        cmp     w0, 7
        beq     .L23
        cmp     w0, 7
        bgt     .L22
        cmp     w0, 6
        beq     .L24
        cmp     w0, 6
        bgt     .L22
        cmp     w0, 5
        beq     .L25
        cmp     w0, 5
        bgt     .L22
        cmp     w0, 4
        beq     .L26
        cmp     w0, 4
        bgt     .L22
        cmp     w0, 3
        beq     .L27
        cmp     w0, 3
        bgt     .L22
        cmp     w0, 1
        beq     .L28
        cmp     w0, 2
        beq     .L29
        b       .L22
.L28:
        add     x0, sp, 32
        bl      createAccount
        b       .L30
.L29:
        add     x0, sp, 32
        bl      deposit
        b       .L30
.L27:
        add     x0, sp, 32
        bl      withdraw
        b       .L30
.L26:
        add     x0, sp, 32
        bl      checkBalance
        b       .L30
.L25:
        add     x0, sp, 32
        bl      displayAccount
        b       .L30
.L24:
        add     x0, sp, 32
        bl      saveToFile
        b       .L30
.L23:
        add     x0, sp, 32
        bl      loadFromFile
        b       .L30
.L21:
        adrp    x0, .LC33
        add     x0, x0, :lo12:.LC33
        bl      puts
        mov     w0, 0
        bl      exit
.L22:
        adrp    x0, .LC34
        add     x0, x0, :lo12:.LC34
        bl      puts
.L30:
        b       .L31