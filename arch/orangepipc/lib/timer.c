#include <asm/timer.h>
#include <llanox/printk.h>

void init_timer0(void)
{
	TMR->IRQ_EN |= 0x01;
	TMR0->INT_VAL = 0x2EE0;
	TMR0->CTRL |= 1 << 4;
	TMR0->CTRL |= 1 << 2;
	TMR0->CTRL |= 0x02;
	while (TMR0->CTRL & 0x02);
	TMR0->CTRL |= 0x01;
}

void clean_pending_timer0(void) 
{
	TMR->IRQ_STA |= 0x01;
}

void enable_int_timer0(void) 
{
	TMR0->CTRL |= 0x01;
}


void disable_int_timer0(void) 
{
	TMR0->CTRL &= ~(0x01);
}
