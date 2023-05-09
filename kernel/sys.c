#include <llanox/syscall.h>
#include <llanox/printk.h>

unsigned int sys_write(int fd, const void *buf, unsigned int num)
{
	return printk("%s", buf);
}
