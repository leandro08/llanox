#include <llanox/printk.h>
#include <asm/serial.h>
#include <asm/cpu.h>
#include <asm/gic.h>
#include <asm/timer.h>
#include <llanox/string.h>
#include <llanox/memory.h>
#include <llanox/pthread.h>


void *main(void *data)
{
	pthread_t t = pthread_self();
	for (;;)
		printk("Thread %d\n", t.tid);
	return NULL;
}



void init()
{ 
	pcb_t *p = process;
	p->next = NULL;
	p->ticks = 0;
	p->pid = 0;
	p->status = RUNNING;
	running = p;
	init_gic();
	init_timer0();
	enable_irq();
	printk("Starting llanox... kernel loaded OK\n\n");
	print_cpu_status();

	pthread_mutex_init(&mutex, NULL);
	pthread_t thread1, thread2, thread3;
	pthread_create(&thread1, NULL, main, NULL);
	pthread_create(&thread2, NULL, main, NULL);
	pthread_create(&thread3, NULL, main, NULL);

	for (;;) {
		printk("Process %d\n", running->pid);
	}
}
