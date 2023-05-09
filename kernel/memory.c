#include <llanox/memory.h>
#include <llanox/printk.h>

uint32_t free = 0;
uint32_t index = 1;
uint32_t count = 1;
uint32_t sp;
uint32_t *p;


void memcpy_32(void *dst, const void *src, uint32_t count)
{
	uint32_t *tmp_dst = dst;
	const uint32_t *tmp_src = src;

	while (count--)
		*tmp_dst++ = *tmp_src++;
}

uint32_t get_stack()
{
	p = (uint32_t *) (sys_stack - 4);

	if (free && count > MAX_INDEX) {
		free--;

		if (*p == 0xA13F) {
			index = 0;
			return sys_stack;
		}

		for (int i = 1; i <= MAX_INDEX; i++) {
			sp = sys_stack - STACK_SIZE * i;
			p = (uint32_t *) (sp - 4);
			if (*p == 0xA13F) {
				index = i;
				return sp;
			}
		}
	}

	if (count <= MAX_INDEX) {
		count++;
		return sys_stack - STACK_SIZE * index++;
	}

	return -1;
}

void free_stack(uint32_t i)
{
	free++;
	p = (uint32_t *) (sys_stack - STACK_SIZE * i - 4);
	*p = 0xA13F;
}

uint32_t get_index()
{
	return index;
}
