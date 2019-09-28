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
	.file	"start.c"
	.text
	.align	2
	.global	initStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStart, %function
initStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #23552
	mov	r5, #67108864
	ldr	r2, .L4
	ldr	r4, .L4+4
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #256
	strh	r1, [r5, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1632
	mov	r2, #100663296
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #768
	mov	r1, #136
	strh	r2, [r5]	@ movhi
	ldr	r3, .L4+44
	ldr	r2, .L4+48
	str	r1, [r3]
	ldrh	r2, [r2, #48]
	ldr	r3, .L4+52
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	22532
	.word	DMANow
	.word	skyBGPal
	.word	6880
	.word	100679680
	.word	skyBGTiles
	.word	splashBGTiles
	.word	100712448
	.word	skyBGMap
	.word	100720640
	.word	splashBGMap
	.word	hOff
	.word	67109120
	.word	buttons
	.size	initStart, .-initStart
	.align	2
	.global	updateStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r2, .L9+4
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r3, .L9
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r2, .L9+4
	ldreq	r3, [r2]
	addeq	r3, r3, #1
	streq	r3, [r2]
	bx	lr
.L10:
	.align	2
.L9:
	.word	67109120
	.word	hOff
	.size	updateStart, .-updateStart
	.align	2
	.global	drawStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStart, %function
drawStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldr	r3, .L12
	ldr	r3, [r3]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #20]	@ movhi
	strh	r3, [r1, #16]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
	.word	hOff
	.size	drawStart, .-drawStart
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 50) 8.2.0"
