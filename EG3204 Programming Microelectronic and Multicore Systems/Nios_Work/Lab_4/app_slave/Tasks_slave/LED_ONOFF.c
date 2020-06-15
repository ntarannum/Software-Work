/*------------------------------------------------------------------*-

   LED_flas.C (v1.00)

  ------------------------------------------------------------------
   
   Simple 'Flash LED' test function.


   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/

//#include <altera_avalon_performance_counter.h>
#include <altera_avalon_pio_regs.h>
#include "../TTC_Scheduler_slave/Main.h"
#include "../TTC_Scheduler_slave/PORT.h"

#include "system.h"

#include "../SPImcp2515_slave/SPI_MCP2515.h"
#include "LED_ONOFF.h"

//extern tByte Sw_pressed_G;
extern tByte Tick_message_data_G;
/*------------------------------------------------------------------*-

  LED_Flash_Init()

  - See below.

-*------------------------------------------------------------------*/
void LED_ONOFF_Init(void)
   {
   // Do nothing
   }


/*------------------------------------------------------------------*-

  LED_Flash_Update()

  Flashes an LED (or pulses a buzzer, etc) on a specified port pin.

  Must call at twice the required flash rate: thus, for 1 Hz
  flash (on for 0.5 seconds, off for 0.5 seconds) must schedule
  at 2 Hz.

-*------------------------------------------------------------------*/
void LED_ONOFF_Update(void)
   {
   
	if (Tick_message_data_G == 0xAA) //Sw_pressed_G == 1)
		{
		// Change the LED from OFF to ON (or vice versa)
		IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,
									IORD_ALTERA_AVALON_PIO_DATA(LED_BASE) ^ LED0_pin);
		}
	else
	{
		// Change the LED from OFF to ON (or vice versa)
		IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 0);
	}

   }
/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
