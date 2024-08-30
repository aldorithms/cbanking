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
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sd      a0,-24(s0)
        lui     a5,%hi(.LC0)
        addi    a0,a5,%lo(.LC0)
        call    printf
        ld      a5,-24(s0)
        mv      a1,a5
        lui     a5,%hi(.LC1)
        addi    a0,a5,%lo(.LC1)
        call    __isoc99_scanf
        lui     a5,%hi(.LC2)
        addi    a0,a5,%lo(.LC2)
        call    printf
        ld      a5,-24(s0)
        addi    a5,a5,4
        mv      a1,a5
        lui     a5,%hi(.LC3)
        addi    a0,a5,%lo(.LC3)
        call    __isoc99_scanf
        ld      a5,-24(s0)
        sw      zero,104(a5)
        lui     a5,%hi(.LC4)
        addi    a0,a5,%lo(.LC4)
        call    puts
        nop
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
.LC5:
        .string "Enter amount to deposit: "
.LC6:
        .string "%f"
.LC7:
        .string "Amount deposited successfully! New balance: %.2f\n"
deposit:
        addi    sp,sp,-48
        sd      ra,40(sp)
        sd      s0,32(sp)
        addi    s0,sp,48
        sd      a0,-40(s0)
        lui     a5,%hi(.LC5)
        addi    a0,a5,%lo(.LC5)
        call    printf
        addi    a5,s0,-20
        mv      a1,a5
        lui     a5,%hi(.LC6)
        addi    a0,a5,%lo(.LC6)
        call    __isoc99_scanf
        ld      a5,-40(s0)
        flw     fa4,104(a5)
        flw     fa5,-20(s0)
        fadd.s  fa5,fa4,fa5
        ld      a5,-40(s0)
        fsw     fa5,104(a5)
        ld      a5,-40(s0)
        flw     fa5,104(a5)
        fcvt.d.s        fa5,fa5
        fmv.x.d a1,fa5
        lui     a5,%hi(.LC7)
        addi    a0,a5,%lo(.LC7)
        call    printf
        nop
        ld      ra,40(sp)
        ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
.LC8:
        .string "Enter amount to withdraw: "
.LC9:
        .string "Insufficient balance!"
.LC10:
        .string "Amount withdrawn successfully! New balance: %.2f\n"
withdraw:
        addi    sp,sp,-48
        sd      ra,40(sp)
        sd      s0,32(sp)
        addi    s0,sp,48
        sd      a0,-40(s0)
        lui     a5,%hi(.LC8)
        addi    a0,a5,%lo(.LC8)
        call    printf
        addi    a5,s0,-20
        mv      a1,a5
        lui     a5,%hi(.LC6)
        addi    a0,a5,%lo(.LC6)
        call    __isoc99_scanf
        ld      a5,-40(s0)
        flw     fa4,104(a5)
        flw     fa5,-20(s0)
        flt.s   a5,fa4,fa5
        bne     a5,zero,.L7
        j       .L8
.L7:
        lui     a5,%hi(.LC9)
        addi    a0,a5,%lo(.LC9)
        call    puts
        j       .L9
.L8:
        ld      a5,-40(s0)
        flw     fa4,104(a5)
        flw     fa5,-20(s0)
        fsub.s  fa5,fa4,fa5
        ld      a5,-40(s0)
        fsw     fa5,104(a5)
        ld      a5,-40(s0)
        flw     fa5,104(a5)
        fcvt.d.s        fa5,fa5
        fmv.x.d a1,fa5
        lui     a5,%hi(.LC10)
        addi    a0,a5,%lo(.LC10)
        call    printf
.L9:
        nop
        ld      ra,40(sp)
        ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
.LC11:
        .string "Account Balance: %.2f\n"
checkBalance:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sd      a0,-24(s0)
        ld      a5,-24(s0)
        flw     fa5,104(a5)
        fcvt.d.s        fa5,fa5
        fmv.x.d a1,fa5
        lui     a5,%hi(.LC11)
        addi    a0,a5,%lo(.LC11)
        call    printf
        nop
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
.LC12:
        .string "\nAccount Details:"
.LC13:
        .string "Account Number: %d\n"
.LC14:
        .string "Account Holder's Name: %s\n"
displayAccount:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sd      a0,-24(s0)
        lui     a5,%hi(.LC12)
        addi    a0,a5,%lo(.LC12)
        call    puts
        ld      a5,-24(s0)
        lw      a5,0(a5)
        mv      a1,a5
        lui     a5,%hi(.LC13)
        addi    a0,a5,%lo(.LC13)
        call    printf
        ld      a5,-24(s0)
        addi    a5,a5,4
        mv      a1,a5
        lui     a5,%hi(.LC14)
        addi    a0,a5,%lo(.LC14)
        call    printf
        ld      a5,-24(s0)
        flw     fa5,104(a5)
        fcvt.d.s        fa5,fa5
        fmv.x.d a1,fa5
        lui     a5,%hi(.LC11)
        addi    a0,a5,%lo(.LC11)
        call    printf
        nop
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
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
        addi    sp,sp,-48
        sd      ra,40(sp)
        sd      s0,32(sp)
        addi    s0,sp,48
        sd      a0,-40(s0)
        lui     a5,%hi(.LC15)
        addi    a1,a5,%lo(.LC15)
        lui     a5,%hi(.LC16)
        addi    a0,a5,%lo(.LC16)
        call    fopen
        mv      a5,a0
        sd      a5,-24(s0)
        ld      a5,-24(s0)
        bne     a5,zero,.L13
        lui     a5,%hi(.LC17)
        addi    a0,a5,%lo(.LC17)
        call    puts
        j       .L12
.L13:
        ld      a5,-40(s0)
        lw      a2,0(a5)
        ld      a5,-40(s0)
        addi    a3,a5,4
        ld      a5,-40(s0)
        flw     fa5,104(a5)
        fcvt.d.s        fa5,fa5
        fmv.x.d a4,fa5
        lui     a5,%hi(.LC18)
        addi    a1,a5,%lo(.LC18)
        ld      a0,-24(s0)
        call    fprintf
        ld      a0,-24(s0)
        call    fclose
        lui     a5,%hi(.LC19)
        addi    a0,a5,%lo(.LC19)
        call    puts
.L12:
        ld      ra,40(sp)
        ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
.LC20:
        .string "r"
.LC21:
        .string "No account data found."
.LC22:
        .string "%d %s %f"
loadFromFile:
        addi    sp,sp,-48
        sd      ra,40(sp)
        sd      s0,32(sp)
        addi    s0,sp,48
        sd      a0,-40(s0)
        lui     a5,%hi(.LC20)
        addi    a1,a5,%lo(.LC20)
        lui     a5,%hi(.LC16)
        addi    a0,a5,%lo(.LC16)
        call    fopen
        mv      a5,a0
        sd      a5,-24(s0)
        ld      a5,-24(s0)
        bne     a5,zero,.L18
        lui     a5,%hi(.LC21)
        addi    a0,a5,%lo(.LC21)
        call    puts
        j       .L15
.L19:
        ld      a0,-40(s0)
        call    displayAccount
.L18:
        ld      a2,-40(s0)
        ld      a5,-40(s0)
        addi    a3,a5,4
        ld      a5,-40(s0)
        addi    a5,a5,104
        mv      a4,a5
        lui     a5,%hi(.LC22)
        addi    a1,a5,%lo(.LC22)
        ld      a0,-24(s0)
        call    __isoc99_fscanf
        mv      a5,a0
        mv      a4,a5
        li      a5,-1
        bne     a4,a5,.L19
        ld      a0,-24(s0)
        call    fclose
.L15:
        ld      ra,40(sp)
        ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
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
        addi    sp,sp,-144
        sd      ra,136(sp)
        sd      s0,128(sp)
        addi    s0,sp,144
.L32:
        lui     a5,%hi(.LC23)
        addi    a0,a5,%lo(.LC23)
        call    puts
        lui     a5,%hi(.LC24)
        addi    a0,a5,%lo(.LC24)
        call    puts
        lui     a5,%hi(.LC25)
        addi    a0,a5,%lo(.LC25)
        call    puts
        lui     a5,%hi(.LC26)
        addi    a0,a5,%lo(.LC26)
        call    puts
        lui     a5,%hi(.LC27)
        addi    a0,a5,%lo(.LC27)
        call    puts
        lui     a5,%hi(.LC28)
        addi    a0,a5,%lo(.LC28)
        call    puts
        lui     a5,%hi(.LC29)
        addi    a0,a5,%lo(.LC29)
        call    puts
        lui     a5,%hi(.LC30)
        addi    a0,a5,%lo(.LC30)
        call    puts
        lui     a5,%hi(.LC31)
        addi    a0,a5,%lo(.LC31)
        call    puts
        lui     a5,%hi(.LC32)
        addi    a0,a5,%lo(.LC32)
        call    printf
        addi    a5,s0,-132
        mv      a1,a5
        lui     a5,%hi(.LC1)
        addi    a0,a5,%lo(.LC1)
        call    __isoc99_scanf
        lw      a5,-132(s0)
        li      a4,8
        bgtu    a5,a4,.L21
        slli    a4,a5,2
        lui     a5,%hi(.L23)
        addi    a5,a5,%lo(.L23)
        add     a5,a4,a5
        lw      a5,0(a5)
        jr      a5
.L23:
        .word   .L21
        .word   .L30
        .word   .L29
        .word   .L28
        .word   .L27
        .word   .L26
        .word   .L25
        .word   .L24
        .word   .L22
.L30:
        addi    a5,s0,-128
        mv      a0,a5
        call    createAccount
        j       .L31
.L29:
        addi    a5,s0,-128
        mv      a0,a5
        call    deposit
        j       .L31
.L28:
        addi    a5,s0,-128
        mv      a0,a5
        call    withdraw
        j       .L31
.L27:
        addi    a5,s0,-128
        mv      a0,a5
        call    checkBalance
        j       .L31
.L26:
        addi    a5,s0,-128
        mv      a0,a5
        call    displayAccount
        j       .L31
.L25:
        addi    a5,s0,-128
        mv      a0,a5
        call    saveToFile
        j       .L31
.L24:
        addi    a5,s0,-128
        mv      a0,a5
        call    loadFromFile
        j       .L31
.L22:
        lui     a5,%hi(.LC33)
        addi    a0,a5,%lo(.LC33)
        call    puts
        li      a0,0
        call    exit
.L21:
        lui     a5,%hi(.LC34)
        addi    a0,a5,%lo(.LC34)
        call    puts
.L31:
        j       .L32