#include <inttypes.h>

#define __I  volatile
#define __O  volatile
#define __IO volatile
#define TMR_BASE 0x01C20C00
#define TMR0_BASE (TMR_BASE + 0x10)
#define TMR1_BASE (TMR_BASE + 0x20)
#define AVS_BASE  (TMR_BASE + 0x80)
#define WDOG_BASE (TMR_BASE + 0xA0)

typedef struct {
	__IO uint32_t IRQ_EN;
	__IO uint32_t IRQ_STA;
} TMR_t;

typedef struct {
	__IO uint32_t CTRL;
	__IO uint32_t INT_VAL;
	__IO uint32_t CUR_VAL;
} TMRx_t;

typedef struct {
	__IO uint32_t CNT_CTRL;
	__IO uint32_t CNT0;
	__IO uint32_t CNT1;
	__IO uint32_t CNT_DIV;
} AVS_t;

typedef struct {
	__IO uint32_t IRQ_EN;
	__IO uint32_t IRQ_STA;
	__IO uint32_t RESERVED[2];
	__IO uint32_t CTRL;
	__IO uint32_t CFG;
	__IO uint32_t MODE;
} WDOG_t;

#define TMR  ((TMR_t *) TMR_BASE)
#define TMR0 ((TMRx_t *) TMR0_BASE)
#define TMR1 ((TMRx_t *) TMR1_BASE)
#define AVS  ((AVS_t *) AVS_BASE)
#define WDOG ((WDOG_t *) WDOG_BASE)

void init_timer0(void);
void clean_pending_timer0(void);
void enable_int_timer0(void);
void disable_int_timer0(void);
