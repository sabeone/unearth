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
	.file	"main.c"
	.text
	.align	2
	.global	toSplash
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	toSplash, %function
toSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L4
	ldr	r3, .L4+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+8
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	seed
	.word	initStart
	.word	state
	.size	toSplash, .-toSplash
	.align	2
	.global	toRules
	.syntax unified
	.arm
	.fpu softvfp
	.type	toRules, %function
toRules:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r4, #67108864
	ldr	r5, .L8
	strh	r2, [r4, #16]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L8+4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+8
	mov	r2, #100663296
	ldr	r1, .L8+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r0, #7936
	mov	r1, #256
	mov	r2, #1
	ldr	r3, .L8+24
	strh	r0, [r4, #8]	@ movhi
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	rulesBGPal
	.word	4768
	.word	rulesBGTiles
	.word	100726784
	.word	rulesBGMap
	.word	state
	.size	toRules, .-toRules
	.align	2
	.global	toGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	toGame, %function
toGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r5, #67108864
	ldr	r4, .L12
	strh	r2, [r5, #16]	@ movhi
	mov	r3, #256
	ldr	r2, .L12+4
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L12+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1280
	mov	r2, #100663296
	ldr	r1, .L12+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+36
	ldr	r1, .L12+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #24320
	mov	r3, #4352
	strh	r2, [r5, #8]	@ movhi
	strh	r3, [r5]	@ movhi
	ldr	r2, .L12+44
	mov	r3, #1
	ldr	r4, .L12+48
	ldr	r1, .L12+52
	ldr	r0, .L12+56
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L12+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	groundBGPal
	.word	groundBGTiles
	.word	100726784
	.word	groundBGMap
	.word	11025
	.word	playSoundA
	.word	1124352
	.word	GameMusic
	.word	state
	.size	toGame, .-toGame
	.align	2
	.global	rules
	.syntax unified
	.arm
	.fpu softvfp
	.type	rules, %function
rules:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L26
	ldr	r3, [r4]
	ldr	r6, .L26+4
	add	r3, r3, #1
	ldr	r2, .L26+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L15
	ldr	r2, .L26+12
	ldrh	r2, [r2]
	ands	r5, r2, #4
	beq	.L24
.L15:
	tst	r3, #8
	beq	.L14
	ldr	r3, .L26+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L25
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	r0, [r4]
	ldr	r3, .L26+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	toGame
.L24:
	ldr	r3, .L26+24
	str	r5, [r4]
	mov	lr, pc
	bx	r3
	ldr	r2, .L26+28
	ldrh	r3, [r6]
	str	r5, [r2]
	b	.L15
.L27:
	.align	2
.L26:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	srand
	.word	initGame
	.word	initStart
	.word	state
	.size	rules, .-rules
	.align	2
	.global	splash
	.syntax unified
	.arm
	.fpu softvfp
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldr	r3, [r4]
	ldr	r2, .L34+4
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r5, .L34+8
	mov	lr, pc
	bx	r2
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	cmn	r3, #64
	blt	.L32
	cmp	r3, #336
	bgt	.L33
.L28:
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	bl	toRules
	ldr	r3, [r5]
	cmp	r3, #336
	ble	.L28
.L33:
	ldr	r0, [r4]
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	toGame
.L35:
	.align	2
.L34:
	.word	seed
	.word	updateStart
	.word	hOff
	.word	drawStart
	.word	waitForVBlank
	.word	srand
	.word	initGame
	.size	splash, .-splash
	.align	2
	.global	toPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	toPause, %function
toPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L38
	mov	r2, #83886080
	ldr	r1, .L38+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #928
	mov	r2, #100663296
	ldr	r1, .L38+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L38+12
	ldr	r1, .L38+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	ip, #7936
	mov	r0, #256
	mov	r1, #3
	ldr	r2, .L38+20
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	ldr	r3, .L38+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	DMANow
	.word	pauseBGPal
	.word	pauseBGTiles
	.word	100726784
	.word	pauseBGMap
	.word	state
	.word	pauseSound
	.size	toPause, .-toPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L52
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L52+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L41:
	tst	r3, #4
	beq	.L40
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L51
.L40:
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	ldr	r2, .L52+12
	ldr	r1, .L52+16
	ldr	r0, .L52+20
	mov	r3, #1
	ldr	r5, .L52+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L52+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L52+32
	ldr	r3, .L52+36
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+40
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	ldr	r3, .L52+28
	mov	lr, pc
	bx	r3
	bl	toGame
	ldrh	r3, [r4]
	b	.L41
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	11025
	.word	1477152
	.word	ScreenMusic
	.word	playSoundA
	.word	unpauseSound
	.word	seed
	.word	initStart
	.word	state
	.size	pause, .-pause
	.align	2
	.global	toWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	toWin, %function
toWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	ldr	r4, .L56+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L56+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L56+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2224
	mov	r2, #100663296
	ldr	r1, .L56+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L56+20
	ldr	r1, .L56+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936
	mov	r2, #256
	mov	lr, #4
	ldr	ip, .L56+28
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r4, .L56+32
	mov	r3, #1
	ldr	r2, .L56+36
	ldr	r1, .L56+40
	ldr	r0, .L56+44
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winBGPal
	.word	winBGTiles
	.word	100726784
	.word	winBGMap
	.word	state
	.word	playSoundA
	.word	11025
	.word	1477152
	.word	ScreenMusic
	.size	toWin, .-toWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L65
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L64
.L58:
	pop	{r4, lr}
	bx	lr
.L64:
	ldr	r2, .L65+12
	ldr	r3, .L65+16
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+20
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	initStart
	.word	state
	.size	win, .-win
	.align	2
	.global	toLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	toLose, %function
toLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L71+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L71+12
	ldr	r3, [r3]
	cmp	r3, #0
	mov	r2, #83886080
	mov	r3, #256
	beq	.L68
	ldr	r1, .L71+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2352
	mov	r2, #100663296
	ldr	r1, .L71+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L71+24
	ldr	r1, .L71+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
.L69:
	mov	r3, #67108864
	mov	r1, #7936
	mov	r2, #256
	mov	lr, #5
	ldr	ip, .L71+32
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r4, .L71+36
	mov	r3, #1
	ldr	r2, .L71+40
	ldr	r1, .L71+44
	ldr	r0, .L71+48
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L68:
	ldr	r1, .L71+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2192
	mov	r2, #100663296
	ldr	r1, .L71+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L71+24
	ldr	r1, .L71+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L69
.L72:
	.align	2
.L71:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	queenActivated
	.word	loseBGPal
	.word	loseBGTiles
	.word	100726784
	.word	loseBGMap
	.word	state
	.word	playSoundA
	.word	11025
	.word	1477152
	.word	ScreenMusic
	.word	lose2BGPal
	.word	lose2BGTiles
	.word	lose2BGMap
	.size	toLose, .-toLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L84
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L74
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
.L74:
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L84+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L84+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L75
	ldr	r3, .L84+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L77
	bgt	.L83
.L75:
	ldr	r3, .L84+40
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L77
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	toLose
.L83:
	pop	{r4, lr}
	b	toWin
.L82:
	bl	toPause
	b	.L74
.L85:
	.align	2
.L84:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	flipPage
	.word	DMANow
	.word	shadowOAM
	.word	locCount
	.word	curCollect
	.word	queenActivated
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	mov	r4, #0
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L98+8
	mov	r3, #1
	ldr	r2, .L98+12
	ldr	r1, .L98+16
	ldr	r0, .L98+20
	mov	lr, pc
	bx	r5
	ldr	r6, .L98+24
	ldr	r2, .L98+28
	ldr	r3, .L98+32
	str	r4, [r2]
	ldr	r8, .L98+36
	mov	lr, pc
	bx	r3
	ldr	r5, .L98+40
	str	r4, [r6]
	mov	r2, r4
	ldr	fp, .L98+44
	ldr	r10, .L98+48
	ldr	r9, .L98+52
	ldr	r7, .L98+56
	ldr	r4, .L98+60
.L87:
	ldrh	r3, [r8]
.L88:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L88
.L90:
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
	.word	.L89
.L89:
	mov	lr, pc
	bx	r7
.L95:
	ldr	r2, [r6]
	b	.L87
.L91:
	ldr	r3, .L98+64
	mov	lr, pc
	bx	r3
	b	.L95
.L92:
	mov	lr, pc
	bx	r9
	b	.L95
.L93:
	mov	lr, pc
	bx	r10
	b	.L95
.L94:
	mov	lr, pc
	bx	fp
	b	.L95
.L99:
	.align	2
.L98:
	.word	setupSounds
	.word	setupInterrupts
	.word	playSoundA
	.word	11025
	.word	1477152
	.word	ScreenMusic
	.word	state
	.word	seed
	.word	initStart
	.word	buttons
	.word	oldButtons
	.word	splash
	.word	rules
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
