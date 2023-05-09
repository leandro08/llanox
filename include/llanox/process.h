#include <inttypes.h>
#include <stddef.h>
#include <llanox/memory.h>

#define READY 0
#define RUNNING 1
#define WAITING 2
#define EXIT 3
#define MAX_PROCESS 32
#define MAX_THREADS 96
#define MAX_THREADS_PER_PROCESS (MAX_THREADS / MAX_PROCESS)
#define QUANTUM 100

typedef struct {
	uint32_t pid;
	uint32_t tid;
	uint32_t index;
} pthread_t;

typedef struct pcb {
	struct pcb *next;
	uint32_t ticks;
	uint32_t pid;
	uint32_t status;
	uint32_t threads;
	uint32_t irq_lr;
	uint32_t sp;
	uint32_t sp_index;
	struct pcb *queue;
	pthread_t thread_info;
} pcb_t;

extern pcb_t process[MAX_PROCESS];
extern pcb_t threads[MAX_THREADS];
extern pcb_t *running;
extern pcb_t *ready_queue;
extern pcb_t *waiting_queue;
extern uint32_t num_process;
extern const uint32_t PCB_SIZE;

uint32_t kfork(int);
void scheduler(void);
void enqueue_pcb(pcb_t **, pcb_t *);
pcb_t *dequeue_pcb(pcb_t **);
void print_queue(pcb_t **);
extern void yield(void);
