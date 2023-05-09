#include <inttypes.h>

#define USR_MODE 0x10
#define FIQ_MODE 0x11
#define IRQ_MODE 0x12
#define SVC_MODE 0x13
#define SYS_MODE 0x1F

#define USR 0x10
#define FIQ 0xD1
#define IRQ 0xD2
#define SVC 0xD3
#define SYS 0xDF



typedef struct {
	uint32_t cpsr;
	uint8_t cpu_mode;
	uint8_t arm_mode;
	uint8_t fiq;
	uint8_t irq;
	uint8_t abort;
	uint8_t endian;
} cpu_t;

void get_cpu_status(cpu_t *);
void print_cpu_status(void);
void reg_dump(void);
void enable_irq(void);
void disable_irq(void);
void enable_fiq(void);
void disable_fiq(void);
void enable_abort(void);
void disable_abort(void);
void enable_int(void);
void disable_int(void);
uint8_t get_cpu_mode(void);
void set_cpu_mode(uint8_t);
void print_stack(uint32_t *, uint32_t);
