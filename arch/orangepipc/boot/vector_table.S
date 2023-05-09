.section ".int_vector"
.align 4

.global __start
__start:

ldr pc, reset_vector	   @ reset
ldr pc, undefined_vector   @ undefined instruction  
ldr pc, syscall_vector	   @ supervisor call       
ldr pc, prefetch_vector	   @ prefetch abort	   
ldr pc, data_vector 	   @ data abort		   
ldr pc, hyp_vector 	   @ hyp mode entry	   
ldr pc, irq_vector	   @ IRQ interrupt	   
ldr pc, fiq_vector 	   @ FIQ interrupt 	   

reset_vector: 	  .word reset_handler
undefined_vector: .word undefined_handler
syscall_vector:   .word syscall_handler
prefetch_vector:  .word 0 @ prefetch_handler
data_vector:	  .word data_handler
hyp_vector:	  .word 0 @ hyp_handler
irq_vector:	  .word irq_interrupt
fiq_vector:	  .word fiq_handler

