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
#include "../ET_TTC_Scheduler/Main.h"
#include "../ET_TTC_Scheduler/PORT.h"

#include "system.h"

#include "../ET_Tasks/PushButton.h"


// ------ Public variable definitions ------------------------------

unsigned int Sw_pressed_G = 0; // The current switch status
tByte Ack_message_data_G;

// ------ Private constants ----------------------------------------

// Allows NO or NC switch to be used (or other wiring variations)
#define SW_PRESSED (0)

// SW_THRES must be > 1 for correct debounce behaviour
#define SW_THRES (3)


// ------ Private variable definitions ------------------------------

static unsigned char pb0_input = 0;

/*------------------------------------------------------------------*-

  PushButton_Init()

  - See below.

-*------------------------------------------------------------------*/
void PushButton_Init(void)
   {
   // Do nothing
   }


/*------------------------------------------------------------------*-

  LED_Flash_Update()

-*------------------------------------------------------------------*/
void PushButton_Update(void)
   {
   // Change the LED from OFF to ON (or vice versa)
//   IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,
//         IORD_ALTERA_AVALON_PIO_DATA(LED_BASE) ^ LED_pin);
		 
   static unsigned int Duration;

   // Read "reset count" switch input (pb0)
   pb0_input = IORD_ALTERA_AVALON_PIO_DATA(KEY0_BASE);
   
   if (pb0_input == SW_PRESSED)
      {
      Duration += 1;

      if (Duration > SW_THRES)
         {
         Duration = SW_THRES;

         Sw_pressed_G = 1;  // Switch is pressed...
         Ack_message_data_G = 0xAA;
         return;
         }

      // Switch pressed, but not yet for long enough
      Sw_pressed_G = 0;
      Ack_message_data_G = 'C';
      return; 
      }
    
   // Switch not pressed - reset the count
   Duration = 0;
   Sw_pressed_G = 0;  // Switch not pressed...
   Ack_message_data_G = 'C';
		 
   }

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
