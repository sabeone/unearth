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
	.file	"myLib.c"
	.text
	.align	2
	.global	delay
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	sub	sp, sp, #8
	cmp	r0, #0
	str	r2, [sp, #4]
	ble	.L1
.L3:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r0, r2
	str	r3, [sp, #4]
	bne	.L3
.L1:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [r3]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawHorzWalls3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorzWalls3, %function
drawHorzWalls3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	ip, r0, #120
	lsl	ip, ip, #1
	cmp	ip, #0
	bxle	lr
	ldr	r3, .L28
	rsb	r2, r0, r0, lsl #4
	add	r2, r0, r2, lsl #4
	ldr	r3, [r3]
	str	lr, [sp, #-4]!
	add	lr, r2, ip
	add	lr, r3, lr, lsl #1
	add	r2, r3, r2, lsl #1
.L17:
	strh	r1, [r2], #2	@ movhi
	cmp	r2, lr
	bne	.L17
	rsb	lr, r0, #159
	rsb	lr, lr, lr, lsl #4
	lsl	lr, lr, #4
	add	r2, lr, ip
	add	r2, r2, r0
	add	r0, r0, lr
	add	r2, r3, r2, lsl #1
	add	r0, r3, r0, lsl #1
.L19:
	strh	r1, [r0], #2	@ movhi
	cmp	r2, r0
	bne	.L19
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.size	drawHorzWalls3, .-drawHorzWalls3
	.align	2
	.global	drawVertWalls3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVertWalls3, %function
drawVertWalls3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	rsb	lr, r0, #80
	lsl	ip, lr, #1
	cmp	ip, #0
	ble	.L30
	ldr	r2, .L40
	lsl	r4, r0, #4
	sub	r3, r4, r0
	ldr	r2, [r2]
	add	r3, r0, r3, lsl #4
	rsb	lr, ip, lr, lsl #5
	add	r3, r2, r3, lsl #1
	add	lr, r3, lr, lsl #5
.L32:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L32
	add	ip, r0, ip
	sub	r3, r4, r0
	rsb	ip, ip, ip, lsl #4
	rsb	r0, r0, #239
	add	r3, r0, r3, lsl #4
	add	ip, r0, ip, lsl #4
	add	r0, r2, ip, lsl #1
	add	r3, r2, r3, lsl #1
.L34:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L34
.L30:
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.size	drawVertWalls3, .-drawVertWalls3
	.align	2
	.global	drawVertDivider3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVertDivider3, %function
drawVertDivider3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r0, r0, r1, lsl #1
	push	{r4, lr}
	rsb	r4, r0, #160
	cmp	r0, r4
	bge	.L42
	ldr	r3, .L47
	ldr	ip, [r3]
	rsb	lr, r1, r1, lsl #4
	rsb	r3, r0, r0, lsl #4
	add	r3, ip, r3, lsl #5
	lsl	ip, lr, #5
.L44:
	add	r0, r0, r1
	cmp	r0, r4
	strh	r2, [r3, #240]	@ movhi
	add	r3, r3, ip
	blt	.L44
.L42:
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.size	drawVertDivider3, .-drawVertDivider3
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, lr}
	mov	lr, #0
	ldr	r4, .L58
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [r4]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r0, [r4, #4]
	orr	r3, r3, #-2130706432
	add	ip, r2, ip, lsl #1
	add	r1, r2, r1, lsl #1
.L51:
	add	r2, sp, #8
	str	lr, [r0, #44]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, ip
	str	r3, [r0, #44]
	bne	.L51
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldrb	ip, [sp, #56]	@ zero_extendqisi2
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	cmp	r2, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #14]	@ movhi
	ble	.L60
	add	r4, r0, r2
	add	r2, r3, r3, lsr #31
	asr	r7, r3, #1
	asr	r2, r2, #1
	sub	r5, r7, #1
	ldr	ip, .L79
	add	r6, r1, r3
	orr	r2, r2, #-2130706432
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	sub	r6, r6, #1
	str	r2, [sp]
	orr	r2, r5, #-2130706432
	ldr	lr, [ip]
	add	r4, r1, r4, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [ip, #4]
	str	r2, [sp, #4]
	orr	r7, r7, #-2130706432
	and	r6, r6, #1
	and	r1, r1, #1
	and	r5, r3, #1
	add	r8, sp, #14
	sub	r9, r3, #1
	b	.L72
.L78:
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	cmp	r5, #0
	ldrb	r10, [lr, r2]	@ zero_extendqisi2
	ldrb	fp, [sp, #56]	@ zero_extendqisi2
	beq	.L63
	orr	r10, r10, fp, lsl #8
	cmp	r3, #1
	strh	r10, [lr, r2]	@ movhi
	ble	.L64
	mov	r10, #0
	add	r2, r0, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r10, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	str	r7, [ip, #44]
.L64:
	add	r0, r0, #240
	cmp	r4, r0
	beq	.L60
.L72:
	cmp	r1, #0
	bne	.L78
	cmp	r5, #0
	beq	.L68
	cmp	r3, #1
	ble	.L69
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r1, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	str	r7, [ip, #44]
.L69:
	add	r2, r9, r0
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	ldrh	fp, [lr, r2]
	ldrb	r10, [sp, #56]	@ zero_extendqisi2
	cmp	r6, #0
	andne	fp, fp, #255
	andeq	fp, fp, #65280
	and	r10, r10, #255
	add	r0, r0, #240
	orrne	fp, fp, r10, lsl #8
	orreq	fp, fp, r10
	cmp	r4, r0
	strh	fp, [lr, r2]	@ movhi
	bne	.L72
.L60:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L68:
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r5, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	ldr	r2, [sp]
	str	r2, [ip, #44]
	b	.L64
.L63:
	orr	r10, r10, fp, lsl #8
	cmp	r3, #2
	strh	r10, [lr, r2]	@ movhi
	ble	.L69
	add	r2, r0, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, lr, r2
	str	r5, [ip, #44]
	str	r8, [ip, #36]
	str	r2, [ip, #40]
	ldr	r2, [sp, #4]
	str	r2, [ip, #44]
	b	.L69
.L80:
	.align	2
.L79:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L83
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L83+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillHalfScreens3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillHalfScreens3, %function
fillHalfScreens3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L100
	push	{r4, r5, r6, lr}
	ldr	ip, [r3]
	mov	lr, r2
	ldr	r4, .L100+4
	ldr	r5, .L100+8
	b	.L86
.L97:
	cmp	r3, #0
	addeq	lr, lr, #1
	rsb	r6, lr, lr, lsl #4
	add	r3, r3, r6, lsl #4
	lsl	r3, r3, #1
	cmp	r2, r5
	strh	r0, [ip, r3]	@ movhi
	beq	.L96
.L89:
	add	r2, r2, #1
.L86:
	umull	r6, r3, r4, r2
	lsr	r3, r3, #6
	rsb	r3, r3, r3, lsl #4
	cmp	r2, #0
	sub	r3, r2, r3, lsl #3
	bne	.L97
	rsb	r3, lr, lr, lsl #4
	lsl	r3, r3, #5
	strh	r0, [ip, r3]	@ movhi
	b	.L89
.L96:
	mov	r2, #0
	ldr	r4, .L100+4
	mov	r0, r2
	ldr	r5, .L100+8
	b	.L90
.L99:
	cmp	r3, #0
	addeq	r0, r0, #1
	rsb	lr, r0, r0, lsl #4
	add	r3, r3, lr, lsl #4
	add	r3, ip, r3, lsl #1
	cmp	r2, r5
	strh	r1, [r3, #240]	@ movhi
	beq	.L98
.L93:
	add	r2, r2, #1
.L90:
	umull	lr, r3, r4, r2
	lsr	r3, r3, #6
	rsb	r3, r3, r3, lsl #4
	cmp	r2, #0
	sub	r3, r2, r3, lsl #3
	bne	.L99
	rsb	r3, r0, r0, lsl #4
	add	r3, ip, r3, lsl #5
	strh	r1, [r3, #240]	@ movhi
	b	.L93
.L98:
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.word	-2004318071
	.word	19199
	.size	fillHalfScreens3, .-fillHalfScreens3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L104
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L104+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	r4, #0
	ldr	r5, .L115
	add	r2, r0, r2
	rsb	lr, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [r5]
	add	lr, r1, lr, lsl #4
	ldr	ip, [sp, #12]
	add	r1, r1, r0, lsl #4
	ldr	r0, [r5, #4]
	add	lr, r2, lr, lsl #1
	add	r1, r2, r1, lsl #1
	orr	r2, r3, #-2147483648
	lsl	r3, r3, #1
.L108:
	str	r4, [r0, #44]
	str	ip, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, lr
	str	r2, [r0, #44]
	add	ip, ip, r3
	bne	.L108
	pop	{r4, r5, lr}
	bx	lr
.L116:
	.align	2
.L115:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	ldr	r6, [sp, #24]
	ble	.L117
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L122
	add	r4, r0, r2
	add	r5, r3, r3, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r5, r5, #1
	ldm	lr, {r7, lr}
	add	r4, r1, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r1, r1, r0, lsl #4
.L119:
	add	r0, ip, ip, lsr #31
	add	r2, r1, r1, lsr #31
	bic	r0, r0, #1
	bic	r2, r2, #1
	add	r1, r1, #240
	add	r0, r6, r0
	add	r2, r7, r2
	cmp	r4, r1
	str	r8, [lr, #44]
	add	ip, ip, r3
	str	r0, [lr, #36]
	str	r2, [lr, #40]
	str	r5, [lr, #44]
	bne	.L119
.L117:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L125
	ldr	r1, .L125+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L126:
	.align	2
.L125:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L128
	ldr	r1, .L128+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L129:
	.align	2
.L128:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L131:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L131
	mov	r2, #67108864
.L132:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L132
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L139
	moveq	r2, #100663296
	ldr	r0, .L139+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L140:
	.align	2
.L139:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L143
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L149
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L151
.L149:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L151:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L149
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L156
	add	r2, r3, #1024
.L153:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L153
	bx	lr
.L157:
	.align	2
.L156:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 50) 8.2.0"
