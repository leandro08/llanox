
./build/llanox.elf:     file format elf32-littlearm

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00003208  40008000  40008000  00008000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000010  4000b208  4000b208  0000b208  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .got          00000040  4000b218  4000b218  0000b218  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  3 .got.plt      0000000c  4000b258  4000b258  0000b258  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  4 .bss          00001834  4000b264  4000b264  0000b264  2**2
                  ALLOC
  5 .comment      00000057  00000000  00000000  0000b264  2**0
                  CONTENTS, READONLY
  6 .ARM.attributes 0000003b  00000000  00000000  0000b2bb  2**0
                  CONTENTS, READONLY

Disassembly of section .text:

40008000 <__start>:
40008000:	e59ff018 	ldr	pc, [pc, #24]	; 40008020 <reset_vector>
40008004:	e59ff018 	ldr	pc, [pc, #24]	; 40008024 <undefined_vector>
40008008:	e59ff018 	ldr	pc, [pc, #24]	; 40008028 <syscall_vector>
4000800c:	e59ff018 	ldr	pc, [pc, #24]	; 4000802c <prefetch_vector>
40008010:	e59ff018 	ldr	pc, [pc, #24]	; 40008030 <data_vector>
40008014:	e59ff018 	ldr	pc, [pc, #24]	; 40008034 <hyp_vector>
40008018:	e59ff018 	ldr	pc, [pc, #24]	; 40008038 <irq_vector>
4000801c:	e59ff018 	ldr	pc, [pc, #24]	; 4000803c <fiq_vector>

40008020 <reset_vector>:
40008020:	40008040 	andmi	r8, r0, r0, asr #32

40008024 <undefined_vector>:
40008024:	40009174 	andmi	r9, r0, r4, ror r1

40008028 <syscall_vector>:
40008028:	4000918c 	andmi	r9, r0, ip, lsl #3

4000802c <prefetch_vector>:
4000802c:	00000000 	andeq	r0, r0, r0

40008030 <data_vector>:
40008030:	400091b4 			; <UNDEFINED> instruction: 0x400091b4

40008034 <hyp_vector>:
40008034:	00000000 	andeq	r0, r0, r0

40008038 <irq_vector>:
40008038:	40008154 	andmi	r8, r0, r4, asr r1

4000803c <fiq_vector>:
4000803c:	400091f8 	strdmi	r9, [r0], -r8

40008040 <__vectors_end>:
40008040:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
40008044:	e2000003 	and	r0, r0, #3
40008048:	e3500000 	cmp	r0, #0
4000804c:	0a000001 	beq	40008058 <init_boot>

40008050 <wait_loop>:
40008050:	e320f003 	wfi
40008054:	eafffffd 	b	40008050 <wait_loop>

40008058 <init_boot>:
40008058:	e59f01f8 	ldr	r0, [pc, #504]	; 40008258 <yield+0x54>
4000805c:	e3a01000 	mov	r1, #0
40008060:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
40008064:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
40008068:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
4000806c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
40008070:	e59f01e4 	ldr	r0, [pc, #484]	; 4000825c <yield+0x58>
40008074:	e59f11e4 	ldr	r1, [pc, #484]	; 40008260 <yield+0x5c>
40008078:	e3a02000 	mov	r2, #0

4000807c <clear_loop>:
4000807c:	e4802004 	str	r2, [r0], #4
40008080:	e1500001 	cmp	r0, r1
40008084:	1afffffc 	bne	4000807c <clear_loop>
40008088:	e5802000 	str	r2, [r0]
4000808c:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
40008090:	e3c11001 	bic	r1, r1, #1
40008094:	e3c11a01 	bic	r1, r1, #4096	; 0x1000
40008098:	e3c11004 	bic	r1, r1, #4
4000809c:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
400080a0:	e3a01000 	mov	r1, #0
400080a4:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
400080a8:	ee300f10 	mrc	15, 1, r0, cr0, cr0, {0}
400080ac:	e30031ff 	movw	r3, #511	; 0x1ff
400080b0:	e00306a0 	and	r0, r3, r0, lsr #13
400080b4:	e3a01000 	mov	r1, #0

400080b8 <way_loop>:
400080b8:	e3a03000 	mov	r3, #0

400080bc <set_loop>:
400080bc:	e1a02f01 	lsl	r2, r1, #30
400080c0:	e1822283 	orr	r2, r2, r3, lsl #5
400080c4:	ee072f5e 	mcr	15, 0, r2, cr7, cr14, {2}
400080c8:	e2833001 	add	r3, r3, #1
400080cc:	e1500003 	cmp	r0, r3
400080d0:	cafffff9 	bgt	400080bc <set_loop>
400080d4:	e2811001 	add	r1, r1, #1
400080d8:	e3510004 	cmp	r1, #4
400080dc:	1afffff5 	bne	400080b8 <way_loop>
400080e0:	ee081f17 	mcr	15, 0, r1, cr8, cr7, {0}
400080e4:	e3a01000 	mov	r1, #0
400080e8:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
400080ec:	e3811a01 	orr	r1, r1, #4096	; 0x1000
400080f0:	e3811004 	orr	r1, r1, #4
400080f4:	e3811b02 	orr	r1, r1, #2048	; 0x800
400080f8:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
400080fc:	e59f0160 	ldr	r0, [pc, #352]	; 40008264 <yield+0x60>
40008100:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
40008104:	e1a0d000 	mov	sp, r0
40008108:	e2400a01 	sub	r0, r0, #4096	; 0x1000
4000810c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
40008110:	e1a0d000 	mov	sp, r0
40008114:	e2400a01 	sub	r0, r0, #4096	; 0x1000
40008118:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
4000811c:	e1a0d000 	mov	sp, r0
40008120:	e2400a01 	sub	r0, r0, #4096	; 0x1000
40008124:	e321f0db 	msr	CPSR_c, #219	; 0xdb
40008128:	e1a0d000 	mov	sp, r0
4000812c:	e2400a01 	sub	r0, r0, #4096	; 0x1000
40008130:	e321f0df 	msr	CPSR_c, #223	; 0xdf
40008134:	e1a0d000 	mov	sp, r0
40008138:	e2400a01 	sub	r0, r0, #4096	; 0x1000
4000813c:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
40008140:	e1a0d000 	mov	sp, r0
40008144:	e59f111c 	ldr	r1, [pc, #284]	; 40008268 <yield+0x64>
40008148:	e5810000 	str	r0, [r1]
4000814c:	ea0005ca 	b	4000987c <init>
40008150:	eaffffbe 	b	40008050 <wait_loop>

40008154 <irq_interrupt>:
40008154:	e24ee004 	sub	lr, lr, #4
40008158:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
4000815c:	e59f0108 	ldr	r0, [pc, #264]	; 4000826c <yield+0x68>
40008160:	e580e000 	str	lr, [r0]
40008164:	e3020000 	movw	r0, #8192	; 0x2000
40008168:	e34001c8 	movt	r0, #456	; 0x1c8
4000816c:	e590000c 	ldr	r0, [r0, #12]
40008170:	e30013ff 	movw	r1, #1023	; 0x3ff
40008174:	e0000001 	and	r0, r0, r1
40008178:	e3500032 	cmp	r0, #50	; 0x32
4000817c:	0a000001 	beq	40008188 <context_switch>
40008180:	eb000411 	bl	400091cc <irq_handler>
40008184:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

40008188 <context_switch>:
40008188:	e3020000 	movw	r0, #8192	; 0x2000
4000818c:	e34001c8 	movt	r0, #456	; 0x1c8
40008190:	e3a01032 	mov	r1, #50	; 0x32
40008194:	e5801010 	str	r1, [r0, #16]
40008198:	e3000c00 	movw	r0, #3072	; 0xc00
4000819c:	e34001c2 	movt	r0, #450	; 0x1c2
400081a0:	e3a01001 	mov	r1, #1
400081a4:	e5801004 	str	r1, [r0, #4]
400081a8:	e89d000f 	ldm	sp, {r0, r1, r2, r3}
400081ac:	e59dc030 	ldr	ip, [sp, #48]	; 0x30
400081b0:	e28dd038 	add	sp, sp, #56	; 0x38
400081b4:	e321f093 	msr	CPSR_c, #147	; 0x93
400081b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
400081bc:	e59f10a8 	ldr	r1, [pc, #168]	; 4000826c <yield+0x68>
400081c0:	e5911000 	ldr	r1, [r1]
400081c4:	e59f00a4 	ldr	r0, [pc, #164]	; 40008270 <yield+0x6c>
400081c8:	e5900000 	ldr	r0, [r0]
400081cc:	e5801014 	str	r1, [r0, #20]
400081d0:	e580d018 	str	sp, [r0, #24]
400081d4:	eb0003a4 	bl	4000906c <scheduler>
400081d8:	e59f0090 	ldr	r0, [pc, #144]	; 40008270 <yield+0x6c>
400081dc:	e5900000 	ldr	r0, [r0]
400081e0:	e5901014 	ldr	r1, [r0, #20]
400081e4:	e590d018 	ldr	sp, [r0, #24]
400081e8:	e59f207c 	ldr	r2, [pc, #124]	; 4000826c <yield+0x68>
400081ec:	e5821000 	str	r1, [r2]
400081f0:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
400081f4:	e321f092 	msr	CPSR_c, #146	; 0x92
400081f8:	e59fe06c 	ldr	lr, [pc, #108]	; 4000826c <yield+0x68>
400081fc:	e59ee000 	ldr	lr, [lr]
40008200:	e1b0f00e 	movs	pc, lr

40008204 <yield>:
40008204:	e10f0000 	mrs	r0, CPSR
40008208:	e3800080 	orr	r0, r0, #128	; 0x80
4000820c:	e129f000 	msr	CPSR_fc, r0
40008210:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008214:	e1a0100e 	mov	r1, lr
40008218:	e59f0050 	ldr	r0, [pc, #80]	; 40008270 <yield+0x6c>
4000821c:	e5900000 	ldr	r0, [r0]
40008220:	e5801014 	str	r1, [r0, #20]
40008224:	e580d018 	str	sp, [r0, #24]
40008228:	eb00038f 	bl	4000906c <scheduler>
4000822c:	e59f003c 	ldr	r0, [pc, #60]	; 40008270 <yield+0x6c>
40008230:	e5900000 	ldr	r0, [r0]
40008234:	e5901014 	ldr	r1, [r0, #20]
40008238:	e590d018 	ldr	sp, [r0, #24]
4000823c:	e1a0f001 	mov	pc, r1
40008240:	e90d0002 	stmdb	sp, {r1}
40008244:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40008248:	e10f0000 	mrs	r0, CPSR
4000824c:	e3c00080 	bic	r0, r0, #128	; 0x80
40008250:	e129f000 	msr	CPSR_fc, r0
40008254:	e59df03c 	ldr	pc, [sp, #60]	; 0x3c
40008258:	40008000 	andmi	r8, r0, r0
4000825c:	4000b264 	andmi	fp, r0, r4, ror #4
40008260:	4000ca98 	mulmi	r0, r8, sl
40008264:	7ff08000 	svcvc	0x00f08000
40008268:	4000b284 	andmi	fp, r0, r4, lsl #5
4000826c:	4000b214 	andmi	fp, r0, r4, lsl r2
40008270:	4000b27c 	andmi	fp, r0, ip, ror r2

40008274 <printk>:
40008274:	e92d000f 	push	{r0, r1, r2, r3}
40008278:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
4000827c:	e24dd028 	sub	sp, sp, #40	; 0x28
40008280:	e3a06000 	mov	r6, #0
40008284:	e28d8004 	add	r8, sp, #4
40008288:	e59d5040 	ldr	r5, [sp, #64]	; 0x40
4000828c:	e28d3044 	add	r3, sp, #68	; 0x44
40008290:	e58d3000 	str	r3, [sp]
40008294:	e5d50000 	ldrb	r0, [r5]
40008298:	e3500000 	cmp	r0, #0
4000829c:	0a000007 	beq	400082c0 <printk+0x4c>
400082a0:	e3500025 	cmp	r0, #37	; 0x25
400082a4:	0a00000a 	beq	400082d4 <printk+0x60>
400082a8:	e2855001 	add	r5, r5, #1
400082ac:	eb0003df 	bl	40009230 <uart0_send>
400082b0:	e2866001 	add	r6, r6, #1
400082b4:	e5d50000 	ldrb	r0, [r5]
400082b8:	e3500000 	cmp	r0, #0
400082bc:	1afffff7 	bne	400082a0 <printk+0x2c>
400082c0:	e1a00006 	mov	r0, r6
400082c4:	e28dd028 	add	sp, sp, #40	; 0x28
400082c8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
400082cc:	e28dd010 	add	sp, sp, #16
400082d0:	e12fff1e 	bx	lr
400082d4:	e3a01023 	mov	r1, #35	; 0x23
400082d8:	e1a00008 	mov	r0, r8
400082dc:	eb00018b 	bl	40008910 <bzero>
400082e0:	e5d53001 	ldrb	r3, [r5, #1]
400082e4:	e2433063 	sub	r3, r3, #99	; 0x63
400082e8:	e3530015 	cmp	r3, #21
400082ec:	908ff103 	addls	pc, pc, r3, lsl #2
400082f0:	ea00001c 	b	40008368 <printk+0xf4>
400082f4:	ea000028 	b	4000839c <printk+0x128>
400082f8:	ea00002e 	b	400083b8 <printk+0x144>
400082fc:	ea000019 	b	40008368 <printk+0xf4>
40008300:	ea000018 	b	40008368 <printk+0xf4>
40008304:	ea000017 	b	40008368 <printk+0xf4>
40008308:	ea000016 	b	40008368 <printk+0xf4>
4000830c:	ea000015 	b	40008368 <printk+0xf4>
40008310:	ea000014 	b	40008368 <printk+0xf4>
40008314:	ea000013 	b	40008368 <printk+0xf4>
40008318:	ea000012 	b	40008368 <printk+0xf4>
4000831c:	ea000011 	b	40008368 <printk+0xf4>
40008320:	ea000010 	b	40008368 <printk+0xf4>
40008324:	ea00000f 	b	40008368 <printk+0xf4>
40008328:	ea000025 	b	400083c4 <printk+0x150>
4000832c:	ea00000d 	b	40008368 <printk+0xf4>
40008330:	ea00000c 	b	40008368 <printk+0xf4>
40008334:	ea00003d 	b	40008430 <printk+0x1bc>
40008338:	ea00000a 	b	40008368 <printk+0xf4>
4000833c:	ea000009 	b	40008368 <printk+0xf4>
40008340:	ea000008 	b	40008368 <printk+0xf4>
40008344:	ea000007 	b	40008368 <printk+0xf4>
40008348:	eaffffff 	b	4000834c <printk+0xd8>
4000834c:	e59d3000 	ldr	r3, [sp]
40008350:	e3a02010 	mov	r2, #16
40008354:	e5930000 	ldr	r0, [r3]
40008358:	e1a01008 	mov	r1, r8
4000835c:	e2833004 	add	r3, r3, #4
40008360:	e58d3000 	str	r3, [sp]
40008364:	eb000171 	bl	40008930 <itoa>
40008368:	e5dd0004 	ldrb	r0, [sp, #4]
4000836c:	e1a04008 	mov	r4, r8
40008370:	e3500000 	cmp	r0, #0
40008374:	e2855002 	add	r5, r5, #2
40008378:	0affffc5 	beq	40008294 <printk+0x20>
4000837c:	e0467004 	sub	r7, r6, r4
40008380:	e2844001 	add	r4, r4, #1
40008384:	e0876004 	add	r6, r7, r4
40008388:	eb0003a8 	bl	40009230 <uart0_send>
4000838c:	e4d40001 	ldrb	r0, [r4], #1
40008390:	e3500000 	cmp	r0, #0
40008394:	1afffffa 	bne	40008384 <printk+0x110>
40008398:	eaffffbd 	b	40008294 <printk+0x20>
4000839c:	e59d3000 	ldr	r3, [sp]
400083a0:	e1a04008 	mov	r4, r8
400083a4:	e5d30000 	ldrb	r0, [r3]
400083a8:	e2833004 	add	r3, r3, #4
400083ac:	e58d3000 	str	r3, [sp]
400083b0:	e5cd0004 	strb	r0, [sp, #4]
400083b4:	eaffffed 	b	40008370 <printk+0xfc>
400083b8:	e59d3000 	ldr	r3, [sp]
400083bc:	e3a0200a 	mov	r2, #10
400083c0:	eaffffe3 	b	40008354 <printk+0xe0>
400083c4:	e3a00030 	mov	r0, #48	; 0x30
400083c8:	eb000398 	bl	40009230 <uart0_send>
400083cc:	e3a00078 	mov	r0, #120	; 0x78
400083d0:	eb000396 	bl	40009230 <uart0_send>
400083d4:	e59d3000 	ldr	r3, [sp]
400083d8:	e3a02010 	mov	r2, #16
400083dc:	e1a01008 	mov	r1, r8
400083e0:	e5930000 	ldr	r0, [r3]
400083e4:	e2833004 	add	r3, r3, #4
400083e8:	e58d3000 	str	r3, [sp]
400083ec:	eb00014f 	bl	40008930 <itoa>
400083f0:	e1a00008 	mov	r0, r8
400083f4:	eb0000e0 	bl	4000877c <strlen>
400083f8:	e3500007 	cmp	r0, #7
400083fc:	caffffd9 	bgt	40008368 <printk+0xf4>
40008400:	e2607007 	rsb	r7, r0, #7
40008404:	e1a04007 	mov	r4, r7
40008408:	e2444001 	sub	r4, r4, #1
4000840c:	e3a00030 	mov	r0, #48	; 0x30
40008410:	eb000386 	bl	40009230 <uart0_send>
40008414:	e3740001 	cmn	r4, #1
40008418:	1afffffa 	bne	40008408 <printk+0x194>
4000841c:	e5dd0004 	ldrb	r0, [sp, #4]
40008420:	e2866001 	add	r6, r6, #1
40008424:	e0866007 	add	r6, r6, r7
40008428:	e1a04008 	mov	r4, r8
4000842c:	eaffffcf 	b	40008370 <printk+0xfc>
40008430:	e59d3000 	ldr	r3, [sp]
40008434:	e5934000 	ldr	r4, [r3]
40008438:	e2833004 	add	r3, r3, #4
4000843c:	e58d3000 	str	r3, [sp]
40008440:	e5d40000 	ldrb	r0, [r4]
40008444:	eaffffc9 	b	40008370 <printk+0xfc>

40008448 <memcpy>:
40008448:	e3520000 	cmp	r2, #0
4000844c:	012fff1e 	bxeq	lr
40008450:	e0812002 	add	r2, r1, r2
40008454:	e2403001 	sub	r3, r0, #1
40008458:	e4d1c001 	ldrb	ip, [r1], #1
4000845c:	e1510002 	cmp	r1, r2
40008460:	e5e3c001 	strb	ip, [r3, #1]!
40008464:	1afffffb 	bne	40008458 <memcpy+0x10>
40008468:	e12fff1e 	bx	lr

4000846c <memmove>:
4000846c:	e2823007 	add	r3, r2, #7
40008470:	e3520000 	cmp	r2, #0
40008474:	e3c33007 	bic	r3, r3, #7
40008478:	e92d4830 	push	{r4, r5, fp, lr}
4000847c:	e28db00c 	add	fp, sp, #12
40008480:	e04dd003 	sub	sp, sp, r3
40008484:	0a00000f 	beq	400084c8 <memmove+0x5c>
40008488:	e2422001 	sub	r2, r2, #1
4000848c:	e24d3001 	sub	r3, sp, #1
40008490:	e0815002 	add	r5, r1, r2
40008494:	e1a0400d 	mov	r4, sp
40008498:	e2411001 	sub	r1, r1, #1
4000849c:	e1a0c003 	mov	ip, r3
400084a0:	e5f1e001 	ldrb	lr, [r1, #1]!
400084a4:	e1510005 	cmp	r1, r5
400084a8:	e5ece001 	strb	lr, [ip, #1]!
400084ac:	1afffffb 	bne	400084a0 <memmove+0x34>
400084b0:	e084c002 	add	ip, r4, r2
400084b4:	e2402001 	sub	r2, r0, #1
400084b8:	e5f31001 	ldrb	r1, [r3, #1]!
400084bc:	e153000c 	cmp	r3, ip
400084c0:	e5e21001 	strb	r1, [r2, #1]!
400084c4:	1afffffb 	bne	400084b8 <memmove+0x4c>
400084c8:	e24bd00c 	sub	sp, fp, #12
400084cc:	e8bd8830 	pop	{r4, r5, fp, pc}

400084d0 <strcpy>:
400084d0:	e5d13000 	ldrb	r3, [r1]
400084d4:	e1a02000 	mov	r2, r0
400084d8:	e3530000 	cmp	r3, #0
400084dc:	0a000003 	beq	400084f0 <strcpy+0x20>
400084e0:	e4c23001 	strb	r3, [r2], #1
400084e4:	e5f13001 	ldrb	r3, [r1, #1]!
400084e8:	e3530000 	cmp	r3, #0
400084ec:	1afffffb 	bne	400084e0 <strcpy+0x10>
400084f0:	e3a03000 	mov	r3, #0
400084f4:	e5c23000 	strb	r3, [r2]
400084f8:	e12fff1e 	bx	lr

400084fc <strncpy>:
400084fc:	e5d1c000 	ldrb	ip, [r1]
40008500:	e3520000 	cmp	r2, #0
40008504:	012fff1e 	bxeq	lr
40008508:	e35c0000 	cmp	ip, #0
4000850c:	0a00000d 	beq	40008548 <strncpy+0x4c>
40008510:	e2811001 	add	r1, r1, #1
40008514:	e1a03000 	mov	r3, r0
40008518:	e4c3c001 	strb	ip, [r3], #1
4000851c:	e2522001 	subs	r2, r2, #1
40008520:	012fff1e 	bxeq	lr
40008524:	e4d1c001 	ldrb	ip, [r1], #1
40008528:	e35c0000 	cmp	ip, #0
4000852c:	1afffff9 	bne	40008518 <strncpy+0x1c>
40008530:	e0832002 	add	r2, r3, r2
40008534:	e3a01000 	mov	r1, #0
40008538:	e4c31001 	strb	r1, [r3], #1
4000853c:	e1530002 	cmp	r3, r2
40008540:	1afffffc 	bne	40008538 <strncpy+0x3c>
40008544:	e12fff1e 	bx	lr
40008548:	e1a03000 	mov	r3, r0
4000854c:	eafffff7 	b	40008530 <strncpy+0x34>

40008550 <strcat>:
40008550:	e1a0c000 	mov	ip, r0
40008554:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
40008558:	e28ce001 	add	lr, ip, #1
4000855c:	e5dc3000 	ldrb	r3, [ip]
40008560:	e3530000 	cmp	r3, #0
40008564:	0a00000e 	beq	400085a4 <strcat+0x54>
40008568:	e5d13000 	ldrb	r3, [r1]
4000856c:	e3530000 	cmp	r3, #0
40008570:	01a0c00e 	moveq	ip, lr
40008574:	0afffff7 	beq	40008558 <strcat+0x8>
40008578:	e2812001 	add	r2, r1, #1
4000857c:	e1a0c00e 	mov	ip, lr
40008580:	e4cc3001 	strb	r3, [ip], #1
40008584:	e1a01002 	mov	r1, r2
40008588:	e4d23001 	ldrb	r3, [r2], #1
4000858c:	e3530000 	cmp	r3, #0
40008590:	1afffffa 	bne	40008580 <strcat+0x30>
40008594:	e5dc3000 	ldrb	r3, [ip]
40008598:	e28ce001 	add	lr, ip, #1
4000859c:	e3530000 	cmp	r3, #0
400085a0:	1afffff0 	bne	40008568 <strcat+0x18>
400085a4:	e5cc3001 	strb	r3, [ip, #1]
400085a8:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

400085ac <strncat>:
400085ac:	e3520000 	cmp	r2, #0
400085b0:	0a00000e 	beq	400085f0 <strncat+0x44>
400085b4:	e5d1c000 	ldrb	ip, [r1]
400085b8:	e35c0000 	cmp	ip, #0
400085bc:	0a00000b 	beq	400085f0 <strncat+0x44>
400085c0:	e0802002 	add	r2, r0, r2
400085c4:	e1a03000 	mov	r3, r0
400085c8:	ea000002 	b	400085d8 <strncat+0x2c>
400085cc:	e5f1c001 	ldrb	ip, [r1, #1]!
400085d0:	e35c0000 	cmp	ip, #0
400085d4:	0a000002 	beq	400085e4 <strncat+0x38>
400085d8:	e4c3c001 	strb	ip, [r3], #1
400085dc:	e1530002 	cmp	r3, r2
400085e0:	1afffff9 	bne	400085cc <strncat+0x20>
400085e4:	e3a02000 	mov	r2, #0
400085e8:	e5c32000 	strb	r2, [r3]
400085ec:	e12fff1e 	bx	lr
400085f0:	e1a03000 	mov	r3, r0
400085f4:	eafffffa 	b	400085e4 <strncat+0x38>

400085f8 <memcmp>:
400085f8:	e3520000 	cmp	r2, #0
400085fc:	e242c001 	sub	ip, r2, #1
40008600:	0a00000b 	beq	40008634 <memcmp+0x3c>
40008604:	e5d02000 	ldrb	r2, [r0]
40008608:	e5d13000 	ldrb	r3, [r1]
4000860c:	e1530002 	cmp	r3, r2
40008610:	0081c00c 	addeq	ip, r1, ip
40008614:	0a000004 	beq	4000862c <memcmp+0x34>
40008618:	ea000007 	b	4000863c <memcmp+0x44>
4000861c:	e5f02001 	ldrb	r2, [r0, #1]!
40008620:	e5f13001 	ldrb	r3, [r1, #1]!
40008624:	e1520003 	cmp	r2, r3
40008628:	1a000003 	bne	4000863c <memcmp+0x44>
4000862c:	e151000c 	cmp	r1, ip
40008630:	1afffff9 	bne	4000861c <memcmp+0x24>
40008634:	e3a00000 	mov	r0, #0
40008638:	e12fff1e 	bx	lr
4000863c:	e1520003 	cmp	r2, r3
40008640:	33e00000 	mvncc	r0, #0
40008644:	23a00001 	movcs	r0, #1
40008648:	e12fff1e 	bx	lr

4000864c <strcmp>:
4000864c:	e5d02000 	ldrb	r2, [r0]
40008650:	e5d13000 	ldrb	r3, [r1]
40008654:	e1530002 	cmp	r3, r2
40008658:	1a000003 	bne	4000866c <strcmp+0x20>
4000865c:	e5f02001 	ldrb	r2, [r0, #1]!
40008660:	e5f13001 	ldrb	r3, [r1, #1]!
40008664:	e1520003 	cmp	r2, r3
40008668:	0afffffb 	beq	4000865c <strcmp+0x10>
4000866c:	e3520000 	cmp	r2, #0
40008670:	1a000003 	bne	40008684 <strcmp+0x38>
40008674:	e2933000 	adds	r3, r3, #0
40008678:	13a03001 	movne	r3, #1
4000867c:	e2630000 	rsb	r0, r3, #0
40008680:	e12fff1e 	bx	lr
40008684:	e16f0f13 	clz	r0, r3
40008688:	e1a002a0 	lsr	r0, r0, #5
4000868c:	e12fff1e 	bx	lr

40008690 <strncmp>:
40008690:	e5d0c000 	ldrb	ip, [r0]
40008694:	e3520000 	cmp	r2, #0
40008698:	e5d13000 	ldrb	r3, [r1]
4000869c:	0a000009 	beq	400086c8 <strncmp+0x38>
400086a0:	e153000c 	cmp	r3, ip
400086a4:	1a000007 	bne	400086c8 <strncmp+0x38>
400086a8:	e0802002 	add	r2, r0, r2
400086ac:	ea000001 	b	400086b8 <strncmp+0x28>
400086b0:	e15c0003 	cmp	ip, r3
400086b4:	1a000003 	bne	400086c8 <strncmp+0x38>
400086b8:	e5f0c001 	ldrb	ip, [r0, #1]!
400086bc:	e5f13001 	ldrb	r3, [r1, #1]!
400086c0:	e1520000 	cmp	r2, r0
400086c4:	1afffff9 	bne	400086b0 <strncmp+0x20>
400086c8:	e35c0000 	cmp	ip, #0
400086cc:	1a000003 	bne	400086e0 <strncmp+0x50>
400086d0:	e2933000 	adds	r3, r3, #0
400086d4:	13a03001 	movne	r3, #1
400086d8:	e2630000 	rsb	r0, r3, #0
400086dc:	e12fff1e 	bx	lr
400086e0:	e16f0f13 	clz	r0, r3
400086e4:	e1a002a0 	lsr	r0, r0, #5
400086e8:	e12fff1e 	bx	lr

400086ec <strchr>:
400086ec:	e5d03000 	ldrb	r3, [r0]
400086f0:	e6ef1071 	uxtb	r1, r1
400086f4:	e1530001 	cmp	r3, r1
400086f8:	1a000003 	bne	4000870c <strchr+0x20>
400086fc:	e12fff1e 	bx	lr
40008700:	e5f03001 	ldrb	r3, [r0, #1]!
40008704:	e1530001 	cmp	r3, r1
40008708:	012fff1e 	bxeq	lr
4000870c:	e3530000 	cmp	r3, #0
40008710:	1afffffa 	bne	40008700 <strchr+0x14>
40008714:	e3510000 	cmp	r1, #0
40008718:	13a00000 	movne	r0, #0
4000871c:	e12fff1e 	bx	lr

40008720 <strrchr>:
40008720:	e5d03000 	ldrb	r3, [r0]
40008724:	e1a02000 	mov	r2, r0
40008728:	e6ef1071 	uxtb	r1, r1
4000872c:	e3530000 	cmp	r3, #0
40008730:	0a000006 	beq	40008750 <strrchr+0x30>
40008734:	e3a00000 	mov	r0, #0
40008738:	e1510003 	cmp	r1, r3
4000873c:	01a00002 	moveq	r0, r2
40008740:	e5f23001 	ldrb	r3, [r2, #1]!
40008744:	e3530000 	cmp	r3, #0
40008748:	1afffffa 	bne	40008738 <strrchr+0x18>
4000874c:	e12fff1e 	bx	lr
40008750:	e1a00003 	mov	r0, r3
40008754:	e12fff1e 	bx	lr

40008758 <memset>:
40008758:	e3520000 	cmp	r2, #0
4000875c:	e6ef1071 	uxtb	r1, r1
40008760:	012fff1e 	bxeq	lr
40008764:	e0802002 	add	r2, r0, r2
40008768:	e1a03000 	mov	r3, r0
4000876c:	e4c31001 	strb	r1, [r3], #1
40008770:	e1530002 	cmp	r3, r2
40008774:	1afffffc 	bne	4000876c <memset+0x14>
40008778:	e12fff1e 	bx	lr

4000877c <strlen>:
4000877c:	e5d01000 	ldrb	r1, [r0]
40008780:	e2803001 	add	r3, r0, #1
40008784:	e3510000 	cmp	r1, #0
40008788:	0a000003 	beq	4000879c <strlen+0x20>
4000878c:	e0431000 	sub	r1, r3, r0
40008790:	e4d32001 	ldrb	r2, [r3], #1
40008794:	e3520000 	cmp	r2, #0
40008798:	1afffffb 	bne	4000878c <strlen+0x10>
4000879c:	e1a00001 	mov	r0, r1
400087a0:	e12fff1e 	bx	lr

400087a4 <strstr>:
400087a4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
400087a8:	e1a05000 	mov	r5, r0
400087ac:	e1a00001 	mov	r0, r1
400087b0:	e1a04001 	mov	r4, r1
400087b4:	ebfffff0 	bl	4000877c <strlen>
400087b8:	e5d53000 	ldrb	r3, [r5]
400087bc:	e3530000 	cmp	r3, #0
400087c0:	0a00002e 	beq	40008880 <strstr+0xdc>
400087c4:	e5d46000 	ldrb	r6, [r4]
400087c8:	e1a07000 	mov	r7, r0
400087cc:	e3a0c000 	mov	ip, #0
400087d0:	e1a00005 	mov	r0, r5
400087d4:	e2878001 	add	r8, r7, #1
400087d8:	ea000003 	b	400087ec <strstr+0x48>
400087dc:	e5d03001 	ldrb	r3, [r0, #1]
400087e0:	e1a00002 	mov	r0, r2
400087e4:	e3530000 	cmp	r3, #0
400087e8:	0a00001d 	beq	40008864 <strstr+0xc0>
400087ec:	e1560003 	cmp	r6, r3
400087f0:	e2802001 	add	r2, r0, #1
400087f4:	1afffff8 	bne	400087dc <strstr+0x38>
400087f8:	e3570000 	cmp	r7, #0
400087fc:	e284e001 	add	lr, r4, #1
40008800:	e2803002 	add	r3, r0, #2
40008804:	0a000018 	beq	4000886c <strstr+0xc8>
40008808:	e5d0c001 	ldrb	ip, [r0, #1]
4000880c:	e5d41001 	ldrb	r1, [r4, #1]
40008810:	e15c0001 	cmp	ip, r1
40008814:	1a000014 	bne	4000886c <strstr+0xc8>
40008818:	e0805008 	add	r5, r0, r8
4000881c:	e2842002 	add	r2, r4, #2
40008820:	e1550003 	cmp	r5, r3
40008824:	e1a04002 	mov	r4, r2
40008828:	e1a01003 	mov	r1, r3
4000882c:	e2822001 	add	r2, r2, #1
40008830:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
40008834:	e5d1e000 	ldrb	lr, [r1]
40008838:	e2833001 	add	r3, r3, #1
4000883c:	e5d4c000 	ldrb	ip, [r4]
40008840:	e15e000c 	cmp	lr, ip
40008844:	0afffff5 	beq	40008820 <strstr+0x7c>
40008848:	e1a0c000 	mov	ip, r0
4000884c:	e1a00001 	mov	r0, r1
40008850:	e2812001 	add	r2, r1, #1
40008854:	e5d03001 	ldrb	r3, [r0, #1]
40008858:	e1a00002 	mov	r0, r2
4000885c:	e3530000 	cmp	r3, #0
40008860:	1affffe1 	bne	400087ec <strstr+0x48>
40008864:	e1a0000c 	mov	r0, ip
40008868:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
4000886c:	e1a0c000 	mov	ip, r0
40008870:	e1a0400e 	mov	r4, lr
40008874:	e1a00002 	mov	r0, r2
40008878:	e1a02003 	mov	r2, r3
4000887c:	eaffffd6 	b	400087dc <strstr+0x38>
40008880:	e1a00003 	mov	r0, r3
40008884:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

40008888 <strrev>:
40008888:	e5d0c000 	ldrb	ip, [r0]
4000888c:	e1a03000 	mov	r3, r0
40008890:	e35c0000 	cmp	ip, #0
40008894:	0a000002 	beq	400088a4 <strrev+0x1c>
40008898:	e5f32001 	ldrb	r2, [r3, #1]!
4000889c:	e3520000 	cmp	r2, #0
400088a0:	1afffffc 	bne	40008898 <strrev+0x10>
400088a4:	e2431001 	sub	r1, r3, #1
400088a8:	e1500001 	cmp	r0, r1
400088ac:	012fff1e 	bxeq	lr
400088b0:	e0413000 	sub	r3, r1, r0
400088b4:	e3530001 	cmp	r3, #1
400088b8:	da000010 	ble	40008900 <strrev+0x78>
400088bc:	e1a03001 	mov	r3, r1
400088c0:	e1a02000 	mov	r2, r0
400088c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
400088c8:	e4531001 	ldrb	r1, [r3], #-1
400088cc:	e4c21001 	strb	r1, [r2], #1
400088d0:	e1a01003 	mov	r1, r3
400088d4:	e1520003 	cmp	r2, r3
400088d8:	e5c3c001 	strb	ip, [r3, #1]
400088dc:	e043e002 	sub	lr, r3, r2
400088e0:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
400088e4:	e5d2c000 	ldrb	ip, [r2]
400088e8:	e35e0001 	cmp	lr, #1
400088ec:	cafffff5 	bgt	400088c8 <strrev+0x40>
400088f0:	e5d13000 	ldrb	r3, [r1]
400088f4:	e5c23000 	strb	r3, [r2]
400088f8:	e5c1c000 	strb	ip, [r1]
400088fc:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
40008900:	e5d13000 	ldrb	r3, [r1]
40008904:	e5c03000 	strb	r3, [r0]
40008908:	e5c1c000 	strb	ip, [r1]
4000890c:	e12fff1e 	bx	lr

40008910 <bzero>:
40008910:	e3510000 	cmp	r1, #0
40008914:	012fff1e 	bxeq	lr
40008918:	e0801001 	add	r1, r0, r1
4000891c:	e3a03000 	mov	r3, #0
40008920:	e4c03001 	strb	r3, [r0], #1
40008924:	e1500001 	cmp	r0, r1
40008928:	1afffffc 	bne	40008920 <bzero+0x10>
4000892c:	e12fff1e 	bx	lr

40008930 <itoa>:
40008930:	e1a03000 	mov	r3, r0
40008934:	e281c001 	add	ip, r1, #1
40008938:	e1a00fa0 	lsr	r0, r0, #31
4000893c:	e352000a 	cmp	r2, #10
40008940:	13a00000 	movne	r0, #0
40008944:	02000001 	andeq	r0, r0, #1
40008948:	e3500000 	cmp	r0, #0
4000894c:	12633000 	rsbne	r3, r3, #0
40008950:	13a0002d 	movne	r0, #45	; 0x2d
40008954:	15c10000 	strbne	r0, [r1]
40008958:	01a00001 	moveq	r0, r1
4000895c:	11a0000c 	movne	r0, ip
40008960:	e3530000 	cmp	r3, #0
40008964:	1a000004 	bne	4000897c <itoa+0x4c>
40008968:	e3a03030 	mov	r3, #48	; 0x30
4000896c:	e5c13000 	strb	r3, [r1]
40008970:	e3a03000 	mov	r3, #0
40008974:	e5cc3000 	strb	r3, [ip]
40008978:	eaffffc2 	b	40008888 <strrev>
4000897c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
40008980:	ea000000 	b	40008988 <itoa+0x58>
40008984:	e28cc001 	add	ip, ip, #1
40008988:	e731f213 	udiv	r1, r3, r2
4000898c:	e0633192 	mls	r3, r2, r1, r3
40008990:	e3530009 	cmp	r3, #9
40008994:	e283e030 	add	lr, r3, #48	; 0x30
40008998:	8283e057 	addhi	lr, r3, #87	; 0x57
4000899c:	e2513000 	subs	r3, r1, #0
400089a0:	e54ce001 	strb	lr, [ip, #-1]
400089a4:	1afffff6 	bne	40008984 <itoa+0x54>
400089a8:	e3a03000 	mov	r3, #0
400089ac:	e5cc3000 	strb	r3, [ip]
400089b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
400089b4:	eaffffb3 	b	40008888 <strrev>

400089b8 <pthread_create>:
400089b8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
400089bc:	e1a06000 	mov	r6, r0
400089c0:	e59f5164 	ldr	r5, [pc, #356]	; 40008b2c <pthread_create+0x174>
400089c4:	e1a08002 	mov	r8, r2
400089c8:	eb000312 	bl	40009618 <disable_irq>
400089cc:	e08f5005 	add	r5, pc, r5
400089d0:	e59f3158 	ldr	r3, [pc, #344]	; 40008b30 <pthread_create+0x178>
400089d4:	e7959003 	ldr	r9, [r5, r3]
400089d8:	e5993000 	ldr	r3, [r9]
400089dc:	e5933010 	ldr	r3, [r3, #16]
400089e0:	e3530003 	cmp	r3, #3
400089e4:	8a00004d 	bhi	40008b20 <pthread_create+0x168>
400089e8:	e59f3144 	ldr	r3, [pc, #324]	; 40008b34 <pthread_create+0x17c>
400089ec:	e7954003 	ldr	r4, [r5, r3]
400089f0:	e5943000 	ldr	r3, [r4]
400089f4:	e3530060 	cmp	r3, #96	; 0x60
400089f8:	0a000032 	beq	40008ac8 <pthread_create+0x110>
400089fc:	e353005f 	cmp	r3, #95	; 0x5f
40008a00:	8a000046 	bhi	40008b20 <pthread_create+0x168>
40008a04:	e59f212c 	ldr	r2, [pc, #300]	; 40008b38 <pthread_create+0x180>
40008a08:	e2831001 	add	r1, r3, #1
40008a0c:	e5841000 	str	r1, [r4]
40008a10:	e7952002 	ldr	r2, [r5, r2]
40008a14:	e5823000 	str	r3, [r2]
40008a18:	eb0000ee 	bl	40008dd8 <get_stack>
40008a1c:	e3700001 	cmn	r0, #1
40008a20:	0a00003e 	beq	40008b20 <pthread_create+0x168>
40008a24:	e5947000 	ldr	r7, [r4]
40008a28:	e3a03030 	mov	r3, #48	; 0x30
40008a2c:	e59f1108 	ldr	r1, [pc, #264]	; 40008b3c <pthread_create+0x184>
40008a30:	e3a02000 	mov	r2, #0
40008a34:	e0030793 	mul	r3, r3, r7
40008a38:	e795a001 	ldr	sl, [r5, r1]
40008a3c:	e5991000 	ldr	r1, [r9]
40008a40:	e08a4003 	add	r4, sl, r3
40008a44:	e5911010 	ldr	r1, [r1, #16]
40008a48:	e78a2003 	str	r2, [sl, r3]
40008a4c:	e5841008 	str	r1, [r4, #8]
40008a50:	e5842004 	str	r2, [r4, #4]
40008a54:	e584200c 	str	r2, [r4, #12]
40008a58:	e5848014 	str	r8, [r4, #20]
40008a5c:	e5840018 	str	r0, [r4, #24]
40008a60:	eb00013a 	bl	40008f50 <get_index>
40008a64:	e5992000 	ldr	r2, [r9]
40008a68:	e1a01004 	mov	r1, r4
40008a6c:	e584001c 	str	r0, [r4, #28]
40008a70:	e5923010 	ldr	r3, [r2, #16]
40008a74:	e592c008 	ldr	ip, [r2, #8]
40008a78:	e59f00b8 	ldr	r0, [pc, #184]	; 40008b38 <pthread_create+0x180>
40008a7c:	e3530002 	cmp	r3, #2
40008a80:	e584c024 	str	ip, [r4, #36]	; 0x24
40008a84:	03a03003 	moveq	r3, #3
40008a88:	12833001 	addne	r3, r3, #1
40008a8c:	e5823010 	str	r3, [r2, #16]
40008a90:	e3a02030 	mov	r2, #48	; 0x30
40008a94:	e027a792 	mla	r7, r2, r7, sl
40008a98:	e59f20a0 	ldr	r2, [pc, #160]	; 40008b40 <pthread_create+0x188>
40008a9c:	e5873028 	str	r3, [r7, #40]	; 0x28
40008aa0:	e586c000 	str	ip, [r6]
40008aa4:	e5863004 	str	r3, [r6, #4]
40008aa8:	e7953000 	ldr	r3, [r5, r0]
40008aac:	e5933000 	ldr	r3, [r3]
40008ab0:	e5863008 	str	r3, [r6, #8]
40008ab4:	e7950002 	ldr	r0, [r5, r2]
40008ab8:	eb00012c 	bl	40008f70 <enqueue_pcb>
40008abc:	eb0002d1 	bl	40009608 <enable_irq>
40008ac0:	e5960004 	ldr	r0, [r6, #4]
40008ac4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
40008ac8:	e59f3074 	ldr	r3, [pc, #116]	; 40008b44 <pthread_create+0x18c>
40008acc:	e795c003 	ldr	ip, [r5, r3]
40008ad0:	e5dc0000 	ldrb	r0, [ip]
40008ad4:	e3500000 	cmp	r0, #0
40008ad8:	0a000010 	beq	40008b20 <pthread_create+0x168>
40008adc:	e59f3058 	ldr	r3, [pc, #88]	; 40008b3c <pthread_create+0x184>
40008ae0:	e3a02000 	mov	r2, #0
40008ae4:	e7953003 	ldr	r3, [r5, r3]
40008ae8:	ea000002 	b	40008af8 <pthread_create+0x140>
40008aec:	e2822001 	add	r2, r2, #1
40008af0:	e3520060 	cmp	r2, #96	; 0x60
40008af4:	0affffc7 	beq	40008a18 <pthread_create+0x60>
40008af8:	e593100c 	ldr	r1, [r3, #12]
40008afc:	e2833030 	add	r3, r3, #48	; 0x30
40008b00:	e3510003 	cmp	r1, #3
40008b04:	1afffff8 	bne	40008aec <pthread_create+0x134>
40008b08:	e59f3028 	ldr	r3, [pc, #40]	; 40008b38 <pthread_create+0x180>
40008b0c:	e2400001 	sub	r0, r0, #1
40008b10:	e5cc0000 	strb	r0, [ip]
40008b14:	e7953003 	ldr	r3, [r5, r3]
40008b18:	e5832000 	str	r2, [r3]
40008b1c:	eaffffbd 	b	40008a18 <pthread_create+0x60>
40008b20:	eb0002b8 	bl	40009608 <enable_irq>
40008b24:	e3e00000 	mvn	r0, #0
40008b28:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
40008b2c:	00002844 	andeq	r2, r0, r4, asr #16
40008b30:	0000000c 	andeq	r0, r0, ip
40008b34:	00000010 	andeq	r0, r0, r0, lsl r0
40008b38:	00000008 	andeq	r0, r0, r8
40008b3c:	00000018 	andeq	r0, r0, r8, lsl r0
40008b40:	00000020 	andeq	r0, r0, r0, lsr #32
40008b44:	00000038 	andeq	r0, r0, r8, lsr r0

40008b48 <pthread_join>:
40008b48:	e92d4030 	push	{r4, r5, lr}
40008b4c:	e24dd014 	sub	sp, sp, #20
40008b50:	e59f4070 	ldr	r4, [pc, #112]	; 40008bc8 <pthread_join+0x80>
40008b54:	e1a05003 	mov	r5, r3
40008b58:	e28d3010 	add	r3, sp, #16
40008b5c:	e08f4004 	add	r4, pc, r4
40008b60:	e9030007 	stmdb	r3, {r0, r1, r2}
40008b64:	eb0002ab 	bl	40009618 <disable_irq>
40008b68:	e3550000 	cmp	r5, #0
40008b6c:	0a000003 	beq	40008b80 <pthread_join+0x38>
40008b70:	eb0002a4 	bl	40009608 <enable_irq>
40008b74:	e3a00000 	mov	r0, #0
40008b78:	e28dd014 	add	sp, sp, #20
40008b7c:	e8bd8030 	pop	{r4, r5, pc}
40008b80:	e59f2044 	ldr	r2, [pc, #68]	; 40008bcc <pthread_join+0x84>
40008b84:	e3a03030 	mov	r3, #48	; 0x30
40008b88:	e59d000c 	ldr	r0, [sp, #12]
40008b8c:	e3a0c002 	mov	ip, #2
40008b90:	e7941002 	ldr	r1, [r4, r2]
40008b94:	e59f2034 	ldr	r2, [pc, #52]	; 40008bd0 <pthread_join+0x88>
40008b98:	e5911000 	ldr	r1, [r1]
40008b9c:	e0030093 	mul	r3, r3, r0
40008ba0:	e581c00c 	str	ip, [r1, #12]
40008ba4:	e7940002 	ldr	r0, [r4, r2]
40008ba8:	e2833020 	add	r3, r3, #32
40008bac:	e0800003 	add	r0, r0, r3
40008bb0:	eb0000ee 	bl	40008f70 <enqueue_pcb>
40008bb4:	ebfffd92 	bl	40008204 <yield>
40008bb8:	eb000292 	bl	40009608 <enable_irq>
40008bbc:	e3a00000 	mov	r0, #0
40008bc0:	e28dd014 	add	sp, sp, #20
40008bc4:	e8bd8030 	pop	{r4, r5, pc}
40008bc8:	000026b4 			; <UNDEFINED> instruction: 0x000026b4
40008bcc:	0000000c 	andeq	r0, r0, ip
40008bd0:	00000018 	andeq	r0, r0, r8, lsl r0

40008bd4 <pthread_self>:
40008bd4:	e59f3024 	ldr	r3, [pc, #36]	; 40008c00 <pthread_self+0x2c>
40008bd8:	e1a0c000 	mov	ip, r0
40008bdc:	e59f2020 	ldr	r2, [pc, #32]	; 40008c04 <pthread_self+0x30>
40008be0:	e08f3003 	add	r3, pc, r3
40008be4:	e7933002 	ldr	r3, [r3, r2]
40008be8:	e5933000 	ldr	r3, [r3]
40008bec:	e2833024 	add	r3, r3, #36	; 0x24
40008bf0:	e8930007 	ldm	r3, {r0, r1, r2}
40008bf4:	e88c0007 	stm	ip, {r0, r1, r2}
40008bf8:	e1a0000c 	mov	r0, ip
40008bfc:	e12fff1e 	bx	lr
40008c00:	00002630 	andeq	r2, r0, r0, lsr r6
40008c04:	0000000c 	andeq	r0, r0, ip

40008c08 <pthread_exit>:
40008c08:	e92d40f0 	push	{r4, r5, r6, r7, lr}
40008c0c:	e24dd014 	sub	sp, sp, #20
40008c10:	e59f70c0 	ldr	r7, [pc, #192]	; 40008cd8 <pthread_exit+0xd0>
40008c14:	e1a04000 	mov	r4, r0
40008c18:	e28d0004 	add	r0, sp, #4
40008c1c:	e08f7007 	add	r7, pc, r7
40008c20:	ebffffeb 	bl	40008bd4 <pthread_self>
40008c24:	e59d500c 	ldr	r5, [sp, #12]
40008c28:	eb00027a 	bl	40009618 <disable_irq>
40008c2c:	e3540000 	cmp	r4, #0
40008c30:	0a000002 	beq	40008c40 <pthread_exit+0x38>
40008c34:	e28dd014 	add	sp, sp, #20
40008c38:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
40008c3c:	ea000271 	b	40009608 <enable_irq>
40008c40:	e59f2094 	ldr	r2, [pc, #148]	; 40008cdc <pthread_exit+0xd4>
40008c44:	e3a03030 	mov	r3, #48	; 0x30
40008c48:	e0050593 	mul	r5, r3, r5
40008c4c:	e7973002 	ldr	r3, [r7, r2]
40008c50:	e2855020 	add	r5, r5, #32
40008c54:	e0855003 	add	r5, r5, r3
40008c58:	e1a00005 	mov	r0, r5
40008c5c:	eb0000fc 	bl	40009054 <dequeue_pcb>
40008c60:	e3500000 	cmp	r0, #0
40008c64:	0a00000c 	beq	40008c9c <pthread_exit+0x94>
40008c68:	e59f3070 	ldr	r3, [pc, #112]	; 40008ce0 <pthread_exit+0xd8>
40008c6c:	e7976003 	ldr	r6, [r7, r3]
40008c70:	e5903010 	ldr	r3, [r0, #16]
40008c74:	e1a01000 	mov	r1, r0
40008c78:	e580400c 	str	r4, [r0, #12]
40008c7c:	e2433001 	sub	r3, r3, #1
40008c80:	e5803010 	str	r3, [r0, #16]
40008c84:	e1a00006 	mov	r0, r6
40008c88:	eb0000b8 	bl	40008f70 <enqueue_pcb>
40008c8c:	e1a00005 	mov	r0, r5
40008c90:	eb0000ef 	bl	40009054 <dequeue_pcb>
40008c94:	e3500000 	cmp	r0, #0
40008c98:	1afffff4 	bne	40008c70 <pthread_exit+0x68>
40008c9c:	e59f3040 	ldr	r3, [pc, #64]	; 40008ce4 <pthread_exit+0xdc>
40008ca0:	e3a02003 	mov	r2, #3
40008ca4:	e7973003 	ldr	r3, [r7, r3]
40008ca8:	e5933000 	ldr	r3, [r3]
40008cac:	e583200c 	str	r2, [r3, #12]
40008cb0:	e593001c 	ldr	r0, [r3, #28]
40008cb4:	eb00008e 	bl	40008ef4 <free_stack>
40008cb8:	e59f3028 	ldr	r3, [pc, #40]	; 40008ce8 <pthread_exit+0xe0>
40008cbc:	e7972003 	ldr	r2, [r7, r3]
40008cc0:	e5d23000 	ldrb	r3, [r2]
40008cc4:	e2833001 	add	r3, r3, #1
40008cc8:	e5c23000 	strb	r3, [r2]
40008ccc:	e28dd014 	add	sp, sp, #20
40008cd0:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
40008cd4:	ea00024b 	b	40009608 <enable_irq>
40008cd8:	000025f4 	strdeq	r2, [r0], -r4
40008cdc:	00000018 	andeq	r0, r0, r8, lsl r0
40008ce0:	00000020 	andeq	r0, r0, r0, lsr #32
40008ce4:	0000000c 	andeq	r0, r0, ip
40008ce8:	00000038 	andeq	r0, r0, r8, lsr r0

40008cec <pthread_mutex_init>:
40008cec:	e3a03000 	mov	r3, #0
40008cf0:	e5803000 	str	r3, [r0]
40008cf4:	e1a00003 	mov	r0, r3
40008cf8:	e12fff1e 	bx	lr

40008cfc <pthread_mutex_lock>:
40008cfc:	e92d4070 	push	{r4, r5, r6, lr}
40008d00:	e1a04000 	mov	r4, r0
40008d04:	e59f5050 	ldr	r5, [pc, #80]	; 40008d5c <pthread_mutex_lock+0x60>
40008d08:	eb000242 	bl	40009618 <disable_irq>
40008d0c:	e5943000 	ldr	r3, [r4]
40008d10:	e08f5005 	add	r5, pc, r5
40008d14:	e3530000 	cmp	r3, #0
40008d18:	e59f3040 	ldr	r3, [pc, #64]	; 40008d60 <pthread_mutex_lock+0x64>
40008d1c:	1a000006 	bne	40008d3c <pthread_mutex_lock+0x40>
40008d20:	e7955003 	ldr	r5, [r5, r3]
40008d24:	e5953000 	ldr	r3, [r5]
40008d28:	e5933028 	ldr	r3, [r3, #40]	; 0x28
40008d2c:	e5843000 	str	r3, [r4]
40008d30:	eb000234 	bl	40009608 <enable_irq>
40008d34:	e3a00000 	mov	r0, #0
40008d38:	e8bd8070 	pop	{r4, r5, r6, pc}
40008d3c:	e7955003 	ldr	r5, [r5, r3]
40008d40:	e3a02002 	mov	r2, #2
40008d44:	e2840004 	add	r0, r4, #4
40008d48:	e5951000 	ldr	r1, [r5]
40008d4c:	e581200c 	str	r2, [r1, #12]
40008d50:	eb000086 	bl	40008f70 <enqueue_pcb>
40008d54:	ebfffd2a 	bl	40008204 <yield>
40008d58:	eafffff1 	b	40008d24 <pthread_mutex_lock+0x28>
40008d5c:	00002500 	andeq	r2, r0, r0, lsl #10
40008d60:	0000000c 	andeq	r0, r0, ip

40008d64 <pthread_mutex_unlock>:
40008d64:	e92d4070 	push	{r4, r5, r6, lr}
40008d68:	e1a06000 	mov	r6, r0
40008d6c:	e59f4034 	ldr	r4, [pc, #52]	; 40008da8 <pthread_mutex_unlock+0x44>
40008d70:	eb000228 	bl	40009618 <disable_irq>
40008d74:	e2860004 	add	r0, r6, #4
40008d78:	e3a05000 	mov	r5, #0
40008d7c:	e08f4004 	add	r4, pc, r4
40008d80:	eb0000b3 	bl	40009054 <dequeue_pcb>
40008d84:	e59f3020 	ldr	r3, [pc, #32]	; 40008dac <pthread_mutex_unlock+0x48>
40008d88:	e1a01000 	mov	r1, r0
40008d8c:	e580500c 	str	r5, [r0, #12]
40008d90:	e7940003 	ldr	r0, [r4, r3]
40008d94:	eb000075 	bl	40008f70 <enqueue_pcb>
40008d98:	e5865000 	str	r5, [r6]
40008d9c:	eb000219 	bl	40009608 <enable_irq>
40008da0:	e1a00005 	mov	r0, r5
40008da4:	e8bd8070 	pop	{r4, r5, r6, pc}
40008da8:	00002494 	muleq	r0, r4, r4
40008dac:	00000020 	andeq	r0, r0, r0, lsr #32

40008db0 <memcpy_32>:
40008db0:	e3520000 	cmp	r2, #0
40008db4:	e2422001 	sub	r2, r2, #1
40008db8:	012fff1e 	bxeq	lr
40008dbc:	e2400004 	sub	r0, r0, #4
40008dc0:	e4913004 	ldr	r3, [r1], #4
40008dc4:	e2422001 	sub	r2, r2, #1
40008dc8:	e3720001 	cmn	r2, #1
40008dcc:	e5a03004 	str	r3, [r0, #4]!
40008dd0:	1afffffa 	bne	40008dc0 <memcpy_32+0x10>
40008dd4:	e12fff1e 	bx	lr

40008dd8 <get_stack>:
40008dd8:	e59f30f8 	ldr	r3, [pc, #248]	; 40008ed8 <get_stack+0x100>
40008ddc:	e59f10f8 	ldr	r1, [pc, #248]	; 40008edc <get_stack+0x104>
40008de0:	e08f3003 	add	r3, pc, r3
40008de4:	e92d4030 	push	{r4, r5, lr}
40008de8:	e7931001 	ldr	r1, [r3, r1]
40008dec:	e59f20ec 	ldr	r2, [pc, #236]	; 40008ee0 <get_stack+0x108>
40008df0:	e5910000 	ldr	r0, [r1]
40008df4:	e793e002 	ldr	lr, [r3, r2]
40008df8:	e59f10e4 	ldr	r1, [pc, #228]	; 40008ee4 <get_stack+0x10c>
40008dfc:	e2404004 	sub	r4, r0, #4
40008e00:	e58e4000 	str	r4, [lr]
40008e04:	e7935001 	ldr	r5, [r3, r1]
40008e08:	e59f20d8 	ldr	r2, [pc, #216]	; 40008ee8 <get_stack+0x110>
40008e0c:	e5951000 	ldr	r1, [r5]
40008e10:	e793c002 	ldr	ip, [r3, r2]
40008e14:	e3510000 	cmp	r1, #0
40008e18:	e59c2000 	ldr	r2, [ip]
40008e1c:	0a00001a 	beq	40008e8c <get_stack+0xb4>
40008e20:	e352007f 	cmp	r2, #127	; 0x7f
40008e24:	9a00001a 	bls	40008e94 <get_stack+0xbc>
40008e28:	e2411001 	sub	r1, r1, #1
40008e2c:	e30ac13f 	movw	ip, #41279	; 0xa13f
40008e30:	e5851000 	str	r1, [r5]
40008e34:	e5102004 	ldr	r2, [r0, #-4]
40008e38:	e152000c 	cmp	r2, ip
40008e3c:	0a000020 	beq	40008ec4 <get_stack+0xec>
40008e40:	e59f20a4 	ldr	r2, [pc, #164]	; 40008eec <get_stack+0x114>
40008e44:	e2400a02 	sub	r0, r0, #8192	; 0x2000
40008e48:	e7934002 	ldr	r4, [r3, r2]
40008e4c:	e3a02001 	mov	r2, #1
40008e50:	ea000003 	b	40008e64 <get_stack+0x8c>
40008e54:	e2822001 	add	r2, r2, #1
40008e58:	e2400a02 	sub	r0, r0, #8192	; 0x2000
40008e5c:	e3520080 	cmp	r2, #128	; 0x80
40008e60:	0a000014 	beq	40008eb8 <get_stack+0xe0>
40008e64:	e5840000 	str	r0, [r4]
40008e68:	e2405004 	sub	r5, r0, #4
40008e6c:	e5101004 	ldr	r1, [r0, #-4]
40008e70:	e151000c 	cmp	r1, ip
40008e74:	1afffff6 	bne	40008e54 <get_stack+0x7c>
40008e78:	e59f1070 	ldr	r1, [pc, #112]	; 40008ef0 <get_stack+0x118>
40008e7c:	e58e5000 	str	r5, [lr]
40008e80:	e7933001 	ldr	r3, [r3, r1]
40008e84:	e5832000 	str	r2, [r3]
40008e88:	e8bd8030 	pop	{r4, r5, pc}
40008e8c:	e352007f 	cmp	r2, #127	; 0x7f
40008e90:	8a000009 	bhi	40008ebc <get_stack+0xe4>
40008e94:	e59f1054 	ldr	r1, [pc, #84]	; 40008ef0 <get_stack+0x118>
40008e98:	e2822001 	add	r2, r2, #1
40008e9c:	e58c2000 	str	r2, [ip]
40008ea0:	e7932001 	ldr	r2, [r3, r1]
40008ea4:	e5923000 	ldr	r3, [r2]
40008ea8:	e0400683 	sub	r0, r0, r3, lsl #13
40008eac:	e2833001 	add	r3, r3, #1
40008eb0:	e5823000 	str	r3, [r2]
40008eb4:	e8bd8030 	pop	{r4, r5, pc}
40008eb8:	e58e5000 	str	r5, [lr]
40008ebc:	e3e00000 	mvn	r0, #0
40008ec0:	e8bd8030 	pop	{r4, r5, pc}
40008ec4:	e59f2024 	ldr	r2, [pc, #36]	; 40008ef0 <get_stack+0x118>
40008ec8:	e3a01000 	mov	r1, #0
40008ecc:	e7933002 	ldr	r3, [r3, r2]
40008ed0:	e5831000 	str	r1, [r3]
40008ed4:	e8bd8030 	pop	{r4, r5, pc}
40008ed8:	00002430 	andeq	r2, r0, r0, lsr r4
40008edc:	00000014 	andeq	r0, r0, r4, lsl r0
40008ee0:	00000000 	andeq	r0, r0, r0
40008ee4:	0000003c 	andeq	r0, r0, ip, lsr r0
40008ee8:	00000030 	andeq	r0, r0, r0, lsr r0
40008eec:	00000034 	andeq	r0, r0, r4, lsr r0
40008ef0:	00000024 	andeq	r0, r0, r4, lsr #32

40008ef4 <free_stack>:
40008ef4:	e59f3044 	ldr	r3, [pc, #68]	; 40008f40 <free_stack+0x4c>
40008ef8:	e59f2044 	ldr	r2, [pc, #68]	; 40008f44 <free_stack+0x50>
40008efc:	e08f3003 	add	r3, pc, r3
40008f00:	e92d4010 	push	{r4, lr}
40008f04:	e30ae13f 	movw	lr, #41279	; 0xa13f
40008f08:	e7934002 	ldr	r4, [r3, r2]
40008f0c:	e59f1034 	ldr	r1, [pc, #52]	; 40008f48 <free_stack+0x54>
40008f10:	e594c000 	ldr	ip, [r4]
40008f14:	e59f2030 	ldr	r2, [pc, #48]	; 40008f4c <free_stack+0x58>
40008f18:	e28cc001 	add	ip, ip, #1
40008f1c:	e584c000 	str	ip, [r4]
40008f20:	e7931001 	ldr	r1, [r3, r1]
40008f24:	e7932002 	ldr	r2, [r3, r2]
40008f28:	e5913000 	ldr	r3, [r1]
40008f2c:	e2433004 	sub	r3, r3, #4
40008f30:	e0430680 	sub	r0, r3, r0, lsl #13
40008f34:	e5820000 	str	r0, [r2]
40008f38:	e580e000 	str	lr, [r0]
40008f3c:	e8bd8010 	pop	{r4, pc}
40008f40:	00002314 	andeq	r2, r0, r4, lsl r3
40008f44:	0000003c 	andeq	r0, r0, ip, lsr r0
40008f48:	00000014 	andeq	r0, r0, r4, lsl r0
40008f4c:	00000000 	andeq	r0, r0, r0

40008f50 <get_index>:
40008f50:	e59f3010 	ldr	r3, [pc, #16]	; 40008f68 <get_index+0x18>
40008f54:	e59f2010 	ldr	r2, [pc, #16]	; 40008f6c <get_index+0x1c>
40008f58:	e08f3003 	add	r3, pc, r3
40008f5c:	e7933002 	ldr	r3, [r3, r2]
40008f60:	e5930000 	ldr	r0, [r3]
40008f64:	e12fff1e 	bx	lr
40008f68:	000022b8 			; <UNDEFINED> instruction: 0x000022b8
40008f6c:	00000024 	andeq	r0, r0, r4, lsr #32

40008f70 <enqueue_pcb>:
40008f70:	e5902000 	ldr	r2, [r0]
40008f74:	e3520000 	cmp	r2, #0
40008f78:	1a000001 	bne	40008f84 <enqueue_pcb+0x14>
40008f7c:	ea000005 	b	40008f98 <enqueue_pcb+0x28>
40008f80:	e1a02003 	mov	r2, r3
40008f84:	e5923000 	ldr	r3, [r2]
40008f88:	e3530000 	cmp	r3, #0
40008f8c:	1afffffb 	bne	40008f80 <enqueue_pcb+0x10>
40008f90:	e5821000 	str	r1, [r2]
40008f94:	e12fff1e 	bx	lr
40008f98:	e5801000 	str	r1, [r0]
40008f9c:	e12fff1e 	bx	lr

40008fa0 <kfork>:
40008fa0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
40008fa4:	e1a07000 	mov	r7, r0
40008fa8:	e59f5094 	ldr	r5, [pc, #148]	; 40009044 <kfork+0xa4>
40008fac:	eb000199 	bl	40009618 <disable_irq>
40008fb0:	e59f3090 	ldr	r3, [pc, #144]	; 40009048 <kfork+0xa8>
40008fb4:	e08f5005 	add	r5, pc, r5
40008fb8:	e7956003 	ldr	r6, [r5, r3]
40008fbc:	e5963000 	ldr	r3, [r6]
40008fc0:	e3530020 	cmp	r3, #32
40008fc4:	0a00001b 	beq	40009038 <kfork+0x98>
40008fc8:	ebffff82 	bl	40008dd8 <get_stack>
40008fcc:	e3700001 	cmn	r0, #1
40008fd0:	0a000018 	beq	40009038 <kfork+0x98>
40008fd4:	e596c000 	ldr	ip, [r6]
40008fd8:	e3a02030 	mov	r2, #48	; 0x30
40008fdc:	e59f1068 	ldr	r1, [pc, #104]	; 4000904c <kfork+0xac>
40008fe0:	e3a03000 	mov	r3, #0
40008fe4:	e0020c92 	mul	r2, r2, ip
40008fe8:	e7951001 	ldr	r1, [r5, r1]
40008fec:	e0814002 	add	r4, r1, r2
40008ff0:	e7813002 	str	r3, [r1, r2]
40008ff4:	e584c008 	str	ip, [r4, #8]
40008ff8:	e5843004 	str	r3, [r4, #4]
40008ffc:	e584300c 	str	r3, [r4, #12]
40009000:	e5843010 	str	r3, [r4, #16]
40009004:	e5847014 	str	r7, [r4, #20]
40009008:	e5840018 	str	r0, [r4, #24]
4000900c:	ebffffcf 	bl	40008f50 <get_index>
40009010:	e59f3038 	ldr	r3, [pc, #56]	; 40009050 <kfork+0xb0>
40009014:	e1a01004 	mov	r1, r4
40009018:	e584001c 	str	r0, [r4, #28]
4000901c:	e7950003 	ldr	r0, [r5, r3]
40009020:	ebffffd2 	bl	40008f70 <enqueue_pcb>
40009024:	eb000177 	bl	40009608 <enable_irq>
40009028:	e5960000 	ldr	r0, [r6]
4000902c:	e2803001 	add	r3, r0, #1
40009030:	e5863000 	str	r3, [r6]
40009034:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
40009038:	eb000172 	bl	40009608 <enable_irq>
4000903c:	e3e00000 	mvn	r0, #0
40009040:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
40009044:	0000225c 	andeq	r2, r0, ip, asr r2
40009048:	0000002c 	andeq	r0, r0, ip, lsr #32
4000904c:	00000004 	andeq	r0, r0, r4
40009050:	00000020 	andeq	r0, r0, r0, lsr #32

40009054 <dequeue_pcb>:
40009054:	e5903000 	ldr	r3, [r0]
40009058:	e3530000 	cmp	r3, #0
4000905c:	15932000 	ldrne	r2, [r3]
40009060:	15802000 	strne	r2, [r0]
40009064:	e1a00003 	mov	r0, r3
40009068:	e12fff1e 	bx	lr

4000906c <scheduler>:
4000906c:	e59f209c 	ldr	r2, [pc, #156]	; 40009110 <scheduler+0xa4>
40009070:	e59f309c 	ldr	r3, [pc, #156]	; 40009114 <scheduler+0xa8>
40009074:	e08f2002 	add	r2, pc, r2
40009078:	e92d4070 	push	{r4, r5, r6, lr}
4000907c:	e7924003 	ldr	r4, [r2, r3]
40009080:	e5943000 	ldr	r3, [r4]
40009084:	e5930004 	ldr	r0, [r3, #4]
40009088:	e593100c 	ldr	r1, [r3, #12]
4000908c:	e3500064 	cmp	r0, #100	; 0x64
40009090:	0a000010 	beq	400090d8 <scheduler+0x6c>
40009094:	e2411002 	sub	r1, r1, #2
40009098:	e3510001 	cmp	r1, #1
4000909c:	8a00000a 	bhi	400090cc <scheduler+0x60>
400090a0:	e59f1070 	ldr	r1, [pc, #112]	; 40009118 <scheduler+0xac>
400090a4:	e3a00000 	mov	r0, #0
400090a8:	e5830004 	str	r0, [r3, #4]
400090ac:	e5830000 	str	r0, [r3]
400090b0:	e7925001 	ldr	r5, [r2, r1]
400090b4:	e1a00005 	mov	r0, r5
400090b8:	ebffffe5 	bl	40009054 <dequeue_pcb>
400090bc:	e5840000 	str	r0, [r4]
400090c0:	e3a03001 	mov	r3, #1
400090c4:	e580300c 	str	r3, [r0, #12]
400090c8:	e8bd8070 	pop	{r4, r5, r6, pc}
400090cc:	e2800001 	add	r0, r0, #1
400090d0:	e5830004 	str	r0, [r3, #4]
400090d4:	e8bd8070 	pop	{r4, r5, r6, pc}
400090d8:	e3510001 	cmp	r1, #1
400090dc:	e3a00000 	mov	r0, #0
400090e0:	e5830004 	str	r0, [r3, #4]
400090e4:	e5830000 	str	r0, [r3]
400090e8:	159f3028 	ldrne	r3, [pc, #40]	; 40009118 <scheduler+0xac>
400090ec:	17925003 	ldrne	r5, [r2, r3]
400090f0:	1affffef 	bne	400090b4 <scheduler+0x48>
400090f4:	e59fc01c 	ldr	ip, [pc, #28]	; 40009118 <scheduler+0xac>
400090f8:	e1a01003 	mov	r1, r3
400090fc:	e583000c 	str	r0, [r3, #12]
40009100:	e792500c 	ldr	r5, [r2, ip]
40009104:	e1a00005 	mov	r0, r5
40009108:	ebffff98 	bl	40008f70 <enqueue_pcb>
4000910c:	eaffffe8 	b	400090b4 <scheduler+0x48>
40009110:	0000219c 	muleq	r0, ip, r1
40009114:	0000000c 	andeq	r0, r0, ip
40009118:	00000020 	andeq	r0, r0, r0, lsr #32

4000911c <print_queue>:
4000911c:	e92d4070 	push	{r4, r5, r6, lr}
40009120:	e5904000 	ldr	r4, [r0]
40009124:	e3540000 	cmp	r4, #0
40009128:	0a000007 	beq	4000914c <print_queue+0x30>
4000912c:	e59f5028 	ldr	r5, [pc, #40]	; 4000915c <print_queue+0x40>
40009130:	e08f5005 	add	r5, pc, r5
40009134:	e5941008 	ldr	r1, [r4, #8]
40009138:	e1a00005 	mov	r0, r5
4000913c:	ebfffc4c 	bl	40008274 <printk>
40009140:	e5944000 	ldr	r4, [r4]
40009144:	e3540000 	cmp	r4, #0
40009148:	1afffff9 	bne	40009134 <print_queue+0x18>
4000914c:	e59f000c 	ldr	r0, [pc, #12]	; 40009160 <print_queue+0x44>
40009150:	e8bd4070 	pop	{r4, r5, r6, lr}
40009154:	e08f0000 	add	r0, pc, r0
40009158:	eafffc45 	b	40008274 <printk>
4000915c:	00000864 	andeq	r0, r0, r4, ror #16
40009160:	00000848 	andeq	r0, r0, r8, asr #16

40009164 <sys_write>:
40009164:	e59f0004 	ldr	r0, [pc, #4]	; 40009170 <sys_write+0xc>
40009168:	e08f0000 	add	r0, pc, r0
4000916c:	eafffc40 	b	40008274 <printk>
40009170:	0000083c 	andeq	r0, r0, ip, lsr r8

40009174 <undefined_handler>:
40009174:	e59f000c 	ldr	r0, [pc, #12]	; 40009188 <undefined_handler+0x14>
40009178:	e92d4010 	push	{r4, lr}
4000917c:	e08f0000 	add	r0, pc, r0
40009180:	ebfffc3b 	bl	40008274 <printk>
40009184:	eafffffe 	b	40009184 <undefined_handler+0x10>
40009188:	0000082c 	andeq	r0, r0, ip, lsr #16

4000918c <syscall_handler>:
4000918c:	e1a03007 	mov	r3, r7
40009190:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
40009194:	e3530004 	cmp	r3, #4
40009198:	1a000000 	bne	400091a0 <syscall_handler+0x14>
4000919c:	ebfffff0 	bl	40009164 <sys_write>
400091a0:	e3a03000 	mov	r3, #0
400091a4:	e78d0003 	str	r0, [sp, r3]
400091a8:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
400091ac:	e1b0f00e 	movs	pc, lr
400091b0:	e12fff1e 	bx	lr

400091b4 <data_handler>:
400091b4:	e59f000c 	ldr	r0, [pc, #12]	; 400091c8 <data_handler+0x14>
400091b8:	e92d4010 	push	{r4, lr}
400091bc:	e08f0000 	add	r0, pc, r0
400091c0:	ebfffc2b 	bl	40008274 <printk>
400091c4:	eafffffe 	b	400091c4 <data_handler+0x10>
400091c8:	0000080c 	andeq	r0, r0, ip, lsl #16

400091cc <irq_handler>:
400091cc:	e92d4070 	push	{r4, r5, r6, lr}
400091d0:	e3a04a02 	mov	r4, #8192	; 0x2000
400091d4:	e34041c8 	movt	r4, #456	; 0x1c8
400091d8:	e59f0014 	ldr	r0, [pc, #20]	; 400091f4 <irq_handler+0x28>
400091dc:	e594500c 	ldr	r5, [r4, #12]
400091e0:	e08f0000 	add	r0, pc, r0
400091e4:	ebfffc22 	bl	40008274 <printk>
400091e8:	e5845010 	str	r5, [r4, #16]
400091ec:	e8bd4070 	pop	{r4, r5, r6, lr}
400091f0:	ea00016c 	b	400097a8 <clean_pending_timer0>
400091f4:	000007fc 	strdeq	r0, [r0], -ip

400091f8 <fiq_handler>:
400091f8:	e59f000c 	ldr	r0, [pc, #12]	; 4000920c <fiq_handler+0x14>
400091fc:	e92d4010 	push	{r4, lr}
40009200:	e08f0000 	add	r0, pc, r0
40009204:	ebfffc1a 	bl	40008274 <printk>
40009208:	eafffffe 	b	40009208 <fiq_handler+0x10>
4000920c:	000007fc 	strdeq	r0, [r0], -ip

40009210 <uart0_recv>:
40009210:	e3a02902 	mov	r2, #32768	; 0x8000
40009214:	e34021c2 	movt	r2, #450	; 0x1c2
40009218:	e5923014 	ldr	r3, [r2, #20]
4000921c:	e3130001 	tst	r3, #1
40009220:	0afffffc 	beq	40009218 <uart0_recv+0x8>
40009224:	e5920000 	ldr	r0, [r2]
40009228:	e6ef0070 	uxtb	r0, r0
4000922c:	e12fff1e 	bx	lr

40009230 <uart0_send>:
40009230:	e3a02902 	mov	r2, #32768	; 0x8000
40009234:	e34021c2 	movt	r2, #450	; 0x1c2
40009238:	e5923014 	ldr	r3, [r2, #20]
4000923c:	e3130020 	tst	r3, #32
40009240:	0afffffc 	beq	40009238 <uart0_send+0x8>
40009244:	e5820000 	str	r0, [r2]
40009248:	e12fff1e 	bx	lr

4000924c <get_cpu_status>:
4000924c:	e10f3000 	mrs	r3, CPSR
40009250:	e5803000 	str	r3, [r0]
40009254:	e6ef3073 	uxtb	r3, r3
40009258:	e3c3207f 	bic	r2, r3, #127	; 0x7f
4000925c:	e203101f 	and	r1, r3, #31
40009260:	e5c01004 	strb	r1, [r0, #4]
40009264:	e2031020 	and	r1, r3, #32
40009268:	e5c01005 	strb	r1, [r0, #5]
4000926c:	e2033040 	and	r3, r3, #64	; 0x40
40009270:	e5c03006 	strb	r3, [r0, #6]
40009274:	e3a03000 	mov	r3, #0
40009278:	e5c02007 	strb	r2, [r0, #7]
4000927c:	e1c030b8 	strh	r3, [r0, #8]
40009280:	e12fff1e 	bx	lr

40009284 <print_cpu_status>:
40009284:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
40009288:	e24dd014 	sub	sp, sp, #20
4000928c:	e28d0004 	add	r0, sp, #4
40009290:	ebffffed 	bl	4000924c <get_cpu_status>
40009294:	e59f01a0 	ldr	r0, [pc, #416]	; 4000943c <print_cpu_status+0x1b8>
40009298:	e08f0000 	add	r0, pc, r0
4000929c:	ebfffbf4 	bl	40008274 <printk>
400092a0:	e5dd3008 	ldrb	r3, [sp, #8]
400092a4:	e2433010 	sub	r3, r3, #16
400092a8:	e353000f 	cmp	r3, #15
400092ac:	908ff103 	addls	pc, pc, r3, lsl #2
400092b0:	ea000012 	b	40009300 <print_cpu_status+0x7c>
400092b4:	ea00000e 	b	400092f4 <print_cpu_status+0x70>
400092b8:	ea000053 	b	4000940c <print_cpu_status+0x188>
400092bc:	ea000056 	b	4000941c <print_cpu_status+0x198>
400092c0:	ea000059 	b	4000942c <print_cpu_status+0x1a8>
400092c4:	ea00000d 	b	40009300 <print_cpu_status+0x7c>
400092c8:	ea00000c 	b	40009300 <print_cpu_status+0x7c>
400092cc:	ea00000b 	b	40009300 <print_cpu_status+0x7c>
400092d0:	ea00000a 	b	40009300 <print_cpu_status+0x7c>
400092d4:	ea000009 	b	40009300 <print_cpu_status+0x7c>
400092d8:	ea000008 	b	40009300 <print_cpu_status+0x7c>
400092dc:	ea000007 	b	40009300 <print_cpu_status+0x7c>
400092e0:	ea000006 	b	40009300 <print_cpu_status+0x7c>
400092e4:	ea000005 	b	40009300 <print_cpu_status+0x7c>
400092e8:	ea000004 	b	40009300 <print_cpu_status+0x7c>
400092ec:	ea000003 	b	40009300 <print_cpu_status+0x7c>
400092f0:	ea000041 	b	400093fc <print_cpu_status+0x178>
400092f4:	e59f0144 	ldr	r0, [pc, #324]	; 40009440 <print_cpu_status+0x1bc>
400092f8:	e08f0000 	add	r0, pc, r0
400092fc:	ebfffbdc 	bl	40008274 <printk>
40009300:	e5dd3009 	ldrb	r3, [sp, #9]
40009304:	e3530000 	cmp	r3, #0
40009308:	0a00001f 	beq	4000938c <print_cpu_status+0x108>
4000930c:	e59f0130 	ldr	r0, [pc, #304]	; 40009444 <print_cpu_status+0x1c0>
40009310:	e08f0000 	add	r0, pc, r0
40009314:	ebfffbd6 	bl	40008274 <printk>
40009318:	e5dd300a 	ldrb	r3, [sp, #10]
4000931c:	e3530000 	cmp	r3, #0
40009320:	0a00001f 	beq	400093a4 <print_cpu_status+0x120>
40009324:	e59f011c 	ldr	r0, [pc, #284]	; 40009448 <print_cpu_status+0x1c4>
40009328:	e08f0000 	add	r0, pc, r0
4000932c:	ebfffbd0 	bl	40008274 <printk>
40009330:	e5dd300b 	ldrb	r3, [sp, #11]
40009334:	e3530000 	cmp	r3, #0
40009338:	0a00001f 	beq	400093bc <print_cpu_status+0x138>
4000933c:	e59f0108 	ldr	r0, [pc, #264]	; 4000944c <print_cpu_status+0x1c8>
40009340:	e08f0000 	add	r0, pc, r0
40009344:	ebfffbca 	bl	40008274 <printk>
40009348:	e5dd300c 	ldrb	r3, [sp, #12]
4000934c:	e3530000 	cmp	r3, #0
40009350:	0a00001f 	beq	400093d4 <print_cpu_status+0x150>
40009354:	e59f00f4 	ldr	r0, [pc, #244]	; 40009450 <print_cpu_status+0x1cc>
40009358:	e08f0000 	add	r0, pc, r0
4000935c:	ebfffbc4 	bl	40008274 <printk>
40009360:	e5dd300d 	ldrb	r3, [sp, #13]
40009364:	e3530000 	cmp	r3, #0
40009368:	1a00001f 	bne	400093ec <print_cpu_status+0x168>
4000936c:	e59f00e0 	ldr	r0, [pc, #224]	; 40009454 <print_cpu_status+0x1d0>
40009370:	e08f0000 	add	r0, pc, r0
40009374:	ebfffbbe 	bl	40008274 <printk>
40009378:	e59f00d8 	ldr	r0, [pc, #216]	; 40009458 <print_cpu_status+0x1d4>
4000937c:	e08f0000 	add	r0, pc, r0
40009380:	ebfffbbb 	bl	40008274 <printk>
40009384:	e28dd014 	add	sp, sp, #20
40009388:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
4000938c:	e59f00c8 	ldr	r0, [pc, #200]	; 4000945c <print_cpu_status+0x1d8>
40009390:	e08f0000 	add	r0, pc, r0
40009394:	ebfffbb6 	bl	40008274 <printk>
40009398:	e5dd300a 	ldrb	r3, [sp, #10]
4000939c:	e3530000 	cmp	r3, #0
400093a0:	1affffdf 	bne	40009324 <print_cpu_status+0xa0>
400093a4:	e59f00b4 	ldr	r0, [pc, #180]	; 40009460 <print_cpu_status+0x1dc>
400093a8:	e08f0000 	add	r0, pc, r0
400093ac:	ebfffbb0 	bl	40008274 <printk>
400093b0:	e5dd300b 	ldrb	r3, [sp, #11]
400093b4:	e3530000 	cmp	r3, #0
400093b8:	1affffdf 	bne	4000933c <print_cpu_status+0xb8>
400093bc:	e59f00a0 	ldr	r0, [pc, #160]	; 40009464 <print_cpu_status+0x1e0>
400093c0:	e08f0000 	add	r0, pc, r0
400093c4:	ebfffbaa 	bl	40008274 <printk>
400093c8:	e5dd300c 	ldrb	r3, [sp, #12]
400093cc:	e3530000 	cmp	r3, #0
400093d0:	1affffdf 	bne	40009354 <print_cpu_status+0xd0>
400093d4:	e59f008c 	ldr	r0, [pc, #140]	; 40009468 <print_cpu_status+0x1e4>
400093d8:	e08f0000 	add	r0, pc, r0
400093dc:	ebfffba4 	bl	40008274 <printk>
400093e0:	e5dd300d 	ldrb	r3, [sp, #13]
400093e4:	e3530000 	cmp	r3, #0
400093e8:	0affffdf 	beq	4000936c <print_cpu_status+0xe8>
400093ec:	e59f0078 	ldr	r0, [pc, #120]	; 4000946c <print_cpu_status+0x1e8>
400093f0:	e08f0000 	add	r0, pc, r0
400093f4:	ebfffb9e 	bl	40008274 <printk>
400093f8:	eaffffde 	b	40009378 <print_cpu_status+0xf4>
400093fc:	e59f006c 	ldr	r0, [pc, #108]	; 40009470 <print_cpu_status+0x1ec>
40009400:	e08f0000 	add	r0, pc, r0
40009404:	ebfffb9a 	bl	40008274 <printk>
40009408:	eaffffbc 	b	40009300 <print_cpu_status+0x7c>
4000940c:	e59f0060 	ldr	r0, [pc, #96]	; 40009474 <print_cpu_status+0x1f0>
40009410:	e08f0000 	add	r0, pc, r0
40009414:	ebfffb96 	bl	40008274 <printk>
40009418:	eaffffb8 	b	40009300 <print_cpu_status+0x7c>
4000941c:	e59f0054 	ldr	r0, [pc, #84]	; 40009478 <print_cpu_status+0x1f4>
40009420:	e08f0000 	add	r0, pc, r0
40009424:	ebfffb92 	bl	40008274 <printk>
40009428:	eaffffb4 	b	40009300 <print_cpu_status+0x7c>
4000942c:	e59f0048 	ldr	r0, [pc, #72]	; 4000947c <print_cpu_status+0x1f8>
40009430:	e08f0000 	add	r0, pc, r0
40009434:	ebfffb8e 	bl	40008274 <printk>
40009438:	eaffffb0 	b	40009300 <print_cpu_status+0x7c>
4000943c:	0000077c 	andeq	r0, r0, ip, ror r7
40009440:	00000748 	andeq	r0, r0, r8, asr #14
40009444:	00000794 	muleq	r0, r4, r7
40009448:	000007b4 			; <UNDEFINED> instruction: 0x000007b4
4000944c:	000007bc 			; <UNDEFINED> instruction: 0x000007bc
40009450:	000007c4 	andeq	r0, r0, r4, asr #15
40009454:	000007e8 	andeq	r0, r0, r8, ror #15
40009458:	000007f8 	strdeq	r0, [r0], -r8
4000945c:	00000730 	andeq	r0, r0, r0, lsr r7
40009460:	00000744 	andeq	r0, r0, r4, asr #14
40009464:	0000074c 	andeq	r0, r0, ip, asr #14
40009468:	00000758 	andeq	r0, r0, r8, asr r7
4000946c:	00000750 	andeq	r0, r0, r0, asr r7
40009470:	00000690 	muleq	r0, r0, r6
40009474:	00000644 	andeq	r0, r0, r4, asr #12
40009478:	00000648 	andeq	r0, r0, r8, asr #12
4000947c:	0000064c 	andeq	r0, r0, ip, asr #12

40009480 <reg_dump>:
40009480:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
40009484:	e24dd04c 	sub	sp, sp, #76	; 0x4c
40009488:	e3a03072 	mov	r3, #114	; 0x72
4000948c:	e58d3004 	str	r3, [sp, #4]
40009490:	e1a03000 	mov	r3, r0
40009494:	e58d3008 	str	r3, [sp, #8]
40009498:	e1a03001 	mov	r3, r1
4000949c:	e58d300c 	str	r3, [sp, #12]
400094a0:	e1a03002 	mov	r3, r2
400094a4:	e58d3010 	str	r3, [sp, #16]
400094a8:	e1a03003 	mov	r3, r3
400094ac:	e58d3014 	str	r3, [sp, #20]
400094b0:	e1a03004 	mov	r3, r4
400094b4:	e58d3018 	str	r3, [sp, #24]
400094b8:	e1a03005 	mov	r3, r5
400094bc:	e58d301c 	str	r3, [sp, #28]
400094c0:	e1a03006 	mov	r3, r6
400094c4:	e58d3020 	str	r3, [sp, #32]
400094c8:	e1a03007 	mov	r3, r7
400094cc:	e58d3024 	str	r3, [sp, #36]	; 0x24
400094d0:	e1a03008 	mov	r3, r8
400094d4:	e58d3028 	str	r3, [sp, #40]	; 0x28
400094d8:	e1a03009 	mov	r3, r9
400094dc:	e58d302c 	str	r3, [sp, #44]	; 0x2c
400094e0:	e1a0300a 	mov	r3, sl
400094e4:	e58d3030 	str	r3, [sp, #48]	; 0x30
400094e8:	e1a0300b 	mov	r3, fp
400094ec:	e58d3034 	str	r3, [sp, #52]	; 0x34
400094f0:	e1a0300c 	mov	r3, ip
400094f4:	e58d3038 	str	r3, [sp, #56]	; 0x38
400094f8:	e1a0300d 	mov	r3, sp
400094fc:	e58d303c 	str	r3, [sp, #60]	; 0x3c
40009500:	e1a0300e 	mov	r3, lr
40009504:	e58d3040 	str	r3, [sp, #64]	; 0x40
40009508:	e1a0300f 	mov	r3, pc
4000950c:	e59f90d8 	ldr	r9, [pc, #216]	; 400095ec <reg_dump+0x16c>
40009510:	e28d6005 	add	r6, sp, #5
40009514:	e59f80d4 	ldr	r8, [pc, #212]	; 400095f0 <reg_dump+0x170>
40009518:	e3a05001 	mov	r5, #1
4000951c:	e59f70d0 	ldr	r7, [pc, #208]	; 400095f4 <reg_dump+0x174>
40009520:	e3a04000 	mov	r4, #0
40009524:	e08f9009 	add	r9, pc, r9
40009528:	e58d3044 	str	r3, [sp, #68]	; 0x44
4000952c:	e08f8008 	add	r8, pc, r8
40009530:	e08f7007 	add	r7, pc, r7
40009534:	ea000010 	b	4000957c <reg_dump+0xfc>
40009538:	e354000d 	cmp	r4, #13
4000953c:	0a000020 	beq	400095c4 <reg_dump+0x144>
40009540:	e354000e 	cmp	r4, #14
40009544:	0a000023 	beq	400095d8 <reg_dump+0x158>
40009548:	e354000f 	cmp	r4, #15
4000954c:	0a000013 	beq	400095a0 <reg_dump+0x120>
40009550:	e28d3008 	add	r3, sp, #8
40009554:	e3540009 	cmp	r4, #9
40009558:	d1a00007 	movle	r0, r7
4000955c:	c1a00008 	movgt	r0, r8
40009560:	e7932104 	ldr	r2, [r3, r4, lsl #2]
40009564:	e28d1004 	add	r1, sp, #4
40009568:	ebfffb41 	bl	40008274 <printk>
4000956c:	e3550010 	cmp	r5, #16
40009570:	0a00000e 	beq	400095b0 <reg_dump+0x130>
40009574:	e2844001 	add	r4, r4, #1
40009578:	e2855001 	add	r5, r5, #1
4000957c:	e3a0200a 	mov	r2, #10
40009580:	e1a01006 	mov	r1, r6
40009584:	e1a00004 	mov	r0, r4
40009588:	ebfffce8 	bl	40008930 <itoa>
4000958c:	e3140001 	tst	r4, #1
40009590:	1affffe8 	bne	40009538 <reg_dump+0xb8>
40009594:	e1a00009 	mov	r0, r9
40009598:	ebfffb35 	bl	40008274 <printk>
4000959c:	eaffffe5 	b	40009538 <reg_dump+0xb8>
400095a0:	e59f0050 	ldr	r0, [pc, #80]	; 400095f8 <reg_dump+0x178>
400095a4:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
400095a8:	e08f0000 	add	r0, pc, r0
400095ac:	ebfffb30 	bl	40008274 <printk>
400095b0:	e59f0044 	ldr	r0, [pc, #68]	; 400095fc <reg_dump+0x17c>
400095b4:	e08f0000 	add	r0, pc, r0
400095b8:	ebfffb2d 	bl	40008274 <printk>
400095bc:	e28dd04c 	add	sp, sp, #76	; 0x4c
400095c0:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
400095c4:	e59f0034 	ldr	r0, [pc, #52]	; 40009600 <reg_dump+0x180>
400095c8:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
400095cc:	e08f0000 	add	r0, pc, r0
400095d0:	ebfffb27 	bl	40008274 <printk>
400095d4:	eaffffe6 	b	40009574 <reg_dump+0xf4>
400095d8:	e59f0024 	ldr	r0, [pc, #36]	; 40009604 <reg_dump+0x184>
400095dc:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
400095e0:	e08f0000 	add	r0, pc, r0
400095e4:	ebfffb22 	bl	40008274 <printk>
400095e8:	eaffffe1 	b	40009574 <reg_dump+0xf4>
400095ec:	000004b4 			; <UNDEFINED> instruction: 0x000004b4
400095f0:	000006a4 	andeq	r0, r0, r4, lsr #13
400095f4:	00000694 	muleq	r0, r4, r6
400095f8:	00000610 	andeq	r0, r0, r0, lsl r6
400095fc:	000005e8 	andeq	r0, r0, r8, ror #11
40009600:	000005d4 	ldrdeq	r0, [r0], -r4
40009604:	000005cc 	andeq	r0, r0, ip, asr #11

40009608 <enable_irq>:
40009608:	e10f0000 	mrs	r0, CPSR
4000960c:	e3c00080 	bic	r0, r0, #128	; 0x80
40009610:	e129f000 	msr	CPSR_fc, r0
40009614:	e12fff1e 	bx	lr

40009618 <disable_irq>:
40009618:	e10f0000 	mrs	r0, CPSR
4000961c:	e3800080 	orr	r0, r0, #128	; 0x80
40009620:	e129f000 	msr	CPSR_fc, r0
40009624:	e12fff1e 	bx	lr

40009628 <enable_fiq>:
40009628:	e10f0000 	mrs	r0, CPSR
4000962c:	e3c00040 	bic	r0, r0, #64	; 0x40
40009630:	e129f000 	msr	CPSR_fc, r0
40009634:	e12fff1e 	bx	lr

40009638 <disable_fiq>:
40009638:	e10f0000 	mrs	r0, CPSR
4000963c:	e3800040 	orr	r0, r0, #64	; 0x40
40009640:	e129f000 	msr	CPSR_fc, r0
40009644:	e12fff1e 	bx	lr

40009648 <enable_abort>:
40009648:	f1080100 	cpsie	a
4000964c:	e12fff1e 	bx	lr

40009650 <disable_abort>:
40009650:	f10c0100 	cpsid	a
40009654:	e12fff1e 	bx	lr

40009658 <enable_int>:
40009658:	e10f0000 	mrs	r0, CPSR
4000965c:	e3c00080 	bic	r0, r0, #128	; 0x80
40009660:	e129f000 	msr	CPSR_fc, r0
40009664:	e10f0000 	mrs	r0, CPSR
40009668:	e3c00040 	bic	r0, r0, #64	; 0x40
4000966c:	e129f000 	msr	CPSR_fc, r0
40009670:	f1080100 	cpsie	a
40009674:	e12fff1e 	bx	lr

40009678 <disable_int>:
40009678:	e10f0000 	mrs	r0, CPSR
4000967c:	e3800080 	orr	r0, r0, #128	; 0x80
40009680:	e129f000 	msr	CPSR_fc, r0
40009684:	e10f0000 	mrs	r0, CPSR
40009688:	e3800040 	orr	r0, r0, #64	; 0x40
4000968c:	e129f000 	msr	CPSR_fc, r0
40009690:	f10c0100 	cpsid	a
40009694:	e12fff1e 	bx	lr

40009698 <get_cpu_mode>:
40009698:	e10f0000 	mrs	r0, CPSR
4000969c:	e200001f 	and	r0, r0, #31
400096a0:	e1a03000 	mov	r3, r0
400096a4:	e6ef0073 	uxtb	r0, r3
400096a8:	e12fff1e 	bx	lr

400096ac <set_cpu_mode>:
400096ac:	e129f000 	msr	CPSR_fc, r0
400096b0:	e12fff1e 	bx	lr

400096b4 <print_stack>:
400096b4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
400096b8:	e1a05000 	mov	r5, r0
400096bc:	e59f0074 	ldr	r0, [pc, #116]	; 40009738 <print_stack+0x84>
400096c0:	e1a06001 	mov	r6, r1
400096c4:	e1a01005 	mov	r1, r5
400096c8:	e08f0000 	add	r0, pc, r0
400096cc:	ebfffae8 	bl	40008274 <printk>
400096d0:	e3560000 	cmp	r6, #0
400096d4:	0a00000f 	beq	40009718 <print_stack+0x64>
400096d8:	e59f705c 	ldr	r7, [pc, #92]	; 4000973c <print_stack+0x88>
400096dc:	e2455004 	sub	r5, r5, #4
400096e0:	e59f8058 	ldr	r8, [pc, #88]	; 40009740 <print_stack+0x8c>
400096e4:	e3a04000 	mov	r4, #0
400096e8:	e08f7007 	add	r7, pc, r7
400096ec:	e08f8008 	add	r8, pc, r8
400096f0:	e5b53004 	ldr	r3, [r5, #4]!
400096f4:	e354000d 	cmp	r4, #13
400096f8:	e1a01004 	mov	r1, r4
400096fc:	e1a00007 	mov	r0, r7
40009700:	e1a02003 	mov	r2, r3
40009704:	0a000007 	beq	40009728 <print_stack+0x74>
40009708:	ebfffad9 	bl	40008274 <printk>
4000970c:	e2844001 	add	r4, r4, #1
40009710:	e1540006 	cmp	r4, r6
40009714:	1afffff5 	bne	400096f0 <print_stack+0x3c>
40009718:	e59f0024 	ldr	r0, [pc, #36]	; 40009744 <print_stack+0x90>
4000971c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
40009720:	e08f0000 	add	r0, pc, r0
40009724:	eafffad2 	b	40008274 <printk>
40009728:	e1a01003 	mov	r1, r3
4000972c:	e1a00008 	mov	r0, r8
40009730:	ebfffacf 	bl	40008274 <printk>
40009734:	eafffff4 	b	4000970c <print_stack+0x58>
40009738:	00000514 	andeq	r0, r0, r4, lsl r5
4000973c:	00000508 	andeq	r0, r0, r8, lsl #10
40009740:	000004f8 	strdeq	r0, [r0], -r8
40009744:	000002b8 			; <UNDEFINED> instruction: 0x000002b8

40009748 <init_timer0>:
40009748:	e3a03b03 	mov	r3, #3072	; 0xc00
4000974c:	e3020ee0 	movw	r0, #12000	; 0x2ee0
40009750:	e34031c2 	movt	r3, #450	; 0x1c2
40009754:	e1a02003 	mov	r2, r3
40009758:	e5931000 	ldr	r1, [r3]
4000975c:	e3811001 	orr	r1, r1, #1
40009760:	e5831000 	str	r1, [r3]
40009764:	e5830014 	str	r0, [r3, #20]
40009768:	e5931010 	ldr	r1, [r3, #16]
4000976c:	e3811010 	orr	r1, r1, #16
40009770:	e5831010 	str	r1, [r3, #16]
40009774:	e5931010 	ldr	r1, [r3, #16]
40009778:	e3811004 	orr	r1, r1, #4
4000977c:	e5831010 	str	r1, [r3, #16]
40009780:	e5931010 	ldr	r1, [r3, #16]
40009784:	e3811002 	orr	r1, r1, #2
40009788:	e5831010 	str	r1, [r3, #16]
4000978c:	e5923010 	ldr	r3, [r2, #16]
40009790:	e3130002 	tst	r3, #2
40009794:	1afffffc 	bne	4000978c <init_timer0+0x44>
40009798:	e5923010 	ldr	r3, [r2, #16]
4000979c:	e3833001 	orr	r3, r3, #1
400097a0:	e5823010 	str	r3, [r2, #16]
400097a4:	e12fff1e 	bx	lr

400097a8 <clean_pending_timer0>:
400097a8:	e3a03b03 	mov	r3, #3072	; 0xc00
400097ac:	e34031c2 	movt	r3, #450	; 0x1c2
400097b0:	e5932004 	ldr	r2, [r3, #4]
400097b4:	e3822001 	orr	r2, r2, #1
400097b8:	e5832004 	str	r2, [r3, #4]
400097bc:	e12fff1e 	bx	lr

400097c0 <enable_int_timer0>:
400097c0:	e3a03b03 	mov	r3, #3072	; 0xc00
400097c4:	e34031c2 	movt	r3, #450	; 0x1c2
400097c8:	e5932010 	ldr	r2, [r3, #16]
400097cc:	e3822001 	orr	r2, r2, #1
400097d0:	e5832010 	str	r2, [r3, #16]
400097d4:	e12fff1e 	bx	lr

400097d8 <disable_int_timer0>:
400097d8:	e3a03b03 	mov	r3, #3072	; 0xc00
400097dc:	e34031c2 	movt	r3, #450	; 0x1c2
400097e0:	e5932010 	ldr	r2, [r3, #16]
400097e4:	e3c22001 	bic	r2, r2, #1
400097e8:	e5832010 	str	r2, [r3, #16]
400097ec:	e12fff1e 	bx	lr

400097f0 <init_gic>:
400097f0:	e3a03a01 	mov	r3, #4096	; 0x1000
400097f4:	e3a02a02 	mov	r2, #8192	; 0x2000
400097f8:	e34031c8 	movt	r3, #456	; 0x1c8
400097fc:	e34021c8 	movt	r2, #456	; 0x1c8
40009800:	e5931000 	ldr	r1, [r3]
40009804:	e3811001 	orr	r1, r1, #1
40009808:	e5831000 	str	r1, [r3]
4000980c:	e5931104 	ldr	r1, [r3, #260]	; 0x104
40009810:	e3811701 	orr	r1, r1, #262144	; 0x40000
40009814:	e5831104 	str	r1, [r3, #260]	; 0x104
40009818:	e5931830 	ldr	r1, [r3, #2096]	; 0x830
4000981c:	e3811801 	orr	r1, r1, #65536	; 0x10000
40009820:	e5831830 	str	r1, [r3, #2096]	; 0x830
40009824:	e5923000 	ldr	r3, [r2]
40009828:	e3833001 	orr	r3, r3, #1
4000982c:	e5823000 	str	r3, [r2]
40009830:	e12fff1e 	bx	lr

40009834 <pro>:
40009834:	e59f2030 	ldr	r2, [pc, #48]	; 4000986c <pro+0x38>
40009838:	e59f3030 	ldr	r3, [pc, #48]	; 40009870 <pro+0x3c>
4000983c:	e08f2002 	add	r2, pc, r2
40009840:	e59f502c 	ldr	r5, [pc, #44]	; 40009874 <pro+0x40>
40009844:	e92d4010 	push	{r4, lr}
40009848:	e08f5005 	add	r5, pc, r5
4000984c:	e7924003 	ldr	r4, [r2, r3]
40009850:	ebffff70 	bl	40009618 <disable_irq>
40009854:	e5943000 	ldr	r3, [r4]
40009858:	e1a00005 	mov	r0, r5
4000985c:	e5931008 	ldr	r1, [r3, #8]
40009860:	ebfffa83 	bl	40008274 <printk>
40009864:	ebffff67 	bl	40009608 <enable_irq>
40009868:	eafffff8 	b	40009850 <pro+0x1c>
4000986c:	000019d4 	ldrdeq	r1, [r0], -r4
40009870:	0000000c 	andeq	r0, r0, ip
40009874:	000003c0 	andeq	r0, r0, r0, asr #7

40009878 <test_p>:
40009878:	eaffffed 	b	40009834 <pro>

4000987c <init>:
4000987c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
40009880:	e3a01001 	mov	r1, #1
40009884:	e59f70c0 	ldr	r7, [pc, #192]	; 4000994c <init+0xd0>
40009888:	e3a06000 	mov	r6, #0
4000988c:	e59f30bc 	ldr	r3, [pc, #188]	; 40009950 <init+0xd4>
40009890:	e24dd02c 	sub	sp, sp, #44	; 0x2c
40009894:	e08f7007 	add	r7, pc, r7
40009898:	e59f20b4 	ldr	r2, [pc, #180]	; 40009954 <init+0xd8>
4000989c:	e7973003 	ldr	r3, [r7, r3]
400098a0:	e59f50b0 	ldr	r5, [pc, #176]	; 40009958 <init+0xdc>
400098a4:	e583100c 	str	r1, [r3, #12]
400098a8:	e5836000 	str	r6, [r3]
400098ac:	e5836004 	str	r6, [r3, #4]
400098b0:	e5836008 	str	r6, [r3, #8]
400098b4:	e7974002 	ldr	r4, [r7, r2]
400098b8:	e08f5005 	add	r5, pc, r5
400098bc:	e5843000 	str	r3, [r4]
400098c0:	ebffffca 	bl	400097f0 <init_gic>
400098c4:	ebffff9f 	bl	40009748 <init_timer0>
400098c8:	ebffff4e 	bl	40009608 <enable_irq>
400098cc:	e59f0088 	ldr	r0, [pc, #136]	; 4000995c <init+0xe0>
400098d0:	e08f0000 	add	r0, pc, r0
400098d4:	ebfffa66 	bl	40008274 <printk>
400098d8:	ebfffe69 	bl	40009284 <print_cpu_status>
400098dc:	e59f307c 	ldr	r3, [pc, #124]	; 40009960 <init+0xe4>
400098e0:	e1a01006 	mov	r1, r6
400098e4:	e7970003 	ldr	r0, [r7, r3]
400098e8:	ebfffcff 	bl	40008cec <pthread_mutex_init>
400098ec:	e59f2070 	ldr	r2, [pc, #112]	; 40009964 <init+0xe8>
400098f0:	e1a03006 	mov	r3, r6
400098f4:	e1a01006 	mov	r1, r6
400098f8:	e28d0004 	add	r0, sp, #4
400098fc:	e7977002 	ldr	r7, [r7, r2]
40009900:	e1a02007 	mov	r2, r7
40009904:	ebfffc2b 	bl	400089b8 <pthread_create>
40009908:	e1a03006 	mov	r3, r6
4000990c:	e1a02007 	mov	r2, r7
40009910:	e1a01006 	mov	r1, r6
40009914:	e28d0010 	add	r0, sp, #16
40009918:	ebfffc26 	bl	400089b8 <pthread_create>
4000991c:	e1a03006 	mov	r3, r6
40009920:	e1a02007 	mov	r2, r7
40009924:	e1a01006 	mov	r1, r6
40009928:	e28d001c 	add	r0, sp, #28
4000992c:	ebfffc21 	bl	400089b8 <pthread_create>
40009930:	ebffff38 	bl	40009618 <disable_irq>
40009934:	e5943000 	ldr	r3, [r4]
40009938:	e1a00005 	mov	r0, r5
4000993c:	e5931008 	ldr	r1, [r3, #8]
40009940:	ebfffa4b 	bl	40008274 <printk>
40009944:	ebffff2f 	bl	40009608 <enable_irq>
40009948:	eafffff8 	b	40009930 <init+0xb4>
4000994c:	0000197c 	andeq	r1, r0, ip, ror r9
40009950:	00000004 	andeq	r0, r0, r4
40009954:	0000000c 	andeq	r0, r0, ip
40009958:	00000350 	andeq	r0, r0, r0, asr r3
4000995c:	00000344 	andeq	r0, r0, r4, asr #6
40009960:	0000001c 	andeq	r0, r0, ip, lsl r0
40009964:	00000028 	andeq	r0, r0, r8, lsr #32

40009968 <main>:
40009968:	e92d4030 	push	{r4, r5, lr}
4000996c:	e24dd014 	sub	sp, sp, #20
40009970:	e59f501c 	ldr	r5, [pc, #28]	; 40009994 <main+0x2c>
40009974:	e28d0004 	add	r0, sp, #4
40009978:	ebfffc95 	bl	40008bd4 <pthread_self>
4000997c:	e08f5005 	add	r5, pc, r5
40009980:	e59d4008 	ldr	r4, [sp, #8]
40009984:	e1a01004 	mov	r1, r4
40009988:	e1a00005 	mov	r0, r5
4000998c:	ebfffa38 	bl	40008274 <printk>
40009990:	eafffffb 	b	40009984 <main+0x1c>
40009994:	00000280 	andeq	r0, r0, r0, lsl #5

40009998 <PCB_SIZE>:
40009998:	00000030 	andeq	r0, r0, r0, lsr r0
4000999c:	5d64255b 	cfstr64pl	mvdx2, [r4, #-364]!	; 0xfffffe94
400099a0:	00003e2d 	andeq	r3, r0, sp, lsr #28
400099a4:	4c4c554e 	cfstr64mi	mvdx5, [ip], {78}	; 0x4e
400099a8:	0000000a 	andeq	r0, r0, sl
400099ac:	00007325 	andeq	r7, r0, r5, lsr #6
400099b0:	55200a0a 	strpl	r0, [r0, #-2570]!	; 0xfffff5f6
400099b4:	6665646e 	strbtvs	r6, [r5], -lr, ror #8
400099b8:	64656e69 	strbtvs	r6, [r5], #-3689	; 0xfffff197
400099bc:	736e6920 	cmnvc	lr, #32, 18	; 0x80000
400099c0:	63757274 	cmnvs	r5, #116, 4	; 0x40000007
400099c4:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
400099c8:	0a0a2021 	beq	40291a54 <_ebss+0x284fbc>
400099cc:	00000000 	andeq	r0, r0, r0
400099d0:	44200a0a 	strtmi	r0, [r0], #-2570	; 0xfffff5f6
400099d4:	20617461 	rsbcs	r7, r1, r1, ror #8
400099d8:	726f6261 	rsbvc	r6, pc, #268435462	; 0x10000006
400099dc:	0a202174 	beq	40811fb4 <_ebss+0x80551c>
400099e0:	0000000a 	andeq	r0, r0, sl
400099e4:	20515249 	subscs	r5, r1, r9, asr #4
400099e8:	6d6f7266 	sfmvs	f7, 2, [pc, #-408]!	; 40009858 <pro+0x24>
400099ec:	6d697420 	cfstrdvs	mvd7, [r9, #-128]!	; 0xffffff80
400099f0:	20307265 	eorscs	r7, r0, r5, ror #4
400099f4:	68746977 	ldmdavs	r4!, {r0, r1, r2, r4, r5, r6, r8, fp, sp, lr}^
400099f8:	3a444920 	bcc	4111be80 <_ebss+0x110f3e8>
400099fc:	0a303520 	beq	40c16e84 <_ebss+0xc0a3ec>
40009a00:	00000000 	andeq	r0, r0, r0
40009a04:	54200a0a 	strtpl	r0, [r0], #-2570	; 0xfffff5f6
40009a08:	20736968 	rsbscs	r6, r3, r8, ror #18
40009a0c:	61207369 			; <UNDEFINED> instruction: 0x61207369
40009a10:	51494620 	cmppl	r9, r0, lsr #12
40009a14:	0a0a2021 	beq	40291aa0 <_ebss+0x285008>
40009a18:	00000000 	andeq	r0, r0, r0
40009a1c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009a20:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009a24:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009a28:	632d2d2d 			; <UNDEFINED> instruction: 0x632d2d2d
40009a2c:	73207570 			; <UNDEFINED> instruction: 0x73207570
40009a30:	75746174 	ldrbvc	r6, [r4, #-372]!	; 0xfffffe8c
40009a34:	2d2d2d73 	stccs	13, cr2, [sp, #-460]!	; 0xfffffe34
40009a38:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009a3c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009a40:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009a44:	00000a0a 	andeq	r0, r0, sl, lsl #20
40009a48:	20757063 	rsbscs	r7, r5, r3, rrx
40009a4c:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
40009a50:	5355203a 	cmppl	r5, #58	; 0x3a
40009a54:	6f6d2052 	svcvs	0x006d2052
40009a58:	000a6564 	andeq	r6, sl, r4, ror #10
40009a5c:	20757063 	rsbscs	r7, r5, r3, rrx
40009a60:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
40009a64:	4946203a 	stmdbmi	r6, {r1, r3, r4, r5, sp}^
40009a68:	6f6d2051 	svcvs	0x006d2051
40009a6c:	000a6564 	andeq	r6, sl, r4, ror #10
40009a70:	20757063 	rsbscs	r7, r5, r3, rrx
40009a74:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
40009a78:	5249203a 	subpl	r2, r9, #58	; 0x3a
40009a7c:	6f6d2051 	svcvs	0x006d2051
40009a80:	000a6564 	andeq	r6, sl, r4, ror #10
40009a84:	20757063 	rsbscs	r7, r5, r3, rrx
40009a88:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
40009a8c:	5653203a 			; <UNDEFINED> instruction: 0x5653203a
40009a90:	6f6d2043 	svcvs	0x006d2043
40009a94:	000a6564 	andeq	r6, sl, r4, ror #10
40009a98:	20757063 	rsbscs	r7, r5, r3, rrx
40009a9c:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
40009aa0:	5953203a 	ldmdbpl	r3, {r1, r3, r4, r5, sp}^
40009aa4:	6f6d2053 	svcvs	0x006d2053
40009aa8:	000a6564 	andeq	r6, sl, r4, ror #10
40009aac:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
40009ab0:	20656e69 	rsbcs	r6, r5, r9, ror #28
40009ab4:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
40009ab8:	54203a65 	strtpl	r3, [r0], #-2661	; 0xfffff59b
40009abc:	626d7568 	rsbvs	r7, sp, #104, 10	; 0x1a000000
40009ac0:	61747320 	cmnvs	r4, r0, lsr #6
40009ac4:	000a6574 	andeq	r6, sl, r4, ror r5
40009ac8:	6863616d 	stmdavs	r3!, {r0, r2, r3, r5, r6, r8, sp, lr}^
40009acc:	20656e69 	rsbcs	r6, r5, r9, ror #28
40009ad0:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
40009ad4:	41203a65 			; <UNDEFINED> instruction: 0x41203a65
40009ad8:	73204d52 			; <UNDEFINED> instruction: 0x73204d52
40009adc:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
40009ae0:	0000000a 	andeq	r0, r0, sl
40009ae4:	3a514946 	bcc	4145c004 <_ebss+0x144f56c>
40009ae8:	73696420 	cmnvc	r9, #32, 8	; 0x20000000
40009aec:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
40009af0:	00000a64 	andeq	r0, r0, r4, ror #20
40009af4:	3a514946 	bcc	4145c014 <_ebss+0x144f57c>
40009af8:	616e6520 	cmnvs	lr, r0, lsr #10
40009afc:	64656c62 	strbtvs	r6, [r5], #-3170	; 0xfffff39e
40009b00:	0000000a 	andeq	r0, r0, sl
40009b04:	3a515249 	bcc	4145e430 <_ebss+0x1451998>
40009b08:	73696420 	cmnvc	r9, #32, 8	; 0x20000000
40009b0c:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
40009b10:	00000a64 	andeq	r0, r0, r4, ror #20
40009b14:	3a515249 	bcc	4145e440 <_ebss+0x14519a8>
40009b18:	616e6520 	cmnvs	lr, r0, lsr #10
40009b1c:	64656c62 	strbtvs	r6, [r5], #-3170	; 0xfffff39e
40009b20:	0000000a 	andeq	r0, r0, sl
40009b24:	524f4241 	subpl	r4, pc, #268435460	; 0x10000004
40009b28:	64203a54 	strtvs	r3, [r0], #-2644	; 0xfffff5ac
40009b2c:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
40009b30:	0a64656c 	beq	419230e8 <_ebss+0x1916650>
40009b34:	00000000 	andeq	r0, r0, r0
40009b38:	524f4241 	subpl	r4, pc, #268435460	; 0x10000004
40009b3c:	65203a54 	strvs	r3, [r0, #-2644]!	; 0xfffff5ac
40009b40:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
40009b44:	000a6465 	andeq	r6, sl, r5, ror #8
40009b48:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
40009b4c:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xfffff19f
40009b50:	203a7373 	eorscs	r7, sl, r3, ror r3
40009b54:	20676962 	rsbcs	r6, r7, r2, ror #18
40009b58:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
40009b5c:	000a6e61 	andeq	r6, sl, r1, ror #28
40009b60:	69646e65 	stmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
40009b64:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xfffff19f
40009b68:	203a7373 	eorscs	r7, sl, r3, ror r3
40009b6c:	7474696c 	ldrbtvc	r6, [r4], #-2412	; 0xfffff694
40009b70:	6520656c 	strvs	r6, [r0, #-1388]!	; 0xfffffa94
40009b74:	6169646e 	cmnvs	r9, lr, ror #8
40009b78:	00000a6e 	andeq	r0, r0, lr, ror #20
40009b7c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b80:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b84:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b88:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b8c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b90:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b94:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b98:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009b9c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009ba0:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
40009ba4:	00000a0a 	andeq	r0, r0, sl, lsl #20
40009ba8:	203a7073 	eorscs	r7, sl, r3, ror r0
40009bac:	09702520 	ldmdbeq	r0!, {r5, r8, sl, sp}^
40009bb0:	00002020 	andeq	r2, r0, r0, lsr #32
40009bb4:	203a726c 	eorscs	r7, sl, ip, ror #4
40009bb8:	09702520 	ldmdbeq	r0!, {r5, r8, sl, sp}^
40009bbc:	00002020 	andeq	r2, r0, r0, lsr #32
40009bc0:	203a6370 	eorscs	r6, sl, r0, ror r3
40009bc4:	09702520 	ldmdbeq	r0!, {r5, r8, sl, sp}^
40009bc8:	00002020 	andeq	r2, r0, r0, lsr #32
40009bcc:	203a7325 	eorscs	r7, sl, r5, lsr #6
40009bd0:	09702520 	ldmdbeq	r0!, {r5, r8, sl, sp}^
40009bd4:	00002020 	andeq	r2, r0, r0, lsr #32
40009bd8:	203a7325 	eorscs	r7, sl, r5, lsr #6
40009bdc:	20097025 	andcs	r7, r9, r5, lsr #32
40009be0:	00000020 	andeq	r0, r0, r0, lsr #32
40009be4:	203a7073 	eorscs	r7, sl, r3, ror r0
40009be8:	000a7025 	andeq	r7, sl, r5, lsr #32
40009bec:	3a343172 	bcc	40d161bc <_ebss+0xd09724>
40009bf0:	0a702520 	beq	41c13078 <_ebss+0x1c065e0>
40009bf4:	00000000 	andeq	r0, r0, r0
40009bf8:	3a642572 	bcc	419131c8 <_ebss+0x1906730>
40009bfc:	0a702520 	beq	41c13084 <_ebss+0x1c065ec>
40009c00:	00000000 	andeq	r0, r0, r0
40009c04:	65726854 	ldrbvs	r6, [r2, #-2132]!	; 0xfffff7ac
40009c08:	25206461 	strcs	r6, [r0, #-1121]!	; 0xfffffb9f
40009c0c:	00000a64 	andeq	r0, r0, r4, ror #20
40009c10:	636f7250 	cmnvs	pc, #80, 4
40009c14:	20737365 	rsbscs	r7, r3, r5, ror #6
40009c18:	000a6425 	andeq	r6, sl, r5, lsr #8
40009c1c:	72617453 	rsbvc	r7, r1, #1392508928	; 0x53000000
40009c20:	676e6974 			; <UNDEFINED> instruction: 0x676e6974
40009c24:	616c6c20 	cmnvs	ip, r0, lsr #24
40009c28:	2e786f6e 	cdpcs	15, 7, cr6, cr8, cr14, {3}
40009c2c:	6b202e2e 	blvs	408154ec <_ebss+0x808a54>
40009c30:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
40009c34:	6f6c206c 	svcvs	0x006c206c
40009c38:	64656461 	strbtvs	r6, [r5], #-1121	; 0xfffffb9f
40009c3c:	0a4b4f20 	beq	412dd8c4 <_ebss+0x12d0e2c>
40009c40:	0000000a 	andeq	r0, r0, sl

40009c44 <user_start>:
40009c44:	50c0f249 	sbcpl	pc, r0, r9, asr #4
40009c48:	0000f2c5 	andeq	pc, r0, r5, asr #5
40009c4c:	53c0f249 	bicpl	pc, r0, #-1879048188	; 0x90000004
40009c50:	0300f2c5 	movweq	pc, #709	; 0x2c5	; <UNPREDICTABLE>
40009c54:	d0054283 	andle	r4, r5, r3, lsl #5
40009c58:	0300f240 	movweq	pc, #576	; 0x240	; <UNPREDICTABLE>
40009c5c:	0300f2c0 	movweq	pc, #704	; 0x2c0	; <UNPREDICTABLE>
40009c60:	4718b103 	ldrmi	fp, [r8, -r3, lsl #2]
40009c64:	bf004770 	svclt	0x00004770
40009c68:	50c0f249 	sbcpl	pc, r0, r9, asr #4
40009c6c:	0000f2c5 	andeq	pc, r0, r5, asr #5
40009c70:	51c0f249 	bicpl	pc, r0, r9, asr #4
40009c74:	0100f2c5 	smlabteq	r0, r5, r2, pc	; <UNPREDICTABLE>
40009c78:	10891a09 	addne	r1, r9, r9, lsl #20
40009c7c:	71d1eb01 	bicsvc	lr, r1, r1, lsl #22
40009c80:	d0051049 	andle	r1, r5, r9, asr #32
40009c84:	0300f240 	movweq	pc, #576	; 0x240	; <UNPREDICTABLE>
40009c88:	0300f2c0 	movweq	pc, #704	; 0x2c0	; <UNPREDICTABLE>
40009c8c:	4718b103 	ldrmi	fp, [r8, -r3, lsl #2]
40009c90:	bf004770 	svclt	0x00004770
40009c94:	f249b510 	vqrshl.s8	d27, d0, d9
40009c98:	f2c554c4 	vmls.i<illegal width 8>	d21, d21, d0[1]
40009c9c:	78230400 	stmdavc	r3!, {sl}
40009ca0:	f7ffb973 			; <UNDEFINED> instruction: 0xf7ffb973
40009ca4:	f240ffcf 	vmax.f32	<illegal reg q15.5>, q8, <illegal reg q7.5>
40009ca8:	f2c00300 	vsubw.s8	q8, q0, d0
40009cac:	b12b0300 			; <UNDEFINED> instruction: 0xb12b0300
40009cb0:	5064f648 	rsbpl	pc, r4, r8, asr #12
40009cb4:	0000f2c5 	andeq	pc, r0, r5, asr #5
40009cb8:	8000f3af 	andhi	pc, r0, pc, lsr #7
40009cbc:	70232301 	eorvc	r2, r3, r1, lsl #6
40009cc0:	bf00bd10 	svclt	0x0000bd10
40009cc4:	f240b508 	vrshl.s8	d27, d8, d0
40009cc8:	f2c00300 	vsubw.s8	q8, q0, d0
40009ccc:	b14b0300 	mrslt	r0, (UNDEF: 123)
40009cd0:	51c8f249 	bicpl	pc, r8, r9, asr #4
40009cd4:	5064f648 	rsbpl	pc, r4, r8, asr #12
40009cd8:	0100f2c5 	smlabteq	r0, r5, r2, pc	; <UNPREDICTABLE>
40009cdc:	0000f2c5 	andeq	pc, r0, r5, asr #5
40009ce0:	8000f3af 	andhi	pc, r0, pc, lsr #7
40009ce4:	4008e8bd 			; <UNDEFINED> instruction: 0x4008e8bd
40009ce8:	bf00e7be 	svclt	0x0000e7be
40009cec:	2b004b13 	blcs	4001c940 <_ebss+0xfea8>
40009cf0:	4b11bf08 	blmi	40479918 <_ebss+0x46ce80>
40009cf4:	f5a3469d 			; <UNDEFINED> instruction: 0xf5a3469d
40009cf8:	21003a80 	smlabbcs	r0, r0, sl, r3
40009cfc:	460f468b 	strmi	r4, [pc], -fp, lsl #13
40009d00:	4a124811 	bmi	4049bd4c <_ebss+0x48f2b4>
40009d04:	f0001a12 			; <UNDEFINED> instruction: 0xf0001a12
40009d08:	4b0df8af 	blmi	40387fcc <_ebss+0x37b534>
40009d0c:	d0002b00 	andle	r2, r0, r0, lsl #22
40009d10:	4b0c4798 	blmi	4031bb78 <_ebss+0x30f0e0>
40009d14:	d0002b00 	andle	r2, r0, r0, lsl #22
40009d18:	20004798 	mulcs	r0, r8, r7
40009d1c:	00042100 	andeq	r2, r4, r0, lsl #2
40009d20:	480b000d 	stmdami	fp, {r0, r2, r3}
40009d24:	f84af000 			; <UNDEFINED> instruction: 0xf84af000
40009d28:	f876f000 			; <UNDEFINED> instruction: 0xf876f000
40009d2c:	00290020 	eoreq	r0, r9, r0, lsr #32
40009d30:	e810f000 	ldmda	r0, {ip, sp, lr, pc}
40009d34:	f848f000 			; <UNDEFINED> instruction: 0xf848f000
40009d38:	00080000 	andeq	r0, r8, r0
	...
40009d48:	500095c4 	andpl	r9, r0, r4, asr #11
40009d4c:	50009618 	andpl	r9, r0, r8, lsl r6
40009d50:	500081a5 	andpl	r8, r0, r5, lsr #3
40009d54:	e59f1018 	ldr	r1, [pc, #24]	; 40009d74 <user_start+0x130>
40009d58:	e3a0200c 	mov	r2, #12
40009d5c:	e92d4010 	push	{r4, lr}
40009d60:	e3a00001 	mov	r0, #1
40009d64:	e08f1001 	add	r1, pc, r1
40009d68:	fa000064 	blx	40009f00 <user_start+0x2bc>
40009d6c:	e3a00000 	mov	r0, #0
40009d70:	e8bd8010 	pop	{r4, pc}
40009d74:	00000c08 	andeq	r0, r0, r8, lsl #24
40009d78:	e1a00000 	nop			; (mov r0, r0)
40009d7c:	e1a01001 	mov	r1, r1
40009d80:	e1a02002 	mov	r2, r2
40009d84:	e3a03004 	mov	r3, #4
40009d88:	e1a07003 	mov	r7, r3
40009d8c:	ef000000 	svc	0x00000000
40009d90:	e1a00000 	nop			; (mov r0, r0)
40009d94:	e12fff1e 	bx	lr
40009d98:	eafffffe 	b	40009d98 <user_start+0x154>
40009d9c:	e59f1014 	ldr	r1, [pc, #20]	; 40009db8 <user_start+0x174>
40009da0:	e3a02005 	mov	r2, #5
40009da4:	e92d4010 	push	{r4, lr}
40009da8:	e3a00000 	mov	r0, #0
40009dac:	e08f1001 	add	r1, pc, r1
40009db0:	ebfffff0 	bl	40009d78 <user_start+0x134>
40009db4:	eafffffe 	b	40009db4 <user_start+0x170>
40009db8:	00000bd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
40009dbc:	46012300 	strmi	r2, [r1], -r0, lsl #6
40009dc0:	4618461a 			; <UNDEFINED> instruction: 0x4618461a
40009dc4:	b8bef000 	ldmlt	lr!, {ip, sp, lr, pc}
40009dc8:	2100b508 	tstcs	r0, r8, lsl #10
40009dcc:	f0004604 			; <UNDEFINED> instruction: 0xf0004604
40009dd0:	f648f8ef 			; <UNDEFINED> instruction: 0xf648f8ef
40009dd4:	f2c55348 	vqdmlal.s<illegal width 8>	<illegal reg q10.5>, d5, d0[2]
40009dd8:	68180300 	ldmdavs	r8, {r8, r9}
40009ddc:	b1036bc3 	smlabtlt	r3, r3, fp, r6
40009de0:	46204798 			; <UNDEFINED> instruction: 0x46204798
40009de4:	efdaf7ff 	svc	0x00daf7ff
40009de8:	f240b538 	vqrshl.s8	d27, d24, d0
40009dec:	f2400400 	vshl.s8	d16, d0, d0
40009df0:	f2c00500 	vabal.s8	q8, d0, d0
40009df4:	f2c00400 	vaddhn.i16	d16, q0, q0
40009df8:	1b640500 	blne	4190b200 <_ebss+0x18fe768>
40009dfc:	d00710a4 	andle	r1, r7, r4, lsr #1
40009e00:	0584eb05 	streq	lr, [r4, #2821]	; 0xb05
40009e04:	f8553c01 			; <UNDEFINED> instruction: 0xf8553c01
40009e08:	47983d04 	ldrmi	r3, [r8, r4, lsl #26]
40009e0c:	d1f92c00 	mvnsle	r2, r0, lsl #24
40009e10:	4038e8bd 	ldrhtmi	lr, [r8], -sp
40009e14:	bdc2f000 	stcllt	0, cr15, [r2]
40009e18:	f240b570 	vqrshl.s8	<illegal reg q13.5>, q8, q0
40009e1c:	f2400600 	vmax.s8	d16, d0, d0
40009e20:	f2c00500 	vabal.s8	q8, d0, d0
40009e24:	f2c00600 	vsubhn.i16	d16, q0, q0
40009e28:	1b760500 	blne	41d8b230 <_ebss+0x1d7e798>
40009e2c:	d00610b6 	strhle	r1, [r6], -r6
40009e30:	34012400 	strcc	r2, [r1], #-1024	; 0xfffffc00
40009e34:	3b04f855 	blcc	40147f90 <_ebss+0x13b4f8>
40009e38:	42a64798 	adcmi	r4, r6, #152, 14	; 0x2600000
40009e3c:	f240d1f9 	vand	<illegal reg q14.5>, q8, <illegal reg q12.5>
40009e40:	f2400600 	vmax.s8	d16, d0, d0
40009e44:	f2c00500 	vabal.s8	q8, d0, d0
40009e48:	f2c00600 	vsubhn.i16	d16, q0, q0
40009e4c:	1b760500 	blne	41d8b254 <_ebss+0x1d7e7bc>
40009e50:	fd9ef000 	ldc2	0, cr15, [lr]
40009e54:	d00610b6 	strhle	r1, [r6], -r6
40009e58:	34012400 	strcc	r2, [r1], #-1024	; 0xfffffc00
40009e5c:	3b04f855 	blcc	40147fb8 <_ebss+0x13b520>
40009e60:	42a64798 	adcmi	r4, r6, #152, 14	; 0x2600000
40009e64:	bd70d1f9 	ldfltp	f5, [r0, #-996]!	; 0xfffffc1c
40009e68:	0786b4f0 			; <UNDEFINED> instruction: 0x0786b4f0
40009e6c:	1e54d044 	cdpne	0, 5, cr13, cr4, cr4, {2}
40009e70:	d03f2a00 	eorsle	r2, pc, r0, lsl #20
40009e74:	4603b2ca 	strmi	fp, [r3], -sl, asr #5
40009e78:	f114e002 			; <UNDEFINED> instruction: 0xf114e002
40009e7c:	d33934ff 	teqle	r9, #-16777216	; 0xff000000
40009e80:	2b01f803 	blcs	40087e94 <_ebss+0x7b3fc>
40009e84:	d1f8079d 			; <UNDEFINED> instruction: 0xd1f8079d
40009e88:	d92c2c03 	stmdble	ip!, {r0, r1, sl, fp, sp}
40009e8c:	2c0fb2cd 	sfmcs	f3, 1, [pc], {205}	; 0xcd
40009e90:	2505ea45 	strcs	lr, [r5, #-2629]	; 0xfffff5bb
40009e94:	4505ea45 	strmi	lr, [r5, #-2629]	; 0xfffff5bb
40009e98:	f1a4d916 			; <UNDEFINED> instruction: 0xf1a4d916
40009e9c:	f1030710 			; <UNDEFINED> instruction: 0xf1030710
40009ea0:	f1030620 			; <UNDEFINED> instruction: 0xf1030620
40009ea4:	093f0210 	ldmdbeq	pc!, {r4, r9}	; <UNPREDICTABLE>
40009ea8:	1607eb06 	strne	lr, [r7], -r6, lsl #22
40009eac:	5504e942 	strpl	lr, [r4, #-2370]	; 0xfffff6be
40009eb0:	5502e942 	strpl	lr, [r2, #-2370]	; 0xfffff6be
40009eb4:	42b23210 	adcsmi	r3, r2, #16, 4
40009eb8:	f004d1f8 			; <UNDEFINED> instruction: 0xf004d1f8
40009ebc:	3701040f 	strcc	r0, [r1, -pc, lsl #8]
40009ec0:	eb032c03 	bl	400d4ed4 <_ebss+0xc843c>
40009ec4:	d90e1307 	stmdble	lr, {r0, r1, r2, r8, r9, ip}
40009ec8:	1d1f1f26 	ldcne	15, cr1, [pc, #-152]	; 40009e38 <user_start+0x1f4>
40009ecc:	08b6461a 	ldmeq	r6!, {r1, r3, r4, r9, sl, lr}
40009ed0:	0786eb07 	streq	lr, [r6, r7, lsl #22]
40009ed4:	5b04f842 	blpl	40147fe4 <_ebss+0x13b54c>
40009ed8:	d1fb42ba 	ldrhle	r4, [fp, #42]!	; 0x2a
40009edc:	f0043601 			; <UNDEFINED> instruction: 0xf0043601
40009ee0:	eb030403 	bl	400caef4 <_ebss+0xbe45c>
40009ee4:	b12c0386 	smlawblt	ip, r6, r3, r0
40009ee8:	441cb2c9 	ldrmi	fp, [ip], #-713	; 0xfffffd37
40009eec:	1b01f803 	blne	40087f00 <_ebss+0x7b468>
40009ef0:	d1fb429c 			; <UNDEFINED> instruction: 0xd1fb429c
40009ef4:	4770bcf0 			; <UNDEFINED> instruction: 0x4770bcf0
40009ef8:	46034614 			; <UNDEFINED> instruction: 0x46034614
40009efc:	bf00e7c4 	svclt	0x0000e7c4
40009f00:	f648b410 			; <UNDEFINED> instruction: 0xf648b410
40009f04:	f2c55478 	vmvn.i32	<illegal reg q10.5>, #5767168	; 0x00580000
40009f08:	46130400 	ldrmi	r0, [r3], -r0, lsl #8
40009f0c:	4601460a 	strmi	r4, [r1], -sl, lsl #12
40009f10:	bc106820 	ldclt	8, cr6, [r0], {32}
40009f14:	b800f000 	stmdalt	r0, {ip, sp, lr, pc}
40009f18:	460db570 			; <UNDEFINED> instruction: 0x460db570
40009f1c:	6414f249 	ldrvs	pc, [r4], #-585	; 0xfffffdb7
40009f20:	0400f2c5 	streq	pc, [r0], #-709	; 0xfffffd3b
40009f24:	46064611 			; <UNDEFINED> instruction: 0x46064611
40009f28:	4628461a 			; <UNDEFINED> instruction: 0x4628461a
40009f2c:	60232300 	eorvs	r2, r3, r0, lsl #6
40009f30:	ef22f7ff 	svc	0x0022f7ff
40009f34:	d0001c43 	andle	r1, r0, r3, asr #24
40009f38:	6823bd70 	stmdavs	r3!, {r4, r5, r6, r8, sl, fp, ip, sp, pc}
40009f3c:	d0fb2b00 	rscsle	r2, fp, r0, lsl #22
40009f40:	bd706033 	ldcllt	0, cr6, [r0, #-204]!	; 0xffffff34
40009f44:	f648b4f0 			; <UNDEFINED> instruction: 0xf648b4f0
40009f48:	f2c55448 	vmls.i<illegal width 8>	d21, d5, d0[2]
40009f4c:	68250400 	stmdavs	r5!, {sl}
40009f50:	4148f8d5 	ldrdmi	pc, [r8, #-133]	; 0xffffff7b
40009f54:	6865b31c 	stmdavs	r5!, {r2, r3, r4, r8, r9, ip, sp, pc}^
40009f58:	dc252d1f 	stcle	13, cr2, [r5], #-124	; 0xffffff84
40009f5c:	1cabb938 			; <UNDEFINED> instruction: 0x1cabb938
40009f60:	35012000 	strcc	r2, [r1, #-0]
40009f64:	f8446065 			; <UNDEFINED> instruction: 0xf8446065
40009f68:	bcf01023 	ldcllt	0, cr1, [r0], #140	; 0x8c
40009f6c:	eb044770 	bl	4011bd34 <_ebss+0x10f29c>
40009f70:	28020685 	stmdacs	r2, {r0, r2, r7, r9, sl}
40009f74:	0701f04f 	streq	pc, [r1, -pc, asr #32]
40009f78:	2088f8c6 	addcs	pc, r8, r6, asr #17
40009f7c:	f705fa07 			; <UNDEFINED> instruction: 0xf705fa07
40009f80:	2188f8d4 	ldrdcs	pc, [r8, r4]
40009f84:	0207ea42 	andeq	lr, r7, #270336	; 0x42000
40009f88:	2188f8c4 	orrcs	pc, r8, r4, asr #17
40009f8c:	3108f8c6 	smlabtcc	r8, r6, r8, pc	; <UNPREDICTABLE>
40009f90:	f8d4bf02 			; <UNDEFINED> instruction: 0xf8d4bf02
40009f94:	431f318c 	tstmi	pc, #140, 2	; 0x23
40009f98:	718cf8c4 	orrvc	pc, ip, r4, asr #17
40009f9c:	f505e7df 			; <UNDEFINED> instruction: 0xf505e7df
40009fa0:	f8c574a6 			; <UNDEFINED> instruction: 0xf8c574a6
40009fa4:	e7d64148 	ldrb	r4, [r6, r8, asr #2]
40009fa8:	30fff04f 	rscscc	pc, pc, pc, asr #32
40009fac:	bf00e7dd 	svclt	0x0000e7dd
40009fb0:	5348f648 	movtpl	pc, #34376	; 0x8648	; <UNPREDICTABLE>
40009fb4:	0300f2c5 	movweq	pc, #709	; 0x2c5	; <UNPREDICTABLE>
40009fb8:	4ff0e92d 	svcmi	0x00f0e92d
40009fbc:	681fb083 	ldmdavs	pc, {r0, r1, r7, ip, sp, pc}	; <UNPREDICTABLE>
40009fc0:	f04f468b 			; <UNDEFINED> instruction: 0xf04f468b
40009fc4:	f04f0801 			; <UNDEFINED> instruction: 0xf04f0801
40009fc8:	90010900 	andls	r0, r1, r0, lsl #18
40009fcc:	6148f8d7 	ldrdvs	pc, [r8, #-135]	; 0xffffff79
40009fd0:	6874b186 	ldmdavs	r4!, {r1, r2, r7, r8, ip, sp, pc}^
40009fd4:	d40d1e65 	strle	r1, [sp], #-3685	; 0xfffff19b
40009fd8:	eb063401 	bl	40196fe4 <_ebss+0x18a54c>
40009fdc:	f1bb0484 			; <UNDEFINED> instruction: 0xf1bb0484
40009fe0:	d00a0f00 	andle	r0, sl, r0, lsl #30
40009fe4:	3100f8d4 	ldrdcc	pc, [r0, -r4]
40009fe8:	d006455b 	andle	r4, r6, fp, asr r5
40009fec:	3c043d01 	stccc	13, cr3, [r4], {1}
40009ff0:	d1f41c6b 	mvnsle	r1, fp, ror #24
40009ff4:	e8bdb003 	pop	{r0, r1, ip, sp, pc}
40009ff8:	68738ff0 	ldmdavs	r3!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}^
40009ffc:	3b016822 	blcc	4006408c <_ebss+0x575f4>
4000a000:	bf0c42ab 	svclt	0x000c42ab
4000a004:	f8c46075 			; <UNDEFINED> instruction: 0xf8c46075
4000a008:	2a009000 	bcs	4002e010 <_ebss+0x21578>
4000a00c:	f8d6d0ee 			; <UNDEFINED> instruction: 0xf8d6d0ee
4000a010:	fa081188 	blx	4020e638 <_ebss+0x201ba0>
4000a014:	f8d6fc05 			; <UNDEFINED> instruction: 0xf8d6fc05
4000a018:	ea1ca004 	b	40732030 <_ebss+0x725598>
4000a01c:	d1090f01 	tstle	r9, r1, lsl #30
4000a020:	68714790 	ldmdavs	r1!, {r4, r7, r8, r9, sl, lr}^
4000a024:	2148f8d7 	ldrdcs	pc, [r8, #-135]	; 0xffffff79
4000a028:	d1014551 	tstle	r1, r1, asr r5
4000a02c:	d0dd4296 	smullsle	r4, sp, r6, r2
4000a030:	e7cd4616 	bfi	r4, r6, #12, #2
4000a034:	318cf8d6 	ldrdcc	pc, [ip, r6]
4000a038:	1080f8d4 	ldrdne	pc, [r0], r4
4000a03c:	0f03ea1c 	svceq	0x0003ea1c
4000a040:	9801d102 	stmdals	r1, {r1, r8, ip, lr, pc}
4000a044:	e7ec4790 			; <UNDEFINED> instruction: 0xe7ec4790
4000a048:	47904608 	ldrmi	r4, [r0, r8, lsl #12]
4000a04c:	bf00e7e9 	svclt	0x0000e7e9
4000a050:	0300f240 	movweq	pc, #576	; 0x240	; <UNPREDICTABLE>
4000a054:	0300f2c0 	movweq	pc, #704	; 0x2c0	; <UNPREDICTABLE>
4000a058:	f248b12b 	vrhadd.s8	d27, d8, d27
4000a05c:	f2c510a5 	vaddl.s8	<illegal reg q8.5>, d21, d21
4000a060:	f7ff0000 			; <UNDEFINED> instruction: 0xf7ff0000
4000a064:	4770beab 	ldrbmi	fp, [r0, -fp, lsr #29]!
4000a068:	460cb538 			; <UNDEFINED> instruction: 0x460cb538
4000a06c:	46056809 	strmi	r6, [r5], -r9, lsl #16
4000a070:	4621b929 	strtmi	fp, [r1], -r9, lsr #18
4000a074:	e8bd4628 	pop	{r3, r5, r9, sl, lr}
4000a078:	f0004038 			; <UNDEFINED> instruction: 0xf0004038
4000a07c:	f7ffb8a3 			; <UNDEFINED> instruction: 0xf7ffb8a3
4000a080:	4621fff3 	qsub8mi	pc, r1, r3	; <UNPREDICTABLE>
4000a084:	e8bd4628 	pop	{r3, r5, r9, sl, lr}
4000a088:	f0004038 			; <UNDEFINED> instruction: 0xf0004038
4000a08c:	bf00b89b 	svclt	0x0000b89b
4000a090:	5378f648 	cmnpl	r8, #72, 12	; 0x4800000	; <UNPREDICTABLE>
4000a094:	0300f2c5 	movweq	pc, #709	; 0x2c5	; <UNPREDICTABLE>
4000a098:	4283681b 	addmi	r6, r3, #1769472	; 0x1b0000
4000a09c:	6cc3d03b 	stclvs	0, cr13, [r3], {59}	; 0x3b
4000a0a0:	4605b570 			; <UNDEFINED> instruction: 0x4605b570
4000a0a4:	2600b18b 	strcs	fp, [r0], -fp, lsl #3
4000a0a8:	b1395999 	teqlt	r9, r9	; <illegal shifter operand>
4000a0ac:	4628680c 	strtmi	r6, [r8], -ip, lsl #16
4000a0b0:	f888f000 			; <UNDEFINED> instruction: 0xf888f000
4000a0b4:	2c004621 	stccs	6, cr4, [r0], {33}	; 0x21
4000a0b8:	6cebd1f8 	stfvsp	f5, [fp], #992	; 0x3e0
4000a0bc:	2e803604 	cdpcs	6, 8, cr3, cr0, cr4, {0}
4000a0c0:	4619d1f2 			; <UNDEFINED> instruction: 0x4619d1f2
4000a0c4:	f0004628 			; <UNDEFINED> instruction: 0xf0004628
4000a0c8:	6c29f87d 	stcvs	8, cr15, [r9], #-500	; 0xfffffe0c
4000a0cc:	4628b111 			; <UNDEFINED> instruction: 0x4628b111
4000a0d0:	f878f000 			; <UNDEFINED> instruction: 0xf878f000
4000a0d4:	1148f8d5 	ldrdne	pc, [r8, #-133]	; 0xffffff7b
4000a0d8:	f505b151 			; <UNDEFINED> instruction: 0xf505b151
4000a0dc:	42b176a6 	adcsmi	r7, r1, #174063616	; 0xa600000
4000a0e0:	680cd006 	stmdavs	ip, {r1, r2, ip, lr, pc}
4000a0e4:	f0004628 			; <UNDEFINED> instruction: 0xf0004628
4000a0e8:	42a6f86d 	adcmi	pc, r6, #7143424	; 0x6d0000
4000a0ec:	d1f84621 	mvnsle	r4, r1, lsr #12
4000a0f0:	b1116d69 	tstlt	r1, r9, ror #26
4000a0f4:	f0004628 			; <UNDEFINED> instruction: 0xf0004628
4000a0f8:	6babf865 	blvs	3eb08294 <__start-0x14ffd6c>
4000a0fc:	6bebb153 	blvs	3faf6650 <__start-0x5119b0>
4000a100:	47984628 	ldrmi	r4, [r8, r8, lsr #12]
4000a104:	12e0f8d5 	rscne	pc, r0, #13959168	; 0xd50000
4000a108:	4628b121 	strtmi	fp, [r8], -r1, lsr #2
4000a10c:	4070e8bd 	ldrhtmi	lr, [r0], #-141	; 0xffffff73
4000a110:	bfaaf7ff 	svclt	0x00aaf7ff
4000a114:	4770bd70 			; <UNDEFINED> instruction: 0x4770bd70
4000a118:	f249b5f8 	vqrshl.s8	<illegal reg q13.5>, q12, <illegal reg q12.5>
4000a11c:	f2c517a8 	vabdl.s8	<illegal reg q8.5>, d21, d24
4000a120:	460c0700 	strmi	r0, [ip], -r0, lsl #14
4000a124:	f0004606 			; <UNDEFINED> instruction: 0xf0004606
4000a128:	68bbfc0d 	ldmvs	fp!, {r0, r2, r3, sl, fp, ip, sp, lr, pc}
4000a12c:	617ef5c4 	cmnvs	lr, r4, asr #11	; <UNPREDICTABLE>
4000a130:	685d310f 	ldmdavs	sp, {r0, r1, r2, r3, r8, ip, sp}^
4000a134:	0503f025 	streq	pc, [r3, #-37]	; 0xffffffdb
4000a138:	f4214429 	vld3.8	{d4-d6}, [r1 :128], r9
4000a13c:	f021617f 			; <UNDEFINED> instruction: 0xf021617f
4000a140:	f5a1010f 			; <UNDEFINED> instruction: 0xf5a1010f
4000a144:	f5b45480 			; <UNDEFINED> instruction: 0xf5b45480
4000a148:	db075f80 	blle	401e1f50 <_ebss+0x1d54b8>
4000a14c:	46302100 	ldrtmi	r2, [r0], -r0, lsl #2
4000a150:	fbfcf000 	blx	3ff4615a <__start-0xc1ea6>
4000a154:	442b68bb 	strtmi	r6, [fp], #-2235	; 0xfffff745
4000a158:	d0044298 	mulle	r4, r8, r2
4000a15c:	f0004630 			; <UNDEFINED> instruction: 0xf0004630
4000a160:	2000fbf3 	strdcs	pc, [r0], -r3
4000a164:	4261bdf8 	rsbmi	fp, r1, #248, 26	; 0x3e00
4000a168:	f0004630 			; <UNDEFINED> instruction: 0xf0004630
4000a16c:	3001fbef 	andcc	pc, r1, pc, ror #23
4000a170:	68bad010 	ldmvs	sl!, {r4, ip, lr, pc}
4000a174:	53e4f249 	mvnpl	pc, #-1879048188	; 0x90000004
4000a178:	0300f2c5 	movweq	pc, #709	; 0x2c5	; <UNPREDICTABLE>
4000a17c:	46301b2d 	ldrtmi	r1, [r0], -sp, lsr #22
4000a180:	0501f045 	streq	pc, [r1, #-69]	; 0xffffffbb
4000a184:	60556819 	subsvs	r6, r5, r9, lsl r8
4000a188:	60191b09 	andsvs	r1, r9, r9, lsl #22
4000a18c:	fbdcf000 	blx	3f746196 <__start-0x8c1e6a>
4000a190:	bdf82001 	ldcllt	0, cr2, [r8, #4]!
4000a194:	46302100 	ldrtmi	r2, [r0], -r0, lsl #2
4000a198:	fbd8f000 	blx	3f6461a2 <__start-0x9c1e5e>
4000a19c:	1a8368ba 	bne	3e0e448c <__start-0x1f23b74>
4000a1a0:	dddb2b0f 	vldrle	d18, [fp, #60]	; 0x3c
4000a1a4:	54b0f249 	ldrtpl	pc, [r0], #585	; 0x249	; <UNPREDICTABLE>
4000a1a8:	0400f2c5 	streq	pc, [r0], #-709	; 0xfffffd3b
4000a1ac:	51e4f249 	mvnpl	pc, r9, asr #4
4000a1b0:	0100f2c5 	smlabteq	r0, r5, r2, pc	; <UNPREDICTABLE>
4000a1b4:	f0436824 			; <UNDEFINED> instruction: 0xf0436824
4000a1b8:	60530301 	subsvs	r0, r3, r1, lsl #6
4000a1bc:	60081b00 	andvs	r1, r8, r0, lsl #22
4000a1c0:	bf00e7cc 	svclt	0x0000e7cc
4000a1c4:	d0552900 	subsle	r2, r5, r0, lsl #18
4000a1c8:	460cb5f8 			; <UNDEFINED> instruction: 0x460cb5f8
4000a1cc:	f0004606 			; <UNDEFINED> instruction: 0xf0004606
4000a1d0:	f854fbb9 			; <UNDEFINED> instruction: 0xf854fbb9
4000a1d4:	f249cc04 			; <UNDEFINED> instruction: 0xf249cc04
4000a1d8:	f2c517a8 	vabdl.s8	<illegal reg q8.5>, d21, d24
4000a1dc:	f1a40700 			; <UNDEFINED> instruction: 0xf1a40700
4000a1e0:	f02c0508 			; <UNDEFINED> instruction: 0xf02c0508
4000a1e4:	186b0101 	stmdane	fp!, {r0, r8}^
4000a1e8:	685a68b8 	ldmdavs	sl, {r3, r4, r5, r7, fp, sp, lr}^
4000a1ec:	f0224298 			; <UNDEFINED> instruction: 0xf0224298
4000a1f0:	d0520203 	subsle	r0, r2, r3, lsl #4
4000a1f4:	0f01f01c 	svceq	0x0001f01c
4000a1f8:	eb03605a 	bl	400e2368 <_ebss+0xd58d0>
4000a1fc:	d13a0002 	teqle	sl, r2
4000a200:	4c08f854 	stcmi	8, cr15, [r8], {84}	; 0x54
4000a204:	0c08f107 	stfeqd	f7, [r8], {7}
4000a208:	1b2d6840 	blne	40b64310 <_ebss+0xb57878>
4000a20c:	f0004421 			; <UNDEFINED> instruction: 0xf0004421
4000a210:	68ac0001 	stmiavs	ip!, {r0}
4000a214:	d07b4564 	rsbsle	r4, fp, r4, ror #10
4000a218:	c00cf8d5 	ldrdgt	pc, [ip], -r5
4000a21c:	c00cf8c4 	andgt	pc, ip, r4, asr #17
4000a220:	4008f8cc 	andmi	pc, r8, ip, asr #17
4000a224:	f041b360 			; <UNDEFINED> instruction: 0xf041b360
4000a228:	606b0301 	rsbvs	r0, fp, r1, lsl #6
4000a22c:	f5b15069 			; <UNDEFINED> instruction: 0xf5b15069
4000a230:	d3567f00 	cmple	r6, #0, 30
4000a234:	2b040a4b 	blcs	4010cb68 <_ebss+0x1000d0>
4000a238:	098bd876 	stmibeq	fp, {r1, r2, r4, r5, r6, fp, ip, lr, pc}
4000a23c:	0039f103 	eorseq	pc, r9, r3, lsl #2
4000a240:	0238f103 	eorseq	pc, r8, #-1073741824	; 0xc0000000
4000a244:	18f800c3 	ldmne	r8!, {r0, r1, r6, r7}^
4000a248:	380858fb 	stmdacc	r8, {r0, r1, r3, r4, r5, r6, r7, fp, ip, lr}
4000a24c:	d07e4298 			; <UNDEFINED> instruction: 0xd07e4298
4000a250:	f022685a 			; <UNDEFINED> instruction: 0xf022685a
4000a254:	428a0203 	addmi	r0, sl, #805306368	; 0x30000000
4000a258:	689bd977 	ldmvs	fp, {r0, r1, r2, r4, r5, r6, r8, fp, ip, lr, pc}
4000a25c:	d1f74298 			; <UNDEFINED> instruction: 0xd1f74298
4000a260:	e9c568c1 	stmib	r5, {r0, r6, r7, fp, sp, lr}^
4000a264:	608d0102 	addvs	r0, sp, r2, lsl #2
4000a268:	463060c5 	ldrtmi	r6, [r0], -r5, asr #1
4000a26c:	40f8e8bd 	ldrhtmi	lr, [r8], #141	; 0x8d
4000a270:	bb6af000 	bllt	41ac6278 <_ebss+0x1ab97e0>
4000a274:	68404770 	stmdavs	r0, {r4, r5, r6, r8, r9, sl, lr}^
4000a278:	0001f000 	andeq	pc, r1, r0
4000a27c:	d1d22800 	bicsle	r2, r2, r0, lsl #16
4000a280:	44116898 	ldrmi	r6, [r1], #-2200	; 0xfffff768
4000a284:	f0414c49 			; <UNDEFINED> instruction: 0xf0414c49
4000a288:	42a00201 	adcmi	r0, r0, #268435456	; 0x10000000
4000a28c:	68dbd068 	ldmvs	fp, {r3, r5, r6, ip, lr, pc}^
4000a290:	609860c3 	addsvs	r6, r8, r3, asr #1
4000a294:	5069606a 	rsbpl	r6, r9, sl, rrx
4000a298:	f01ce7c9 			; <UNDEFINED> instruction: 0xf01ce7c9
4000a29c:	440a0f01 	strmi	r0, [sl], #-3841	; 0xfffff0ff
4000a2a0:	f854d107 			; <UNDEFINED> instruction: 0xf854d107
4000a2a4:	1aed3c08 	bne	3fb592cc <__start-0x4aed34>
4000a2a8:	e9d5441a 	ldmib	r5, {r1, r3, r4, sl, lr}^
4000a2ac:	60cb1302 	sbcvs	r1, fp, r2, lsl #6
4000a2b0:	f2496099 	vqadd.s8	d22, d25, d9
4000a2b4:	f2c553b4 	vrsra.s64	d21, d20, #59
4000a2b8:	f0420300 			; <UNDEFINED> instruction: 0xf0420300
4000a2bc:	60690101 	rsbvs	r0, r9, r1, lsl #2
4000a2c0:	60bd681b 	adcsvs	r6, sp, fp, lsl r8
4000a2c4:	d8074293 	stmdale	r7, {r0, r1, r4, r7, r9, lr}
4000a2c8:	53e0f249 	mvnpl	pc, #-1879048188	; 0x90000004
4000a2cc:	0300f2c5 	movweq	pc, #709	; 0x2c5	; <UNPREDICTABLE>
4000a2d0:	68194630 	ldmdavs	r9, {r4, r5, r9, sl, lr}
4000a2d4:	ff20f7ff 			; <UNDEFINED> instruction: 0xff20f7ff
4000a2d8:	e8bd4630 	pop	{r4, r5, r9, sl, lr}
4000a2dc:	f00040f8 			; <UNDEFINED> instruction: 0xf00040f8
4000a2e0:	08c9bb33 	stmiaeq	r9, {r0, r1, r4, r5, r8, r9, fp, ip, sp, pc}^
4000a2e4:	18c82301 	stmiane	r8, {r0, r8, r9, sp}^
4000a2e8:	1089687a 	addne	r6, r9, sl, ror r8
4000a2ec:	f857408b 			; <UNDEFINED> instruction: 0xf857408b
4000a2f0:	43131030 	tstmi	r3, #48	; 0x30
4000a2f4:	02c0eb07 	sbceq	lr, r0, #7168	; 0x1c00
4000a2f8:	3a08607b 	bcc	402224ec <_ebss+0x215a54>
4000a2fc:	1202e9c5 	andne	lr, r2, #3227648	; 0x314000
4000a300:	5030f847 	eorspl	pc, r0, r7, asr #16
4000a304:	60cd4630 	sbcvs	r4, sp, r0, lsr r6
4000a308:	40f8e8bd 	ldrhtmi	lr, [r8], #141	; 0x8d
4000a30c:	bb1cf000 	bllt	40746314 <_ebss+0x73987c>
4000a310:	d1452800 	cmple	r5, r0, lsl #16
4000a314:	440a6898 	strmi	r6, [sl], #-2200	; 0xfffff768
4000a318:	f04268db 			; <UNDEFINED> instruction: 0xf04268db
4000a31c:	60c30101 	sbcvs	r0, r3, r1, lsl #2
4000a320:	60696098 	mlsvs	r9, r8, r0, r6
4000a324:	e7d750aa 	ldrb	r5, [r7, sl, lsr #1]
4000a328:	d9082b14 	stmdble	r8, {r2, r4, r8, r9, fp, sp}
4000a32c:	d81e2b54 	ldmdale	lr, {r2, r4, r6, r8, r9, fp, sp}
4000a330:	f1030b0b 			; <UNDEFINED> instruction: 0xf1030b0b
4000a334:	f103006f 			; <UNDEFINED> instruction: 0xf103006f
4000a338:	00c3026e 	sbceq	r0, r3, lr, ror #4
4000a33c:	f103e783 			; <UNDEFINED> instruction: 0xf103e783
4000a340:	f103005c 			; <UNDEFINED> instruction: 0xf103005c
4000a344:	00c3025b 	sbceq	r0, r3, fp, asr r2
4000a348:	4618e77d 			; <UNDEFINED> instruction: 0x4618e77d
4000a34c:	1093e788 	addsne	lr, r3, r8, lsl #15
4000a350:	2201687c 	andcs	r6, r1, #124, 16	; 0x7c0000
4000a354:	fa024601 	blx	4009bb60 <_ebss+0x8f0c8>
4000a358:	4323f303 	msrmi	CPSR_xc, #201326592	; 0xc000000
4000a35c:	e780607b 			; <UNDEFINED> instruction: 0xe780607b
4000a360:	5504e9c7 	strpl	lr, [r4, #-2503]	; 0xfffff639
4000a364:	0002e9c5 	andeq	lr, r2, r5, asr #19
4000a368:	5069606a 	rsbpl	r6, r9, sl, rrx
4000a36c:	f5b3e7b4 			; <UNDEFINED> instruction: 0xf5b3e7b4
4000a370:	d8067faa 	stmdale	r6, {r1, r3, r5, r7, r8, r9, sl, fp, ip, sp, lr}
4000a374:	f1030bcb 			; <UNDEFINED> instruction: 0xf1030bcb
4000a378:	f1030078 			; <UNDEFINED> instruction: 0xf1030078
4000a37c:	00c30277 	sbceq	r0, r3, r7, ror r2
4000a380:	f240e761 	vabd.s8	q15, q0, <illegal reg q8.5>
4000a384:	42935254 	addsmi	r5, r3, #84, 4	; 0x40000005
4000a388:	0c8bbf9d 	stceq	15, cr11, [fp], {157}	; 0x9d
4000a38c:	007df103 	rsbseq	pc, sp, r3, lsl #2
4000a390:	027cf103 	rsbseq	pc, ip, #-1073741824	; 0xc0000000
4000a394:	737ef44f 	cmnvc	lr, #1325400064	; 0x4f000000	; <UNPREDICTABLE>
4000a398:	227ebf8c 	rsbscs	fp, lr, #140, 30	; 0x230
4000a39c:	e75200c3 	ldrb	r0, [r2, -r3, asr #1]
4000a3a0:	0201f041 	andeq	pc, r1, #65	; 0x41
4000a3a4:	6019606a 	andsvs	r6, r9, sl, rrx
4000a3a8:	bf00e796 	svclt	0x0000e796
4000a3ac:	500091b0 			; <UNDEFINED> instruction: 0x500091b0
4000a3b0:	4ff0e92d 	svcmi	0x00f0e92d
4000a3b4:	050bf101 	streq	pc, [fp, #-257]	; 0xfffffeff
4000a3b8:	b0832d16 	addlt	r2, r3, r6, lsl sp
4000a3bc:	d8274606 	stmdale	r7!, {r1, r2, r9, sl, lr}
4000a3c0:	f2002910 	vmul.i8	d2, d0, d0
4000a3c4:	f000818f 			; <UNDEFINED> instruction: 0xf000818f
4000a3c8:	2510fabd 	ldrcs	pc, [r0, #-2749]	; 0xfffff543
4000a3cc:	24022218 	strcs	r2, [r2], #-536	; 0xfffffde8
4000a3d0:	17a8f249 	strne	pc, [r8, r9, asr #4]!
4000a3d4:	0700f2c5 	streq	pc, [r0, -r5, asr #5]
4000a3d8:	f1a2443a 			; <UNDEFINED> instruction: 0xf1a2443a
4000a3dc:	68530108 	ldmdavs	r3, {r3, r8}^
4000a3e0:	f000428b 			; <UNDEFINED> instruction: 0xf000428b
4000a3e4:	685a81a8 	ldmdavs	sl, {r3, r5, r7, r8, pc}^
4000a3e8:	0408f103 	streq	pc, [r8], #-259	; 0xfffffefd
4000a3ec:	463068d9 			; <UNDEFINED> instruction: 0x463068d9
4000a3f0:	0203f022 	andeq	pc, r3, #34	; 0x22
4000a3f4:	4413689d 	ldrmi	r6, [r3], #-2205	; 0xfffff763
4000a3f8:	60e9685a 	rscvs	r6, r9, sl, asr r8
4000a3fc:	0201f042 	andeq	pc, r1, #66	; 0x42
4000a400:	605a608d 	subsvs	r6, sl, sp, lsl #1
4000a404:	faa0f000 	blx	3e84640c <__start-0x17c1bf4>
4000a408:	b0034620 	andlt	r4, r3, r0, lsr #12
4000a40c:	8ff0e8bd 	svchi	0x00f0e8bd
4000a410:	0507f025 	streq	pc, [r7, #-37]	; 0xffffffdb
4000a414:	bf9442a9 	svclt	0x009442a9
4000a418:	21012100 	mrscs	r2, (UNDEF: 17)
4000a41c:	73d5ea51 	bicsvc	lr, r5, #331776	; 0x51000
4000a420:	8160f040 	msrhi	SPSR_, r0, asr #32
4000a424:	fa8ef000 	blx	3e3c642c <__start-0x1c41bd4>
4000a428:	7ffcf5b5 	svcvc	0x00fcf5b5
4000a42c:	81a1f0c0 			; <UNDEFINED> instruction: 0x81a1f0c0
4000a430:	d00b0a6b 	andle	r0, fp, fp, ror #20
4000a434:	f2402b04 	vqdmulh.s<illegal width 8>	d18, d0, d4
4000a438:	2b14814e 	blcs	4052a978 <_ebss+0x51dee0>
4000a43c:	81d6f200 	bicshi	pc, r6, r0, lsl #4
4000a440:	045cf103 	ldrbeq	pc, [ip], #-259	; 0xfffffefd	; <UNPREDICTABLE>
4000a444:	0c5bf103 	ldfeqp	f7, [fp], {3}
4000a448:	e00400e3 	and	r0, r4, r3, ror #1
4000a44c:	7300f44f 	movwvc	pc, #1103	; 0x44f	; <UNPREDICTABLE>
4000a450:	f04f2440 			; <UNDEFINED> instruction: 0xf04f2440
4000a454:	f2490c3f 	vfma.f32	d16, d9, d31
4000a458:	f2c517a8 	vabdl.s8	<illegal reg q8.5>, d21, d24
4000a45c:	443b0700 	ldrtmi	r0, [fp], #-1792	; 0xfffff900
4000a460:	0008f1a3 	andeq	pc, r8, r3, lsr #3
4000a464:	4298685b 	addsmi	r6, r8, #5963776	; 0x5b0000
4000a468:	e00cd106 	and	sp, ip, r6, lsl #2
4000a46c:	f2802900 	vqdmlal.s<illegal width 8>	q1, d0, d0
4000a470:	68db8140 	ldmvs	fp, {r6, r8, pc}^
4000a474:	d0064298 	mulle	r6, r8, r2
4000a478:	f022685a 			; <UNDEFINED> instruction: 0xf022685a
4000a47c:	1b510203 	blne	4144ac90 <_ebss+0x143e1f8>
4000a480:	ddf3290f 			; <UNDEFINED> instruction: 0xddf3290f
4000a484:	693a4664 	ldmdbvs	sl!, {r2, r5, r6, r9, sl, lr}
4000a488:	c4b4f8df 	ldrtgt	pc, [r4], #2271	; 0x8df	; <UNPREDICTABLE>
4000a48c:	bf084562 	svclt	0x00084562
4000a490:	d026687b 	eorle	r6, r6, fp, ror r8
4000a494:	f0236853 			; <UNDEFINED> instruction: 0xf0236853
4000a498:	1b590303 	blne	4164b0ac <_ebss+0x163e614>
4000a49c:	f300290f 	vmls.i8	d2, d0, d15
4000a4a0:	29008151 	stmdbcs	r0, {r0, r4, r6, r8, pc}
4000a4a4:	cc04e9c7 			; <UNDEFINED> instruction: 0xcc04e9c7
4000a4a8:	8107f280 	smlabbhi	r7, r0, r2, pc	; <UNPREDICTABLE>
4000a4ac:	7f00f5b3 	svcvc	0x0000f5b3
4000a4b0:	817bf080 	cmnhi	fp, r0, lsl #1	; <UNPREDICTABLE>
4000a4b4:	f04f08db 			; <UNDEFINED> instruction: 0xf04f08db
4000a4b8:	eb030e01 	bl	400cdcc4 <_ebss+0xc122c>
4000a4bc:	6879000e 	ldmdavs	r9!, {r1, r2, r3}^
4000a4c0:	f857109b 			; <UNDEFINED> instruction: 0xf857109b
4000a4c4:	fa0e8030 	blx	403aa58c <_ebss+0x39daf4>
4000a4c8:	eb07f303 	bl	402070dc <_ebss+0x1fa644>
4000a4cc:	430b0ec0 	movwmi	r0, #48832	; 0xbec0
4000a4d0:	0108f1ae 	smlatbeq	r8, lr, r1, pc	; <UNPREDICTABLE>
4000a4d4:	e9c2607b 	stmib	r2, {r0, r1, r3, r4, r5, r6, sp, lr}^
4000a4d8:	f8478102 			; <UNDEFINED> instruction: 0xf8478102
4000a4dc:	f8c82030 			; <UNDEFINED> instruction: 0xf8c82030
4000a4e0:	10a2200c 	adcne	r2, r2, ip
4000a4e4:	40902001 	addsmi	r2, r0, r1
4000a4e8:	d8384298 	ldmdale	r8!, {r3, r4, r7, r9, lr}
4000a4ec:	d1054218 	tstle	r5, r8, lsl r2
4000a4f0:	0403f024 	streq	pc, [r3], #-36	; 0xffffffdc
4000a4f4:	34040040 	strcc	r0, [r4], #-64	; 0xffffffc0
4000a4f8:	d0fb4218 	rscsle	r4, fp, r8, lsl r2
4000a4fc:	09c4eb07 	stmibeq	r4, {r0, r1, r2, r8, r9, fp, sp, lr, pc}^
4000a500:	46ce46a0 	strbmi	r4, [lr], r0, lsr #13
4000a504:	300cf8de 	ldrdcc	pc, [ip], -lr
4000a508:	d107459e 			; <UNDEFINED> instruction: 0xd107459e
4000a50c:	2a00e135 	bcs	400429e8 <_ebss+0x35f50>
4000a510:	813cf280 	teqhi	ip, r0, lsl #5	; <UNPREDICTABLE>
4000a514:	459e68db 	ldrmi	r6, [lr, #2267]	; 0x8db
4000a518:	812ff000 	msrhi	CPSR_fsxc, r0
4000a51c:	f0216859 			; <UNDEFINED> instruction: 0xf0216859
4000a520:	1b4a0103 	blne	4128a934 <_ebss+0x127de9c>
4000a524:	ddf22a0f 			; <UNDEFINED> instruction: 0xddf22a0f
4000a528:	eb0368dc 	bl	400e48a0 <_ebss+0xd7e08>
4000a52c:	f8d30e05 			; <UNDEFINED> instruction: 0xf8d30e05
4000a530:	f0458008 			; <UNDEFINED> instruction: 0xf0458008
4000a534:	46300501 	ldrtmi	r0, [r0], -r1, lsl #10
4000a538:	f042605d 			; <UNDEFINED> instruction: 0xf042605d
4000a53c:	f8c80501 			; <UNDEFINED> instruction: 0xf8c80501
4000a540:	f8c4400c 			; <UNDEFINED> instruction: 0xf8c4400c
4000a544:	f1038008 			; <UNDEFINED> instruction: 0xf1038008
4000a548:	e9c70408 	stmib	r7, {r3, sl}^
4000a54c:	e9ceee04 	stmib	lr, {r2, r9, sl, fp, sp, lr, pc}^
4000a550:	f8cecc02 			; <UNDEFINED> instruction: 0xf8cecc02
4000a554:	505a5004 	subspl	r5, sl, r4
4000a558:	f9f6f000 			; <UNDEFINED> instruction: 0xf9f6f000
4000a55c:	68bce754 	ldmvs	ip!, {r2, r4, r6, r8, r9, sl, sp, lr, pc}
4000a560:	f0236863 			; <UNDEFINED> instruction: 0xf0236863
4000a564:	45aa0a03 	strmi	r0, [sl, #2563]!	; 0xa03
4000a568:	0305ebaa 	movweq	lr, #23466	; 0x5baa
4000a56c:	2200bf2c 	andcs	fp, r0, #44, 30	; 0xb0
4000a570:	2b0f2201 	blcs	403d2d7c <_ebss+0x3c62e4>
4000a574:	f042bfd8 			; <UNDEFINED> instruction: 0xf042bfd8
4000a578:	2a000201 	bcs	4000ad84 <user_start+0x1140>
4000a57c:	80cbf000 	sbchi	pc, fp, r0
4000a580:	59e0f249 	stmibpl	r0!, {r0, r3, r6, r9, ip, sp, lr, pc}^
4000a584:	0900f2c5 	stmdbeq	r0, {r0, r2, r6, r7, r9, ip, sp, lr, pc}
4000a588:	2408f8d7 	strcs	pc, [r8], #-2263	; 0xfffff729
4000a58c:	f8d94630 			; <UNDEFINED> instruction: 0xf8d94630
4000a590:	32013000 	andcc	r3, r1, #0
4000a594:	0803eb05 	stmdaeq	r3, {r0, r2, r8, r9, fp, sp, lr, pc}
4000a598:	f508bf17 			; <UNDEFINED> instruction: 0xf508bf17
4000a59c:	f1085880 			; <UNDEFINED> instruction: 0xf1085880
4000a5a0:	f1080810 			; <UNDEFINED> instruction: 0xf1080810
4000a5a4:	f428080f 	vld2.8	{d0-d1}, [r8]
4000a5a8:	bf18687f 	svclt	0x0018687f
4000a5ac:	080ff028 	stmdaeq	pc, {r3, r5, ip, sp, lr, pc}	; <UNPREDICTABLE>
4000a5b0:	f0004641 			; <UNDEFINED> instruction: 0xf0004641
4000a5b4:	f1b0f9cb 			; <UNDEFINED> instruction: 0xf1b0f9cb
4000a5b8:	46833fff 			; <UNDEFINED> instruction: 0x46833fff
4000a5bc:	8124f000 	msrhi	CPSR_s, r0
4000a5c0:	010aeb04 	tsteq	sl, r4, lsl #22
4000a5c4:	f2004281 	vhsub.s8	d4, d16, d1
4000a5c8:	f8d9811d 			; <UNDEFINED> instruction: 0xf8d9811d
4000a5cc:	44433004 	strbmi	r3, [r3], #-4
4000a5d0:	3004f8c9 	andcc	pc, r4, r9, asr #17
4000a5d4:	816ff000 	msrhi	SPSR_fsxc, r0
4000a5d8:	2408f8d7 	strcs	pc, [r8], #-2263	; 0xfffff729
4000a5dc:	bf0f3201 	svclt	0x000f3201
4000a5e0:	b408f8c7 	strlt	pc, [r8], #-2247	; 0xfffff739
4000a5e4:	0101ebab 	smlatbeq	r1, fp, fp, lr
4000a5e8:	f8c9185b 			; <UNDEFINED> instruction: 0xf8c9185b
4000a5ec:	f01b3004 			; <UNDEFINED> instruction: 0xf01b3004
4000a5f0:	f0000307 			; <UNDEFINED> instruction: 0xf0000307
4000a5f4:	f1c38145 			; <UNDEFINED> instruction: 0xf1c38145
4000a5f8:	f5c30108 			; <UNDEFINED> instruction: 0xf5c30108
4000a5fc:	448b5280 	strmi	r5, [fp], #640	; 0x280
4000a600:	44d83208 	ldrbmi	r3, [r8], #520	; 0x208
4000a604:	eba24630 	bl	3e89becc <__start-0x176c134>
4000a608:	93010208 	movwls	r0, #4616	; 0x1208
4000a60c:	020bf3c2 	andeq	pc, fp, #134217731	; 0x8000003
4000a610:	46119200 	ldrmi	r9, [r1], -r0, lsl #4
4000a614:	f99af000 			; <UNDEFINED> instruction: 0xf99af000
4000a618:	e9dd1c42 	ldmib	sp, {r1, r6, sl, fp, ip}^
4000a61c:	bf022300 	svclt	0x00022300
4000a620:	22003b08 	andcs	r3, r0, #8, 22	; 0x2000
4000a624:	0003eb08 	andeq	lr, r3, r8, lsl #22
4000a628:	3004f8d9 	ldrdcc	pc, [r4], -r9
4000a62c:	010beba0 	smlatbeq	fp, r0, fp, lr
4000a630:	441142bc 	ldrmi	r4, [r1], #-700	; 0xfffffd44
4000a634:	b008f8c7 	andlt	pc, r8, r7, asr #17
4000a638:	0101f041 	tsteq	r1, r1, asr #32	; <UNPREDICTABLE>
4000a63c:	f8cb4413 			; <UNDEFINED> instruction: 0xf8cb4413
4000a640:	f8c91004 			; <UNDEFINED> instruction: 0xf8c91004
4000a644:	d0183004 	andsle	r3, r8, r4
4000a648:	0f0ff1ba 	svceq	0x000ff1ba
4000a64c:	2301bf9c 	movwcs	fp, #8092	; 0x1f9c
4000a650:	3004f8cb 	andcc	pc, r4, fp, asr #17
4000a654:	f1aad92c 			; <UNDEFINED> instruction: 0xf1aad92c
4000a658:	6861020c 	stmdavs	r1!, {r2, r3, r9}^
4000a65c:	0207f022 	andeq	pc, r7, #34	; 0x22
4000a660:	0c05f04f 	stceq	0, cr15, [r5], {79}	; 0x4f
4000a664:	2a0f18a0 	bcs	403d08ec <_ebss+0x3c3e54>
4000a668:	0101f001 	tsteq	r1, r1	; <UNPREDICTABLE>
4000a66c:	0102ea41 	tsteq	r2, r1, asr #20
4000a670:	e9c06061 	stmib	r0, {r0, r5, r6, sp, lr}^
4000a674:	f200cc01 			; <UNDEFINED> instruction: 0xf200cc01
4000a678:	68bc814a 	ldmvs	ip!, {r1, r3, r6, r8, pc}
4000a67c:	202cf8d9 	ldrdcs	pc, [ip], -r9	; <UNPREDICTABLE>
4000a680:	1030f8d9 	ldrsbtne	pc, [r0], -r9	; <UNPREDICTABLE>
4000a684:	68624293 	stmdavs	r2!, {r0, r1, r4, r7, r9, lr}^
4000a688:	f8c9bf88 			; <UNDEFINED> instruction: 0xf8c9bf88
4000a68c:	428b302c 	addmi	r3, fp, #44	; 0x2c
4000a690:	0203f022 	andeq	pc, r3, #34	; 0x22
4000a694:	f8c9bf88 			; <UNDEFINED> instruction: 0xf8c9bf88
4000a698:	42953030 	addsmi	r3, r5, #48	; 0x30
4000a69c:	0305eba2 	movweq	lr, #23458	; 0x5ba2
4000a6a0:	2200bf94 	andcs	fp, r0, #148, 30	; 0x250
4000a6a4:	2b0f2201 	blcs	403d2eb0 <_ebss+0x3c6418>
4000a6a8:	f042bfd8 			; <UNDEFINED> instruction: 0xf042bfd8
4000a6ac:	b3920201 	orrslt	r0, r2, #268435456	; 0x10000000
4000a6b0:	24004630 	strcs	r4, [r0], #-1584	; 0xfffff9d0
4000a6b4:	f948f000 			; <UNDEFINED> instruction: 0xf948f000
4000a6b8:	4413e6a6 	ldrmi	lr, [r3], #-1702	; 0xfffff95a
4000a6bc:	0408f102 	streq	pc, [r8], #-258	; 0xfffffefe
4000a6c0:	685a4630 	ldmdavs	sl, {r4, r5, r9, sl, lr}^
4000a6c4:	0201f042 	andeq	pc, r1, #66	; 0x42
4000a6c8:	f000605a 			; <UNDEFINED> instruction: 0xf000605a
4000a6cc:	4620f93d 			; <UNDEFINED> instruction: 0x4620f93d
4000a6d0:	e8bdb003 	pop	{r0, r1, ip, sp, pc}
4000a6d4:	09ab8ff0 	stmibeq	fp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
4000a6d8:	0439f103 	ldrteq	pc, [r9], #-259	; 0xfffffefd	; <UNPREDICTABLE>
4000a6dc:	0c38f103 	ldfeqd	f7, [r8], #-12
4000a6e0:	e6b800e3 	ldrt	r0, [r8], r3, ror #1
4000a6e4:	230c2400 	movwcs	r2, #50176	; 0xc400
4000a6e8:	60334620 	eorsvs	r4, r3, r0, lsr #12
4000a6ec:	e8bdb003 	pop	{r0, r1, ip, sp, pc}
4000a6f0:	441a8ff0 	ldrmi	r8, [sl], #-4080	; 0xfffff010
4000a6f4:	7502e9d3 	strvc	lr, [r2, #-2515]	; 0xfffff62d
4000a6f8:	f1034630 			; <UNDEFINED> instruction: 0xf1034630
4000a6fc:	68510408 	ldmdavs	r1, {r3, sl}^
4000a700:	f04160fd 			; <UNDEFINED> instruction: 0xf04160fd
4000a704:	60af0101 	adcvs	r0, pc, r1, lsl #2
4000a708:	f0006051 			; <UNDEFINED> instruction: 0xf0006051
4000a70c:	4620f91d 			; <UNDEFINED> instruction: 0x4620f91d
4000a710:	e8bdb003 	pop	{r0, r1, ip, sp, pc}
4000a714:	19628ff0 	stmdbne	r2!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}^
4000a718:	0301f043 	movweq	pc, #4163	; 0x1043	; <UNPREDICTABLE>
4000a71c:	f0454630 			; <UNDEFINED> instruction: 0xf0454630
4000a720:	60650501 	rsbvs	r0, r5, r1, lsl #10
4000a724:	60ba3408 	adcsvs	r3, sl, r8, lsl #8
4000a728:	f0006053 			; <UNDEFINED> instruction: 0xf0006053
4000a72c:	4620f90d 	strtmi	pc, [r0], -sp, lsl #18
4000a730:	e8bdb003 	pop	{r0, r1, ip, sp, pc}
4000a734:	68d38ff0 	ldmvs	r3, {r4, r5, r6, r7, r8, r9, sl, fp, pc}^
4000a738:	bf08429a 	svclt	0x0008429a
4000a73c:	f43f3402 			; <UNDEFINED> instruction: 0xf43f3402
4000a740:	e650aea2 	ldrb	sl, [r0], -r2, lsr #29
4000a744:	0e05eb02 	vmlaeq.f64	d14, d5, d2
4000a748:	f0454630 			; <UNDEFINED> instruction: 0xf0454630
4000a74c:	60550501 	subsvs	r0, r5, r1, lsl #10
4000a750:	ee04e9c7 	vmls.f16	s28, s9, s14
4000a754:	0501f041 	streq	pc, [r1, #-65]	; 0xffffffbf
4000a758:	cc02e9ce 			; <UNDEFINED> instruction: 0xcc02e9ce
4000a75c:	0408f102 	streq	pc, [r8], #-258	; 0xfffffefe
4000a760:	5004f8ce 	andpl	pc, r4, lr, asr #17
4000a764:	f00050d1 			; <UNDEFINED> instruction: 0xf00050d1
4000a768:	4620f8ef 	strtmi	pc, [r0], -pc, ror #17
4000a76c:	e8bdb003 	pop	{r0, r1, ip, sp, pc}
4000a770:	08ec8ff0 	stmiaeq	ip!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}^
4000a774:	0208f105 	andeq	pc, r8, #1073741825	; 0x40000001
4000a778:	f108e62a 			; <UNDEFINED> instruction: 0xf108e62a
4000a77c:	f10e0801 			; <UNDEFINED> instruction: 0xf10e0801
4000a780:	f0180e08 			; <UNDEFINED> instruction: 0xf0180e08
4000a784:	f47f0f03 			; <UNDEFINED> instruction: 0xf47f0f03
4000a788:	e054aebd 	ldrh	sl, [r4], #-237	; 0xffffff13
4000a78c:	461c4419 			; <UNDEFINED> instruction: 0x461c4419
4000a790:	463068da 			; <UNDEFINED> instruction: 0x463068da
4000a794:	5f08f854 	svcpl	0x0008f854
4000a798:	f043684b 			; <UNDEFINED> instruction: 0xf043684b
4000a79c:	604b0301 	subvs	r0, fp, r1, lsl #6
4000a7a0:	609560ea 	addsvs	r6, r5, sl, ror #1
4000a7a4:	f8d0f000 			; <UNDEFINED> instruction: 0xf8d0f000
4000a7a8:	0a59e62e 	beq	41684068 <_ebss+0x16775d0>
4000a7ac:	d9302904 	ldmdble	r0!, {r2, r8, fp, sp}
4000a7b0:	d8782914 	ldmdale	r8!, {r2, r4, r8, fp, sp}^
4000a7b4:	005cf101 	subseq	pc, ip, r1, lsl #2
4000a7b8:	00c0315b 	sbceq	r3, r0, fp, asr r1
4000a7bc:	0e00eb07 	vmlaeq.f64	d14, d0, d7
4000a7c0:	f1ae5838 			; <UNDEFINED> instruction: 0xf1ae5838
4000a7c4:	45860e08 	strmi	r0, [r6, #3592]	; 0xe08
4000a7c8:	6841d051 	stmdavs	r1, {r0, r4, r6, ip, lr, pc}^
4000a7cc:	0103f021 	tsteq	r3, r1, lsr #32	; <UNPREDICTABLE>
4000a7d0:	d9024299 	stmdble	r2, {r0, r3, r4, r7, r9, lr}
4000a7d4:	45866880 	strmi	r6, [r6, #2176]	; 0x880
4000a7d8:	f8d0d1f7 			; <UNDEFINED> instruction: 0xf8d0d1f7
4000a7dc:	687be00c 	ldmdavs	fp!, {r2, r3, sp, lr, pc}^
4000a7e0:	0e02e9c2 	vmlseq.f16	s28, s5, s4	; <UNPREDICTABLE>
4000a7e4:	2008f8ce 	andcs	pc, r8, lr, asr #17
4000a7e8:	e67a60c2 	ldrbt	r6, [sl], -r2, asr #1
4000a7ec:	d9162b54 	ldmdble	r6, {r2, r4, r6, r8, r9, fp, sp}
4000a7f0:	7faaf5b3 	svcvc	0x00aaf5b3
4000a7f4:	0bebd86b 	bleq	3fb009a8 <__start-0x507658>
4000a7f8:	0478f103 	ldrbteq	pc, [r8], #-259	; 0xfffffefd	; <UNPREDICTABLE>
4000a7fc:	0c77f103 	ldfeqp	f7, [r7], #-12
4000a800:	e62800e3 	strt	r0, [r8], -r3, ror #1
4000a804:	d06d42bc 	strhtle	r4, [sp], #-44	; 0xffffffd4
4000a808:	686268bc 	stmdavs	r2!, {r2, r3, r4, r5, r7, fp, sp, lr}^
4000a80c:	0203f022 	andeq	pc, r3, #34	; 0x22
4000a810:	0999e743 	ldmibeq	r9, {r0, r1, r6, r8, r9, sl, sp, lr, pc}
4000a814:	0039f101 	eorseq	pc, r9, r1, lsl #2
4000a818:	00c03138 	sbceq	r3, r0, r8, lsr r1
4000a81c:	0b2be7ce 	bleq	40b0475c <_ebss+0xaf7cc4>
4000a820:	046ff103 	strbteq	pc, [pc], #-259	; 4000a828 <user_start+0xbe4>	; <UNPREDICTABLE>
4000a824:	0c6ef103 	stfeqp	f7, [lr], #-12
4000a828:	e61400e3 	ldr	r0, [r4], -r3, ror #1
4000a82c:	9000f8d9 	ldrdls	pc, [r0], -r9
4000a830:	f0404599 			; <UNDEFINED> instruction: 0xf0404599
4000a834:	f0148082 			; <UNDEFINED> instruction: 0xf0148082
4000a838:	f1a90f03 			; <UNDEFINED> instruction: 0xf1a90f03
4000a83c:	f1040308 			; <UNDEFINED> instruction: 0xf1040308
4000a840:	d1f334ff 	ldrshle	r3, [r3, #79]!	; 0x4f
4000a844:	ea23687b 	b	408e4a38 <_ebss+0x8d7fa0>
4000a848:	607b0300 	rsbsvs	r0, fp, r0, lsl #6
4000a84c:	42980040 	addsmi	r0, r8, #64	; 0x40
4000a850:	2200bf8c 	andcs	fp, r0, #140, 30	; 0x230
4000a854:	28002201 	stmdacs	r0, {r0, r9, sp}
4000a858:	2200bf08 	andcs	fp, r0, #8, 30
4000a85c:	e67eb91a 			; <UNDEFINED> instruction: 0xe67eb91a
4000a860:	f1080040 	cpsie	f
4000a864:	42180804 	andsmi	r0, r8, #4, 16	; 0x40000
4000a868:	4644d0fa 			; <UNDEFINED> instruction: 0x4644d0fa
4000a86c:	687be646 	ldmdavs	fp!, {r1, r2, r6, r9, sl, sp, lr, pc}^
4000a870:	f04f1089 			; <UNDEFINED> instruction: 0xf04f1089
4000a874:	fa080801 	blx	4020c880 <_ebss+0x1ffde8>
4000a878:	430bf101 	movwmi	pc, #45313	; 0xb101	; <UNPREDICTABLE>
4000a87c:	e7af607b 			; <UNDEFINED> instruction: 0xe7af607b
4000a880:	463044d8 			; <UNDEFINED> instruction: 0x463044d8
4000a884:	0200f1c8 	andeq	pc, r0, #200, 2	; 0x32
4000a888:	f3c29301 	vsubw.u8	<illegal reg q12.5>, q1, d1
4000a88c:	9200020b 	andls	r0, r0, #-1342177280	; 0xb0000000
4000a890:	f0004611 			; <UNDEFINED> instruction: 0xf0004611
4000a894:	1c43f85b 	mcrrne	8, 5, pc, r3, cr11	; <UNPREDICTABLE>
4000a898:	2300e9dd 	movwcs	lr, #2525	; 0x9dd
4000a89c:	4680bf14 	pkhbtmi	fp, r0, r4, lsl #30
4000a8a0:	4640461a 			; <UNDEFINED> instruction: 0x4640461a
4000a8a4:	2954e6c0 	ldmdbcs	r4, {r6, r7, r9, sl, sp, lr, pc}^
4000a8a8:	0b19d822 	bleq	40680938 <_ebss+0x673ea0>
4000a8ac:	006ff101 	rsbeq	pc, pc, r1, lsl #2
4000a8b0:	00c0316e 	sbceq	r3, r0, lr, ror #2
4000a8b4:	f3c1e782 	vabdl.u8	q15, d17, d2
4000a8b8:	2a00020b 	bcs	4000b0ec <user_start+0x14a8>
4000a8bc:	ae8cf47f 	mcrge	4, 4, pc, cr12, cr15, {3}	; <UNPREDICTABLE>
4000a8c0:	eb0a68ba 	bl	402a4bb0 <_ebss+0x298118>
4000a8c4:	f0410108 			; <UNDEFINED> instruction: 0xf0410108
4000a8c8:	60510101 	subsvs	r0, r1, r1, lsl #2
4000a8cc:	f240e6d5 	vmin.s8	q15, q8, <illegal reg q2.5>
4000a8d0:	42935254 	addsmi	r5, r3, #84, 4	; 0x40000005
4000a8d4:	0cabd815 	stceq	8, cr13, [fp], #84	; 0x54
4000a8d8:	047df103 	ldrbteq	pc, [sp], #-259	; 0xfffffefd	; <UNPREDICTABLE>
4000a8dc:	0c7cf103 	ldfeqp	f7, [ip], #-12
4000a8e0:	e5b800e3 	ldr	r0, [r8, #227]!	; 0xe3
4000a8e4:	3004f8d9 	ldrdcc	pc, [r4], -r9
4000a8e8:	f8c94443 			; <UNDEFINED> instruction: 0xf8c94443
4000a8ec:	e6733004 	ldrbt	r3, [r3], -r4
4000a8f0:	7faaf5b1 	svcvc	0x00aaf5b1
4000a8f4:	0bd9d813 	bleq	3f680948 <__start-0x9876b8>
4000a8f8:	0078f101 	rsbseq	pc, r8, r1, lsl #2
4000a8fc:	00c03177 	sbceq	r3, r0, r7, ror r1
4000a900:	f44fe75c 	vst1.16	{d30}, [pc :64], ip
4000a904:	247f737e 	ldrbtcs	r7, [pc], #-894	; 4000a90c <user_start+0xcc8>
4000a908:	0c7ef04f 	ldcleq	0, cr15, [lr], #-316	; 0xfffffec4
4000a90c:	f104e5a3 			; <UNDEFINED> instruction: 0xf104e5a3
4000a910:	46300108 	ldrtmi	r0, [r0], -r8, lsl #2
4000a914:	fc56f7ff 	mrrc2	7, 15, pc, r6, cr15	; <UNPREDICTABLE>
4000a918:	3004f8d9 	ldrdcc	pc, [r4], -r9
4000a91c:	f240e6ad 	vmax.s8	d30, d16, d29
4000a920:	42815054 	addmi	r5, r1, #84	; 0x54
4000a924:	0c99bf9b 	ldceq	15, cr11, [r9], {155}	; 0x9b
4000a928:	007df101 	rsbseq	pc, sp, r1, lsl #2
4000a92c:	707ef44f 	rsbsvc	pc, lr, pc, asr #8
4000a930:	bf8c317c 	svclt	0x008c317c
4000a934:	00c0217e 	sbceq	r2, r0, lr, ror r1
4000a938:	687be740 	ldmdavs	fp!, {r6, r8, r9, sl, sp, lr, pc}^
4000a93c:	bf00e786 	svclt	0x0000e786
4000a940:	500091b0 			; <UNDEFINED> instruction: 0x500091b0
4000a944:	bf004770 	svclt	0x00004770
4000a948:	bf004770 	svclt	0x00004770
4000a94c:	f249b538 	vqrshl.s8	d27, d24, d9
4000a950:	f2c56414 	vmov.i32	d22, #5505024	; 0x00540000
4000a954:	46050400 	strmi	r0, [r5], -r0, lsl #8
4000a958:	23004608 	movwcs	r4, #1544	; 0x608
4000a95c:	f7ff6023 			; <UNDEFINED> instruction: 0xf7ff6023
4000a960:	1c43ea1c 	vmovne	s24, s25, lr, r3
4000a964:	bd38d000 	ldclt	0, cr13, [r8, #-0]
4000a968:	2b006823 	blcs	400249fc <_ebss+0x17f64>
4000a96c:	602bd0fb 	strdvs	sp, [fp], -fp	; <UNPREDICTABLE>
4000a970:	bf00bd38 	svclt	0x0000bd38
4000a974:	6c6c6548 	cfstr64vs	mvdx6, [ip], #-288	; 0xfffffee0
4000a978:	6f57206f 	svcvs	0x0057206f
4000a97c:	0a646c72 	beq	41925b4c <_ebss+0x19190b4>
4000a980:	00000000 	andeq	r0, r0, r0
4000a984:	54495845 	strbpl	r5, [r9], #-2117	; 0xfffff7bb
4000a988:	0000000a 	andeq	r0, r0, sl
4000a98c:	50008d80 	andpl	r8, r0, r0, lsl #27
4000a990:	bf00b5f8 	svclt	0x0000b5f8
4000a994:	bc08bcf8 	stclt	12, cr11, [r8], {248}	; 0xf8
4000a998:	4770469e 			; <UNDEFINED> instruction: 0x4770469e
4000a99c:	bf00b5f8 	svclt	0x0000b5f8
4000a9a0:	bc08bcf8 	stclt	12, cr11, [r8], {248}	; 0xf8
4000a9a4:	4770469e 			; <UNDEFINED> instruction: 0x4770469e
4000a9a8:	00000000 	andeq	r0, r0, r0
4000a9ac:	7ffff340 	svcvc	0x00fff340
4000a9b0:	00000001 	andeq	r0, r0, r1
	...
4000a9bc:	50008d80 	andpl	r8, r0, r0, lsl #27
	...
4000a9c8:	5000906c 	andpl	r9, r0, ip, rrx
4000a9cc:	500090d4 	ldrdpl	r9, [r0], -r4
4000a9d0:	5000913c 	andpl	r9, r0, ip, lsr r1
	...
4000aa6c:	00000001 	andeq	r0, r0, r1
4000aa70:	00000000 	andeq	r0, r0, r0
4000aa74:	abcd330e 	blge	3f3576b4 <__start-0xcb094c>
4000aa78:	e66d1234 			; <UNDEFINED> instruction: 0xe66d1234
4000aa7c:	0005deec 	andeq	sp, r5, ip, ror #29
4000aa80:	0000000b 	andeq	r0, r0, fp
	...
4000adf4:	500091a8 	andpl	r9, r0, r8, lsr #3
4000adf8:	500091a8 	andpl	r9, r0, r8, lsr #3
4000adfc:	500091b0 			; <UNDEFINED> instruction: 0x500091b0
4000ae00:	500091b0 			; <UNDEFINED> instruction: 0x500091b0
4000ae04:	500091b8 			; <UNDEFINED> instruction: 0x500091b8
4000ae08:	500091b8 			; <UNDEFINED> instruction: 0x500091b8
4000ae0c:	500091c0 	andpl	r9, r0, r0, asr #3
4000ae10:	500091c0 	andpl	r9, r0, r0, asr #3
4000ae14:	500091c8 	andpl	r9, r0, r8, asr #3
4000ae18:	500091c8 	andpl	r9, r0, r8, asr #3
4000ae1c:	500091d0 	ldrdpl	r9, [r0], -r0
4000ae20:	500091d0 	ldrdpl	r9, [r0], -r0
4000ae24:	500091d8 	ldrdpl	r9, [r0], -r8
4000ae28:	500091d8 	ldrdpl	r9, [r0], -r8
4000ae2c:	500091e0 	andpl	r9, r0, r0, ror #3
4000ae30:	500091e0 	andpl	r9, r0, r0, ror #3
4000ae34:	500091e8 	andpl	r9, r0, r8, ror #3
4000ae38:	500091e8 	andpl	r9, r0, r8, ror #3
4000ae3c:	500091f0 	strdpl	r9, [r0], -r0
4000ae40:	500091f0 	strdpl	r9, [r0], -r0
4000ae44:	500091f8 	strdpl	r9, [r0], -r8
4000ae48:	500091f8 	strdpl	r9, [r0], -r8
4000ae4c:	50009200 	andpl	r9, r0, r0, lsl #4
4000ae50:	50009200 	andpl	r9, r0, r0, lsl #4
4000ae54:	50009208 	andpl	r9, r0, r8, lsl #4
4000ae58:	50009208 	andpl	r9, r0, r8, lsl #4
4000ae5c:	50009210 	andpl	r9, r0, r0, lsl r2
4000ae60:	50009210 	andpl	r9, r0, r0, lsl r2
4000ae64:	50009218 	andpl	r9, r0, r8, lsl r2
4000ae68:	50009218 	andpl	r9, r0, r8, lsl r2
4000ae6c:	50009220 	andpl	r9, r0, r0, lsr #4
4000ae70:	50009220 	andpl	r9, r0, r0, lsr #4
4000ae74:	50009228 	andpl	r9, r0, r8, lsr #4
4000ae78:	50009228 	andpl	r9, r0, r8, lsr #4
4000ae7c:	50009230 	andpl	r9, r0, r0, lsr r2
4000ae80:	50009230 	andpl	r9, r0, r0, lsr r2
4000ae84:	50009238 	andpl	r9, r0, r8, lsr r2
4000ae88:	50009238 	andpl	r9, r0, r8, lsr r2
4000ae8c:	50009240 	andpl	r9, r0, r0, asr #4
4000ae90:	50009240 	andpl	r9, r0, r0, asr #4
4000ae94:	50009248 	andpl	r9, r0, r8, asr #4
4000ae98:	50009248 	andpl	r9, r0, r8, asr #4
4000ae9c:	50009250 	andpl	r9, r0, r0, asr r2
4000aea0:	50009250 	andpl	r9, r0, r0, asr r2
4000aea4:	50009258 	andpl	r9, r0, r8, asr r2
4000aea8:	50009258 	andpl	r9, r0, r8, asr r2
4000aeac:	50009260 	andpl	r9, r0, r0, ror #4
4000aeb0:	50009260 	andpl	r9, r0, r0, ror #4
4000aeb4:	50009268 	andpl	r9, r0, r8, ror #4
4000aeb8:	50009268 	andpl	r9, r0, r8, ror #4
4000aebc:	50009270 	andpl	r9, r0, r0, ror r2
4000aec0:	50009270 	andpl	r9, r0, r0, ror r2
4000aec4:	50009278 	andpl	r9, r0, r8, ror r2
4000aec8:	50009278 	andpl	r9, r0, r8, ror r2
4000aecc:	50009280 	andpl	r9, r0, r0, lsl #5
4000aed0:	50009280 	andpl	r9, r0, r0, lsl #5
4000aed4:	50009288 	andpl	r9, r0, r8, lsl #5
4000aed8:	50009288 	andpl	r9, r0, r8, lsl #5
4000aedc:	50009290 	mulpl	r0, r0, r2
4000aee0:	50009290 	mulpl	r0, r0, r2
4000aee4:	50009298 	mulpl	r0, r8, r2
4000aee8:	50009298 	mulpl	r0, r8, r2
4000aeec:	500092a0 	andpl	r9, r0, r0, lsr #5
4000aef0:	500092a0 	andpl	r9, r0, r0, lsr #5
4000aef4:	500092a8 	andpl	r9, r0, r8, lsr #5
4000aef8:	500092a8 	andpl	r9, r0, r8, lsr #5
4000aefc:	500092b0 			; <UNDEFINED> instruction: 0x500092b0
4000af00:	500092b0 			; <UNDEFINED> instruction: 0x500092b0
4000af04:	500092b8 			; <UNDEFINED> instruction: 0x500092b8
4000af08:	500092b8 			; <UNDEFINED> instruction: 0x500092b8
4000af0c:	500092c0 	andpl	r9, r0, r0, asr #5
4000af10:	500092c0 	andpl	r9, r0, r0, asr #5
4000af14:	500092c8 	andpl	r9, r0, r8, asr #5
4000af18:	500092c8 	andpl	r9, r0, r8, asr #5
4000af1c:	500092d0 	ldrdpl	r9, [r0], -r0
4000af20:	500092d0 	ldrdpl	r9, [r0], -r0
4000af24:	500092d8 	ldrdpl	r9, [r0], -r8
4000af28:	500092d8 	ldrdpl	r9, [r0], -r8
4000af2c:	500092e0 	andpl	r9, r0, r0, ror #5
4000af30:	500092e0 	andpl	r9, r0, r0, ror #5
4000af34:	500092e8 	andpl	r9, r0, r8, ror #5
4000af38:	500092e8 	andpl	r9, r0, r8, ror #5
4000af3c:	500092f0 	strdpl	r9, [r0], -r0
4000af40:	500092f0 	strdpl	r9, [r0], -r0
4000af44:	500092f8 	strdpl	r9, [r0], -r8
4000af48:	500092f8 	strdpl	r9, [r0], -r8
4000af4c:	50009300 	andpl	r9, r0, r0, lsl #6
4000af50:	50009300 	andpl	r9, r0, r0, lsl #6
4000af54:	50009308 	andpl	r9, r0, r8, lsl #6
4000af58:	50009308 	andpl	r9, r0, r8, lsl #6
4000af5c:	50009310 	andpl	r9, r0, r0, lsl r3
4000af60:	50009310 	andpl	r9, r0, r0, lsl r3
4000af64:	50009318 	andpl	r9, r0, r8, lsl r3
4000af68:	50009318 	andpl	r9, r0, r8, lsl r3
4000af6c:	50009320 	andpl	r9, r0, r0, lsr #6
4000af70:	50009320 	andpl	r9, r0, r0, lsr #6
4000af74:	50009328 	andpl	r9, r0, r8, lsr #6
4000af78:	50009328 	andpl	r9, r0, r8, lsr #6
4000af7c:	50009330 	andpl	r9, r0, r0, lsr r3
4000af80:	50009330 	andpl	r9, r0, r0, lsr r3
4000af84:	50009338 	andpl	r9, r0, r8, lsr r3
4000af88:	50009338 	andpl	r9, r0, r8, lsr r3
4000af8c:	50009340 	andpl	r9, r0, r0, asr #6
4000af90:	50009340 	andpl	r9, r0, r0, asr #6
4000af94:	50009348 	andpl	r9, r0, r8, asr #6
4000af98:	50009348 	andpl	r9, r0, r8, asr #6
4000af9c:	50009350 	andpl	r9, r0, r0, asr r3
4000afa0:	50009350 	andpl	r9, r0, r0, asr r3
4000afa4:	50009358 	andpl	r9, r0, r8, asr r3
4000afa8:	50009358 	andpl	r9, r0, r8, asr r3
4000afac:	50009360 	andpl	r9, r0, r0, ror #6
4000afb0:	50009360 	andpl	r9, r0, r0, ror #6
4000afb4:	50009368 	andpl	r9, r0, r8, ror #6
4000afb8:	50009368 	andpl	r9, r0, r8, ror #6
4000afbc:	50009370 	andpl	r9, r0, r0, ror r3
4000afc0:	50009370 	andpl	r9, r0, r0, ror r3
4000afc4:	50009378 	andpl	r9, r0, r8, ror r3
4000afc8:	50009378 	andpl	r9, r0, r8, ror r3
4000afcc:	50009380 	andpl	r9, r0, r0, lsl #7
4000afd0:	50009380 	andpl	r9, r0, r0, lsl #7
4000afd4:	50009388 	andpl	r9, r0, r8, lsl #7
4000afd8:	50009388 	andpl	r9, r0, r8, lsl #7
4000afdc:	50009390 	mulpl	r0, r0, r3
4000afe0:	50009390 	mulpl	r0, r0, r3
4000afe4:	50009398 	mulpl	r0, r8, r3
4000afe8:	50009398 	mulpl	r0, r8, r3
4000afec:	500093a0 	andpl	r9, r0, r0, lsr #7
4000aff0:	500093a0 	andpl	r9, r0, r0, lsr #7
4000aff4:	500093a8 	andpl	r9, r0, r8, lsr #7
4000aff8:	500093a8 	andpl	r9, r0, r8, lsr #7
4000affc:	500093b0 			; <UNDEFINED> instruction: 0x500093b0
4000b000:	500093b0 			; <UNDEFINED> instruction: 0x500093b0
4000b004:	500093b8 			; <UNDEFINED> instruction: 0x500093b8
4000b008:	500093b8 			; <UNDEFINED> instruction: 0x500093b8
4000b00c:	500093c0 	andpl	r9, r0, r0, asr #7
4000b010:	500093c0 	andpl	r9, r0, r0, asr #7
4000b014:	500093c8 	andpl	r9, r0, r8, asr #7
4000b018:	500093c8 	andpl	r9, r0, r8, asr #7
4000b01c:	500093d0 	ldrdpl	r9, [r0], -r0
4000b020:	500093d0 	ldrdpl	r9, [r0], -r0
4000b024:	500093d8 	ldrdpl	r9, [r0], -r8
4000b028:	500093d8 	ldrdpl	r9, [r0], -r8
4000b02c:	500093e0 	andpl	r9, r0, r0, ror #7
4000b030:	500093e0 	andpl	r9, r0, r0, ror #7
4000b034:	500093e8 	andpl	r9, r0, r8, ror #7
4000b038:	500093e8 	andpl	r9, r0, r8, ror #7
4000b03c:	500093f0 	strdpl	r9, [r0], -r0
4000b040:	500093f0 	strdpl	r9, [r0], -r0
4000b044:	500093f8 	strdpl	r9, [r0], -r8
4000b048:	500093f8 	strdpl	r9, [r0], -r8
4000b04c:	50009400 	andpl	r9, r0, r0, lsl #8
4000b050:	50009400 	andpl	r9, r0, r0, lsl #8
4000b054:	50009408 	andpl	r9, r0, r8, lsl #8
4000b058:	50009408 	andpl	r9, r0, r8, lsl #8
4000b05c:	50009410 	andpl	r9, r0, r0, lsl r4
4000b060:	50009410 	andpl	r9, r0, r0, lsl r4
4000b064:	50009418 	andpl	r9, r0, r8, lsl r4
4000b068:	50009418 	andpl	r9, r0, r8, lsl r4
4000b06c:	50009420 	andpl	r9, r0, r0, lsr #8
4000b070:	50009420 	andpl	r9, r0, r0, lsr #8
4000b074:	50009428 	andpl	r9, r0, r8, lsr #8
4000b078:	50009428 	andpl	r9, r0, r8, lsr #8
4000b07c:	50009430 	andpl	r9, r0, r0, lsr r4
4000b080:	50009430 	andpl	r9, r0, r0, lsr r4
4000b084:	50009438 	andpl	r9, r0, r8, lsr r4
4000b088:	50009438 	andpl	r9, r0, r8, lsr r4
4000b08c:	50009440 	andpl	r9, r0, r0, asr #8
4000b090:	50009440 	andpl	r9, r0, r0, asr #8
4000b094:	50009448 	andpl	r9, r0, r8, asr #8
4000b098:	50009448 	andpl	r9, r0, r8, asr #8
4000b09c:	50009450 	andpl	r9, r0, r0, asr r4
4000b0a0:	50009450 	andpl	r9, r0, r0, asr r4
4000b0a4:	50009458 	andpl	r9, r0, r8, asr r4
4000b0a8:	50009458 	andpl	r9, r0, r8, asr r4
4000b0ac:	50009460 	andpl	r9, r0, r0, ror #8
4000b0b0:	50009460 	andpl	r9, r0, r0, ror #8
4000b0b4:	50009468 	andpl	r9, r0, r8, ror #8
4000b0b8:	50009468 	andpl	r9, r0, r8, ror #8
4000b0bc:	50009470 	andpl	r9, r0, r0, ror r4
4000b0c0:	50009470 	andpl	r9, r0, r0, ror r4
4000b0c4:	50009478 	andpl	r9, r0, r8, ror r4
4000b0c8:	50009478 	andpl	r9, r0, r8, ror r4
4000b0cc:	50009480 	andpl	r9, r0, r0, lsl #9
4000b0d0:	50009480 	andpl	r9, r0, r0, lsl #9
4000b0d4:	50009488 	andpl	r9, r0, r8, lsl #9
4000b0d8:	50009488 	andpl	r9, r0, r8, lsl #9
4000b0dc:	50009490 	mulpl	r0, r0, r4
4000b0e0:	50009490 	mulpl	r0, r0, r4
4000b0e4:	50009498 	mulpl	r0, r8, r4
4000b0e8:	50009498 	mulpl	r0, r8, r4
4000b0ec:	500094a0 	andpl	r9, r0, r0, lsr #9
4000b0f0:	500094a0 	andpl	r9, r0, r0, lsr #9
4000b0f4:	500094a8 	andpl	r9, r0, r8, lsr #9
4000b0f8:	500094a8 	andpl	r9, r0, r8, lsr #9
4000b0fc:	500094b0 			; <UNDEFINED> instruction: 0x500094b0
4000b100:	500094b0 			; <UNDEFINED> instruction: 0x500094b0
4000b104:	500094b8 			; <UNDEFINED> instruction: 0x500094b8
4000b108:	500094b8 			; <UNDEFINED> instruction: 0x500094b8
4000b10c:	500094c0 	andpl	r9, r0, r0, asr #9
4000b110:	500094c0 	andpl	r9, r0, r0, asr #9
4000b114:	500094c8 	andpl	r9, r0, r8, asr #9
4000b118:	500094c8 	andpl	r9, r0, r8, asr #9
4000b11c:	500094d0 	ldrdpl	r9, [r0], -r0
4000b120:	500094d0 	ldrdpl	r9, [r0], -r0
4000b124:	500094d8 	ldrdpl	r9, [r0], -r8
4000b128:	500094d8 	ldrdpl	r9, [r0], -r8
4000b12c:	500094e0 	andpl	r9, r0, r0, ror #9
4000b130:	500094e0 	andpl	r9, r0, r0, ror #9
4000b134:	500094e8 	andpl	r9, r0, r8, ror #9
4000b138:	500094e8 	andpl	r9, r0, r8, ror #9
4000b13c:	500094f0 	strdpl	r9, [r0], -r0
4000b140:	500094f0 	strdpl	r9, [r0], -r0
4000b144:	500094f8 	strdpl	r9, [r0], -r8
4000b148:	500094f8 	strdpl	r9, [r0], -r8
4000b14c:	50009500 	andpl	r9, r0, r0, lsl #10
4000b150:	50009500 	andpl	r9, r0, r0, lsl #10
4000b154:	50009508 	andpl	r9, r0, r8, lsl #10
4000b158:	50009508 	andpl	r9, r0, r8, lsl #10
4000b15c:	50009510 	andpl	r9, r0, r0, lsl r5
4000b160:	50009510 	andpl	r9, r0, r0, lsl r5
4000b164:	50009518 	andpl	r9, r0, r8, lsl r5
4000b168:	50009518 	andpl	r9, r0, r8, lsl r5
4000b16c:	50009520 	andpl	r9, r0, r0, lsr #10
4000b170:	50009520 	andpl	r9, r0, r0, lsr #10
4000b174:	50009528 	andpl	r9, r0, r8, lsr #10
4000b178:	50009528 	andpl	r9, r0, r8, lsr #10
4000b17c:	50009530 	andpl	r9, r0, r0, lsr r5
4000b180:	50009530 	andpl	r9, r0, r0, lsr r5
4000b184:	50009538 	andpl	r9, r0, r8, lsr r5
4000b188:	50009538 	andpl	r9, r0, r8, lsr r5
4000b18c:	50009540 	andpl	r9, r0, r0, asr #10
4000b190:	50009540 	andpl	r9, r0, r0, asr #10
4000b194:	50009548 	andpl	r9, r0, r8, asr #10
4000b198:	50009548 	andpl	r9, r0, r8, asr #10
4000b19c:	50009550 	andpl	r9, r0, r0, asr r5
4000b1a0:	50009550 	andpl	r9, r0, r0, asr r5
4000b1a4:	50009558 	andpl	r9, r0, r8, asr r5
4000b1a8:	50009558 	andpl	r9, r0, r8, asr r5
4000b1ac:	50009560 	andpl	r9, r0, r0, ror #10
4000b1b0:	50009560 	andpl	r9, r0, r0, ror #10
4000b1b4:	50009568 	andpl	r9, r0, r8, ror #10
4000b1b8:	50009568 	andpl	r9, r0, r8, ror #10
4000b1bc:	50009570 	andpl	r9, r0, r0, ror r5
4000b1c0:	50009570 	andpl	r9, r0, r0, ror r5
4000b1c4:	50009578 	andpl	r9, r0, r8, ror r5
4000b1c8:	50009578 	andpl	r9, r0, r8, ror r5
4000b1cc:	50009580 	andpl	r9, r0, r0, lsl #11
4000b1d0:	50009580 	andpl	r9, r0, r0, lsl #11
4000b1d4:	50009588 	andpl	r9, r0, r8, lsl #11
4000b1d8:	50009588 	andpl	r9, r0, r8, lsl #11
4000b1dc:	50009590 	mulpl	r0, r0, r5
4000b1e0:	50009590 	mulpl	r0, r0, r5
4000b1e4:	50009598 	mulpl	r0, r8, r5
4000b1e8:	50009598 	mulpl	r0, r8, r5
4000b1ec:	500095a0 	andpl	r9, r0, r0, lsr #11
4000b1f0:	500095a0 	andpl	r9, r0, r0, lsr #11
4000b1f4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
4000b1f8:	00020000 	andeq	r0, r2, r0
4000b1fc:	50008081 	andpl	r8, r0, r1, lsl #1
4000b200:	50008051 	andpl	r8, r0, r1, asr r0
4000b204:	5000840d 	andpl	r8, r0, sp, lsl #8

Disassembly of section .data:

4000b208 <count>:
4000b208:	00000001 	andeq	r0, r0, r1

4000b20c <index>:
4000b20c:	00000001 	andeq	r0, r0, r1

4000b210 <num_process>:
4000b210:	00000001 	andeq	r0, r0, r1

4000b214 <irq_lr>:
4000b214:	00000000 	andeq	r0, r0, r0

Disassembly of section .got:

4000b218 <.got>:
4000b218:	4000b288 	andmi	fp, r0, r8, lsl #5
4000b21c:	4000b290 	mulmi	r0, r0, r2
4000b220:	4000b264 	andmi	fp, r0, r4, ror #4
4000b224:	4000b27c 	andmi	fp, r0, ip, ror r2
4000b228:	4000b268 	andmi	fp, r0, r8, ror #4
4000b22c:	4000b284 	andmi	fp, r0, r4, lsl #5
4000b230:	4000b890 	mulmi	r0, r0, r8
4000b234:	4000ca90 	mulmi	r0, r0, sl
4000b238:	4000b278 	andmi	fp, r0, r8, ror r2
4000b23c:	4000b20c 	andmi	fp, r0, ip, lsl #4
4000b240:	40009968 	andmi	r9, r0, r8, ror #18
4000b244:	4000b210 	andmi	fp, r0, r0, lsl r2
4000b248:	4000b208 	andmi	fp, r0, r8, lsl #4
4000b24c:	4000b28c 	andmi	fp, r0, ip, lsl #5
4000b250:	4000b26c 	andmi	fp, r0, ip, ror #4
4000b254:	4000b270 	andmi	fp, r0, r0, ror r2

Disassembly of section .got.plt:

4000b258 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .bss:

4000b264 <thread_index>:
4000b264:	00000000 	andeq	r0, r0, r0

4000b268 <num_threads>:
4000b268:	00000000 	andeq	r0, r0, r0

4000b26c <free_threads>:
4000b26c:	00000000 	andeq	r0, r0, r0

4000b270 <free>:
4000b270:	00000000 	andeq	r0, r0, r0

4000b274 <waiting_queue>:
4000b274:	00000000 	andeq	r0, r0, r0

4000b278 <ready_queue>:
4000b278:	00000000 	andeq	r0, r0, r0

4000b27c <running>:
4000b27c:	00000000 	andeq	r0, r0, r0

4000b280 <a>:
4000b280:	00000000 	andeq	r0, r0, r0

4000b284 <sys_stack>:
4000b284:	00000000 	andeq	r0, r0, r0

4000b288 <p>:
4000b288:	00000000 	andeq	r0, r0, r0

4000b28c <sp>:
4000b28c:	00000000 	andeq	r0, r0, r0

4000b290 <process>:
	...

4000b890 <threads>:
	...

4000ca90 <mutex>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__start-0x3ef372dc>
   4:	35312820 	ldrcc	r2, [r1, #-2080]!	; 0xfffff7e0
   8:	322d373a 	eorcc	r3, sp, #15204352	; 0xe80000
   c:	2d383130 	ldfcss	f3, [r8, #-192]!	; 0xffffff40
  10:	362d3271 			; <UNDEFINED> instruction: 0x362d3271
  14:	2e372029 	cdpcs	0, 3, cr2, cr7, cr9, {1}
  18:	20312e33 	eorscs	r2, r1, r3, lsr lr
  1c:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
  20:	32323630 	eorscc	r3, r2, #48, 12	; 0x3000000
  24:	65722820 	ldrbvs	r2, [r2, #-2080]!	; 0xfffff7e0
  28:	7361656c 	cmnvc	r1, #108, 10	; 0x1b000000
  2c:	5b202965 	blpl	80a5c8 <__start-0x3f7fda38>
  30:	2f4d5241 	svccs	0x004d5241
  34:	65626d65 	strbvs	r6, [r2, #-3429]!	; 0xfffff29b
  38:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
  3c:	622d372d 	eorvs	r3, sp, #11796480	; 0xb40000
  40:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  44:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0xffffff98
  48:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  4c:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  50:	30393136 	eorscc	r3, r9, r6, lsr r1
  54:	Address 0x0000000000000054 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003a41 	andeq	r3, r0, r1, asr #20
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000030 	andeq	r0, r0, r0, lsr r0
  10:	726f4305 	rsbvc	r4, pc, #335544320	; 0x14000000
  14:	2d786574 	cfldr64cs	mvdx6, [r8, #-464]!	; 0xfffffe30
  18:	06003741 	streq	r3, [r0], -r1, asr #14
  1c:	0841070a 	stmdaeq	r1, {r1, r3, r8, r9, sl}^
  20:	0a020901 	beq	8242c <__start-0x3ff85bd4>
  24:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  28:	17011501 	strne	r1, [r1, -r1, lsl #10]
  2c:	1a011803 	bne	46040 <__start-0x3ffc1fc0>
  30:	22021e01 	andcs	r1, r2, #1, 28
  34:	2c012a01 			; <UNDEFINED> instruction: 0x2c012a01
  38:	Address 0x0000000000000038 is out of bounds.

