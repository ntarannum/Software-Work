/*------------------------------------------------------------------*-

   2_50_XXg.C (v1.00) 

  ------------------------------------------------------------------

   *** THIS IS A SCHEDULER FOR A NIOS II PROCESSOR ***

   *** Uses a full-featured interval timer peripheral ***
   *** 50 MHz clock -> 50 ms (precise) tick interval ***


   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/

#include "2_50_XXg.h"
#include "Sch51.h"
#include <sys/alt_irq.h>
#include <altera_avalon_timer_regs.h>

// ------ Public variable declarations -----------------------------

// The array of tasks (see Sch51.C)
extern sTask SCH_tasks_G[SCH_MAX_TASKS];

// Used to display the error code
// See Main.H for details of error codes
// See Port.H for details of the error port
extern tByte Error_code_G;

static void SCH_Update(void *);

/*------------------------------------------------------------------*-

  SCH_Init_T2()

  Scheduler initialisation function.  Prepares scheduler
  data structures and sets up timer interrupts at required rate.
  
  You must call this function before using the scheduler.  

-*------------------------------------------------------------------*/
void SCH_Init_T0(void)
   {
   tByte i;

   for (i = 0; i < SCH_MAX_TASKS; i++) 
      {
      SCH_Delete_Task(i);
      }

   // Reset the global error variable
   // - SCH_Delete_Task() will generate an error code, 
   //   (because the task array is empty)
   Error_code_G = 0;

   // Now set up the interval timer
   // The required overflow is 0.050 seconds (50 ms)
   IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (((50 * (TIMER_0_FREQ) / 1000) - 1) >> 16) & 0xFFFF);
   IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, ( (50 * (TIMER_0_FREQ) / 1000) - 1)        & 0xFFFF);

   IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
		   (0x1 << ALTERA_AVALON_TIMER_CONTROL_START_OFST) | // Start
		   (0x1 << ALTERA_AVALON_TIMER_CONTROL_CONT_OFST ) | // Continuous
		   (0x1 << ALTERA_AVALON_TIMER_CONTROL_ITO_OFST  )); // Generate interrupts

   alt_ic_isr_register(0, TIMER_0_IRQ, SCH_Update, 0, 0);
   }

/*------------------------------------------------------------------*-
  
  SCH_Start()

  Starts the scheduler, by enabling interrupts.

  NOTE: Usually called after all regular tasks are added,
  to keep the tasks synchronised.

  NOTE: ONLY THE SCHEDULER INTERRUPT SHOULD BE ENABLED!!! 
 
-*------------------------------------------------------------------*/
void SCH_Start(void) 
   {
	alt_irq_cpu_enable_interrupts();
   }

/*------------------------------------------------------------------*-

  SCH_Update

  This is the scheduler ISR.  It is called at a rate 
  determined by the timer settings in SCH_Init().
  This version is triggered by the interval timer interrupts:
  the timer is automatically reloaded.

-*------------------------------------------------------------------*/
void SCH_Update(void * context)
   {
   tByte Index;

   IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE,
		   IORD_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE) &
		   ~ALTERA_AVALON_TIMER_STATUS_TO_MSK); // Clear TO (timeout)
 
   // NOTE: calculations are in *TICKS* (not milliseconds)
   for (Index = 0; Index < SCH_MAX_TASKS; Index++)
      {
      // Check if there is a task at this location
      if (SCH_tasks_G[Index].pTask)
         {
         if (SCH_tasks_G[Index].Delay == 0)
            {
            // The task is due to run
            SCH_tasks_G[Index].RunMe = 1;  // Set the run flag

            if (SCH_tasks_G[Index].Period)
               {
               // Schedule periodic tasks to run again
               SCH_tasks_G[Index].Delay = SCH_tasks_G[Index].Period;
               }
            }
         else
            {
            // Not yet ready to run: just decrement the delay 
            SCH_tasks_G[Index].Delay -= 1;
            }
         }         
      }
   }   


/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
