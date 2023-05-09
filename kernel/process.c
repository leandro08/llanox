#include <llanox/process.h>
#include <llanox/memory.h>
#include <stddef.h>
#include <asm/cpu.h>
#include <llanox/printk.h>

pcb_t process[MAX_PROCESS];
pcb_t threads[MAX_THREADS];
pcb_t *running = NULL;
pcb_t *ready_queue = NULL; 
pcb_t *waiting_queue = NULL;
uint32_t num_process = 1;
const uint32_t PCB_SIZE = sizeof(pcb_t);


uint32_t kfork(int fun_addr)
{
	disable_irq();

	if (num_process == MAX_PROCESS) {
		enable_irq();
		return -1;
	}

	uint32_t sp = get_stack();
	if (sp == STACK_ERROR) {
		enable_irq();
		return -1;
	}

	pcb_t *p = &process[num_process];
	p->next = NULL;
	p->ticks = 0;
	p->pid = num_process;
	p->status = READY;
	p->threads = 0;
	p->irq_lr = fun_addr;
	p->sp = sp;
	p->sp_index = get_index();
	enqueue_pcb(&ready_queue, p);
	enable_irq();
	return num_process++;	
}

void scheduler(void)
{
	if (running->ticks == QUANTUM || running->status == WAITING || running->status == EXIT) {
		running->ticks = 0;
		running->next = NULL;
	//	print_queue(&ready_queue);
		if (running->status == RUNNING) {
			running->status = READY;
			enqueue_pcb(&ready_queue, running);
	//		print_queue(&ready_queue);
		}
		running = dequeue_pcb(&ready_queue);
	//	print_queue(&ready_queue);
		running->status = RUNNING;
	} else {
		running->ticks++;
	}
}

void enqueue_pcb(pcb_t **queue, pcb_t *pcb)
{
	if (*queue == NULL) {
		*queue = pcb;
		return;
	}

	pcb_t *p = *queue;
	while (p->next != NULL)
		p = p->next;
	
	p->next = pcb;
}

pcb_t *dequeue_pcb(pcb_t **queue)
{
	if (*queue == NULL)
		return NULL;

	pcb_t *p = *queue;

	if (p->next == NULL) {
		*queue = NULL;
		return p;
	}

	*queue = p->next;
	return p;
}

void print_queue(pcb_t **queue)
{
	pcb_t *p = *queue;
	while (p != NULL) {
		printk("[%d]->", p->pid);
		p = p->next;
	}
	printk("NULL\n");
}
