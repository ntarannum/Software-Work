/*------------------------------------------------------------------*-
Modifications in the master code by nt161:

-- in the spi_mcp2515.c file the MCP2515_Init(void) was altered and the number of data bytes was changed to 0x03 ----> MCP2515_Write_Register(TXB0DLC, 0x03);
   as the master will only send 3 bytes at most in every tick message, byte one being the slave ID and the other two bytes are codes for operating the LEDs on
   the slaves.
-- included the pushbutton.h file in the 2_50_XXg.c file in order to send messages to the slave if the push button was pressed
   this if statement was implemented in the SCC_A_MASTER_Send_Tick_Message(const tByte SLAVE_INDEX) function in the same file.
-- only two codes are sent to the slave if the push button on the master are pressed, one is 0x06 which turns on LED 5 on the 
   TT core and 0x03 which turns on LED 0 on the ET core
-- however, if the pushbutton is not pressed a message of 0x43, (as this value is used in the pushbutton.c file, well the ASCII character 'C' is used) 
   is sent to the slave


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

