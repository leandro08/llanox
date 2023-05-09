#include <llanox/pthread.h>
#include <llanox/memory.h>
#include <llanox/printk.h>
#include <stddef.h>
#include <asm/cpu.h>

uint8_t free_threads = 0;
uint32_t num_threads = 0;
uint32_t thread_index = 0;


int pthread_create(pthread_t *thread, const pthread_attr_t *attr, void * (*fun_addr)(void *), void *arg)
{
	disable_irq();

	if (running->threads > MAX_THREADS_PER_PROCESS) {
		enable_irq();
		return -1;
	}

	if (num_threads == MAX_THREADS && free_threads) {
		for (int i = 0; i < MAX_THREADS; i++) {
			if (threads[i].status == EXIT) {
				free_threads--;
				thread_index = i;
				break;
			}
		}
	} else if (num_threads < MAX_THREADS) { 
		thread_index = num_threads++;
	} else {
		enable_irq();
		return -1;
	}

	uint32_t sp = get_stack();
	if (sp == STACK_ERROR) {
		enable_irq();
		return -1;
	}

	pcb_t *p = &threads[num_threads];
	p->pid = thread_index;
	p->pid = running->threads;
	p->next = NULL;
	p->ticks = 0;
	p->status = READY;
	p->irq_lr = (int) fun_addr;
	p->sp = sp;
	p->sp_index = get_index();
	p->thread_info.pid = running->pid;

	if (running->threads == (MAX_THREADS_PER_PROCESS - 1))
		running->threads = MAX_THREADS_PER_PROCESS;
	else
		running->threads++;
		
	p->thread_info.tid = running->threads;
	thread->pid = running->pid;
	thread->tid = running->threads;
	thread->index = thread_index;
	enqueue_pcb(&ready_queue, p);
	enable_irq();
	return thread->tid;
}

int pthread_join(pthread_t thread, void **thread_return)
{
	disable_irq();

	if (thread_return == NULL) {
		running->status = WAITING;
		enqueue_pcb(&threads[thread.index].queue, running);
		yield();
	}

	enable_irq();
	return 0;
}

void pthread_exit(void *retval)
{
	pcb_t *p;
	pthread_t t = pthread_self();
		
	disable_irq();
		if (retval == NULL) {
			p = dequeue_pcb(&threads[t.index].queue);
			while (p != NULL) {
				p->status = READY;
				p->threads--;
				enqueue_pcb(&ready_queue, p);
				p = dequeue_pcb(&threads[t.index].queue);
			}
			running->status = EXIT;
			free_stack(running->sp_index);
			free_threads++;
		}
	enable_irq();
}

pthread_t pthread_self()
{
	return running->thread_info;	
}

int pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *attr)
{
	mutex->tid = 0;
	return 0;
}

int pthread_mutex_lock(pthread_mutex_t *mutex)
{
	disable_irq();
		if (mutex->tid) {
			running->status = WAITING;
			enqueue_pcb(&mutex->queue, running);
			yield();
		}
	mutex->tid = running->thread_info.tid; 			
	enable_irq();
	return 0;
}

int pthread_mutex_unlock(pthread_mutex_t *mutex)
{
	pcb_t *p;
	disable_irq();
	p = dequeue_pcb(&mutex->queue);
	p->status = READY;
	enqueue_pcb(&ready_queue, p);
	mutex->tid = 0;	
	enable_irq();
	return 0;
}
