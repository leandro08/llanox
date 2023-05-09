#include <asm/gic.h>

void init_gic(void)
{
	int div;
	int mod;

	GICD->CTLR |= 0x01;
	div = INT_TIMER0 / 32;
	mod = INT_TIMER0 % 32;
	GICD->ISENABLERn[div] |= 1 << mod;
	div = INT_TIMER0 / 4;
	mod = INT_TIMER0 % 4;
	GICD->ITARGETSRn[div] |= 1 << 16;
	GICC->CTLR |= 1 << 0;
}
