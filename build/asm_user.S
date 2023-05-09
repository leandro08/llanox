
./build/user.elf:     file format elf32-littlearm


Disassembly of section .text:

50008000 <deregister_tm_clones>:
50008000:	f249 50c0 	movw	r0, #38336	; 0x95c0
50008004:	f2c5 0000 	movt	r0, #20480	; 0x5000
50008008:	f249 53c0 	movw	r3, #38336	; 0x95c0
5000800c:	f2c5 0300 	movt	r3, #20480	; 0x5000
50008010:	4283      	cmp	r3, r0
50008012:	d005      	beq.n	50008020 <deregister_tm_clones+0x20>
50008014:	f240 0300 	movw	r3, #0
50008018:	f2c0 0300 	movt	r3, #0
5000801c:	b103      	cbz	r3, 50008020 <deregister_tm_clones+0x20>
5000801e:	4718      	bx	r3
50008020:	4770      	bx	lr
50008022:	bf00      	nop

50008024 <register_tm_clones>:
50008024:	f249 50c0 	movw	r0, #38336	; 0x95c0
50008028:	f2c5 0000 	movt	r0, #20480	; 0x5000
5000802c:	f249 51c0 	movw	r1, #38336	; 0x95c0
50008030:	f2c5 0100 	movt	r1, #20480	; 0x5000
50008034:	1a09      	subs	r1, r1, r0
50008036:	1089      	asrs	r1, r1, #2
50008038:	eb01 71d1 	add.w	r1, r1, r1, lsr #31
5000803c:	1049      	asrs	r1, r1, #1
5000803e:	d005      	beq.n	5000804c <register_tm_clones+0x28>
50008040:	f240 0300 	movw	r3, #0
50008044:	f2c0 0300 	movt	r3, #0
50008048:	b103      	cbz	r3, 5000804c <register_tm_clones+0x28>
5000804a:	4718      	bx	r3
5000804c:	4770      	bx	lr
5000804e:	bf00      	nop

50008050 <__do_global_dtors_aux>:
50008050:	b510      	push	{r4, lr}
50008052:	f249 54c4 	movw	r4, #38340	; 0x95c4
50008056:	f2c5 0400 	movt	r4, #20480	; 0x5000
5000805a:	7823      	ldrb	r3, [r4, #0]
5000805c:	b973      	cbnz	r3, 5000807c <__do_global_dtors_aux+0x2c>
5000805e:	f7ff ffcf 	bl	50008000 <deregister_tm_clones>
50008062:	f240 0300 	movw	r3, #0
50008066:	f2c0 0300 	movt	r3, #0
5000806a:	b12b      	cbz	r3, 50008078 <__do_global_dtors_aux+0x28>
5000806c:	f648 5064 	movw	r0, #36196	; 0x8d64
50008070:	f2c5 0000 	movt	r0, #20480	; 0x5000
50008074:	f3af 8000 	nop.w
50008078:	2301      	movs	r3, #1
5000807a:	7023      	strb	r3, [r4, #0]
5000807c:	bd10      	pop	{r4, pc}
5000807e:	bf00      	nop

50008080 <frame_dummy>:
50008080:	b508      	push	{r3, lr}
50008082:	f240 0300 	movw	r3, #0
50008086:	f2c0 0300 	movt	r3, #0
5000808a:	b14b      	cbz	r3, 500080a0 <frame_dummy+0x20>
5000808c:	f249 51c8 	movw	r1, #38344	; 0x95c8
50008090:	f648 5064 	movw	r0, #36196	; 0x8d64
50008094:	f2c5 0100 	movt	r1, #20480	; 0x5000
50008098:	f2c5 0000 	movt	r0, #20480	; 0x5000
5000809c:	f3af 8000 	nop.w
500080a0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
500080a4:	e7be      	b.n	50008024 <register_tm_clones>
500080a6:	bf00      	nop

500080a8 <_mainCRTStartup>:
500080a8:	4b13      	ldr	r3, [pc, #76]	; (500080f8 <_mainCRTStartup+0x50>)
500080aa:	2b00      	cmp	r3, #0
500080ac:	bf08      	it	eq
500080ae:	4b11      	ldreq	r3, [pc, #68]	; (500080f4 <_mainCRTStartup+0x4c>)
500080b0:	469d      	mov	sp, r3
500080b2:	f5a3 3a80 	sub.w	sl, r3, #65536	; 0x10000
500080b6:	2100      	movs	r1, #0
500080b8:	468b      	mov	fp, r1
500080ba:	460f      	mov	r7, r1
500080bc:	4811      	ldr	r0, [pc, #68]	; (50008104 <_mainCRTStartup+0x5c>)
500080be:	4a12      	ldr	r2, [pc, #72]	; (50008108 <_mainCRTStartup+0x60>)
500080c0:	1a12      	subs	r2, r2, r0
500080c2:	f000 f8af 	bl	50008224 <memset>
500080c6:	4b0d      	ldr	r3, [pc, #52]	; (500080fc <_mainCRTStartup+0x54>)
500080c8:	2b00      	cmp	r3, #0
500080ca:	d000      	beq.n	500080ce <_mainCRTStartup+0x26>
500080cc:	4798      	blx	r3
500080ce:	4b0c      	ldr	r3, [pc, #48]	; (50008100 <_mainCRTStartup+0x58>)
500080d0:	2b00      	cmp	r3, #0
500080d2:	d000      	beq.n	500080d6 <_mainCRTStartup+0x2e>
500080d4:	4798      	blx	r3
500080d6:	2000      	movs	r0, #0
500080d8:	2100      	movs	r1, #0
500080da:	0004      	movs	r4, r0
500080dc:	000d      	movs	r5, r1
500080de:	480b      	ldr	r0, [pc, #44]	; (5000810c <_mainCRTStartup+0x64>)
500080e0:	f000 f84a 	bl	50008178 <atexit>
500080e4:	f000 f876 	bl	500081d4 <__libc_init_array>
500080e8:	0020      	movs	r0, r4
500080ea:	0029      	movs	r1, r5
500080ec:	f000 e810 	blx	50008110 <main>
500080f0:	f000 f848 	bl	50008184 <exit>
500080f4:	00080000 	.word	0x00080000
	...
50008104:	500095c4 	.word	0x500095c4
50008108:	50009618 	.word	0x50009618
5000810c:	500081a5 	.word	0x500081a5

50008110 <main>:
50008110:	e59f1018 	ldr	r1, [pc, #24]	; 50008130 <main+0x20>
50008114:	e3a0200c 	mov	r2, #12
50008118:	e92d4010 	push	{r4, lr}
5000811c:	e3a00001 	mov	r0, #1
50008120:	e08f1001 	add	r1, pc, r1
50008124:	fa000064 	blx	500082bc <write>
50008128:	e3a00000 	mov	r0, #0
5000812c:	e8bd8010 	pop	{r4, pc}
50008130:	00000c08 	.word	0x00000c08

50008134 <_write>:
50008134:	e1a00000 	nop			; (mov r0, r0)
50008138:	e1a01001 	mov	r1, r1
5000813c:	e1a02002 	mov	r2, r2
50008140:	e3a03004 	mov	r3, #4
50008144:	e1a07003 	mov	r7, r3
50008148:	ef000000 	svc	0x00000000
5000814c:	e1a00000 	nop			; (mov r0, r0)
50008150:	e12fff1e 	bx	lr

50008154 <_sbrk>:
50008154:	eafffffe 	b	50008154 <_sbrk>

50008158 <_exit>:
50008158:	e59f1014 	ldr	r1, [pc, #20]	; 50008174 <_exit+0x1c>
5000815c:	e3a02005 	mov	r2, #5
50008160:	e92d4010 	push	{r4, lr}
50008164:	e3a00000 	mov	r0, #0
50008168:	e08f1001 	add	r1, pc, r1
5000816c:	ebfffff0 	bl	50008134 <_write>
50008170:	eafffffe 	b	50008170 <_exit+0x18>
50008174:	00000bd0 	.word	0x00000bd0

50008178 <atexit>:
50008178:	2300      	movs	r3, #0
5000817a:	4601      	mov	r1, r0
5000817c:	461a      	mov	r2, r3
5000817e:	4618      	mov	r0, r3
50008180:	f000 b8be 	b.w	50008300 <__register_exitproc>

50008184 <exit>:
50008184:	b508      	push	{r3, lr}
50008186:	2100      	movs	r1, #0
50008188:	4604      	mov	r4, r0
5000818a:	f000 f8ef 	bl	5000836c <__call_exitprocs>
5000818e:	f648 5348 	movw	r3, #36168	; 0x8d48
50008192:	f2c5 0300 	movt	r3, #20480	; 0x5000
50008196:	6818      	ldr	r0, [r3, #0]
50008198:	6bc3      	ldr	r3, [r0, #60]	; 0x3c
5000819a:	b103      	cbz	r3, 5000819e <exit+0x1a>
5000819c:	4798      	blx	r3
5000819e:	4620      	mov	r0, r4
500081a0:	f7ff efda 	blx	50008158 <_exit>

500081a4 <__libc_fini_array>:
500081a4:	b538      	push	{r3, r4, r5, lr}
500081a6:	f240 0400 	movw	r4, #0
500081aa:	f240 0500 	movw	r5, #0
500081ae:	f2c0 0400 	movt	r4, #0
500081b2:	f2c0 0500 	movt	r5, #0
500081b6:	1b64      	subs	r4, r4, r5
500081b8:	10a4      	asrs	r4, r4, #2
500081ba:	d007      	beq.n	500081cc <__libc_fini_array+0x28>
500081bc:	eb05 0584 	add.w	r5, r5, r4, lsl #2
500081c0:	3c01      	subs	r4, #1
500081c2:	f855 3d04 	ldr.w	r3, [r5, #-4]!
500081c6:	4798      	blx	r3
500081c8:	2c00      	cmp	r4, #0
500081ca:	d1f9      	bne.n	500081c0 <__libc_fini_array+0x1c>
500081cc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
500081d0:	f000 bdc2 	b.w	50008d58 <_fini>

500081d4 <__libc_init_array>:
500081d4:	b570      	push	{r4, r5, r6, lr}
500081d6:	f240 0600 	movw	r6, #0
500081da:	f240 0500 	movw	r5, #0
500081de:	f2c0 0600 	movt	r6, #0
500081e2:	f2c0 0500 	movt	r5, #0
500081e6:	1b76      	subs	r6, r6, r5
500081e8:	10b6      	asrs	r6, r6, #2
500081ea:	d006      	beq.n	500081fa <__libc_init_array+0x26>
500081ec:	2400      	movs	r4, #0
500081ee:	3401      	adds	r4, #1
500081f0:	f855 3b04 	ldr.w	r3, [r5], #4
500081f4:	4798      	blx	r3
500081f6:	42a6      	cmp	r6, r4
500081f8:	d1f9      	bne.n	500081ee <__libc_init_array+0x1a>
500081fa:	f240 0600 	movw	r6, #0
500081fe:	f240 0500 	movw	r5, #0
50008202:	f2c0 0600 	movt	r6, #0
50008206:	f2c0 0500 	movt	r5, #0
5000820a:	1b76      	subs	r6, r6, r5
5000820c:	f000 fd9e 	bl	50008d4c <_user_etext>
50008210:	10b6      	asrs	r6, r6, #2
50008212:	d006      	beq.n	50008222 <__libc_init_array+0x4e>
50008214:	2400      	movs	r4, #0
50008216:	3401      	adds	r4, #1
50008218:	f855 3b04 	ldr.w	r3, [r5], #4
5000821c:	4798      	blx	r3
5000821e:	42a6      	cmp	r6, r4
50008220:	d1f9      	bne.n	50008216 <__libc_init_array+0x42>
50008222:	bd70      	pop	{r4, r5, r6, pc}

50008224 <memset>:
50008224:	b4f0      	push	{r4, r5, r6, r7}
50008226:	0786      	lsls	r6, r0, #30
50008228:	d044      	beq.n	500082b4 <memset+0x90>
5000822a:	1e54      	subs	r4, r2, #1
5000822c:	2a00      	cmp	r2, #0
5000822e:	d03f      	beq.n	500082b0 <memset+0x8c>
50008230:	b2ca      	uxtb	r2, r1
50008232:	4603      	mov	r3, r0
50008234:	e002      	b.n	5000823c <memset+0x18>
50008236:	f114 34ff 	adds.w	r4, r4, #4294967295	; 0xffffffff
5000823a:	d339      	bcc.n	500082b0 <memset+0x8c>
5000823c:	f803 2b01 	strb.w	r2, [r3], #1
50008240:	079d      	lsls	r5, r3, #30
50008242:	d1f8      	bne.n	50008236 <memset+0x12>
50008244:	2c03      	cmp	r4, #3
50008246:	d92c      	bls.n	500082a2 <memset+0x7e>
50008248:	b2cd      	uxtb	r5, r1
5000824a:	2c0f      	cmp	r4, #15
5000824c:	ea45 2505 	orr.w	r5, r5, r5, lsl #8
50008250:	ea45 4505 	orr.w	r5, r5, r5, lsl #16
50008254:	d916      	bls.n	50008284 <memset+0x60>
50008256:	f1a4 0710 	sub.w	r7, r4, #16
5000825a:	f103 0620 	add.w	r6, r3, #32
5000825e:	f103 0210 	add.w	r2, r3, #16
50008262:	093f      	lsrs	r7, r7, #4
50008264:	eb06 1607 	add.w	r6, r6, r7, lsl #4
50008268:	e942 5504 	strd	r5, r5, [r2, #-16]
5000826c:	e942 5502 	strd	r5, r5, [r2, #-8]
50008270:	3210      	adds	r2, #16
50008272:	42b2      	cmp	r2, r6
50008274:	d1f8      	bne.n	50008268 <memset+0x44>
50008276:	f004 040f 	and.w	r4, r4, #15
5000827a:	3701      	adds	r7, #1
5000827c:	2c03      	cmp	r4, #3
5000827e:	eb03 1307 	add.w	r3, r3, r7, lsl #4
50008282:	d90e      	bls.n	500082a2 <memset+0x7e>
50008284:	1f26      	subs	r6, r4, #4
50008286:	1d1f      	adds	r7, r3, #4
50008288:	461a      	mov	r2, r3
5000828a:	08b6      	lsrs	r6, r6, #2
5000828c:	eb07 0786 	add.w	r7, r7, r6, lsl #2
50008290:	f842 5b04 	str.w	r5, [r2], #4
50008294:	42ba      	cmp	r2, r7
50008296:	d1fb      	bne.n	50008290 <memset+0x6c>
50008298:	3601      	adds	r6, #1
5000829a:	f004 0403 	and.w	r4, r4, #3
5000829e:	eb03 0386 	add.w	r3, r3, r6, lsl #2
500082a2:	b12c      	cbz	r4, 500082b0 <memset+0x8c>
500082a4:	b2c9      	uxtb	r1, r1
500082a6:	441c      	add	r4, r3
500082a8:	f803 1b01 	strb.w	r1, [r3], #1
500082ac:	429c      	cmp	r4, r3
500082ae:	d1fb      	bne.n	500082a8 <memset+0x84>
500082b0:	bcf0      	pop	{r4, r5, r6, r7}
500082b2:	4770      	bx	lr
500082b4:	4614      	mov	r4, r2
500082b6:	4603      	mov	r3, r0
500082b8:	e7c4      	b.n	50008244 <memset+0x20>
500082ba:	bf00      	nop

500082bc <write>:
500082bc:	b410      	push	{r4}
500082be:	f648 5478 	movw	r4, #36216	; 0x8d78
500082c2:	f2c5 0400 	movt	r4, #20480	; 0x5000
500082c6:	4613      	mov	r3, r2
500082c8:	460a      	mov	r2, r1
500082ca:	4601      	mov	r1, r0
500082cc:	6820      	ldr	r0, [r4, #0]
500082ce:	bc10      	pop	{r4}
500082d0:	f000 b800 	b.w	500082d4 <_write_r>

500082d4 <_write_r>:
500082d4:	b570      	push	{r4, r5, r6, lr}
500082d6:	460d      	mov	r5, r1
500082d8:	f249 6414 	movw	r4, #38420	; 0x9614
500082dc:	f2c5 0400 	movt	r4, #20480	; 0x5000
500082e0:	4611      	mov	r1, r2
500082e2:	4606      	mov	r6, r0
500082e4:	461a      	mov	r2, r3
500082e6:	4628      	mov	r0, r5
500082e8:	2300      	movs	r3, #0
500082ea:	6023      	str	r3, [r4, #0]
500082ec:	f7ff ef22 	blx	50008134 <_write>
500082f0:	1c43      	adds	r3, r0, #1
500082f2:	d000      	beq.n	500082f6 <_write_r+0x22>
500082f4:	bd70      	pop	{r4, r5, r6, pc}
500082f6:	6823      	ldr	r3, [r4, #0]
500082f8:	2b00      	cmp	r3, #0
500082fa:	d0fb      	beq.n	500082f4 <_write_r+0x20>
500082fc:	6033      	str	r3, [r6, #0]
500082fe:	bd70      	pop	{r4, r5, r6, pc}

50008300 <__register_exitproc>:
50008300:	b4f0      	push	{r4, r5, r6, r7}
50008302:	f648 5448 	movw	r4, #36168	; 0x8d48
50008306:	f2c5 0400 	movt	r4, #20480	; 0x5000
5000830a:	6825      	ldr	r5, [r4, #0]
5000830c:	f8d5 4148 	ldr.w	r4, [r5, #328]	; 0x148
50008310:	b31c      	cbz	r4, 5000835a <__register_exitproc+0x5a>
50008312:	6865      	ldr	r5, [r4, #4]
50008314:	2d1f      	cmp	r5, #31
50008316:	dc25      	bgt.n	50008364 <__register_exitproc+0x64>
50008318:	b938      	cbnz	r0, 5000832a <__register_exitproc+0x2a>
5000831a:	1cab      	adds	r3, r5, #2
5000831c:	2000      	movs	r0, #0
5000831e:	3501      	adds	r5, #1
50008320:	6065      	str	r5, [r4, #4]
50008322:	f844 1023 	str.w	r1, [r4, r3, lsl #2]
50008326:	bcf0      	pop	{r4, r5, r6, r7}
50008328:	4770      	bx	lr
5000832a:	eb04 0685 	add.w	r6, r4, r5, lsl #2
5000832e:	2802      	cmp	r0, #2
50008330:	f04f 0701 	mov.w	r7, #1
50008334:	f8c6 2088 	str.w	r2, [r6, #136]	; 0x88
50008338:	fa07 f705 	lsl.w	r7, r7, r5
5000833c:	f8d4 2188 	ldr.w	r2, [r4, #392]	; 0x188
50008340:	ea42 0207 	orr.w	r2, r2, r7
50008344:	f8c4 2188 	str.w	r2, [r4, #392]	; 0x188
50008348:	f8c6 3108 	str.w	r3, [r6, #264]	; 0x108
5000834c:	bf02      	ittt	eq
5000834e:	f8d4 318c 	ldreq.w	r3, [r4, #396]	; 0x18c
50008352:	431f      	orreq	r7, r3
50008354:	f8c4 718c 	streq.w	r7, [r4, #396]	; 0x18c
50008358:	e7df      	b.n	5000831a <__register_exitproc+0x1a>
5000835a:	f505 74a6 	add.w	r4, r5, #332	; 0x14c
5000835e:	f8c5 4148 	str.w	r4, [r5, #328]	; 0x148
50008362:	e7d6      	b.n	50008312 <__register_exitproc+0x12>
50008364:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
50008368:	e7dd      	b.n	50008326 <__register_exitproc+0x26>
5000836a:	bf00      	nop

5000836c <__call_exitprocs>:
5000836c:	f648 5348 	movw	r3, #36168	; 0x8d48
50008370:	f2c5 0300 	movt	r3, #20480	; 0x5000
50008374:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
50008378:	b083      	sub	sp, #12
5000837a:	681f      	ldr	r7, [r3, #0]
5000837c:	468b      	mov	fp, r1
5000837e:	f04f 0801 	mov.w	r8, #1
50008382:	f04f 0900 	mov.w	r9, #0
50008386:	9001      	str	r0, [sp, #4]
50008388:	f8d7 6148 	ldr.w	r6, [r7, #328]	; 0x148
5000838c:	b186      	cbz	r6, 500083b0 <__call_exitprocs+0x44>
5000838e:	6874      	ldr	r4, [r6, #4]
50008390:	1e65      	subs	r5, r4, #1
50008392:	d40d      	bmi.n	500083b0 <__call_exitprocs+0x44>
50008394:	3401      	adds	r4, #1
50008396:	eb06 0484 	add.w	r4, r6, r4, lsl #2
5000839a:	f1bb 0f00 	cmp.w	fp, #0
5000839e:	d00a      	beq.n	500083b6 <__call_exitprocs+0x4a>
500083a0:	f8d4 3100 	ldr.w	r3, [r4, #256]	; 0x100
500083a4:	455b      	cmp	r3, fp
500083a6:	d006      	beq.n	500083b6 <__call_exitprocs+0x4a>
500083a8:	3d01      	subs	r5, #1
500083aa:	3c04      	subs	r4, #4
500083ac:	1c6b      	adds	r3, r5, #1
500083ae:	d1f4      	bne.n	5000839a <__call_exitprocs+0x2e>
500083b0:	b003      	add	sp, #12
500083b2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
500083b6:	6873      	ldr	r3, [r6, #4]
500083b8:	6822      	ldr	r2, [r4, #0]
500083ba:	3b01      	subs	r3, #1
500083bc:	42ab      	cmp	r3, r5
500083be:	bf0c      	ite	eq
500083c0:	6075      	streq	r5, [r6, #4]
500083c2:	f8c4 9000 	strne.w	r9, [r4]
500083c6:	2a00      	cmp	r2, #0
500083c8:	d0ee      	beq.n	500083a8 <__call_exitprocs+0x3c>
500083ca:	f8d6 1188 	ldr.w	r1, [r6, #392]	; 0x188
500083ce:	fa08 fc05 	lsl.w	ip, r8, r5
500083d2:	f8d6 a004 	ldr.w	sl, [r6, #4]
500083d6:	ea1c 0f01 	tst.w	ip, r1
500083da:	d109      	bne.n	500083f0 <__call_exitprocs+0x84>
500083dc:	4790      	blx	r2
500083de:	6871      	ldr	r1, [r6, #4]
500083e0:	f8d7 2148 	ldr.w	r2, [r7, #328]	; 0x148
500083e4:	4551      	cmp	r1, sl
500083e6:	d101      	bne.n	500083ec <__call_exitprocs+0x80>
500083e8:	4296      	cmp	r6, r2
500083ea:	d0dd      	beq.n	500083a8 <__call_exitprocs+0x3c>
500083ec:	4616      	mov	r6, r2
500083ee:	e7cd      	b.n	5000838c <__call_exitprocs+0x20>
500083f0:	f8d6 318c 	ldr.w	r3, [r6, #396]	; 0x18c
500083f4:	f8d4 1080 	ldr.w	r1, [r4, #128]	; 0x80
500083f8:	ea1c 0f03 	tst.w	ip, r3
500083fc:	d102      	bne.n	50008404 <__call_exitprocs+0x98>
500083fe:	9801      	ldr	r0, [sp, #4]
50008400:	4790      	blx	r2
50008402:	e7ec      	b.n	500083de <__call_exitprocs+0x72>
50008404:	4608      	mov	r0, r1
50008406:	4790      	blx	r2
50008408:	e7e9      	b.n	500083de <__call_exitprocs+0x72>
5000840a:	bf00      	nop

5000840c <register_fini>:
5000840c:	f240 0300 	movw	r3, #0
50008410:	f2c0 0300 	movt	r3, #0
50008414:	b12b      	cbz	r3, 50008422 <register_fini+0x16>
50008416:	f248 10a5 	movw	r0, #33189	; 0x81a5
5000841a:	f2c5 0000 	movt	r0, #20480	; 0x5000
5000841e:	f7ff beab 	b.w	50008178 <atexit>
50008422:	4770      	bx	lr

50008424 <cleanup_glue>:
50008424:	b538      	push	{r3, r4, r5, lr}
50008426:	460c      	mov	r4, r1
50008428:	6809      	ldr	r1, [r1, #0]
5000842a:	4605      	mov	r5, r0
5000842c:	b929      	cbnz	r1, 5000843a <cleanup_glue+0x16>
5000842e:	4621      	mov	r1, r4
50008430:	4628      	mov	r0, r5
50008432:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
50008436:	f000 b8a3 	b.w	50008580 <_free_r>
5000843a:	f7ff fff3 	bl	50008424 <cleanup_glue>
5000843e:	4621      	mov	r1, r4
50008440:	4628      	mov	r0, r5
50008442:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
50008446:	f000 b89b 	b.w	50008580 <_free_r>
5000844a:	bf00      	nop

5000844c <_reclaim_reent>:
5000844c:	f648 5378 	movw	r3, #36216	; 0x8d78
50008450:	f2c5 0300 	movt	r3, #20480	; 0x5000
50008454:	681b      	ldr	r3, [r3, #0]
50008456:	4283      	cmp	r3, r0
50008458:	d03b      	beq.n	500084d2 <_reclaim_reent+0x86>
5000845a:	6cc3      	ldr	r3, [r0, #76]	; 0x4c
5000845c:	b570      	push	{r4, r5, r6, lr}
5000845e:	4605      	mov	r5, r0
50008460:	b18b      	cbz	r3, 50008486 <_reclaim_reent+0x3a>
50008462:	2600      	movs	r6, #0
50008464:	5999      	ldr	r1, [r3, r6]
50008466:	b139      	cbz	r1, 50008478 <_reclaim_reent+0x2c>
50008468:	680c      	ldr	r4, [r1, #0]
5000846a:	4628      	mov	r0, r5
5000846c:	f000 f888 	bl	50008580 <_free_r>
50008470:	4621      	mov	r1, r4
50008472:	2c00      	cmp	r4, #0
50008474:	d1f8      	bne.n	50008468 <_reclaim_reent+0x1c>
50008476:	6ceb      	ldr	r3, [r5, #76]	; 0x4c
50008478:	3604      	adds	r6, #4
5000847a:	2e80      	cmp	r6, #128	; 0x80
5000847c:	d1f2      	bne.n	50008464 <_reclaim_reent+0x18>
5000847e:	4619      	mov	r1, r3
50008480:	4628      	mov	r0, r5
50008482:	f000 f87d 	bl	50008580 <_free_r>
50008486:	6c29      	ldr	r1, [r5, #64]	; 0x40
50008488:	b111      	cbz	r1, 50008490 <_reclaim_reent+0x44>
5000848a:	4628      	mov	r0, r5
5000848c:	f000 f878 	bl	50008580 <_free_r>
50008490:	f8d5 1148 	ldr.w	r1, [r5, #328]	; 0x148
50008494:	b151      	cbz	r1, 500084ac <_reclaim_reent+0x60>
50008496:	f505 76a6 	add.w	r6, r5, #332	; 0x14c
5000849a:	42b1      	cmp	r1, r6
5000849c:	d006      	beq.n	500084ac <_reclaim_reent+0x60>
5000849e:	680c      	ldr	r4, [r1, #0]
500084a0:	4628      	mov	r0, r5
500084a2:	f000 f86d 	bl	50008580 <_free_r>
500084a6:	42a6      	cmp	r6, r4
500084a8:	4621      	mov	r1, r4
500084aa:	d1f8      	bne.n	5000849e <_reclaim_reent+0x52>
500084ac:	6d69      	ldr	r1, [r5, #84]	; 0x54
500084ae:	b111      	cbz	r1, 500084b6 <_reclaim_reent+0x6a>
500084b0:	4628      	mov	r0, r5
500084b2:	f000 f865 	bl	50008580 <_free_r>
500084b6:	6bab      	ldr	r3, [r5, #56]	; 0x38
500084b8:	b153      	cbz	r3, 500084d0 <_reclaim_reent+0x84>
500084ba:	6beb      	ldr	r3, [r5, #60]	; 0x3c
500084bc:	4628      	mov	r0, r5
500084be:	4798      	blx	r3
500084c0:	f8d5 12e0 	ldr.w	r1, [r5, #736]	; 0x2e0
500084c4:	b121      	cbz	r1, 500084d0 <_reclaim_reent+0x84>
500084c6:	4628      	mov	r0, r5
500084c8:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
500084cc:	f7ff bfaa 	b.w	50008424 <cleanup_glue>
500084d0:	bd70      	pop	{r4, r5, r6, pc}
500084d2:	4770      	bx	lr

500084d4 <_malloc_trim_r>:
500084d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
500084d6:	f249 17a8 	movw	r7, #37288	; 0x91a8
500084da:	f2c5 0700 	movt	r7, #20480	; 0x5000
500084de:	460c      	mov	r4, r1
500084e0:	4606      	mov	r6, r0
500084e2:	f000 fc0d 	bl	50008d00 <__malloc_lock>
500084e6:	68bb      	ldr	r3, [r7, #8]
500084e8:	f5c4 617e 	rsb	r1, r4, #4064	; 0xfe0
500084ec:	310f      	adds	r1, #15
500084ee:	685d      	ldr	r5, [r3, #4]
500084f0:	f025 0503 	bic.w	r5, r5, #3
500084f4:	4429      	add	r1, r5
500084f6:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
500084fa:	f021 010f 	bic.w	r1, r1, #15
500084fe:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
50008502:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
50008506:	db07      	blt.n	50008518 <_malloc_trim_r+0x44>
50008508:	2100      	movs	r1, #0
5000850a:	4630      	mov	r0, r6
5000850c:	f000 fbfc 	bl	50008d08 <_sbrk_r>
50008510:	68bb      	ldr	r3, [r7, #8]
50008512:	442b      	add	r3, r5
50008514:	4298      	cmp	r0, r3
50008516:	d004      	beq.n	50008522 <_malloc_trim_r+0x4e>
50008518:	4630      	mov	r0, r6
5000851a:	f000 fbf3 	bl	50008d04 <__malloc_unlock>
5000851e:	2000      	movs	r0, #0
50008520:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
50008522:	4261      	negs	r1, r4
50008524:	4630      	mov	r0, r6
50008526:	f000 fbef 	bl	50008d08 <_sbrk_r>
5000852a:	3001      	adds	r0, #1
5000852c:	d010      	beq.n	50008550 <_malloc_trim_r+0x7c>
5000852e:	68ba      	ldr	r2, [r7, #8]
50008530:	f249 53e4 	movw	r3, #38372	; 0x95e4
50008534:	f2c5 0300 	movt	r3, #20480	; 0x5000
50008538:	1b2d      	subs	r5, r5, r4
5000853a:	4630      	mov	r0, r6
5000853c:	f045 0501 	orr.w	r5, r5, #1
50008540:	6819      	ldr	r1, [r3, #0]
50008542:	6055      	str	r5, [r2, #4]
50008544:	1b09      	subs	r1, r1, r4
50008546:	6019      	str	r1, [r3, #0]
50008548:	f000 fbdc 	bl	50008d04 <__malloc_unlock>
5000854c:	2001      	movs	r0, #1
5000854e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
50008550:	2100      	movs	r1, #0
50008552:	4630      	mov	r0, r6
50008554:	f000 fbd8 	bl	50008d08 <_sbrk_r>
50008558:	68ba      	ldr	r2, [r7, #8]
5000855a:	1a83      	subs	r3, r0, r2
5000855c:	2b0f      	cmp	r3, #15
5000855e:	dddb      	ble.n	50008518 <_malloc_trim_r+0x44>
50008560:	f249 54b0 	movw	r4, #38320	; 0x95b0
50008564:	f2c5 0400 	movt	r4, #20480	; 0x5000
50008568:	f249 51e4 	movw	r1, #38372	; 0x95e4
5000856c:	f2c5 0100 	movt	r1, #20480	; 0x5000
50008570:	6824      	ldr	r4, [r4, #0]
50008572:	f043 0301 	orr.w	r3, r3, #1
50008576:	6053      	str	r3, [r2, #4]
50008578:	1b00      	subs	r0, r0, r4
5000857a:	6008      	str	r0, [r1, #0]
5000857c:	e7cc      	b.n	50008518 <_malloc_trim_r+0x44>
5000857e:	bf00      	nop

50008580 <_free_r>:
50008580:	2900      	cmp	r1, #0
50008582:	d055      	beq.n	50008630 <_free_r+0xb0>
50008584:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
50008586:	460c      	mov	r4, r1
50008588:	4606      	mov	r6, r0
5000858a:	f000 fbb9 	bl	50008d00 <__malloc_lock>
5000858e:	f854 cc04 	ldr.w	ip, [r4, #-4]
50008592:	f249 17a8 	movw	r7, #37288	; 0x91a8
50008596:	f2c5 0700 	movt	r7, #20480	; 0x5000
5000859a:	f1a4 0508 	sub.w	r5, r4, #8
5000859e:	f02c 0101 	bic.w	r1, ip, #1
500085a2:	186b      	adds	r3, r5, r1
500085a4:	68b8      	ldr	r0, [r7, #8]
500085a6:	685a      	ldr	r2, [r3, #4]
500085a8:	4298      	cmp	r0, r3
500085aa:	f022 0203 	bic.w	r2, r2, #3
500085ae:	d052      	beq.n	50008656 <_free_r+0xd6>
500085b0:	f01c 0f01 	tst.w	ip, #1
500085b4:	605a      	str	r2, [r3, #4]
500085b6:	eb03 0002 	add.w	r0, r3, r2
500085ba:	d13a      	bne.n	50008632 <_free_r+0xb2>
500085bc:	f854 4c08 	ldr.w	r4, [r4, #-8]
500085c0:	f107 0c08 	add.w	ip, r7, #8
500085c4:	6840      	ldr	r0, [r0, #4]
500085c6:	1b2d      	subs	r5, r5, r4
500085c8:	4421      	add	r1, r4
500085ca:	f000 0001 	and.w	r0, r0, #1
500085ce:	68ac      	ldr	r4, [r5, #8]
500085d0:	4564      	cmp	r4, ip
500085d2:	d07b      	beq.n	500086cc <_free_r+0x14c>
500085d4:	f8d5 c00c 	ldr.w	ip, [r5, #12]
500085d8:	f8c4 c00c 	str.w	ip, [r4, #12]
500085dc:	f8cc 4008 	str.w	r4, [ip, #8]
500085e0:	b360      	cbz	r0, 5000863c <_free_r+0xbc>
500085e2:	f041 0301 	orr.w	r3, r1, #1
500085e6:	606b      	str	r3, [r5, #4]
500085e8:	5069      	str	r1, [r5, r1]
500085ea:	f5b1 7f00 	cmp.w	r1, #512	; 0x200
500085ee:	d356      	bcc.n	5000869e <_free_r+0x11e>
500085f0:	0a4b      	lsrs	r3, r1, #9
500085f2:	2b04      	cmp	r3, #4
500085f4:	d876      	bhi.n	500086e4 <_free_r+0x164>
500085f6:	098b      	lsrs	r3, r1, #6
500085f8:	f103 0039 	add.w	r0, r3, #57	; 0x39
500085fc:	f103 0238 	add.w	r2, r3, #56	; 0x38
50008600:	00c3      	lsls	r3, r0, #3
50008602:	18f8      	adds	r0, r7, r3
50008604:	58fb      	ldr	r3, [r7, r3]
50008606:	3808      	subs	r0, #8
50008608:	4298      	cmp	r0, r3
5000860a:	d07e      	beq.n	5000870a <_free_r+0x18a>
5000860c:	685a      	ldr	r2, [r3, #4]
5000860e:	f022 0203 	bic.w	r2, r2, #3
50008612:	428a      	cmp	r2, r1
50008614:	d977      	bls.n	50008706 <_free_r+0x186>
50008616:	689b      	ldr	r3, [r3, #8]
50008618:	4298      	cmp	r0, r3
5000861a:	d1f7      	bne.n	5000860c <_free_r+0x8c>
5000861c:	68c1      	ldr	r1, [r0, #12]
5000861e:	e9c5 0102 	strd	r0, r1, [r5, #8]
50008622:	608d      	str	r5, [r1, #8]
50008624:	60c5      	str	r5, [r0, #12]
50008626:	4630      	mov	r0, r6
50008628:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
5000862c:	f000 bb6a 	b.w	50008d04 <__malloc_unlock>
50008630:	4770      	bx	lr
50008632:	6840      	ldr	r0, [r0, #4]
50008634:	f000 0001 	and.w	r0, r0, #1
50008638:	2800      	cmp	r0, #0
5000863a:	d1d2      	bne.n	500085e2 <_free_r+0x62>
5000863c:	6898      	ldr	r0, [r3, #8]
5000863e:	4411      	add	r1, r2
50008640:	4c49      	ldr	r4, [pc, #292]	; (50008768 <_free_r+0x1e8>)
50008642:	f041 0201 	orr.w	r2, r1, #1
50008646:	42a0      	cmp	r0, r4
50008648:	d068      	beq.n	5000871c <_free_r+0x19c>
5000864a:	68db      	ldr	r3, [r3, #12]
5000864c:	60c3      	str	r3, [r0, #12]
5000864e:	6098      	str	r0, [r3, #8]
50008650:	606a      	str	r2, [r5, #4]
50008652:	5069      	str	r1, [r5, r1]
50008654:	e7c9      	b.n	500085ea <_free_r+0x6a>
50008656:	f01c 0f01 	tst.w	ip, #1
5000865a:	440a      	add	r2, r1
5000865c:	d107      	bne.n	5000866e <_free_r+0xee>
5000865e:	f854 3c08 	ldr.w	r3, [r4, #-8]
50008662:	1aed      	subs	r5, r5, r3
50008664:	441a      	add	r2, r3
50008666:	e9d5 1302 	ldrd	r1, r3, [r5, #8]
5000866a:	60cb      	str	r3, [r1, #12]
5000866c:	6099      	str	r1, [r3, #8]
5000866e:	f249 53b4 	movw	r3, #38324	; 0x95b4
50008672:	f2c5 0300 	movt	r3, #20480	; 0x5000
50008676:	f042 0101 	orr.w	r1, r2, #1
5000867a:	6069      	str	r1, [r5, #4]
5000867c:	681b      	ldr	r3, [r3, #0]
5000867e:	60bd      	str	r5, [r7, #8]
50008680:	4293      	cmp	r3, r2
50008682:	d807      	bhi.n	50008694 <_free_r+0x114>
50008684:	f249 53e0 	movw	r3, #38368	; 0x95e0
50008688:	f2c5 0300 	movt	r3, #20480	; 0x5000
5000868c:	4630      	mov	r0, r6
5000868e:	6819      	ldr	r1, [r3, #0]
50008690:	f7ff ff20 	bl	500084d4 <_malloc_trim_r>
50008694:	4630      	mov	r0, r6
50008696:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
5000869a:	f000 bb33 	b.w	50008d04 <__malloc_unlock>
5000869e:	08c9      	lsrs	r1, r1, #3
500086a0:	2301      	movs	r3, #1
500086a2:	18c8      	adds	r0, r1, r3
500086a4:	687a      	ldr	r2, [r7, #4]
500086a6:	1089      	asrs	r1, r1, #2
500086a8:	408b      	lsls	r3, r1
500086aa:	f857 1030 	ldr.w	r1, [r7, r0, lsl #3]
500086ae:	4313      	orrs	r3, r2
500086b0:	eb07 02c0 	add.w	r2, r7, r0, lsl #3
500086b4:	607b      	str	r3, [r7, #4]
500086b6:	3a08      	subs	r2, #8
500086b8:	e9c5 1202 	strd	r1, r2, [r5, #8]
500086bc:	f847 5030 	str.w	r5, [r7, r0, lsl #3]
500086c0:	4630      	mov	r0, r6
500086c2:	60cd      	str	r5, [r1, #12]
500086c4:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
500086c8:	f000 bb1c 	b.w	50008d04 <__malloc_unlock>
500086cc:	2800      	cmp	r0, #0
500086ce:	d145      	bne.n	5000875c <_free_r+0x1dc>
500086d0:	6898      	ldr	r0, [r3, #8]
500086d2:	440a      	add	r2, r1
500086d4:	68db      	ldr	r3, [r3, #12]
500086d6:	f042 0101 	orr.w	r1, r2, #1
500086da:	60c3      	str	r3, [r0, #12]
500086dc:	6098      	str	r0, [r3, #8]
500086de:	6069      	str	r1, [r5, #4]
500086e0:	50aa      	str	r2, [r5, r2]
500086e2:	e7d7      	b.n	50008694 <_free_r+0x114>
500086e4:	2b14      	cmp	r3, #20
500086e6:	d908      	bls.n	500086fa <_free_r+0x17a>
500086e8:	2b54      	cmp	r3, #84	; 0x54
500086ea:	d81e      	bhi.n	5000872a <_free_r+0x1aa>
500086ec:	0b0b      	lsrs	r3, r1, #12
500086ee:	f103 006f 	add.w	r0, r3, #111	; 0x6f
500086f2:	f103 026e 	add.w	r2, r3, #110	; 0x6e
500086f6:	00c3      	lsls	r3, r0, #3
500086f8:	e783      	b.n	50008602 <_free_r+0x82>
500086fa:	f103 005c 	add.w	r0, r3, #92	; 0x5c
500086fe:	f103 025b 	add.w	r2, r3, #91	; 0x5b
50008702:	00c3      	lsls	r3, r0, #3
50008704:	e77d      	b.n	50008602 <_free_r+0x82>
50008706:	4618      	mov	r0, r3
50008708:	e788      	b.n	5000861c <_free_r+0x9c>
5000870a:	1093      	asrs	r3, r2, #2
5000870c:	687c      	ldr	r4, [r7, #4]
5000870e:	2201      	movs	r2, #1
50008710:	4601      	mov	r1, r0
50008712:	fa02 f303 	lsl.w	r3, r2, r3
50008716:	4323      	orrs	r3, r4
50008718:	607b      	str	r3, [r7, #4]
5000871a:	e780      	b.n	5000861e <_free_r+0x9e>
5000871c:	e9c7 5504 	strd	r5, r5, [r7, #16]
50008720:	e9c5 0002 	strd	r0, r0, [r5, #8]
50008724:	606a      	str	r2, [r5, #4]
50008726:	5069      	str	r1, [r5, r1]
50008728:	e7b4      	b.n	50008694 <_free_r+0x114>
5000872a:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
5000872e:	d806      	bhi.n	5000873e <_free_r+0x1be>
50008730:	0bcb      	lsrs	r3, r1, #15
50008732:	f103 0078 	add.w	r0, r3, #120	; 0x78
50008736:	f103 0277 	add.w	r2, r3, #119	; 0x77
5000873a:	00c3      	lsls	r3, r0, #3
5000873c:	e761      	b.n	50008602 <_free_r+0x82>
5000873e:	f240 5254 	movw	r2, #1364	; 0x554
50008742:	4293      	cmp	r3, r2
50008744:	bf9d      	ittte	ls
50008746:	0c8b      	lsrls	r3, r1, #18
50008748:	f103 007d 	addls.w	r0, r3, #125	; 0x7d
5000874c:	f103 027c 	addls.w	r2, r3, #124	; 0x7c
50008750:	f44f 737e 	movhi.w	r3, #1016	; 0x3f8
50008754:	bf8c      	ite	hi
50008756:	227e      	movhi	r2, #126	; 0x7e
50008758:	00c3      	lslls	r3, r0, #3
5000875a:	e752      	b.n	50008602 <_free_r+0x82>
5000875c:	f041 0201 	orr.w	r2, r1, #1
50008760:	606a      	str	r2, [r5, #4]
50008762:	6019      	str	r1, [r3, #0]
50008764:	e796      	b.n	50008694 <_free_r+0x114>
50008766:	bf00      	nop
50008768:	500091b0 	.word	0x500091b0

5000876c <_malloc_r>:
5000876c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
50008770:	f101 050b 	add.w	r5, r1, #11
50008774:	2d16      	cmp	r5, #22
50008776:	b083      	sub	sp, #12
50008778:	4606      	mov	r6, r0
5000877a:	d827      	bhi.n	500087cc <_malloc_r+0x60>
5000877c:	2910      	cmp	r1, #16
5000877e:	f200 818f 	bhi.w	50008aa0 <_malloc_r+0x334>
50008782:	f000 fabd 	bl	50008d00 <__malloc_lock>
50008786:	2510      	movs	r5, #16
50008788:	2218      	movs	r2, #24
5000878a:	2402      	movs	r4, #2
5000878c:	f249 17a8 	movw	r7, #37288	; 0x91a8
50008790:	f2c5 0700 	movt	r7, #20480	; 0x5000
50008794:	443a      	add	r2, r7
50008796:	f1a2 0108 	sub.w	r1, r2, #8
5000879a:	6853      	ldr	r3, [r2, #4]
5000879c:	428b      	cmp	r3, r1
5000879e:	f000 81a8 	beq.w	50008af2 <_malloc_r+0x386>
500087a2:	685a      	ldr	r2, [r3, #4]
500087a4:	f103 0408 	add.w	r4, r3, #8
500087a8:	68d9      	ldr	r1, [r3, #12]
500087aa:	4630      	mov	r0, r6
500087ac:	f022 0203 	bic.w	r2, r2, #3
500087b0:	689d      	ldr	r5, [r3, #8]
500087b2:	4413      	add	r3, r2
500087b4:	685a      	ldr	r2, [r3, #4]
500087b6:	60e9      	str	r1, [r5, #12]
500087b8:	f042 0201 	orr.w	r2, r2, #1
500087bc:	608d      	str	r5, [r1, #8]
500087be:	605a      	str	r2, [r3, #4]
500087c0:	f000 faa0 	bl	50008d04 <__malloc_unlock>
500087c4:	4620      	mov	r0, r4
500087c6:	b003      	add	sp, #12
500087c8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
500087cc:	f025 0507 	bic.w	r5, r5, #7
500087d0:	42a9      	cmp	r1, r5
500087d2:	bf94      	ite	ls
500087d4:	2100      	movls	r1, #0
500087d6:	2101      	movhi	r1, #1
500087d8:	ea51 73d5 	orrs.w	r3, r1, r5, lsr #31
500087dc:	f040 8160 	bne.w	50008aa0 <_malloc_r+0x334>
500087e0:	f000 fa8e 	bl	50008d00 <__malloc_lock>
500087e4:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
500087e8:	f0c0 81a1 	bcc.w	50008b2e <_malloc_r+0x3c2>
500087ec:	0a6b      	lsrs	r3, r5, #9
500087ee:	d00b      	beq.n	50008808 <_malloc_r+0x9c>
500087f0:	2b04      	cmp	r3, #4
500087f2:	f240 814e 	bls.w	50008a92 <_malloc_r+0x326>
500087f6:	2b14      	cmp	r3, #20
500087f8:	f200 81d6 	bhi.w	50008ba8 <_malloc_r+0x43c>
500087fc:	f103 045c 	add.w	r4, r3, #92	; 0x5c
50008800:	f103 0c5b 	add.w	ip, r3, #91	; 0x5b
50008804:	00e3      	lsls	r3, r4, #3
50008806:	e004      	b.n	50008812 <_malloc_r+0xa6>
50008808:	f44f 7300 	mov.w	r3, #512	; 0x200
5000880c:	2440      	movs	r4, #64	; 0x40
5000880e:	f04f 0c3f 	mov.w	ip, #63	; 0x3f
50008812:	f249 17a8 	movw	r7, #37288	; 0x91a8
50008816:	f2c5 0700 	movt	r7, #20480	; 0x5000
5000881a:	443b      	add	r3, r7
5000881c:	f1a3 0008 	sub.w	r0, r3, #8
50008820:	685b      	ldr	r3, [r3, #4]
50008822:	4298      	cmp	r0, r3
50008824:	d106      	bne.n	50008834 <_malloc_r+0xc8>
50008826:	e00c      	b.n	50008842 <_malloc_r+0xd6>
50008828:	2900      	cmp	r1, #0
5000882a:	f280 8140 	bge.w	50008aae <_malloc_r+0x342>
5000882e:	68db      	ldr	r3, [r3, #12]
50008830:	4298      	cmp	r0, r3
50008832:	d006      	beq.n	50008842 <_malloc_r+0xd6>
50008834:	685a      	ldr	r2, [r3, #4]
50008836:	f022 0203 	bic.w	r2, r2, #3
5000883a:	1b51      	subs	r1, r2, r5
5000883c:	290f      	cmp	r1, #15
5000883e:	ddf3      	ble.n	50008828 <_malloc_r+0xbc>
50008840:	4664      	mov	r4, ip
50008842:	693a      	ldr	r2, [r7, #16]
50008844:	f8df c4b4 	ldr.w	ip, [pc, #1204]	; 50008cfc <_malloc_r+0x590>
50008848:	4562      	cmp	r2, ip
5000884a:	bf08      	it	eq
5000884c:	687b      	ldreq	r3, [r7, #4]
5000884e:	d026      	beq.n	5000889e <_malloc_r+0x132>
50008850:	6853      	ldr	r3, [r2, #4]
50008852:	f023 0303 	bic.w	r3, r3, #3
50008856:	1b59      	subs	r1, r3, r5
50008858:	290f      	cmp	r1, #15
5000885a:	f300 8151 	bgt.w	50008b00 <_malloc_r+0x394>
5000885e:	2900      	cmp	r1, #0
50008860:	e9c7 cc04 	strd	ip, ip, [r7, #16]
50008864:	f280 8107 	bge.w	50008a76 <_malloc_r+0x30a>
50008868:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
5000886c:	f080 817b 	bcs.w	50008b66 <_malloc_r+0x3fa>
50008870:	08db      	lsrs	r3, r3, #3
50008872:	f04f 0e01 	mov.w	lr, #1
50008876:	eb03 000e 	add.w	r0, r3, lr
5000887a:	6879      	ldr	r1, [r7, #4]
5000887c:	109b      	asrs	r3, r3, #2
5000887e:	f857 8030 	ldr.w	r8, [r7, r0, lsl #3]
50008882:	fa0e f303 	lsl.w	r3, lr, r3
50008886:	eb07 0ec0 	add.w	lr, r7, r0, lsl #3
5000888a:	430b      	orrs	r3, r1
5000888c:	f1ae 0108 	sub.w	r1, lr, #8
50008890:	607b      	str	r3, [r7, #4]
50008892:	e9c2 8102 	strd	r8, r1, [r2, #8]
50008896:	f847 2030 	str.w	r2, [r7, r0, lsl #3]
5000889a:	f8c8 200c 	str.w	r2, [r8, #12]
5000889e:	10a2      	asrs	r2, r4, #2
500088a0:	2001      	movs	r0, #1
500088a2:	4090      	lsls	r0, r2
500088a4:	4298      	cmp	r0, r3
500088a6:	d838      	bhi.n	5000891a <_malloc_r+0x1ae>
500088a8:	4218      	tst	r0, r3
500088aa:	d105      	bne.n	500088b8 <_malloc_r+0x14c>
500088ac:	f024 0403 	bic.w	r4, r4, #3
500088b0:	0040      	lsls	r0, r0, #1
500088b2:	3404      	adds	r4, #4
500088b4:	4218      	tst	r0, r3
500088b6:	d0fb      	beq.n	500088b0 <_malloc_r+0x144>
500088b8:	eb07 09c4 	add.w	r9, r7, r4, lsl #3
500088bc:	46a0      	mov	r8, r4
500088be:	46ce      	mov	lr, r9
500088c0:	f8de 300c 	ldr.w	r3, [lr, #12]
500088c4:	459e      	cmp	lr, r3
500088c6:	d107      	bne.n	500088d8 <_malloc_r+0x16c>
500088c8:	e135      	b.n	50008b36 <_malloc_r+0x3ca>
500088ca:	2a00      	cmp	r2, #0
500088cc:	f280 813c 	bge.w	50008b48 <_malloc_r+0x3dc>
500088d0:	68db      	ldr	r3, [r3, #12]
500088d2:	459e      	cmp	lr, r3
500088d4:	f000 812f 	beq.w	50008b36 <_malloc_r+0x3ca>
500088d8:	6859      	ldr	r1, [r3, #4]
500088da:	f021 0103 	bic.w	r1, r1, #3
500088de:	1b4a      	subs	r2, r1, r5
500088e0:	2a0f      	cmp	r2, #15
500088e2:	ddf2      	ble.n	500088ca <_malloc_r+0x15e>
500088e4:	68dc      	ldr	r4, [r3, #12]
500088e6:	eb03 0e05 	add.w	lr, r3, r5
500088ea:	f8d3 8008 	ldr.w	r8, [r3, #8]
500088ee:	f045 0501 	orr.w	r5, r5, #1
500088f2:	4630      	mov	r0, r6
500088f4:	605d      	str	r5, [r3, #4]
500088f6:	f042 0501 	orr.w	r5, r2, #1
500088fa:	f8c8 400c 	str.w	r4, [r8, #12]
500088fe:	f8c4 8008 	str.w	r8, [r4, #8]
50008902:	f103 0408 	add.w	r4, r3, #8
50008906:	e9c7 ee04 	strd	lr, lr, [r7, #16]
5000890a:	e9ce cc02 	strd	ip, ip, [lr, #8]
5000890e:	f8ce 5004 	str.w	r5, [lr, #4]
50008912:	505a      	str	r2, [r3, r1]
50008914:	f000 f9f6 	bl	50008d04 <__malloc_unlock>
50008918:	e754      	b.n	500087c4 <_malloc_r+0x58>
5000891a:	68bc      	ldr	r4, [r7, #8]
5000891c:	6863      	ldr	r3, [r4, #4]
5000891e:	f023 0a03 	bic.w	sl, r3, #3
50008922:	45aa      	cmp	sl, r5
50008924:	ebaa 0305 	sub.w	r3, sl, r5
50008928:	bf2c      	ite	cs
5000892a:	2200      	movcs	r2, #0
5000892c:	2201      	movcc	r2, #1
5000892e:	2b0f      	cmp	r3, #15
50008930:	bfd8      	it	le
50008932:	f042 0201 	orrle.w	r2, r2, #1
50008936:	2a00      	cmp	r2, #0
50008938:	f000 80cb 	beq.w	50008ad2 <_malloc_r+0x366>
5000893c:	f249 59e0 	movw	r9, #38368	; 0x95e0
50008940:	f2c5 0900 	movt	r9, #20480	; 0x5000
50008944:	f8d7 2408 	ldr.w	r2, [r7, #1032]	; 0x408
50008948:	4630      	mov	r0, r6
5000894a:	f8d9 3000 	ldr.w	r3, [r9]
5000894e:	3201      	adds	r2, #1
50008950:	eb05 0803 	add.w	r8, r5, r3
50008954:	bf17      	itett	ne
50008956:	f508 5880 	addne.w	r8, r8, #4096	; 0x1000
5000895a:	f108 0810 	addeq.w	r8, r8, #16
5000895e:	f108 080f 	addne.w	r8, r8, #15
50008962:	f428 687f 	bicne.w	r8, r8, #4080	; 0xff0
50008966:	bf18      	it	ne
50008968:	f028 080f 	bicne.w	r8, r8, #15
5000896c:	4641      	mov	r1, r8
5000896e:	f000 f9cb 	bl	50008d08 <_sbrk_r>
50008972:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
50008976:	4683      	mov	fp, r0
50008978:	f000 8124 	beq.w	50008bc4 <_malloc_r+0x458>
5000897c:	eb04 010a 	add.w	r1, r4, sl
50008980:	4281      	cmp	r1, r0
50008982:	f200 811d 	bhi.w	50008bc0 <_malloc_r+0x454>
50008986:	f8d9 3004 	ldr.w	r3, [r9, #4]
5000898a:	4443      	add	r3, r8
5000898c:	f8c9 3004 	str.w	r3, [r9, #4]
50008990:	f000 816f 	beq.w	50008c72 <_malloc_r+0x506>
50008994:	f8d7 2408 	ldr.w	r2, [r7, #1032]	; 0x408
50008998:	3201      	adds	r2, #1
5000899a:	bf0f      	iteee	eq
5000899c:	f8c7 b408 	streq.w	fp, [r7, #1032]	; 0x408
500089a0:	ebab 0101 	subne.w	r1, fp, r1
500089a4:	185b      	addne	r3, r3, r1
500089a6:	f8c9 3004 	strne.w	r3, [r9, #4]
500089aa:	f01b 0307 	ands.w	r3, fp, #7
500089ae:	f000 8145 	beq.w	50008c3c <_malloc_r+0x4d0>
500089b2:	f1c3 0108 	rsb	r1, r3, #8
500089b6:	f5c3 5280 	rsb	r2, r3, #4096	; 0x1000
500089ba:	448b      	add	fp, r1
500089bc:	3208      	adds	r2, #8
500089be:	44d8      	add	r8, fp
500089c0:	4630      	mov	r0, r6
500089c2:	eba2 0208 	sub.w	r2, r2, r8
500089c6:	9301      	str	r3, [sp, #4]
500089c8:	f3c2 020b 	ubfx	r2, r2, #0, #12
500089cc:	9200      	str	r2, [sp, #0]
500089ce:	4611      	mov	r1, r2
500089d0:	f000 f99a 	bl	50008d08 <_sbrk_r>
500089d4:	1c42      	adds	r2, r0, #1
500089d6:	e9dd 2300 	ldrd	r2, r3, [sp]
500089da:	bf02      	ittt	eq
500089dc:	3b08      	subeq	r3, #8
500089de:	2200      	moveq	r2, #0
500089e0:	eb08 0003 	addeq.w	r0, r8, r3
500089e4:	f8d9 3004 	ldr.w	r3, [r9, #4]
500089e8:	eba0 010b 	sub.w	r1, r0, fp
500089ec:	42bc      	cmp	r4, r7
500089ee:	4411      	add	r1, r2
500089f0:	f8c7 b008 	str.w	fp, [r7, #8]
500089f4:	f041 0101 	orr.w	r1, r1, #1
500089f8:	4413      	add	r3, r2
500089fa:	f8cb 1004 	str.w	r1, [fp, #4]
500089fe:	f8c9 3004 	str.w	r3, [r9, #4]
50008a02:	d018      	beq.n	50008a36 <_malloc_r+0x2ca>
50008a04:	f1ba 0f0f 	cmp.w	sl, #15
50008a08:	bf9c      	itt	ls
50008a0a:	2301      	movls	r3, #1
50008a0c:	f8cb 3004 	strls.w	r3, [fp, #4]
50008a10:	d92c      	bls.n	50008a6c <_malloc_r+0x300>
50008a12:	f1aa 020c 	sub.w	r2, sl, #12
50008a16:	6861      	ldr	r1, [r4, #4]
50008a18:	f022 0207 	bic.w	r2, r2, #7
50008a1c:	f04f 0c05 	mov.w	ip, #5
50008a20:	18a0      	adds	r0, r4, r2
50008a22:	2a0f      	cmp	r2, #15
50008a24:	f001 0101 	and.w	r1, r1, #1
50008a28:	ea41 0102 	orr.w	r1, r1, r2
50008a2c:	6061      	str	r1, [r4, #4]
50008a2e:	e9c0 cc01 	strd	ip, ip, [r0, #4]
50008a32:	f200 814a 	bhi.w	50008cca <_malloc_r+0x55e>
50008a36:	68bc      	ldr	r4, [r7, #8]
50008a38:	f8d9 202c 	ldr.w	r2, [r9, #44]	; 0x2c
50008a3c:	f8d9 1030 	ldr.w	r1, [r9, #48]	; 0x30
50008a40:	4293      	cmp	r3, r2
50008a42:	6862      	ldr	r2, [r4, #4]
50008a44:	bf88      	it	hi
50008a46:	f8c9 302c 	strhi.w	r3, [r9, #44]	; 0x2c
50008a4a:	428b      	cmp	r3, r1
50008a4c:	f022 0203 	bic.w	r2, r2, #3
50008a50:	bf88      	it	hi
50008a52:	f8c9 3030 	strhi.w	r3, [r9, #48]	; 0x30
50008a56:	4295      	cmp	r5, r2
50008a58:	eba2 0305 	sub.w	r3, r2, r5
50008a5c:	bf94      	ite	ls
50008a5e:	2200      	movls	r2, #0
50008a60:	2201      	movhi	r2, #1
50008a62:	2b0f      	cmp	r3, #15
50008a64:	bfd8      	it	le
50008a66:	f042 0201 	orrle.w	r2, r2, #1
50008a6a:	b392      	cbz	r2, 50008ad2 <_malloc_r+0x366>
50008a6c:	4630      	mov	r0, r6
50008a6e:	2400      	movs	r4, #0
50008a70:	f000 f948 	bl	50008d04 <__malloc_unlock>
50008a74:	e6a6      	b.n	500087c4 <_malloc_r+0x58>
50008a76:	4413      	add	r3, r2
50008a78:	f102 0408 	add.w	r4, r2, #8
50008a7c:	4630      	mov	r0, r6
50008a7e:	685a      	ldr	r2, [r3, #4]
50008a80:	f042 0201 	orr.w	r2, r2, #1
50008a84:	605a      	str	r2, [r3, #4]
50008a86:	f000 f93d 	bl	50008d04 <__malloc_unlock>
50008a8a:	4620      	mov	r0, r4
50008a8c:	b003      	add	sp, #12
50008a8e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
50008a92:	09ab      	lsrs	r3, r5, #6
50008a94:	f103 0439 	add.w	r4, r3, #57	; 0x39
50008a98:	f103 0c38 	add.w	ip, r3, #56	; 0x38
50008a9c:	00e3      	lsls	r3, r4, #3
50008a9e:	e6b8      	b.n	50008812 <_malloc_r+0xa6>
50008aa0:	2400      	movs	r4, #0
50008aa2:	230c      	movs	r3, #12
50008aa4:	4620      	mov	r0, r4
50008aa6:	6033      	str	r3, [r6, #0]
50008aa8:	b003      	add	sp, #12
50008aaa:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
50008aae:	441a      	add	r2, r3
50008ab0:	e9d3 7502 	ldrd	r7, r5, [r3, #8]
50008ab4:	4630      	mov	r0, r6
50008ab6:	f103 0408 	add.w	r4, r3, #8
50008aba:	6851      	ldr	r1, [r2, #4]
50008abc:	60fd      	str	r5, [r7, #12]
50008abe:	f041 0101 	orr.w	r1, r1, #1
50008ac2:	60af      	str	r7, [r5, #8]
50008ac4:	6051      	str	r1, [r2, #4]
50008ac6:	f000 f91d 	bl	50008d04 <__malloc_unlock>
50008aca:	4620      	mov	r0, r4
50008acc:	b003      	add	sp, #12
50008ace:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
50008ad2:	1962      	adds	r2, r4, r5
50008ad4:	f043 0301 	orr.w	r3, r3, #1
50008ad8:	4630      	mov	r0, r6
50008ada:	f045 0501 	orr.w	r5, r5, #1
50008ade:	6065      	str	r5, [r4, #4]
50008ae0:	3408      	adds	r4, #8
50008ae2:	60ba      	str	r2, [r7, #8]
50008ae4:	6053      	str	r3, [r2, #4]
50008ae6:	f000 f90d 	bl	50008d04 <__malloc_unlock>
50008aea:	4620      	mov	r0, r4
50008aec:	b003      	add	sp, #12
50008aee:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
50008af2:	68d3      	ldr	r3, [r2, #12]
50008af4:	429a      	cmp	r2, r3
50008af6:	bf08      	it	eq
50008af8:	3402      	addeq	r4, #2
50008afa:	f43f aea2 	beq.w	50008842 <_malloc_r+0xd6>
50008afe:	e650      	b.n	500087a2 <_malloc_r+0x36>
50008b00:	eb02 0e05 	add.w	lr, r2, r5
50008b04:	4630      	mov	r0, r6
50008b06:	f045 0501 	orr.w	r5, r5, #1
50008b0a:	6055      	str	r5, [r2, #4]
50008b0c:	e9c7 ee04 	strd	lr, lr, [r7, #16]
50008b10:	f041 0501 	orr.w	r5, r1, #1
50008b14:	e9ce cc02 	strd	ip, ip, [lr, #8]
50008b18:	f102 0408 	add.w	r4, r2, #8
50008b1c:	f8ce 5004 	str.w	r5, [lr, #4]
50008b20:	50d1      	str	r1, [r2, r3]
50008b22:	f000 f8ef 	bl	50008d04 <__malloc_unlock>
50008b26:	4620      	mov	r0, r4
50008b28:	b003      	add	sp, #12
50008b2a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
50008b2e:	08ec      	lsrs	r4, r5, #3
50008b30:	f105 0208 	add.w	r2, r5, #8
50008b34:	e62a      	b.n	5000878c <_malloc_r+0x20>
50008b36:	f108 0801 	add.w	r8, r8, #1
50008b3a:	f10e 0e08 	add.w	lr, lr, #8
50008b3e:	f018 0f03 	tst.w	r8, #3
50008b42:	f47f aebd 	bne.w	500088c0 <_malloc_r+0x154>
50008b46:	e054      	b.n	50008bf2 <_malloc_r+0x486>
50008b48:	4419      	add	r1, r3
50008b4a:	461c      	mov	r4, r3
50008b4c:	68da      	ldr	r2, [r3, #12]
50008b4e:	4630      	mov	r0, r6
50008b50:	f854 5f08 	ldr.w	r5, [r4, #8]!
50008b54:	684b      	ldr	r3, [r1, #4]
50008b56:	f043 0301 	orr.w	r3, r3, #1
50008b5a:	604b      	str	r3, [r1, #4]
50008b5c:	60ea      	str	r2, [r5, #12]
50008b5e:	6095      	str	r5, [r2, #8]
50008b60:	f000 f8d0 	bl	50008d04 <__malloc_unlock>
50008b64:	e62e      	b.n	500087c4 <_malloc_r+0x58>
50008b66:	0a59      	lsrs	r1, r3, #9
50008b68:	2904      	cmp	r1, #4
50008b6a:	d930      	bls.n	50008bce <_malloc_r+0x462>
50008b6c:	2914      	cmp	r1, #20
50008b6e:	d878      	bhi.n	50008c62 <_malloc_r+0x4f6>
50008b70:	f101 005c 	add.w	r0, r1, #92	; 0x5c
50008b74:	315b      	adds	r1, #91	; 0x5b
50008b76:	00c0      	lsls	r0, r0, #3
50008b78:	eb07 0e00 	add.w	lr, r7, r0
50008b7c:	5838      	ldr	r0, [r7, r0]
50008b7e:	f1ae 0e08 	sub.w	lr, lr, #8
50008b82:	4586      	cmp	lr, r0
50008b84:	d051      	beq.n	50008c2a <_malloc_r+0x4be>
50008b86:	6841      	ldr	r1, [r0, #4]
50008b88:	f021 0103 	bic.w	r1, r1, #3
50008b8c:	4299      	cmp	r1, r3
50008b8e:	d902      	bls.n	50008b96 <_malloc_r+0x42a>
50008b90:	6880      	ldr	r0, [r0, #8]
50008b92:	4586      	cmp	lr, r0
50008b94:	d1f7      	bne.n	50008b86 <_malloc_r+0x41a>
50008b96:	f8d0 e00c 	ldr.w	lr, [r0, #12]
50008b9a:	687b      	ldr	r3, [r7, #4]
50008b9c:	e9c2 0e02 	strd	r0, lr, [r2, #8]
50008ba0:	f8ce 2008 	str.w	r2, [lr, #8]
50008ba4:	60c2      	str	r2, [r0, #12]
50008ba6:	e67a      	b.n	5000889e <_malloc_r+0x132>
50008ba8:	2b54      	cmp	r3, #84	; 0x54
50008baa:	d916      	bls.n	50008bda <_malloc_r+0x46e>
50008bac:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
50008bb0:	d86b      	bhi.n	50008c8a <_malloc_r+0x51e>
50008bb2:	0beb      	lsrs	r3, r5, #15
50008bb4:	f103 0478 	add.w	r4, r3, #120	; 0x78
50008bb8:	f103 0c77 	add.w	ip, r3, #119	; 0x77
50008bbc:	00e3      	lsls	r3, r4, #3
50008bbe:	e628      	b.n	50008812 <_malloc_r+0xa6>
50008bc0:	42bc      	cmp	r4, r7
50008bc2:	d06d      	beq.n	50008ca0 <_malloc_r+0x534>
50008bc4:	68bc      	ldr	r4, [r7, #8]
50008bc6:	6862      	ldr	r2, [r4, #4]
50008bc8:	f022 0203 	bic.w	r2, r2, #3
50008bcc:	e743      	b.n	50008a56 <_malloc_r+0x2ea>
50008bce:	0999      	lsrs	r1, r3, #6
50008bd0:	f101 0039 	add.w	r0, r1, #57	; 0x39
50008bd4:	3138      	adds	r1, #56	; 0x38
50008bd6:	00c0      	lsls	r0, r0, #3
50008bd8:	e7ce      	b.n	50008b78 <_malloc_r+0x40c>
50008bda:	0b2b      	lsrs	r3, r5, #12
50008bdc:	f103 046f 	add.w	r4, r3, #111	; 0x6f
50008be0:	f103 0c6e 	add.w	ip, r3, #110	; 0x6e
50008be4:	00e3      	lsls	r3, r4, #3
50008be6:	e614      	b.n	50008812 <_malloc_r+0xa6>
50008be8:	f8d9 9000 	ldr.w	r9, [r9]
50008bec:	4599      	cmp	r9, r3
50008bee:	f040 8082 	bne.w	50008cf6 <_malloc_r+0x58a>
50008bf2:	f014 0f03 	tst.w	r4, #3
50008bf6:	f1a9 0308 	sub.w	r3, r9, #8
50008bfa:	f104 34ff 	add.w	r4, r4, #4294967295	; 0xffffffff
50008bfe:	d1f3      	bne.n	50008be8 <_malloc_r+0x47c>
50008c00:	687b      	ldr	r3, [r7, #4]
50008c02:	ea23 0300 	bic.w	r3, r3, r0
50008c06:	607b      	str	r3, [r7, #4]
50008c08:	0040      	lsls	r0, r0, #1
50008c0a:	4298      	cmp	r0, r3
50008c0c:	bf8c      	ite	hi
50008c0e:	2200      	movhi	r2, #0
50008c10:	2201      	movls	r2, #1
50008c12:	2800      	cmp	r0, #0
50008c14:	bf08      	it	eq
50008c16:	2200      	moveq	r2, #0
50008c18:	b91a      	cbnz	r2, 50008c22 <_malloc_r+0x4b6>
50008c1a:	e67e      	b.n	5000891a <_malloc_r+0x1ae>
50008c1c:	0040      	lsls	r0, r0, #1
50008c1e:	f108 0804 	add.w	r8, r8, #4
50008c22:	4218      	tst	r0, r3
50008c24:	d0fa      	beq.n	50008c1c <_malloc_r+0x4b0>
50008c26:	4644      	mov	r4, r8
50008c28:	e646      	b.n	500088b8 <_malloc_r+0x14c>
50008c2a:	687b      	ldr	r3, [r7, #4]
50008c2c:	1089      	asrs	r1, r1, #2
50008c2e:	f04f 0801 	mov.w	r8, #1
50008c32:	fa08 f101 	lsl.w	r1, r8, r1
50008c36:	430b      	orrs	r3, r1
50008c38:	607b      	str	r3, [r7, #4]
50008c3a:	e7af      	b.n	50008b9c <_malloc_r+0x430>
50008c3c:	44d8      	add	r8, fp
50008c3e:	4630      	mov	r0, r6
50008c40:	f1c8 0200 	rsb	r2, r8, #0
50008c44:	9301      	str	r3, [sp, #4]
50008c46:	f3c2 020b 	ubfx	r2, r2, #0, #12
50008c4a:	9200      	str	r2, [sp, #0]
50008c4c:	4611      	mov	r1, r2
50008c4e:	f000 f85b 	bl	50008d08 <_sbrk_r>
50008c52:	1c43      	adds	r3, r0, #1
50008c54:	e9dd 2300 	ldrd	r2, r3, [sp]
50008c58:	bf14      	ite	ne
50008c5a:	4680      	movne	r8, r0
50008c5c:	461a      	moveq	r2, r3
50008c5e:	4640      	mov	r0, r8
50008c60:	e6c0      	b.n	500089e4 <_malloc_r+0x278>
50008c62:	2954      	cmp	r1, #84	; 0x54
50008c64:	d822      	bhi.n	50008cac <_malloc_r+0x540>
50008c66:	0b19      	lsrs	r1, r3, #12
50008c68:	f101 006f 	add.w	r0, r1, #111	; 0x6f
50008c6c:	316e      	adds	r1, #110	; 0x6e
50008c6e:	00c0      	lsls	r0, r0, #3
50008c70:	e782      	b.n	50008b78 <_malloc_r+0x40c>
50008c72:	f3c1 020b 	ubfx	r2, r1, #0, #12
50008c76:	2a00      	cmp	r2, #0
50008c78:	f47f ae8c 	bne.w	50008994 <_malloc_r+0x228>
50008c7c:	68ba      	ldr	r2, [r7, #8]
50008c7e:	eb0a 0108 	add.w	r1, sl, r8
50008c82:	f041 0101 	orr.w	r1, r1, #1
50008c86:	6051      	str	r1, [r2, #4]
50008c88:	e6d5      	b.n	50008a36 <_malloc_r+0x2ca>
50008c8a:	f240 5254 	movw	r2, #1364	; 0x554
50008c8e:	4293      	cmp	r3, r2
50008c90:	d815      	bhi.n	50008cbe <_malloc_r+0x552>
50008c92:	0cab      	lsrs	r3, r5, #18
50008c94:	f103 047d 	add.w	r4, r3, #125	; 0x7d
50008c98:	f103 0c7c 	add.w	ip, r3, #124	; 0x7c
50008c9c:	00e3      	lsls	r3, r4, #3
50008c9e:	e5b8      	b.n	50008812 <_malloc_r+0xa6>
50008ca0:	f8d9 3004 	ldr.w	r3, [r9, #4]
50008ca4:	4443      	add	r3, r8
50008ca6:	f8c9 3004 	str.w	r3, [r9, #4]
50008caa:	e673      	b.n	50008994 <_malloc_r+0x228>
50008cac:	f5b1 7faa 	cmp.w	r1, #340	; 0x154
50008cb0:	d813      	bhi.n	50008cda <_malloc_r+0x56e>
50008cb2:	0bd9      	lsrs	r1, r3, #15
50008cb4:	f101 0078 	add.w	r0, r1, #120	; 0x78
50008cb8:	3177      	adds	r1, #119	; 0x77
50008cba:	00c0      	lsls	r0, r0, #3
50008cbc:	e75c      	b.n	50008b78 <_malloc_r+0x40c>
50008cbe:	f44f 737e 	mov.w	r3, #1016	; 0x3f8
50008cc2:	247f      	movs	r4, #127	; 0x7f
50008cc4:	f04f 0c7e 	mov.w	ip, #126	; 0x7e
50008cc8:	e5a3      	b.n	50008812 <_malloc_r+0xa6>
50008cca:	f104 0108 	add.w	r1, r4, #8
50008cce:	4630      	mov	r0, r6
50008cd0:	f7ff fc56 	bl	50008580 <_free_r>
50008cd4:	f8d9 3004 	ldr.w	r3, [r9, #4]
50008cd8:	e6ad      	b.n	50008a36 <_malloc_r+0x2ca>
50008cda:	f240 5054 	movw	r0, #1364	; 0x554
50008cde:	4281      	cmp	r1, r0
50008ce0:	bf9b      	ittet	ls
50008ce2:	0c99      	lsrls	r1, r3, #18
50008ce4:	f101 007d 	addls.w	r0, r1, #125	; 0x7d
50008ce8:	f44f 707e 	movhi.w	r0, #1016	; 0x3f8
50008cec:	317c      	addls	r1, #124	; 0x7c
50008cee:	bf8c      	ite	hi
50008cf0:	217e      	movhi	r1, #126	; 0x7e
50008cf2:	00c0      	lslls	r0, r0, #3
50008cf4:	e740      	b.n	50008b78 <_malloc_r+0x40c>
50008cf6:	687b      	ldr	r3, [r7, #4]
50008cf8:	e786      	b.n	50008c08 <_malloc_r+0x49c>
50008cfa:	bf00      	nop
50008cfc:	500091b0 	.word	0x500091b0

50008d00 <__malloc_lock>:
50008d00:	4770      	bx	lr
50008d02:	bf00      	nop

50008d04 <__malloc_unlock>:
50008d04:	4770      	bx	lr
50008d06:	bf00      	nop

50008d08 <_sbrk_r>:
50008d08:	b538      	push	{r3, r4, r5, lr}
50008d0a:	f249 6414 	movw	r4, #38420	; 0x9614
50008d0e:	f2c5 0400 	movt	r4, #20480	; 0x5000
50008d12:	4605      	mov	r5, r0
50008d14:	4608      	mov	r0, r1
50008d16:	2300      	movs	r3, #0
50008d18:	6023      	str	r3, [r4, #0]
50008d1a:	f7ff ea1c 	blx	50008154 <_sbrk>
50008d1e:	1c43      	adds	r3, r0, #1
50008d20:	d000      	beq.n	50008d24 <_sbrk_r+0x1c>
50008d22:	bd38      	pop	{r3, r4, r5, pc}
50008d24:	6823      	ldr	r3, [r4, #0]
50008d26:	2b00      	cmp	r3, #0
50008d28:	d0fb      	beq.n	50008d22 <_sbrk_r+0x1a>
50008d2a:	602b      	str	r3, [r5, #0]
50008d2c:	bd38      	pop	{r3, r4, r5, pc}
50008d2e:	bf00      	nop
50008d30:	6c6c6548 	.word	0x6c6c6548
50008d34:	6f57206f 	.word	0x6f57206f
50008d38:	0a646c72 	.word	0x0a646c72
50008d3c:	00000000 	.word	0x00000000
50008d40:	54495845 	.word	0x54495845
50008d44:	0000000a 	.word	0x0000000a

50008d48 <_global_impure_ptr>:
50008d48:	50008d80                                ...P

Disassembly of section .init:

50008d4c <_init>:
50008d4c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
50008d4e:	bf00      	nop
50008d50:	bcf8      	pop	{r3, r4, r5, r6, r7}
50008d52:	bc08      	pop	{r3}
50008d54:	469e      	mov	lr, r3
50008d56:	4770      	bx	lr

Disassembly of section .fini:

50008d58 <_fini>:
50008d58:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
50008d5a:	bf00      	nop
50008d5c:	bcf8      	pop	{r3, r4, r5, r6, r7}
50008d5e:	bc08      	pop	{r3}
50008d60:	469e      	mov	lr, r3
50008d62:	4770      	bx	lr
