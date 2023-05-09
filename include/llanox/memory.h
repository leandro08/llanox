#include <inttypes.h>

#define STACK_ERROR -1
#define STACK_SIZE 8192
#define STACK_SECTION 1024
#define MAX_INDEX (STACK_SECTION / (STACK_SIZE / 1024) - 1)

uint32_t sys_stack;
extern const void * const user_start;
extern const void * const user_end;

void memcpy_32(void *, const void *, uint32_t);
uint32_t get_stack(void);
void free_stack(uint32_t);
uint32_t get_index(void);
