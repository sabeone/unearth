	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoblin.part.3, %function
drawGoblin.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #20]
	ldr	r1, [r0]
	ldr	r4, [r0, #56]
	ldr	r2, [r0, #48]
	ldr	ip, .L4
	lsl	r3, r3, #23
	ldrb	lr, [r0, #16]	@ zero_extendqisi2
	lsl	r1, r1, #3
	add	r2, r2, r4, lsl #5
	lsr	r3, r3, #23
	add	r0, ip, r1
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	lr, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawGoblin.part.3, .-drawGoblin.part.3
	.align	2
	.global	initLocations
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLocations, %function
initLocations:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	ldr	r3, [r3]
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L24+4
	sub	sp, sp, #28
	mov	lr, pc
	bx	r8
	ldr	r4, .L24+8
	umull	r2, r3, r4, r0
	lsr	r3, r3, #7
	add	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #3
	ldr	r5, .L24+12
	add	r0, r0, #8
	str	r0, [r5]
	mov	lr, pc
	bx	r8
	mov	r6, r5
	mov	r9, #0
	mov	r7, #16
	ldr	r2, .L24+16
	lsr	ip, r0, #5
	umull	r1, r3, r2, ip
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #5
	str	r4, [sp, #16]
	str	r3, [r5, #4]
	str	r2, [sp, #20]
	ldr	r10, .L24+20
.L9:
	ldr	r3, .L24
	ldr	r3, [r3]
	add	fp, r9, #1
	cmp	r3, fp
	ble	.L22
.L21:
	mov	lr, pc
	bx	r8
	ldr	r3, [sp, #16]
	umull	r2, r3, r0, r3
	lsr	r3, r3, #7
	add	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #8
	str	r0, [r5, #8]
	mov	lr, pc
	bx	r8
	mov	r4, #0
	ldr	r2, [sp, #20]
	lsr	r3, r0, #5
	umull	r1, r2, r3, r2
	rsb	r3, r2, r2, lsl #3
	sub	r0, r0, r3, lsl #5
	str	r0, [r5, #12]
.L8:
	mov	r3, #16
	ldr	ip, [r5, #8]
	stmib	sp, {r0, r7}
	str	r7, [sp, #12]
	str	ip, [sp]
	add	r1, r6, r4, lsl #3
	mov	r2, r3
	ldr	r1, [r1, #4]
	ldr	r0, [r6, r4, lsl #3]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	bne	.L21
	cmp	r4, r9
	add	r4, r4, #1
	ldrlt	r0, [r5, #12]
	blt	.L8
.L23:
	add	r5, r5, #8
	mov	r9, fp
	b	.L9
.L22:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	locationCount
	.word	rand
	.word	-252645135
	.word	locations
	.word	613566761
	.word	collision
	.size	initLocations, .-initLocations
	.align	2
	.global	initDirt
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDirt, %function
initDirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L31
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L26
	mov	r5, #0
	mov	r7, #16
	mov	r10, r5
	ldr	r9, .L31+4
	ldr	r4, .L31+8
	ldr	r6, .L31+12
	add	r8, r9, #4
.L28:
	ldr	r1, [r6]
	ldr	ip, [r9, r5, lsl #3]
	ldr	r0, [r8, r5, lsl #3]
	add	lr, r1, #1
	str	r1, [r4]
	str	ip, [r4, #12]
	str	r7, [r4, #4]
	str	r7, [r4, #8]
	str	r0, [r4, #16]
	ldr	r3, .L31+16
	str	lr, [r6]
	mov	lr, pc
	bx	r3
	ldr	r1, .L31+20
	umull	r3, r1, r0, r1
	lsr	r1, r1, #2
	ldr	ip, [fp]
	add	r1, r1, r1, lsl #2
	add	r5, r5, #1
	sub	r0, r0, r1
	add	r0, r0, #1
	cmp	ip, r5
	str	r10, [r4, #24]
	str	r0, [r4, #20]
	add	r4, r4, #28
	bgt	.L28
.L26:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	locationCount
	.word	locations
	.word	dirtPatches
	.word	curOamIndex
	.word	rand
	.word	-858993459
	.size	initDirt, .-initDirt
	.align	2
	.global	updateDirt
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDirt, %function
updateDirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L44
	ldr	r2, [r3, #28]
	cmp	r2, #0
	bxeq	lr
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r3, #12]
	sub	sp, sp, #20
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r4, #12
	ldmib	r4, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L44+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L33
	ldr	r3, [r4, #20]
	sub	r3, r3, #1
	cmp	r3, #0
	ldreq	r2, .L44+8
	str	r3, [r4, #20]
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
.L33:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	dwarf
	.word	collision
	.word	locCount
	.size	updateDirt, .-updateDirt
	.align	2
	.global	drawDirt
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDirt, %function
drawDirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ldr	r2, [r0]
	ble	.L47
	ldr	r3, [r0, #16]
	ldr	r1, [r0, #24]
	ldr	ip, .L53
	lsl	r3, r3, #23
	str	lr, [sp, #-4]!
	lsl	r2, r2, #3
	ldrb	lr, [r0, #12]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r0, ip, r2
	orr	r3, r3, #16384
	lsl	r1, r1, #1
	strh	lr, [ip, r2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L47:
	mov	r1, #512
	ldr	r3, .L53
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L54:
	.align	2
.L53:
	.word	shadowOAM
	.size	drawDirt, .-drawDirt
	.align	2
	.global	initDwarf
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDwarf, %function
initDwarf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #72
	mov	r4, #112
	mov	lr, #3
	mov	ip, #16
	mov	r0, #2
	mov	r1, #1
	ldr	r3, .L57
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #48]
	str	r2, [r3]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	ip, [r3, #4]
	str	ip, [r3, #8]
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	pop	{r4, r5, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	dwarf
	.size	initDwarf, .-initDwarf
	.align	2
	.global	updateDwarf
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDwarf, %function
updateDwarf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L76
	ldrh	r2, [r4]
	tst	r2, #2
	beq	.L60
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	ands	r3, r3, #2
	beq	.L74
.L60:
	tst	r2, #1
	beq	.L61
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	beq	.L75
.L61:
	mov	r2, #0
	ldr	r3, .L76+8
	str	r2, [r3, #28]
.L62:
	ldr	r2, .L76+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L63
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #20]
	sub	r2, r2, r1
	cmp	r2, #0
	strgt	r2, [r3, #12]
.L63:
	ldr	r2, .L76+12
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L64
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #4]
	add	r2, r2, r0
	rsb	r1, r1, #160
	cmp	r2, r1
	strlt	r2, [r3, #12]
.L64:
	ldr	r2, .L76+12
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L65
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #24]
	sub	r2, r2, r1
	cmp	r2, #0
	strgt	r2, [r3, #16]
.L65:
	ldr	r2, .L76+12
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L59
	ldr	r2, [r3, #16]
	ldr	r0, [r3, #24]
	ldr	r1, [r3, #8]
	add	r2, r2, r0
	rsb	r1, r1, #240
	cmp	r2, r1
	strlt	r2, [r3, #16]
.L59:
	pop	{r4, r5, r6, lr}
	bx	lr
.L75:
	ldr	r2, .L76+16
	mov	r1, #5888
	ldr	r0, .L76+20
	ldr	r4, .L76+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L76+8
	str	r2, [r3, #28]
	b	.L62
.L74:
	ldr	r2, .L76+16
	ldr	r1, .L76+28
	ldr	r0, .L76+32
	ldr	r5, .L76+24
	mov	lr, pc
	bx	r5
	ldr	ip, .L76+36
	ldr	r0, .L76+40
	ldr	r1, [ip]
	ldr	r3, [r0, #36]
	rsbs	r1, r1, #1
	movcc	r1, #0
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldrh	r2, [r4]
	str	r1, [ip]
	str	r3, [r0, #36]
	b	.L60
.L77:
	.align	2
.L76:
	.word	oldButtons
	.word	buttons
	.word	dwarf
	.word	67109120
	.word	11025
	.word	AxeSFX
	.word	playSoundB
	.word	14928
	.word	CheatSFX
	.word	cheatEnable
	.word	goblins
	.size	updateDwarf, .-updateDwarf
	.global	__aeabi_idivmod
	.align	2
	.global	animateDwarf
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateDwarf, %function
animateDwarf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #10
	push	{r4, r5, r6, lr}
	ldr	r4, .L91
	ldr	r3, .L91+4
	ldr	r5, [r4, #32]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r1, [r4, #36]
	bne	.L79
	ldr	r0, [r4, #44]
	ldr	r3, .L91+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L79:
	ldr	r3, .L91+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #2
	streq	r3, [r4, #36]
	ldr	r3, .L91+12
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L91+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L82
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	bne	.L84
.L85:
	mov	r3, #4
	str	r3, [r4, #36]
.L84:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L85
	ldr	r3, [r4, #36]
	cmp	r3, #10
	bne	.L84
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	dwarf
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animateDwarf, .-animateDwarf
	.align	2
	.global	drawDwarf
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDwarf, %function
drawDwarf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L95
	ldr	r3, [r1, #16]
	str	lr, [sp, #-4]!
	ldr	r0, [r1]
	ldr	lr, [r1, #44]
	ldr	r2, [r1, #36]
	ldr	ip, .L95+4
	lsl	r3, r3, #23
	lsl	r0, r0, #3
	add	r2, r2, lr, lsl #5
	lsr	r3, r3, #23
	ldrb	lr, [r1, #12]	@ zero_extendqisi2
	orr	r3, r3, #16384
	add	r1, ip, r0
	lsl	r2, r2, #1
	strh	lr, [ip, r0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L96:
	.align	2
.L95:
	.word	dwarf
	.word	shadowOAM
	.size	drawDwarf, .-drawDwarf
	.align	2
	.global	initGoblins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGoblins, %function
initGoblins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L106
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L97
	mov	r5, #0
	mov	r8, #16
	ldr	r4, .L106+4
	ldr	r10, .L106+8
	ldr	r9, .L106+12
	ldr	r7, .L106+16
	ldr	r6, .L106+20
.L101:
	mov	ip, #15
	ldr	r3, [r9]
	add	r1, r7, r3, lsl #3
	ldr	r2, [r10]
	ldr	r1, [r1, #4]
	ldr	r0, [r7, r3, lsl #3]
	str	r3, [r4, #12]
	str	r1, [r4, #20]
	add	r3, r3, #1
	add	r1, r2, #1
	str	r3, [r9]
	str	ip, [r4, #8]
	str	r2, [r4]
	str	r1, [r10]
	str	r8, [r4, #4]
	str	r0, [r4, #16]
	mov	lr, pc
	bx	r6
	tst	r0, #1
	mvneq	r3, #0
	movne	r3, #1
	str	r3, [r4, #24]
	mov	lr, pc
	bx	r6
	tst	r0, #1
	mvneq	r3, #0
	movne	r3, #1
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r6
	mov	r3, #0
	rsbs	ip, r5, #1
	movcc	ip, #0
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r3, [r4, #56]
	mov	r1, #5
	mov	r3, #3
	ldr	lr, .L106+24
	umull	r2, lr, r0, lr
	lsr	lr, lr, #2
	add	lr, lr, lr, lsl #2
	sub	r0, r0, lr
	add	r0, r0, #2
	str	r0, [r4, #32]
	ldr	r0, [fp]
	add	r5, r5, #1
	cmp	r0, r5
	str	ip, [r4, #36]
	str	r1, [r4, #48]
	str	r3, [r4, #60]
	add	r4, r4, #64
	bgt	.L101
.L97:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	goblinCount
	.word	goblins
	.word	curOamIndex
	.word	curLocationIndex
	.word	locations
	.word	rand
	.word	-858993459
	.size	initGoblins, .-initGoblins
	.align	2
	.global	updateGoblin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGoblin, %function
updateGoblin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #12]
	ldr	r2, .L149
	push	{r4, r5, r6, lr}
	rsb	r3, r3, r3, lsl #3
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #20]
	cmp	r3, #0
	sub	sp, sp, #16
	mov	r4, r0
	ble	.L145
.L109:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L111
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L145:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ble	.L109
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L110
	mov	r3, #0
	ldr	r2, .L149+4
	ldr	r1, .L149+8
	ldr	r0, .L149+12
	ldr	r5, .L149+16
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r3, .L149+20
	str	r2, [r3]
.L110:
	mov	r3, #1
	str	r3, [r4, #40]
.L111:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L113
	ldr	r2, [r4, #4]
	rsb	r2, r2, #160
	cmp	r3, r2
	beq	.L113
	ldr	r1, [r4, #20]
	cmp	r1, #0
	beq	.L113
	ldr	r3, [r4, #8]
	rsb	r3, r3, #240
	cmp	r1, r3
	bne	.L114
.L113:
	ldr	lr, .L149+24
	ldr	r3, [lr]
	cmp	r3, #0
	bgt	.L146
.L116:
	mov	r3, #0
	ldr	r1, [r4, #20]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
.L114:
	ldr	r3, .L149+28
	ldr	r2, [r3, #28]
	cmp	r2, #0
	bne	.L147
.L122:
	ldr	r3, [r4, #28]
	add	r3, r3, r1
	str	r3, [r4, #20]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L146:
	sub	ip, r3, #1
	ldr	r2, .L149+4
	mov	r3, #0
	ldr	r1, .L149+32
	ldr	r0, .L149+36
	ldr	r5, .L149+16
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	ldr	r3, .L149+40
	ldr	r3, [r3]
	subs	r2, r3, #1
	bmi	.L116
	lsl	r1, r2, #1
	add	r0, r1, r2
	ldr	ip, .L149+44
	add	r0, r2, r0, lsl #2
	add	r0, ip, r0, lsl #2
	ldr	r0, [r0, #36]
	cmp	r0, #0
	addeq	r1, r3, r3, lsl #1
	addeq	r3, r3, r1, lsl #2
	addeq	r3, ip, r3, lsl #2
	bne	.L118
.L120:
	subs	r2, r2, #1
	sub	r3, r3, #52
	bcc	.L116
	ldr	r1, [r3, #-16]
	cmp	r1, #0
	beq	.L120
	lsl	r1, r2, #1
.L118:
	mov	r3, #0
	add	r1, r1, r2
	add	r2, r2, r1, lsl #2
	add	r2, ip, r2, lsl #2
	str	r3, [r2, #36]
	b	.L116
.L147:
	ldmib	r3, {r0, ip}
	ldr	r2, [r3, #16]
	ldr	r3, [r3, #12]
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L149+48
	ldmib	r4, {r2, r3}
	ldr	r0, [r4, #16]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L144
	ldr	r5, [r4, #32]
	cmp	r5, #0
	beq	.L148
.L124:
	sub	r5, r5, #1
	str	r5, [r4, #32]
.L144:
	ldr	r1, [r4, #20]
	b	.L122
.L148:
	mov	r3, r5
	ldr	r2, .L149+4
	mov	r1, #8320
	ldr	r0, .L149+52
	ldr	r6, .L149+16
	mov	lr, pc
	bx	r6
	str	r5, [r4, #40]
	ldr	r5, [r4, #32]
	b	.L124
.L150:
	.align	2
.L149:
	.word	dirtPatches
	.word	11025
	.word	44641
	.word	QueenSFX
	.word	playSoundB
	.word	queenActivated
	.word	curCollect
	.word	dwarf
	.word	1588
	.word	TheftSFX
	.word	coinCount
	.word	collectedCoins
	.word	collision
	.word	DeathSFX
	.size	updateGoblin, .-updateGoblin
	.align	2
	.global	animateGoblin
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateGoblin, %function
animateGoblin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L156
	ldr	r5, [r0, #44]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	ldr	r2, [r0, #48]
	cmp	r5, r3, lsl #2
	mov	r4, r0
	str	r2, [r0, #52]
	bne	.L152
	ldr	r0, [r0, #56]
	ldr	r3, .L156+4
	add	r0, r0, #1
	ldr	r1, [r4, #60]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #56]
.L152:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	movlt	r3, #7
	movge	r3, #8
	add	r5, r5, #1
	str	r5, [r4, #44]
	str	r3, [r4, #48]
	pop	{r4, r5, r6, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateGoblin, .-animateGoblin
	.align	2
	.global	drawGoblin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoblin, %function
drawGoblin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #40]
	cmp	r2, #0
	bne	drawGoblin.part.3
.L159:
	mov	r1, #512
	ldr	r3, [r0]
	ldr	r2, .L160
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L161:
	.align	2
.L160:
	.word	shadowOAM
	.size	drawGoblin, .-drawGoblin
	.align	2
	.global	initCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoins, %function
initCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L167
	ldr	r10, [r3]
	cmp	r10, #0
	sub	sp, sp, #12
	ble	.L162
	ldr	fp, .L167+4
	ldr	r4, [fp]
	mov	r2, r4
	mov	ip, #16
	mov	r0, #1
	mov	r1, #0
	mov	r8, #9
	ldr	r3, .L167+8
	ldr	r9, [r3]
	ldr	r5, .L167+12
	ldr	r3, .L167+16
	str	r9, [sp, #4]
	add	r4, r4, r10
	sub	r7, r9, r2
	add	r6, r5, #4
.L164:
	add	lr, r7, r2
	str	r2, [r3, #12]
	ldr	r9, [r5, r2, lsl #3]
	str	lr, [r3]
	ldr	lr, [r6, r2, lsl #3]
	add	r2, r2, #1
	cmp	r2, r4
	str	r9, [r3, #16]
	str	ip, [r3, #4]
	str	ip, [r3, #8]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	str	r8, [r3, #48]
	str	lr, [r3, #20]
	add	r3, r3, #52
	bne	.L164
	ldr	r9, [sp, #4]
	ldr	r3, .L167+8
	add	r9, r9, r10
	str	r9, [r3]
	str	r2, [fp]
.L162:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	coinCount
	.word	curLocationIndex
	.word	curOamIndex
	.word	locations
	.word	coins
	.size	initCoins, .-initCoins
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r1, #1
	mov	r4, #0
	ldr	r2, .L174
	ldr	r3, .L174+4
	ldr	r6, .L174+8
	ldr	r8, .L174+12
	str	r4, [r2]
	str	r1, [r6]
	str	r4, [r3]
	mov	lr, pc
	bx	r8
	ldr	r7, .L174+16
	ldr	r3, .L174+20
	and	r0, r0, #7
	add	r0, r0, #8
	str	r4, [r3]
	str	r0, [r7]
	mov	lr, pc
	bx	r8
	ldr	r9, .L174+24
	umull	r2, r3, r9, r0
	lsr	r3, r3, #2
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3, lsl #1
	ldr	r3, .L174+28
	add	r0, r0, #3
	str	r0, [r3]
	mov	lr, pc
	bx	r8
	umull	r3, r5, r0, r9
	lsr	r5, r5, #1
	add	r5, r5, r5, lsl #1
	ldr	r2, [r7]
	sub	r5, r0, r5
	ldr	r1, .L174+32
	ldr	r0, .L174+36
	ldr	r7, .L174+40
	ldr	r3, .L174+44
	add	r5, r5, #3
	str	r4, [r0]
	str	r5, [r1]
	str	r5, [r7]
	str	r2, [r3]
	bl	initLocations
	ldr	ip, [r7]
	cmp	ip, r4
	ble	.L170
	mov	r1, r4
	mov	lr, #9
	mov	r0, r4
	ldr	r2, [r6]
	ldr	r3, .L174+48
	add	ip, ip, r2
.L171:
	str	r2, [r3]
	add	r2, r2, #1
	cmp	r2, ip
	str	r1, [r3, #20]
	str	r0, [r3, #16]
	str	r0, [r3, #36]
	str	lr, [r3, #48]
	add	r1, r1, #16
	add	r3, r3, #52
	bne	.L171
	str	r2, [r6]
.L170:
	mov	r2, #0
	mov	lr, #3
	mov	ip, #16
	mov	r0, #2
	mov	r1, #1
	mov	r5, #72
	mov	r4, #112
	ldr	r3, .L174+52
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #48]
	str	r2, [r3]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	ip, [r3, #4]
	str	ip, [r3, #8]
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	bl	initCoins
	bl	initGoblins
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initDirt
.L175:
	.align	2
.L174:
	.word	cheatEnable
	.word	queenActivated
	.word	curOamIndex
	.word	rand
	.word	locationCount
	.word	curLocationIndex
	.word	-1431655765
	.word	goblinCount
	.word	coinsRemaining
	.word	curCollect
	.word	coinCount
	.word	locCount
	.word	collectedCoins
	.word	dwarf
	.size	initGame, .-initGame
	.align	2
	.global	updateCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoin, %function
updateCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #12]
	ldr	r2, .L192
	rsb	r3, r3, r3, lsl #3
	add	r3, r2, r3, lsl #2
	ldr	r3, [r3, #20]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ble	.L191
.L177:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L178
.L176:
	pop	{r4, r5, r6, lr}
	bx	lr
.L191:
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L177
	ldr	r2, .L192+4
	ldr	r1, .L192+8
	ldr	r0, .L192+12
	ldr	r5, .L192+16
	mov	lr, pc
	bx	r5
	mov	r1, #1
	ldr	ip, .L192+20
	ldr	r0, .L192+24
	ldr	r2, [ip]
	ldr	r3, [r0]
	sub	r2, r2, #1
	add	r3, r3, r1
	str	r2, [ip]
	str	r3, [r0]
	str	r1, [r4, #36]
	str	r1, [r4, #40]
.L178:
	ldr	r3, [r4, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #16]
	bne	.L176
	ldr	r2, .L192+28
	ldr	r0, [r2]
	cmp	r0, #0
	str	r3, [r4, #36]
	ble	.L176
	ldr	ip, .L192+32
	ldr	r2, [ip, #36]
	cmp	r2, #0
	movne	r2, ip
	bne	.L183
	b	.L181
.L184:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	beq	.L181
.L183:
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r2, #52
	bne	.L184
	b	.L176
.L181:
	mov	r2, #1
	add	r1, r3, r3, lsl r2
	add	r3, r3, r1, lsl #2
	add	r3, ip, r3, lsl #2
	str	r2, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L193:
	.align	2
.L192:
	.word	dirtPatches
	.word	11025
	.word	4973
	.word	CoinSFX
	.word	playSoundB
	.word	coinsRemaining
	.word	curCollect
	.word	coinCount
	.word	collectedCoins
	.size	updateCoin, .-updateCoin
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L208
	bl	updateDwarf
	bl	animateDwarf
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L195
	mov	r5, #0
	ldr	r4, .L208+4
.L196:
	mov	r0, r4
	bl	updateDirt
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #28
	bgt	.L196
.L195:
	ldr	r6, .L208+8
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L197
	mov	r9, #0
	ldr	r4, .L208+12
	ldr	r7, .L208+16
	ldr	r8, .L208+20
.L200:
	mov	r0, r4
	bl	updateGoblin
	ldr	r5, [r4, #44]
	smull	r3, r2, r7, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	ldr	r2, [r4, #48]
	cmp	r5, r3, lsl #2
	add	r9, r9, #1
	str	r2, [r4, #52]
	bne	.L198
	add	r0, r4, #56
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r8
	str	r1, [r4, #56]
.L198:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	movlt	r3, #7
	movge	r3, #8
	ldr	r2, [r6]
	add	r5, r5, #1
	cmp	r2, r9
	str	r5, [r4, #44]
	str	r3, [r4, #48]
	add	r4, r4, #64
	bgt	.L200
.L197:
	ldr	r6, .L208+24
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L194
	mov	r5, #0
	ldr	r4, .L208+28
.L202:
	mov	r0, r4
	bl	updateCoin
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #52
	bgt	.L202
.L194:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L209:
	.align	2
.L208:
	.word	locationCount
	.word	dirtPatches
	.word	goblinCount
	.word	goblins
	.word	1717986919
	.word	__aeabi_idivmod
	.word	coinCount
	.word	coins
	.size	updateGame, .-updateGame
	.align	2
	.global	drawCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoin, %function
drawCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	ldr	r3, [r0]
	beq	.L211
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bne	.L211
	ldr	r2, [r0, #20]
	ldr	r1, [r0, #48]
	ldr	ip, .L220
	lsl	r2, r2, #23
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldrb	lr, [r0, #16]	@ zero_extendqisi2
	lsr	r2, r2, #23
	add	r0, ip, r3
	orr	r2, r2, #16384
	lsl	r1, r1, #1
	strh	lr, [ip, r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L211:
	mov	r1, #512
	ldr	r2, .L220
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L221:
	.align	2
.L220:
	.word	shadowOAM
	.size	drawCoin, .-drawCoin
	.align	2
	.global	initCollectedCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCollectedCoins, %function
initCollectedCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L230
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	mov	r1, #0
	push	{r4, lr}
	mov	r0, r1
	mov	lr, #9
	ldr	r4, .L230+4
	ldr	r2, [r4]
	ldr	r3, .L230+8
	add	ip, ip, r2
.L224:
	str	r2, [r3]
	add	r2, r2, #1
	cmp	r2, ip
	str	r1, [r3, #20]
	str	r0, [r3, #16]
	str	r0, [r3, #36]
	str	lr, [r3, #48]
	add	r1, r1, #16
	add	r3, r3, #52
	bne	.L224
	str	r2, [r4]
	pop	{r4, lr}
	bx	lr
.L231:
	.align	2
.L230:
	.word	coinCount
	.word	curOamIndex
	.word	collectedCoins
	.size	initCollectedCoins, .-initCollectedCoins
	.align	2
	.global	drawCollectedCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCollectedCoins, %function
drawCollectedCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L243
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r6, #512
	add	r2, r0, r0, lsl #1
	ldr	r3, .L243+4
	add	r0, r0, r2, lsl #2
	ldr	ip, .L243+8
	ldr	r5, .L243+12
	add	r0, r3, r0, lsl #2
.L236:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldr	r2, [r3]
	lsl	r1, r2, #3
	lsleq	r2, r2, #3
	add	lr, ip, r1
	strheq	r6, [ip, r2]	@ movhi
	beq	.L235
	ldr	r2, [r3, #20]
	ldr	r4, [r3, #48]
	and	r2, r2, r5
	ldrb	r7, [r3, #16]	@ zero_extendqisi2
	orr	r2, r2, #16384
	lsl	r4, r4, #1
	strh	r2, [lr, #2]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	strh	r7, [ip, r1]	@ movhi
.L235:
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L236
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L244:
	.align	2
.L243:
	.word	coinCount
	.word	collectedCoins
	.word	shadowOAM
	.word	511
	.size	drawCollectedCoins, .-drawCollectedCoins
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L270
	ldr	r2, .L270+4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0]
	ldr	lr, [r2]
	ldr	r1, [r0, #16]
	ldr	r4, .L270+8
	ldr	r6, [r0, #44]
	ldr	r2, [r0, #36]
	ldr	r5, .L270+12
	ldrb	ip, [r0, #12]	@ zero_extendqisi2
	lsl	r3, r3, #3
	and	r1, r1, r4
	add	r2, r2, r6, lsl #5
	orr	r1, r1, #16384
	lsl	r2, r2, #1
	strh	ip, [r5, r3]	@ movhi
	cmp	lr, #0
	add	r3, r5, r3
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ble	.L252
	mov	r6, #512
	ldr	r3, .L270+16
	rsb	lr, lr, lr, lsl #3
	add	lr, r3, lr, lsl #2
.L251:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3]
	lsl	r1, r2, #3
	lslle	r2, r2, #3
	add	ip, r5, r1
	strhle	r6, [r5, r2]	@ movhi
	ble	.L250
	ldr	r2, [r3, #16]
	ldr	r0, [r3, #24]
	and	r2, r2, r4
	ldrb	r7, [r3, #12]	@ zero_extendqisi2
	orr	r2, r2, #16384
	lsl	r0, r0, #1
	strh	r2, [ip, #2]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	strh	r7, [r5, r1]	@ movhi
.L250:
	add	r3, r3, #28
	cmp	r3, lr
	bne	.L251
.L252:
	ldr	r8, .L270+20
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L248
	mov	r6, #0
	mov	r7, #512
	ldr	r4, .L270+24
	b	.L257
.L268:
	mov	r0, r4
	bl	drawGoblin.part.3
.L256:
	ldr	r3, [r8]
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #64
	ble	.L248
.L257:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L268
	ldr	r3, [r4]
	lsl	r3, r3, #3
	strh	r7, [r5, r3]	@ movhi
	b	.L256
.L248:
	ldr	r3, .L270+28
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L254
	add	r2, r1, r1, lsl #1
	ldr	r3, .L270+32
	add	r1, r1, r2, lsl #2
	mov	lr, #512
	ldr	r4, .L270+8
	add	r1, r3, r1, lsl #2
	b	.L260
.L269:
	ldr	ip, [r3, #44]
	lsl	r0, r2, #3
	cmp	ip, #0
	add	ip, r5, r0
	bne	.L258
	ldr	r2, [r3, #20]
	and	r2, r2, r4
	ldr	r6, [r3, #48]
	orr	r2, r2, #16384
	strh	r2, [ip, #2]	@ movhi
	add	r3, r3, #52
	ldrb	r2, [r3, #-36]	@ zero_extendqisi2
	lsl	r6, r6, #1
	cmp	r1, r3
	strh	r6, [ip, #4]	@ movhi
	strh	r2, [r5, r0]	@ movhi
	beq	.L254
.L260:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldr	r2, [r3]
	bne	.L269
.L258:
	add	r3, r3, #52
	lsl	r2, r2, #3
	cmp	r1, r3
	strh	lr, [r5, r2]	@ movhi
	bne	.L260
.L254:
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCollectedCoins
.L271:
	.align	2
.L270:
	.word	dwarf
	.word	locationCount
	.word	511
	.word	shadowOAM
	.word	dirtPatches
	.word	goblinCount
	.word	goblins
	.word	coinCount
	.word	coins
	.size	drawGame, .-drawGame
	.comm	collectedCoins,260,4
	.comm	coins,260,4
	.comm	goblins,512,4
	.comm	dwarf,52,4
	.comm	dirtPatches,420,4
	.comm	locations,120,4
	.comm	locCount,4,4
	.comm	curCollect,4,4
	.comm	coinsRemaining,4,4
	.comm	coinCount,4,4
	.comm	goblinCount,4,4
	.comm	curLocationIndex,4,4
	.comm	locationCount,4,4
	.comm	queenActivated,4,4
	.comm	cheatEnable,4,4
	.comm	curOamIndex,4,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
