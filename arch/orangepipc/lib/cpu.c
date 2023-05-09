#include <asm/cpu.h>
#include <inttypes.h>
#include <llanox/printk.h>
#include <llanox/stdlib.h>


void get_cpu_status(cpu_t *cpu_status)
{
	__asm volatile ("mrs %[result], cpsr"
			: [result] "=r" (cpu_status->cpsr));

	cpu_status->cpu_mode = cpu_status->cpsr & 0x1F;
	cpu_status->arm_mode = cpu_status->cpsr & 0x20;
	cpu_status->fiq = cpu_status->cpsr & 0x40;
	cpu_status->irq = cpu_status->cpsr & 0x80;
	cpu_status->abort = cpu_status->cpsr & 0x100;
	cpu_status->endian = cpu_status->cpsr & 0x200;
}

void print_cpu_status(void)
{
	cpu_t cpu_status;
	get_cpu_status(&cpu_status);

	printk("---------------cpu status---------------\n\n");
	
	switch (cpu_status.cpu_mode) {
		case USR_MODE:
			printk("cpu mode: USR mode\n");
			break;
		case FIQ_MODE:
			printk("cpu mode: FIQ mode\n");
			break;
		case IRQ_MODE:
			printk("cpu mode: IRQ mode\n");
			break;
		case SVC_MODE:
			printk("cpu mode: SVC mode\n");
			break;
		case SYS_MODE:
			printk("cpu mode: SYS mode\n");
			break;
		default:
			break;
	}

	if (cpu_status.arm_mode)
		printk("machine state: Thumb state\n");
	else
		printk("machine state: ARM state\n");

	if (cpu_status.fiq)
		printk("FIQ: disabled\n");
	else
		printk("FIQ: enabled\n");

	if (cpu_status.irq)
		printk("IRQ: disabled\n");
	else
		printk("IRQ: enabled\n");

	if (cpu_status.abort)
		printk("ABORT: disabled\n");
	else
		printk("ABORT: enabled\n");

	if (cpu_status.endian)
		printk("endianness: big endian\n");
	else
		printk("endianness: little endian\n");

	printk("----------------------------------------\n\n");

}

inline void reg_dump(void)
{
	uint32_t reg_val[16];
	char reg[4] = "r";
 
	__asm volatile ("mov %0, r0"  : "=r" (reg_val[0])); 
	__asm volatile ("mov %0, r1"  : "=r" (reg_val[1])); 
	__asm volatile ("mov %0, r2"  : "=r" (reg_val[2])); 
	__asm volatile ("mov %0, r3"  : "=r" (reg_val[3])); 
	__asm volatile ("mov %0, r4"  : "=r" (reg_val[4])); 
	__asm volatile ("mov %0, r5"  : "=r" (reg_val[5])); 
	__asm volatile ("mov %0, r6"  : "=r" (reg_val[6])); 
	__asm volatile ("mov %0, r7"  : "=r" (reg_val[7])); 
	__asm volatile ("mov %0, r8"  : "=r" (reg_val[8])); 
	__asm volatile ("mov %0, r9"  : "=r" (reg_val[9])); 
	__asm volatile ("mov %0, r10" : "=r" (reg_val[10])); 
	__asm volatile ("mov %0, r11" : "=r" (reg_val[11])); 
	__asm volatile ("mov %0, r12" : "=r" (reg_val[12])); 
	__asm volatile ("mov %0, r13" : "=r" (reg_val[13])); 
	__asm volatile ("mov %0, r14" : "=r" (reg_val[14])); 
	__asm volatile ("mov %0, r15" : "=r" (reg_val[15])); 
	
	int i;

	for (i = 0; i < 16; i++) {
		itoa(i, &reg[1], 10);
		if (i % 2 == 0)
			printk("\n");
		if (i == 13)
			printk("sp:  %p\t  ", reg_val[13]);
		else if (i == 14)
			printk("lr:  %p\t  ", reg_val[14]);
		else if (i == 15)
			printk("pc:  %p\t  ", reg_val[15]);
		else if (i < 10)
			printk("%s:  %p\t  ", reg, reg_val[i]);	
		else
			printk("%s: %p\t  ", reg, reg_val[i]);	
	}
	printk("\n\n");
}

inline void enable_irq(void)
{
	__asm volatile ("mrs r0, cpsr\n\t"
			"bic r0, r0, #0x80\n\t"
			"msr cpsr, r0\n\t");
}

inline void disable_irq(void)
{
	__asm volatile ("mrs r0, cpsr\n\t"
			"orr r0, r0, #0x80\n\t"
			"msr cpsr, r0\n\t");
}

inline void enable_fiq(void)
{
	__asm volatile ("mrs r0, cpsr\n\t"
			"bic r0, r0, #0x40\n\t"
			"msr cpsr, r0\n\t");
}

inline void disable_fiq(void)
{
	__asm volatile ("mrs r0, cpsr\n\t"
			"orr r0, r0, #0x40\n\t"
			"msr cpsr, r0\n\t");
}

inline void enable_abort(void)
{
	__asm volatile ("cpsie a");
}

inline void disable_abort(void)
{
	__asm volatile ("cpsid a");
}

void enable_int(void)
{
	enable_irq();
	enable_fiq();
	enable_abort();
}

void disable_int(void)
{
	disable_irq();
	disable_fiq();
	disable_abort();
}

uint8_t get_cpu_mode(void)
{ 
	uint8_t mode;
	__asm volatile ("mrs r0, cpsr\n\t"
			"and r0, r0, #0x1F\n\t"
			"mov %[result], r0"
			: [result] "=r" (mode)
			:
			: "r0");
	return mode;
}

inline void set_cpu_mode(uint8_t mode)
{
	__asm volatile ("msr cpsr, %[input_i]"
			:
			: [input_i] "r" (mode)
			:);
}

void print_stack(uint32_t *p, uint32_t size) {
	int r = 0;
	printk("sp: %p\n", p);
	while (size--) {
		if (r == 13)
			printk("r14: %p\n", *p);
		else {
			printk("r%d: %p\n", r, *p);
		}
		p++;
		r++;
	}
	printk("\n");
}
