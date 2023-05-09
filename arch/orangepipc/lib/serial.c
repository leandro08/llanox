#include <asm/serial.h>

uint8_t uart0_recv(void)
{
	while (!(UART0->LSR & 0x01));
	return (UART0->RBR_THR_DLL & 0xFF);
}

void uart0_send(uint8_t data)
{
	while (!(UART0->LSR & 0x20));
	UART0->RBR_THR_DLL = data; 
}
