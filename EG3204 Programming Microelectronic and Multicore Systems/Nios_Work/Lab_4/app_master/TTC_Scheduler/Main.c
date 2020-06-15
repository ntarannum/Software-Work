/*------------------------------------------------------------------*-

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

#include "Main.h"
#include "2_50_XXg.h" 

#include "../SPImcp2515/SPI_MCP2515.h"

#include "../Tasks/PushButton.h"
#include "../Tasks/LED_ONOFF.h"
#include "../Tasks/HEARTBEAT.h"
#include "altera_avalon_spi.h"
#include "../SPImcp2515/alt_spi_master.h"
#include "../TTC_Scheduler/PORT.h"
#include <altera_avalon_pio_regs.h>
#include "sys/alt_stdio.h"
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

   // Add the 'Flash LED' task (on for ~1000 ms, off for ~1000 ms)
   // - timings are in ticks (50 ms tick interval)
   // (Max interval / delay is 65535 ticks)
   SCH_Add_Task(PushButton_Update, 2, 5);
   SCH_Add_Task(LED_ONOFF_Update, 5, 20);
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

