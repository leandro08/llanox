#include <syscall.h>
#include <sys/stat.h>

unsigned int _write(int fd, const void *buf, int count)
{	
	_syscall3(unsigned int, SYS_write, fd, buf, count)
}

/*
int _close(int fd)
{
	_write(0, "CLOSE\n", 6);
	return 0;	
}

int _read(int fd, void *buf, unsigned int count)
{
	_write(0, "READ\n", 5);
	return 0;
}

int _lseek(int fd, int offset, int whence)
{
	_write(0, "LSEEK\n", 6);
	return 0;
}

int _fstat(int fildes, struct stat *buf)
{
	_write(0, "FSTAT\n", 6);
	return 0;
}

int _isatty(int fd)
{
	_write(0, "ISATTY\n", 7);
	return 0;
}
*/

void *_sbrk(int i)
{
	for(;;);
	void *p;
	return p;
}

void _exit(int i)
{
	_write(0, "EXIT\n", 5);
	for (;;);
}
