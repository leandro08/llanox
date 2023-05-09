#include <inttypes.h>

#define __I  volatile
#define __O  volatile
#define __IO volatile
#define UART0_BASE 0x01C28000

typedef struct {
	__IO uint32_t RBR_THR_DLL;
	__IO uint32_t DLH_IER;
	__IO uint32_t IIR_FCR;
	__IO uint32_t LCR;
	__IO uint32_t MCR;
	__I  uint32_t LSR;
	__I  uint32_t MSR;
	__IO uint32_t SCH;
} UART_t;

#define UART0 ((UART_t *) UART0_BASE)

uint8_t uart0_recv(void);
void uart0_send(uint8_t);
