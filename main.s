	.cpu arm7tdmi
	.fpu softvfp
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
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L10
	mov	lr, pc
	bx	r4
	mov	r0, #0
	ldr	r3, .L10+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L10+8
	ldr	r3, .L10+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L10+16
	ldr	r3, .L10+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r1, .L10+28
	mov	r0, #67108864
	ldr	r3, [r1]
	b	.L3
.L2:
	add	r3, r3, #1
	str	r3, [r1]
.L3:
	ldr	r2, [r0, #304]
	tst	r2, #8
	bne	.L2
	cmp	r3, #10
	ble	.L2
	mov	r0, #0
	ldr	r3, .L10+32
	ldr	r2, .L10+36
	str	r0, [r1]
	str	r2, [r3]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	flipPage
	.word	fillScreen4
	.word	instrPal
	.word	loadPalette
	.word	instrBitmap
	.word	drawBackgroundImage4
	.word	waitForVblank
	.word	.LANCHOR0
	.word	state
	.word	splash
	.size	instructions, .-instructions
	.align	2
	.type	drawBossBullets.part.0, %function
drawBossBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L17
	ldr	r0, [r3, #20]
	ldr	r2, .L17+4
	add	r0, r0, #1
	smull	r1, r2, r0, r2
	mov	r1, r0, asr #31
	rsb	r2, r1, r2, asr #1
	add	r2, r2, r2, asl #2
	subs	r2, r0, r2
	stmfd	sp!, {r4, r5, lr}
	str	r0, [r3, #20]
	beq	.L13
	ldr	r1, [r3, #24]
	mov	r1, r1, asl #21
	add	r1, r1, #327680
	mov	r1, r1, lsr #16
.L14:
	ldr	r0, [r3, #28]
	ldr	lr, .L17+8
	ldr	r2, [r3, #4]
	ldr	r5, [r3, #12]
	mov	r0, r0, asl #3
	ldr	r4, [r3]
	add	ip, lr, r0
	add	r2, r2, r5
	strh	r4, [lr, r0]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	str	r2, [r3, #4]
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L13:
	ldr	r0, [r3, #24]
	add	r0, r0, #1
	cmp	r0, #2
	movle	r1, r0, asl #21
	addle	r1, r1, #327680
	strle	r0, [r3, #24]
	movle	r1, r1, lsr #16
	movgt	r1, #5
	strgt	r2, [r3, #24]
	b	.L14
.L18:
	.align	2
.L17:
	.word	bossBullet
	.word	1717986919
	.word	shadowOAM
	.size	drawBossBullets.part.0, .-drawBossBullets.part.0
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L20
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L24
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L24+4
	ldr	ip, .L24+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	mov	r5, r2
	ldr	r3, .L28+8
	ldr	r3, [r3]
	ldr	lr, .L28+12
	ldr	r6, .L28+16
	mov	r7, r1
	ldr	ip, .L28+20
	mov	r8, r0
	str	r4, [r3, #20]
	mov	r1, r0
	ldr	r2, .L28+24
	mov	r0, #1
	mov	r3, #910163968
	str	r4, [lr]
	mov	lr, pc
	bx	ip
	strh	r4, [r6, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L28+28
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r1, #128
	rsb	r0, r0, #0
	ldr	r4, .L28+32
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r6]	@ movhi
	mov	r0, r7
	strh	r1, [r6, #2]	@ movhi
	ldr	r6, .L28+36
	str	r8, [r4]
	str	r2, [r4, #12]
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	mov	lr, pc
	bx	r6
	adr	r3, .L28
	ldmia	r3, {r2-r3}
	ldr	ip, .L28+40
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r6
	ldr	ip, .L28+44
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L28+48
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L29:
	.align	3
.L28:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	vbCountA
	.word	67109120
	.word	DMANow
	.word	67109024
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	mov	r5, r2
	ldr	r3, .L32+8
	ldr	r3, [r3]
	ldr	lr, .L32+12
	ldr	r6, .L32+16
	mov	r7, r1
	ldr	ip, .L32+20
	mov	r8, r0
	str	r4, [r3, #32]
	mov	r1, r0
	ldr	r2, .L32+24
	mov	r0, #2
	mov	r3, #910163968
	str	r4, [lr]
	mov	lr, pc
	bx	ip
	strh	r4, [r6, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L32+28
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r1, #128
	rsb	r0, r0, #0
	ldr	r4, .L32+32
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r6, #4]	@ movhi
	mov	r0, r7
	strh	r1, [r6, #6]	@ movhi
	ldr	r6, .L32+36
	str	r8, [r4]
	str	r2, [r4, #12]
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	mov	lr, pc
	bx	r6
	adr	r3, .L32
	ldmia	r3, {r2-r3}
	ldr	ip, .L32+40
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r6
	ldr	ip, .L32+44
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L32+48
	mov	lr, pc
	bx	r3
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L33:
	.align	3
.L32:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	vbCountB
	.word	67109120
	.word	DMANow
	.word	67109028
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L50
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L35
	ldr	r2, .L50+4
	ldr	r3, [r2, #12]
	cmp	r3, #0
	ldrne	r1, .L50+8
	ldrne	r3, [r1]
	ldr	r5, .L50+12
	addne	r3, r3, #1
	ldreq	r3, .L50+8
	strne	r3, [r1]
	ldr	r1, [r5, #12]
	ldr	r4, .L50+16
	ldreq	r3, [r3]
	cmp	r1, #0
	ldrne	r1, [r4]
	ldr	r2, [r2, #20]
	addne	r1, r1, #1
	strne	r1, [r4]
	cmp	r2, r3
	ldr	r3, .L50+4
	bgt	.L39
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L40
	ldr	r0, .L50+20
	ldr	r1, .L50+24
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L39:
	ldr	r3, [r4]
	ldr	r2, [r5, #20]
	cmp	r2, r3
	ldr	r3, .L50+12
	bgt	.L41
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L42
	ldr	r0, .L50+20
	ldr	r1, .L50+24
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L41:
	mov	r2, #1
	ldr	r3, .L50
	strh	r2, [r3, #2]	@ movhi
.L35:
	mov	r2, #1
	ldr	r3, .L50
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L42:
	ldmia	r3, {r0, r1, r2}
	bl	playSoundB
	b	.L41
.L40:
	ldmia	r3, {r0, r1, r2}
	bl	playSoundA
	b	.L39
.L51:
	.align	2
.L50:
	.word	67109376
	.word	soundA
	.word	vbCountA
	.word	soundB
	.word	vbCountB
	.word	dma
	.word	67109120
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4864
	mov	r0, #23296
	ldr	r2, .L54
	stmfd	sp!, {r4, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L54+4
	ldr	r3, .L54+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L54+12
	mov	r0, #3
	ldr	r1, .L54+16
	mov	r2, #100663296
	mov	r3, #1760
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L54+20
	ldr	r2, .L54+24
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L54+28
	ldr	r2, .L54+32
	ldr	r3, .L54+36
	mov	lr, pc
	bx	r4
	ldr	ip, .L54+40
	mov	r1, #2048
	mov	r2, #1
	ldr	r0, .L54+44
	mov	r3, #24
	mov	lr, pc
	bx	ip
	ldr	r0, .L54+48
	ldr	r3, .L54+52
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L54+56
	ldr	r2, .L54+60
	mov	lr, pc
	bx	r4
	ldr	r2, .L54+64
	ldr	r0, .L54+68
	ldr	r1, .L54+72
	bl	playSoundA
	mov	r2, #1
	ldr	r3, .L54+76
	ldmfd	sp!, {r4, lr}
	str	r2, [r3, #16]
	bx	lr
.L55:
	.align	2
.L54:
	.word	6148
	.word	streetPal
	.word	loadPalette
	.word	DMANow
	.word	streetTiles
	.word	streetMap
	.word	100718592
	.word	skylineTiles
	.word	100679680
	.word	9952
	.word	loadMap
	.word	skylineMap
	.word	newSpritesheetPal
	.word	loadSpritePalette
	.word	newSpritesheetTiles
	.word	100728832
	.word	11025
	.word	gameSong
	.word	111519
	.word	soundA
	.size	initializeGame, .-initializeGame
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L61
	mov	lr, pc
	bx	r4
	mov	r0, #0
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L61+8
	ldr	r3, .L61+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L61+16
	ldr	r3, .L61+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
.L57:
	ldr	r3, [r2, #304]
	tst	r3, #4
	bne	.L57
	bl	initializeGame
	ldr	r3, .L61+28
	ldr	r2, .L61+32
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	flipPage
	.word	fillScreen4
	.word	pausePal
	.word	loadPalette
	.word	pauseBitmap
	.word	drawBackgroundImage4
	.word	waitForVblank
	.word	state
	.word	game
	.size	pause, .-pause
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r6, #0
	mov	r4, #67108864
	ldr	r3, .L75
	ldr	r5, .L75+4
	sub	sp, sp, #164
	str	r6, [r5]
	ldr	r7, .L75+8
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r0, r6
	ldr	r3, .L75+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L75+16
	ldr	r3, .L75+20
	mov	lr, pc
	bx	r3
	ldr	r0, .L75+24
	ldr	r3, .L75+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+32
	ldmia	r3, {r0, r1, r2}
	ldr	r6, .L75+36
	stmia	sp, {r0, r1, r2}
	mov	r3, #6
	mov	r2, sp
	mov	r0, #10
	mov	r1, #5
	mov	lr, pc
	bx	r6
	ldr	r3, .L75+40
	ldmia	r3, {r0, r1}
	add	r2, sp, #40
	stmia	r2, {r0, r1}
	mov	r3, #6
	mov	r0, #20
	mov	r1, #5
	mov	lr, pc
	bx	r6
	ldr	r3, .L75+44
	ldmia	r3, {r0, r1, r2, r3}
	add	ip, sp, #80
	stmia	ip!, {r0, r1, r2}
	add	r2, sp, #80
	strb	r3, [ip]
	mov	r0, #50
	mov	r1, #140
	mov	r3, #6
	mov	lr, pc
	bx	r6
	ldr	lr, .L75+48
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #120
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, [lr]
	add	r2, sp, #120
	mov	r1, #140
	mov	r0, #60
	strb	lr, [ip]
	mov	r3, #6
	mov	lr, pc
	bx	r6
	ldr	r3, .L75+52
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r7
	mov	r1, r4
	ldr	r2, [r5]
	b	.L68
.L74:
	cmp	r2, #20
	bgt	.L73
	ldr	r3, [r1, #304]
.L67:
	add	r2, r2, #1
	str	r2, [r5]
.L68:
	ldr	r3, [r1, #304]
	mvn	r3, r3
	ands	r3, r3, #8
	bne	.L74
	ldr	r0, [r1, #304]
	tst	r0, #4
	bne	.L67
	cmp	r2, #20
	ble	.L67
	ldr	r2, .L75+56
	ldr	r1, .L75+60
	str	r3, [r5]
	str	r1, [r2]
	add	sp, sp, #164
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L73:
	mov	r1, #0
	ldr	r3, .L75+56
	ldr	r2, .L75+64
	str	r1, [r5]
	str	r2, [r3]
	bl	initializeGame
	add	sp, sp, #164
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	1028
	.word	.LANCHOR0
	.word	flipPage
	.word	fillScreen4
	.word	splashPal
	.word	loadPalette
	.word	splashBitmap
	.word	drawBackgroundImage4
	.word	.LC0
	.word	drawString4
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	waitForVblank
	.word	state
	.word	instructions
	.word	game
	.size	splash, .-splash
	.align	2
	.global	initializeSplash
	.type	initializeSplash, %function
initializeSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r3, #67108864
	ldr	r1, .L78
	ldr	r2, .L78+4
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	bx	lr
.L79:
	.align	2
.L78:
	.word	.LANCHOR0
	.word	1028
	.size	initializeSplash, .-initializeSplash
	.align	2
	.global	initializePause
	.type	initializePause, %function
initializePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L81
	strh	r2, [r3]	@ movhi
	bx	lr
.L82:
	.align	2
.L81:
	.word	1028
	.size	initializePause, .-initializePause
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L86
.L84:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L84
	bx	lr
.L87:
	.align	2
.L86:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	execute
	.type	execute, %function
execute:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	r0	@ indirect register sibling call
	.size	execute, .-execute
	.align	2
	.global	drawKil
	.type	drawKil, %function
drawKil:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L90
	ldmia	r1, {r2, r3}
	mvn	r2, r2, asl #17
	mvn	r3, r3, asl #17
	mvn	r2, r2, lsr #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #28]
	ldr	r1, .L90+4
	mov	r0, r0, asl #7
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L91:
	.align	2
.L90:
	.word	kil
	.word	shadowOAM
	.size	drawKil, .-drawKil
	.align	2
	.global	drawBullets
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L106
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	add	ip, r3, #320
	mov	r5, #0
	ldr	r4, .L106+4
	ldr	lr, .L106+8
	b	.L98
.L105:
	ldr	r0, [r3, #24]
	mov	r0, r0, asl #21
	add	r0, r0, #262144
	mov	r0, r0, lsr #16
.L96:
	ldr	r2, [r3, #28]
	ldr	r8, [r3, #12]
	mov	r2, r2, asl #3
	ldr	r7, [r3]
	add	r6, lr, r2
	add	r1, r1, r8
	strh	r7, [lr, r2]	@ movhi
	strh	r0, [r6, #4]	@ movhi
	strh	r1, [r6, #2]	@ movhi
	str	r1, [r3, #4]
.L94:
	add	r3, r3, #32
	cmp	r3, ip
	beq	.L104
.L98:
	ldr	r1, [r3, #4]
	cmp	r1, #240
	strgt	r5, [r3, #16]
	bgt	.L94
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L94
	ldr	r0, [r3, #20]
	add	r0, r0, #1
	smull	r2, r6, r4, r0
	mov	r2, r0, asr #31
	rsb	r2, r2, r6, asr #1
	add	r2, r2, r2, asl #2
	subs	r2, r0, r2
	str	r0, [r3, #20]
	bne	.L105
	ldr	r6, [r3, #24]
	add	r6, r6, #1
	mov	r0, r6, asl #21
	cmp	r6, #3
	add	r0, r0, #262144
	strle	r6, [r3, #24]
	movle	r0, r0, lsr #16
	movgt	r0, #4
	strgt	r2, [r3, #24]
	b	.L96
.L104:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	bullets
	.word	1717986919
	.word	shadowOAM
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L121
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, .L121+4
	ldr	r4, .L121+8
	add	lr, r3, #640
	b	.L113
.L120:
	ldr	r6, [r3, #8]
	mov	r6, r6, asl #23
	add	r6, r6, #131072
	mov	r6, r6, lsr #16
.L111:
	ldr	r2, [r3, #-16]
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r3, #-12]
	ldr	r8, [r3, #-4]
	ldr	ip, [r3, #12]
	ldr	r7, .L121+12
	add	r0, r0, r8
	mov	ip, ip, asl #3
	add	r8, r4, ip
	add	r1, r1, #1
	orr	r7, r0, r7
	str	r1, [r3, #4]
	strh	r2, [r4, ip]	@ movhi
	strh	r6, [r8, #4]	@ movhi
	str	r0, [r3, #-12]
	strh	r7, [r8, #2]	@ movhi
.L109:
	add	r3, r3, #32
	cmp	r3, lr
	beq	.L119
.L113:
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L109
	ldr	r1, [r3, #4]
	smull	r2, r0, r5, r1
	mov	r2, r1, asr #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, asl #2
	subs	r2, r1, r2, asl #1
	bne	.L120
	ldr	r0, [r3, #8]
	add	r0, r0, #1
	cmp	r0, #1
	movle	r6, r0, asl #23
	addle	r6, r6, #131072
	strle	r0, [r3, #8]
	movle	r6, r6, lsr #16
	movgt	r6, #2
	strgt	r2, [r3, #8]
	b	.L111
.L119:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L122:
	.align	2
.L121:
	.word	enemies+16
	.word	1717986919
	.word	shadowOAM
	.word	-28672
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	spawnEnemy
	.type	spawnEnemy, %function
spawnEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L129
	mov	r2, #0
	mov	r3, r0
	stmfd	sp!, {r4, r5, lr}
.L125:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L126
	add	r2, r2, #1
	cmp	r2, #20
	add	r3, r3, #32
	bne	.L125
.L124:
	mov	r5, #1
	mov	r4, #240
	mvn	lr, #0
	ldr	r2, .L129+4
	ldr	r3, .L129+8
	ldr	r1, [r2, #4]
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #3
	add	r2, r3, r3, asl #3
	add	r3, r3, r2, asl #1
	ldr	r2, .L129+12
	rsb	r3, r3, r1
	ldr	r2, [r2, r3, asl #2]
	add	r3, r0, ip, asl #5
	str	r5, [r3, #16]
	str	r4, [r3, #4]
	str	lr, [r3, #12]
	str	r2, [r0, ip, asl #5]
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L126:
	mov	ip, r2
	b	.L124
.L130:
	.align	2
.L129:
	.word	enemies
	.word	.LANCHOR0
	.word	1808407283
	.word	.LANCHOR1
	.size	spawnEnemy, .-spawnEnemy
	.align	2
	.global	checkCollisions
	.type	checkCollisions, %function
checkCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #0
	ldr	r3, .L153
	ldr	lr, [r3]
	ldr	r3, [r3, #4]
	sub	sp, sp, #20
	add	r3, r3, #16
	str	r3, [sp, #8]
	ldr	r3, .L153
	ldr	fp, [r3, #36]
	ldr	r3, .L153+4
	add	r2, lr, #32
	ldr	r1, .L153+8
	str	r2, [sp, #12]
	ldr	r6, [r3]
	ldr	r2, .L153+12
	ldr	r9, .L153+16
	add	r7, r1, #640
.L132:
	ldr	ip, [r1]
	add	r4, ip, #24
	mov	r5, r4
	ldr	r0, [r1, #16]
	ldr	r3, .L153+20
.L134:
	ldr	r4, [r3, #16]
	cmp	r4, #0
	beq	.L133
	cmp	r0, #0
	beq	.L133
	ldr	r4, [r3, #4]
	ldr	r8, [r1, #4]
	add	r4, r4, #8
	cmp	r4, r8
	blt	.L133
	ldr	r4, [r3]
	cmp	r4, ip
	blt	.L133
	cmp	r4, r5
	bgt	.L133
	ldr	r4, [r1, #28]
	mov	r4, r4, asl #3
	str	r4, [sp]
	mov	r4, #512
	str	r4, [sp, #4]
	ldr	r8, [r3, #28]
	ldrh	r4, [sp, #4]
	mov	r8, r8, asl #3
	strh	r4, [r9, r8]	@ movhi
	mov	r8, #512
	mov	r0, #0
	ldr	r4, [sp]
	str	r10, [r3, #16]
	str	r10, [r1, #16]
	strh	r8, [r9, r4]	@ movhi
	add	r6, r6, #1
.L133:
	add	r3, r3, #32
	cmp	r3, r2
	bne	.L134
	cmp	r0, #0
	beq	.L135
	ldr	r3, [r1, #4]
	cmp	r3, #0
	ble	.L151
.L135:
	cmp	lr, ip
	bge	.L152
.L136:
	ldr	r3, [sp, #12]
	cmp	r3, ip
	blt	.L138
.L137:
	ldr	r3, [r1, #4]
	ldr	r0, [sp, #8]
	cmp	r0, r3
	blt	.L138
	mov	r0, #512
	ldr	r3, [r1, #28]
	mov	r3, r3, asl #3
	str	r10, [r1, #16]
	strh	r0, [r9, r3]	@ movhi
	sub	fp, fp, #1
.L138:
	add	r1, r1, #32
	cmp	r1, r7
	bne	.L132
	ldr	r3, .L153+4
	str	r6, [r3]
	ldr	r3, .L153
	str	fp, [r3, #36]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L152:
	add	r3, ip, #32
	cmp	lr, r3
	ble	.L137
	cmp	lr, ip
	bgt	.L138
	b	.L136
.L151:
	mov	r0, #512
	ldr	r3, [r1, #28]
	mov	r3, r3, asl #3
	str	r10, [r1, #16]
	strh	r0, [r9, r3]	@ movhi
	sub	fp, fp, #1
	b	.L135
.L154:
	.align	2
.L153:
	.word	kil
	.word	score
	.word	enemies
	.word	bullets+320
	.word	shadowOAM
	.word	bullets
	.size	checkCollisions, .-checkCollisions
	.align	2
	.global	spawnBoss
	.type	spawnBoss, %function
spawnBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #1
	mov	r2, #0
	mov	ip, #75
	mov	r0, #220
	ldr	r3, .L157
	ldr	r1, [r3, #20]
	add	r1, r1, lr
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L158:
	.align	2
.L157:
	.word	boss
	.size	spawnBoss, .-spawnBoss
	.align	2
	.global	drawBoss
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L170
	ldr	r3, .L170+4
	ldr	r1, [r2, #20]
	smull	ip, r0, r3, r1
	mov	r3, r1, asr #31
	rsb	r3, r3, r0, asr #3
	add	r3, r3, r3, asl #2
	cmp	r1, r3, asl #2
	stmfd	sp!, {r4, r5, lr}
	bne	.L161
	ldr	r3, [r2, #24]
	add	r3, r3, #1
	cmp	r3, #1
	movgt	r3, #0
	str	r3, [r2, #24]
.L161:
	ldr	r1, .L170+8
	ldr	r3, [r1, #16]
	cmp	r3, #0
	beq	.L164
	ldmia	r2, {r3, lr}
.L165:
	ldr	r1, [r2, #36]
	ldr	r0, .L170
	cmp	r1, #0
	subne	r1, r1, #1
	strne	r1, [r0, #36]
	bne	.L168
	ldr	r1, .L170+12
	ldr	r1, [r1]
	cmp	r1, r3
	sublt	r3, r3, #1
	addge	r3, r3, #1
	str	r3, [r0]
.L168:
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r2, #28]
	ldr	ip, .L170+16
	ldr	r1, .L170+20
	mov	r2, r2, asl #3
	ldr	r4, .L170+24
	add	r0, ip, r2
	orr	r1, lr, r1
	strh	r4, [r0, #4]	@ movhi
	strh	r3, [ip, r2]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L164:
	mov	r4, #32
	mov	ip, #1
	mvn	r0, #3
	ldmia	r2, {r3, lr}
	add	r5, r3, #16
	str	r5, [r1]
	str	r4, [r1, #28]
	str	ip, [r1, #16]
	str	r0, [r1, #12]
	str	lr, [r1, #4]
	b	.L165
.L171:
	.align	2
.L170:
	.word	boss
	.word	1717986919
	.word	bossBullet
	.word	kil
	.word	shadowOAM
	.word	-28672
	.word	258
	.size	drawBoss, .-drawBoss
	.align	2
	.global	bossShoot
	.type	bossShoot, %function
bossShoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #32
	mov	r0, #1
	mvn	r1, #3
	ldr	r3, .L174
	str	lr, [sp, #-4]!
	ldmia	r3, {r2, lr}
	ldr	r3, .L174+4
	add	r2, r2, #16
	stmia	r3, {r2, lr}
	str	ip, [r3, #28]
	str	r0, [r3, #16]
	str	r1, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L175:
	.align	2
.L174:
	.word	boss
	.word	bossBullet
	.size	bossShoot, .-bossShoot
	.align	2
	.global	drawBossBullets
	.type	drawBossBullets, %function
drawBossBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L178
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	drawBossBullets.part.0
.L179:
	.align	2
.L178:
	.word	bossBullet
	.size	drawBossBullets, .-drawBossBullets
	.align	2
	.global	bossCollisions
	.type	bossCollisions, %function
bossCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r8, #0
	mov	r7, #512
	ldr	r0, .L205
	ldr	r3, .L205+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	ldr	r5, [r0, #32]
	ldr	r6, .L205+8
	add	r4, lr, #24
	add	r1, r3, #320
.L182:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L181
	ldr	r2, [r3, #4]
	add	r2, r2, #8
	cmp	r2, ip
	blt	.L181
	ldr	r2, [r3]
	cmp	r2, lr
	blt	.L181
	cmp	r2, r4
	ldrle	r2, [r3, #28]
	movle	r2, r2, asl #3
	strle	r8, [r3, #16]
	strleh	r7, [r6, r2]	@ movhi
	suble	r5, r5, #10
.L181:
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L182
	ldr	r4, .L205+12
	ldr	r3, [r4, #16]
	cmp	r3, #0
	str	r5, [r0, #32]
	beq	.L185
	ldr	r1, .L205+16
	ldr	r2, [r4]
	ldr	r3, [r1]
	cmp	r2, r3
	bge	.L204
.L185:
	ldr	r5, [r4, #4]
.L184:
	ldr	r2, .L205+20
	ldr	r3, .L205+24
	ldr	r2, [r2, #4]
	smull	ip, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, asl #2
	cmp	r2, r3
	bne	.L193
	ldr	lr, [r0, #4]
	ldr	r3, .L205+28
	ldr	ip, [r0]
	ldr	r7, [r0, #36]
	sub	lr, lr, #19
	add	r1, r3, #320
.L192:
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L189
	ldr	r2, [r3, #-12]
	cmp	lr, r2
	bgt	.L189
	ldr	r2, [r3, #-16]
	cmp	ip, r2
	add	r6, ip, #24
	bgt	.L189
	cmp	r2, r6
	bgt	.L189
	mov	r7, #30
	cmp	ip, #40
	subgt	ip, ip, #32
	addle	ip, ip, #32
.L189:
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L192
	str	ip, [r0]
	str	r7, [r0, #36]
.L193:
	cmp	r5, #0
	movle	r3, #0
	strle	r3, [r4, #16]
.L180:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L204:
	add	r3, r3, #24
	cmp	r2, r3
	bgt	.L185
	ldr	r3, [r1, #4]
	ldr	r5, [r4, #4]
	add	r3, r3, #16
	cmp	r5, r3
	bgt	.L184
	mov	r6, #512
	mov	ip, #0
	ldr	r2, [r1, #36]
	ldr	r3, [r4, #28]
	ldr	lr, .L205+8
	sub	r2, r2, #1
	mov	r3, r3, asl #3
	str	r2, [r1, #36]
	strh	r6, [lr, r3]	@ movhi
	str	ip, [r4, #16]
	b	.L184
.L206:
	.align	2
.L205:
	.word	boss
	.word	bullets
	.word	shadowOAM
	.word	bossBullet
	.word	kil
	.word	.LANCHOR0
	.word	1717986919
	.word	bullets+16
	.size	bossCollisions, .-bossCollisions
	.align	2
	.global	shoot
	.type	shoot, %function
shoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L213
	mov	r2, #0
	mov	r3, r4
.L209:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L210
	add	r2, r2, #1
	cmp	r2, #10
	add	r3, r3, #32
	bne	.L209
.L208:
	ldr	r0, .L213+4
	ldr	r1, .L213+8
	ldr	r2, .L213+12
	bl	playSoundB
	mov	r6, #1
	mov	r2, #0
	mov	lr, #2
	ldr	r3, .L213+16
	ldmia	r3, {r0, r1}
	ldr	ip, .L213+20
	add	r3, r4, r5, asl #5
	add	r1, r1, #16
	add	r0, r0, #16
	str	r0, [r4, r5, asl #5]
	str	r6, [r3, #16]
	str	lr, [r3, #12]
	str	r1, [r3, #4]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [ip, #16]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L210:
	mov	r5, r2
	b	.L208
.L214:
	.align	2
.L213:
	.word	bullets
	.word	shootSFX
	.word	11025
	.word	3070
	.word	kil
	.word	soundB
	.size	shoot, .-shoot
	.global	__aeabi_idivmod
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r6, .L282
	ldr	r3, [r6]
	ldr	r4, .L282+4
	cmp	r3, #0
	ldreq	r3, [r4, #8]
	addeq	r3, r3, #1
	streq	r3, [r4, #8]
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ldr	r3, .L282+4
	bne	.L217
	ldr	r2, .L282+8
	ldr	r2, [r2]
	cmp	r2, #90
	moveq	r2, #1
	streq	r2, [r3, #12]
.L217:
	ldr	r5, .L282+12
	ldr	r2, .L282+16
	ldr	r3, [r5, #24]
	smull	r0, r1, r2, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	bne	.L219
	ldr	r2, [r5, #28]
	add	r2, r2, #1
	cmp	r2, #1
	movgt	r2, #0
	str	r2, [r5, #28]
.L219:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	add	r3, r3, #1
	tst	r2, #64
	str	r3, [r5, #24]
	ldr	r3, .L282+12
	bne	.L222
	ldr	r2, [r3]
	cmp	r2, #2
	bgt	.L277
.L223:
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
.L222:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L224
	ldr	r2, .L282+8
	ldr	r3, [r2]
	cmp	r3, #89
	bgt	.L225
	ldr	r1, [r4, #12]
	cmp	r1, #0
	ldr	r1, .L282+4
	bne	.L225
	ldr	r0, [r1, #16]
	add	r3, r3, #1
	add	r0, r0, #1
	str	r3, [r2]
	str	r0, [r1, #16]
.L224:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L226
	ldr	r3, [r5, #4]
	ldr	r2, .L282+12
	cmp	r3, #2
	ldrgt	r1, [r2, #40]
	rsbgt	r3, r1, r3
	strgt	r3, [r2, #4]
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
.L226:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldreq	r3, [r5, #4]
	ldreq	r2, [r5, #40]
	addeq	r3, r3, r2
	streq	r3, [r5, #4]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #2
	ldr	r3, [r5, #32]
	subne	r3, r3, #1
	strne	r3, [r5, #32]
	bne	.L230
	cmp	r3, #0
	ldr	r7, .L282+12
	ble	.L278
.L230:
	mov	r2, #67108864
	ldr	r3, [r2, #304]
	tst	r3, #8
	ldr	r3, [r4]
	bne	.L232
	cmp	r3, #20
	ldr	r1, .L282+4
	bgt	.L279
.L232:
	add	r3, r3, #1
	str	r3, [r4]
.L233:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #512
	moveq	r2, #5
	moveq	r1, #3
	ldreq	r3, .L282+20
	streq	r2, [r3]
	ldr	r2, .L282+24
	streq	r1, [r5, #40]
	ldr	r3, .L282+28
	ldr	r1, [r2, #80]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldr	r7, .L282+4
	bne	.L237
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L280
.L237:
	ldr	r3, [r6]
.L236:
	ldr	r2, [r5, #36]
	cmp	r2, #0
	bne	.L238
	mov	ip, #67108864
	ldr	lr, .L282+32
	ldr	r1, .L282+36
	ldr	r0, .L282+40
	str	r2, [r4]
	strh	lr, [ip]	@ movhi
	str	r0, [r1]
.L239:
	cmp	r3, #0
	bne	.L276
.L244:
	mov	ip, #67108864
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #16]
	add	r0, r2, r2, lsr #31
	add	r1, r3, r3, lsr #31
	mov	r2, r2, asl #16
	mov	r0, r0, asl #15
	mov	r3, r3, asl #16
	mov	r1, r1, asl #15
	mov	r2, r2, lsr #16
	mov	r0, r0, lsr #16
	mov	r3, r3, lsr #16
	mov	r1, r1, lsr #16
	strh	r2, [ip, #16]	@ movhi
	strh	r3, [ip, #18]	@ movhi
	strh	r0, [ip, #20]	@ movhi
	strh	r1, [ip, #22]	@ movhi
	bl	checkCollisions
	ldmia	r5, {r2, r3}
	mvn	r2, r2, asl #17
	mvn	r3, r3, asl #17
	mvn	r2, r2, lsr #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r5, #28]
	ldr	r1, .L282+44
	mov	r0, r0, asl #7
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bl	drawBullets
	bl	drawEnemies
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L245
	bl	drawBoss
	ldr	r3, .L282+48
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L281
.L246:
	bl	bossCollisions
.L247:
	mov	r0, #3
	ldr	r1, .L282+44
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L282+52
	mov	lr, pc
	bx	ip
	ldr	r3, .L282+56
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L245:
	bl	drawEnemies
	b	.L247
.L238:
	ldr	r2, .L282+60
	ldr	r2, [r2]
	cmp	r2, #50
	ble	.L239
	cmp	r3, #0
	beq	.L240
.L276:
	ldr	r2, .L282+64
.L243:
	ldr	r3, [r2, #32]
	cmp	r3, #0
	bne	.L244
	mov	r0, #67108864
	ldr	ip, .L282+32
	ldr	r2, .L282+36
	ldr	r1, .L282+68
	str	r3, [r4]
	strh	ip, [r0]	@ movhi
	str	r1, [r2]
	b	.L244
.L225:
	ldr	r3, [r5]
	ldr	r2, .L282+12
	cmp	r3, #127
	ldrle	r1, [r2, #40]
	addle	r3, r3, r1
	strle	r3, [r2]
	b	.L224
.L277:
	ldr	r1, [r4, #12]
	cmp	r1, #0
	ldrne	r1, [r3, #40]
	rsbne	r2, r1, r2
	strne	r2, [r3]
	b	.L223
.L280:
	ldr	r3, [r6]
	cmp	r3, #0
	ldr	r8, .L282
	bne	.L236
	bl	spawnEnemy
	ldr	r2, [r7, #4]
	add	r2, r2, #1
	ldr	r3, [r8]
	str	r2, [r7, #4]
	b	.L236
.L279:
	mov	ip, #0
	ldr	lr, .L282+32
	ldr	r3, .L282+36
	ldr	r0, .L282+72
	strh	lr, [r2]	@ movhi
	str	ip, [r1]
	str	r0, [r3]
	b	.L233
.L281:
	bl	drawBossBullets.part.0
	b	.L246
.L240:
	mov	r0, #1
	mov	lr, #75
	mov	ip, #220
	ldr	r2, .L282+64
	ldr	r1, [r2, #20]
	add	r1, r1, r0
	str	r3, [r2, #24]
	str	r3, [r2, #12]
	str	r3, [r2, #8]
	str	r3, [r2, #36]
	str	lr, [r2]
	str	ip, [r2, #4]
	str	r1, [r2, #20]
	str	r0, [r2, #16]
	str	r0, [r6]
	b	.L243
.L278:
	bl	shoot
	mov	r2, #2
	ldr	r3, .L282+20
	ldr	r3, [r3]
	str	r2, [r7, #28]
	str	r3, [r7, #32]
	b	.L230
.L283:
	.align	2
.L282:
	.word	bossFight
	.word	.LANCHOR0
	.word	bigRow
	.word	kil
	.word	1717986919
	.word	shootInit
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	1028
	.word	state
	.word	lose
	.word	shadowOAM
	.word	bossBullet
	.word	DMANow
	.word	waitForVblank
	.word	score
	.word	boss
	.word	win
	.word	pause
	.size	game, .-game
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r0, #0
	mov	r2, #67108864
	mov	lr, #4864
	mov	r1, #512
	ldr	ip, .L292
	strh	lr, [r2]	@ movhi
	str	r0, [ip]
	mov	r3, r0
	ldr	lr, [r2, #304]
	ldr	ip, .L292+4
	ldr	r2, .L292+8
	ldr	r0, .L292+12
	str	lr, [ip]
	str	r0, [r2]
	ldr	r2, .L292+16
	sub	sp, sp, #36
.L285:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L285
	mov	r2, #0
	mov	r0, #10
	mov	r1, #100
	mov	lr, #80
	mov	ip, #2
	mov	r5, r2
	mov	r6, sp
	mov	r4, r2
	mov	r9, sp
	ldr	r3, .L292+20
	ldr	r8, .L292+24
	ldr	r7, .L292+28
	str	r2, [r8]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	lr, [r3]
	str	ip, [r3, #40]
	str	r0, [r3, #4]
	str	r0, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r7, #32]
	ldr	r8, .L292+32
.L286:
	mov	lr, r9
	add	r3, r5, #3
	str	r4, [r6]
	str	r4, [sp, #4]
	str	r3, [sp, #28]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, r8, r5, asl #5
	stmia	ip!, {r0, r1, r2, r3}
	str	r4, [sp, #16]
	str	r4, [sp, #20]
	str	r4, [sp, #24]
	add	r5, r5, #1
	ldmia	lr, {r0, r1, r2, r3}
	cmp	r5, #10
	mov	r6, r9
	stmia	ip, {r0, r1, r2, r3}
	bne	.L286
	mov	r5, #0
	mov	r4, r5
	mov	r8, r9
	ldr	r9, .L292+36
.L287:
	mov	lr, r8
	add	r3, r5, #21
	str	r4, [r6]
	str	r4, [sp, #4]
	str	r3, [sp, #28]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, r9, r5, asl #5
	stmia	ip!, {r0, r1, r2, r3}
	str	r4, [sp, #16]
	str	r4, [sp, #20]
	str	r4, [sp, #24]
	add	r5, r5, #1
	ldmia	lr, {r0, r1, r2, r3}
	cmp	r5, #20
	stmia	ip, {r0, r1, r2, r3}
	mov	r6, r8
	mov	r3, #0
	bne	.L287
	mov	r5, #60
	mov	r4, #40
	mov	ip, #10
	ldr	r2, .L292+40
	ldr	lr, .L292+44
	ldr	r0, .L292+48
	ldr	r1, .L292+52
	str	r5, [r7, #28]
	str	r4, [lr, #80]
	str	ip, [r0]
	str	r3, [r2, #4]
	str	r3, [r2, #12]
	str	r3, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #16]
	str	r3, [r1]
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L293:
	.align	2
.L292:
	.word	bigRow
	.word	buttons
	.word	state
	.word	splash
	.word	shadowOAM
	.word	kil
	.word	bossFight
	.word	boss
	.word	bullets
	.word	enemies
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	shootInit
	.word	score
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r7, lr}
	ldr	r3, .L297
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r4, #1
	mov	r7, #128
	mov	r6, #0
	ldr	r2, .L297+4
	ldrh	r0, [r3, #4]
	ldrh	r1, [r2]
	ldr	r5, .L297+8
	ldr	ip, .L297+12
	ldr	lr, .L297+16
	orr	r1, r1, r4
	orr	r0, r0, #8
	strh	r7, [r3, #132]	@ movhi
	strh	r6, [r3, #128]	@ movhi
	strh	r5, [r3, #130]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	r4, .L297+20
	str	lr, [ip, #4092]
.L295:
	ldr	ip, [r4]
	mov	lr, pc
	bx	ip
	b	.L295
.L298:
	.align	2
.L297:
	.word	initialize
	.word	67109376
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.word	state
	.size	main, .-main
	.text
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L307
	mov	lr, pc
	bx	r4
	mov	r0, #0
	ldr	r3, .L307+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L307+8
	ldr	r3, .L307+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L307+16
	ldr	r3, .L307+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L307+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r1, .L307+28
	mov	r0, #67108864
	ldr	r3, [r1]
	b	.L301
.L300:
	add	r3, r3, #1
	str	r3, [r1]
.L301:
	ldr	r2, [r0, #304]
	tst	r2, #4
	mov	r2, #67108864
	bne	.L300
	cmp	r3, #10
	ble	.L300
	mov	r0, #0
	ldr	r3, .L307+32
	str	r0, [r1]
	strh	r3, [r2]	@ movhi
	bl	initialize
	ldr	r3, .L307+36
	ldr	r2, .L307+40
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L308:
	.align	2
.L307:
	.word	flipPage
	.word	fillScreen4
	.word	winPal
	.word	loadPalette
	.word	winBitmap
	.word	drawBackgroundImage4
	.word	waitForVblank
	.word	.LANCHOR0
	.word	1028
	.word	state
	.word	splash
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L314
	mov	lr, pc
	bx	r4
	mov	r0, #0
	ldr	r3, .L314+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L314+8
	ldr	r3, .L314+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L314+16
	ldr	r3, .L314+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L314+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
.L310:
	ldr	r3, [r2, #304]
	tst	r3, #4
	mov	r3, #67108864
	bne	.L310
	mov	r0, #0
	ldr	r1, .L314+28
	ldr	r2, .L314+32
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	bl	initialize
	ldr	r3, .L314+36
	ldr	r2, .L314+40
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L315:
	.align	2
.L314:
	.word	flipPage
	.word	fillScreen4
	.word	losePal
	.word	loadPalette
	.word	loseBitmap
	.word	drawBackgroundImage4
	.word	waitForVblank
	.word	.LANCHOR0
	.word	1028
	.word	state
	.word	splash
	.size	lose, .-lose
	.comm	kil,44,4
	.comm	bullets,320,4
	.comm	enemies,640,4
	.comm	bossBullet,32,4
	.comm	boss,40,4
	.global	spawnPos
	.comm	bigRow,4,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	vbCountB,4,4
	.comm	vbCountA,4,4
	.comm	soundB,28,4
	.comm	soundA,28,4
	.comm	bossFight,4,4
	.comm	shootInit,4,4
	.global	pauseLock
	.comm	score,4,4
	.global	spawnFreq
	.global	spawnOn
	.global	seed
	.global	vOff
	.global	hOff
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	spawnPos, %object
	.size	spawnPos, 80
spawnPos:
	.word	26
	.word	77
	.word	11
	.word	126
	.word	102
	.word	17
	.word	99
	.word	15
	.word	54
	.word	30
	.word	36
	.word	49
	.word	109
	.word	111
	.word	102
	.word	86
	.word	45
	.word	68
	.word	123
	.word	120
	.type	spawnFreq, %object
	.size	spawnFreq, 4
spawnFreq:
	.word	20
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"PRESS START\000"
.LC1:
	.ascii	"TO PLAY\000"
.LC2:
	.ascii	"PRESS SELECT\000"
	.space	3
.LC3:
	.ascii	"FOR INSTRUCTIONS\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pauseLock, %object
	.size	pauseLock, 4
pauseLock:
	.space	4
	.type	seed, %object
	.size	seed, 4
seed:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	spawnOn, %object
	.size	spawnOn, 4
spawnOn:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 43) 4.9.2"
