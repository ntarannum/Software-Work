/*------------------------------------------------------------------*-
Modifications in the ET slave code by nt161:

-- changed the SCC_A_SLAVE_Process_Tick_Message(void) in the 2_50_XXg.c file
	as only 2 codes need to be sent from the master at one time in order for the system to be implemented
	so the tick message array only copies 2 codes sent from the master.
-- changed the SharedMem_Update(void) in the SharedMem_Mutex.c file
	the code doesn't work when the fifth byte of the master spican register is read, so the code was changed and only 3 positions of the 
	shared memory buffer is checked, position 0 for the slave ID
	and the next two hold the tick message data which are the codes sent from the master.



   Main.c (v1.00)

  ------------------------------------------------------------------
 
   Demonstration program for:

   Generic 16-bit auto-reload scheduler (using a full-featured 
   interval timer).

   Assumes 50 MHz clock signal (-> 50 ms tick interval).

   *** All timing is in TICKS (not milliseconds) ***


   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/

#include "../ET_TTC_Scheduler/Main.h"
#include "../ET_TTC_Scheduler/2_50_XXg.h"

#include "../ET_SPImcp2515/SPI_MCP2515.h"

#include "../ET_Tasks/SharedMem_Mutex.h"
#include "../ET_Tasks/PushButton.h"
#include "../ET_Tasks/LED_ONOFF.h"
#include "../ET_Tasks/HEARTBEAT.h"

/*----------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include "sys/alt_alarm.h"
#include "system.h"
#include "nios2.h"
#include "altera_avalon_mutex.h"
#include "../ET_TTC_Scheduler/Port.h"
#include <altera_avalon_pio_regs.h>
/* -------------------------------------------------------------- */

/* ............................................................... */
/* ............................................................... */

void alt_main(void)
   {

   // Set up the scheduler
   SCH_Init_T0();

   // Prepare for the 'Flash_LED' task
   PushButton_Init();
   LED_ONOFF_Init();
   HEARTBEAT_Init();

   // Set up for Shared Memory in dual processors
   SharedMem_Init();

   // Add the 'Flash LED' task (on for ~1000 ms, off for ~1000 ms)
   // - timings are in ticks (50 ms tick interval)
   // (Max interval / delay is 65535 ticks)
   SCH_Add_Task(SharedMem_Update, 1, 100);
   SCH_Add_Task(PushButton_Update, 2, 10);
   SCH_Add_Task(LED_ONOFF_Update, 5, 100);
   SCH_Add_Task(HEARTBEAT_Update, 0, 100);

   // Start the scheduler
   SCH_Start();

   while(1)
      {

      SCH_Dispatch_Tasks();
      }
   }

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/

