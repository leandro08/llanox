.arm

.data
	irq_lr: .word 0

.section ".boot"

.global reset_handler, irq_interrupt, context_switch, yield

reset_handler:
	
	@ disable all cores except core #0
	mrc p15, 0, r0, c0, c0, 5
	and r0, r0, #0x03
	cmp r0, #0x00
	beq init_boot

	wait_loop:
		wfi
		b wait_loop

	init_boot:
		@ copy the vector table from __vectors_start to 0x00000000
		ldr r0, =__vectors_start
		mov r1, #0x00
		ldmia r0!, {r2-r9}
		stmia r1!, {r2-r9}
		ldmia r0!, {r2-r9}
		stmia r1!, {r2-r9}

		@ clear bss section
		ldr r0, =_bss
		ldr r1, =_ebss
		mov r2, #0x00
	clear_loop:
		str r2, [r0], #4
		cmp r0, r1
		bne clear_loop
		str r2, [r0]
		

		@ disable L1 i-d caches and MMU
		mrc p15, 0, r1, c1, c0, 0
		bic r1, r1, #0x01
		bic r1, r1, #(0x1 << 12) 
		bic r1, r1, #(0x1 << 2) 
		mcr p15, 0, r1, c1, c0, 0 


		@ invalidate instruction cache
		mov r1, #0
		mcr p15, 0, r1, c7, c5, 0

		@ invalidate data cache
		mrc p15, 1, r0, c0, c0, 0 @ read cache size ID
		mov r3, #0x1ff
		and r0, r3, r0, lsr #13
		mov r1, #0 

		way_loop:
			mov r3, #0 @ r3 = set counter set_loop
		set_loop:
			mov r2, r1, lsl #30 
			orr r2, r3, lsl #5 
			mcr p15, 0, r2, c7, c14, 2 @ clean and invalidate line described by r2
			add r3, r3, #1 
			cmp r0, r3
			bgt set_loop
			add r1, r1, #1 
			cmp r1, #4 
			bne way_loop 

		@ invalidate TLB
		mcr p15, 0, r1, c8, c7, 0

		@ enable i-d caches and branch prediction
		mov r1, #0
		mrc p15, 0, r1, c1, c0, 0
		orr r1, r1, #(0x1 << 12)
		orr r1, r1, #(0x1 << 2)  
		orr r1, r1, #(0x1 << 11) 
		mcr p15, 0, r1, c1, c0, 0


		@ initialize stacks of core modes	
		ldr r0, =sys_stack_base

		@ FIQ mode
		msr cpsr_c, #0xD1
		mov sp, r0
		sub r0, r0, #0x1000

		@ IRQ mode
		msr cpsr_c, #0xD2  
		mov sp, r0
		sub r0, r0, #0x1000

		@ ABORT mode
		msr cpsr_c, #0xD7  
		mov sp, r0
		sub r0, r0, #0x1000

		@ UNDEF mode
		msr cpsr_c, #0xDB  
		mov sp, r0
		sub r0, r0, #0x1000

		@ SYS mode
		msr cpsr_c, #0xDF
		mov sp, r0		
		sub r0, r0, #0x1000
		
		@ switching to SVC mode and setting stack
		msr cpsr_c, #0xD3
		mov sp, r0
		ldr r1, =sys_stack
		str r0, [r1]

		@ call init
		b init

		b wait_loop


irq_interrupt:
	sub lr, lr, #4
	stmfd sp!, {r0-r12, lr}
	ldr r0, =irq_lr
	str lr, [r0]	
	movw r0, #0x2000
	movt r0, #0x01C8
	ldr r0, [r0, #12]
	mov r1, #0x03FF
	and r0, r0, r1
	cmp r0, #50
	beq context_switch
	bl irq_handler
	ldmfd sp!, {r0-r12, pc}^

context_switch:
	movw r0, #0x2000
	movt r0, #0x01C8
	mov r1, #50
	str r1, [r0, #16]
	movw r0, #0x0C00	
	movt r0, #0x01C2
	mov r1, #0x01
	str r1, [r0, #4]
	ldmfd sp, {r0-r3}
	ldr r12, [sp, #0x30]
	add sp, sp, #0x38
	msr cpsr_c, #0x93
	stmfd sp!, {r0-r12, lr}
	ldr r1, =irq_lr
	ldr r1, [r1]
	ldr r0, =running
	ldr r0, [r0]
	str r1, [r0, #20]
	str sp, [r0, #24]
	bl scheduler
	ldr r0, =running
	ldr r0, [r0]
	ldr r1, [r0, #20]
	ldr sp, [r0, #24]
	ldr r2, =irq_lr
	str r1, [r2]
	ldmfd sp!, {r0-r12, lr}
	msr cpsr_c, #0x92
	ldr lr, =irq_lr
	ldr lr, [lr]
	movs pc, lr

yield:
	mrs r0, cpsr
	orr r0, r0, #0x80
	msr cpsr, r0
	stmfd sp!, {r0-r12, lr}
	mov r1, lr
	ldr r0, =running
	ldr r0, [r0]
	str r1, [r0, #20]
	str sp, [r0, #24]
	bl scheduler
	ldr r0, =running
	ldr r0, [r0]
	ldr r1, [r0, #20]
	ldr sp, [r0, #24]
	mov pc, r1
	stmfd sp, {r1}
	ldmfd sp!, {r0-r12, lr}
	mrs r0, cpsr
	bic r0, r0, #0x80
	msr cpsr, r0
	ldr pc, [sp, #0x3c]
