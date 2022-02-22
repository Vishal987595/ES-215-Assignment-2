	.file	1 "fib.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	Fibonacci
	.set	nomips16
	.set	nomicromips
	.ent	Fibonacci
	.type	Fibonacci, @function
Fibonacci:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$5,$L14
	addiu	$12,$5,-1

	blez	$12,$L3
	move	$8,$12

	li	$8,1			# 0x1
$L3:
	move	$2,$4
	move	$3,$0
	li	$11,1			# 0x1
	.option	pic0
	b	$L4
	.option	pic2
	move	$10,$0

$L11:
	li	$3,1			# 0x1
$L4:
	addiu	$6,$3,1
	slt	$7,$8,$6
	sw	$11,4($2)
	sw	$10,0($2)
	beq	$7,$0,$L11
	addiu	$2,$2,8

	slt	$2,$6,$5
	beq	$2,$0,$L14
	addiu	$3,$3,2

	sll	$7,$6,3
	slt	$3,$3,$12
	beq	$3,$0,$L7
	addu	$2,$4,$7

	lw	$8,-16($2)
	lw	$9,-12($2)
	lw	$7,-8($2)
	lw	$3,-4($2)
	nop
$L8:
	addu	$10,$9,$3
	sltu	$11,$10,$9
	addu	$8,$8,$7
	addu	$8,$11,$8
	addu	$11,$3,$10
	move	$9,$10
	sltu	$3,$11,$3
	addiu	$10,$6,3
	addu	$7,$7,$8
	addu	$7,$3,$7
	slt	$10,$10,$12
	sw	$8,0($2)
	sw	$9,4($2)
	sw	$7,8($2)
	sw	$11,12($2)
	move	$3,$11
	addiu	$6,$6,2
	bne	$10,$0,$L8
	addiu	$2,$2,16

	sll	$7,$6,3
$L7:
	addu	$2,$4,$7
$L9:
	lw	$3,-4($2)
	lw	$4,-12($2)
	lw	$7,-8($2)
	lw	$8,-16($2)
	addu	$4,$3,$4
	addu	$7,$7,$8
	sltu	$3,$4,$3
	addiu	$6,$6,1
	addu	$3,$3,$7
	slt	$7,$6,$5
	sw	$3,0($2)
	sw	$4,4($2)
	bne	$7,$0,$L9
	addiu	$2,$2,8

$L14:
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	Fibonacci
	.size	Fibonacci, .-Fibonacci
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"[%d  %llu] \000"
	.align	2
$LC2:
	.ascii	"\012Time taken is: %f\000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,72,$31		# vars= 8, regs= 8/0, args= 24, gp= 8
	.mask	0xc03f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-72
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$19,52($sp)
	lw	$19,%got(__stack_chk_guard)($28)
	lw	$25,%call16(clock)($28)
	lw	$2,0($19)
	sw	$fp,64($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$31,68($sp)
	sw	$21,60($sp)
	sw	$20,56($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	sw	$2,36($fp)
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	lui	$21,%hi($LC0)

	addiu	$sp,$sp,-800
	addiu	$17,$sp,24
	li	$5,100			# 0x64
	move	$4,$17
	.option	pic0
	jal	Fibonacci
	.option	pic2
	move	$18,$2

	lw	$28,24($fp)
	move	$16,$0
	addiu	$21,$21,%lo($LC0)
	li	$20,100			# 0x64
$L17:
	lw	$5,4($17)
	lw	$4,0($17)
	lw	$25,%call16(__printf_chk)($28)
	addiu	$16,$16,1
	sw	$5,20($sp)
	sw	$4,16($sp)
	move	$6,$16
	move	$5,$21
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	li	$4,1			# 0x1

	lw	$28,24($fp)
	bne	$16,$20,$L17
	addiu	$17,$17,8

	lw	$25,%call16(clock)($28)
	nop
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	subu	$18,$2,$18
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1+4)($2)
	mtc1	$18,$f0
	lwc1	$f3,%lo($LC1)($2)
	cvt.d.w	$f0,$f0
	div.d	$f0,$f0,$f2
	lw	$28,24($fp)
	lui	$5,%hi($LC2)
	lw	$25,%call16(__printf_chk)($28)
	addiu	$5,$5,%lo($LC2)
	mfc1	$7,$f0
	mfc1	$6,$f1
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	li	$4,1			# 0x1

	lw	$3,36($fp)
	lw	$2,0($19)
	lw	$28,24($fp)
	bne	$3,$2,$L21
	move	$2,$0

	move	$sp,$fp
	lw	$31,68($fp)
	lw	$fp,64($sp)
	lw	$21,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	jr	$31
	addiu	$sp,$sp,72

$L21:
	lw	$25,%call16(__stack_chk_fail)($28)
	nop
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC1:
	.word	1093567616
	.word	0
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
