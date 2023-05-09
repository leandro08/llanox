#include <llanox/printk.h>
#include <asm/cpu.h>
#include <asm/int_handlers.h>
#include <llanox/syscall.h>
#include <asm/gic.h>
#include <asm/timer.h>
#include <llanox/process.h>
#include <llanox/memory.h>

void undefined_handler(void)
{
	printk("\n\n Undefined instruction! \n\n");
	for (;;);
}

void syscall_handler(void)
{
	unsigned int sys_num;
	__asm volatile ("mov %[result], r7"
			: [result] "=r" (sys_num)
			:
			:);
	SAVE_REGS;
	switch (sys_num) {
		case SYS_write:
			__asm volatile ("bl sys_write");
			break;
		default:
			break;
	}
	__asm volatile ("str r0, [sp, %[input_i]]"
			:
			: [input_i] "r" (REG_0)
			:);
	RESTORE_REGS;
	__asm volatile ("movs pc, r14");
}


void data_handler(void)
{
	printk("\n\n Data abort! \n\n");
	for (;;);
}

void irq_handler(void)
{
//	__asm volatile ("subs lr, lr, #4");
//	SAVE_REGS;
	uint32_t id = GICC->IAR;
/*
//	scheduler();
	switch (id) {
		case 50:
			__asm volatile ("msr cpsr_c, #0xD3");
			SAVE_REGS;
			__asm volatile ("mov %[result], sp"
					: [result] "=r" (running->sp)
					:);
			scheduler();
			__asm volatile ("mov sp, %[input_i]"
					:
					: [input_i] "r" (running->sp)
					:);
			RESTORE_REGS;
			uint32_t lr_reg;
			__asm volatile ("mov %[result], lr"
					: [result] "=r" (lr_reg)
					:
					:);
			__asm volatile ("msr cpsr_c, #0xD2");
			__asm volatile ("mov lr, %[input_i]"
					:
					: [input_i] "r" (lr_reg)
					:);
				
			break;
		default:
			break;
	}

//	printk("IRQ from timer0 with ID: %d\n\n", id);
	GICC->EOIR = id;
	RESTORE_REGS;
	__asm volatile ("movs pc, lr");
	
//	for (;;);

*/ 
	printk("IRQ from timer0 with ID: 50\n");
	GICC->EOIR = id;
	clean_pending_timer0();
}

void fiq_handler(void)
{
	printk("\n\n This is a FIQ! \n\n");
	for (;;);
}
