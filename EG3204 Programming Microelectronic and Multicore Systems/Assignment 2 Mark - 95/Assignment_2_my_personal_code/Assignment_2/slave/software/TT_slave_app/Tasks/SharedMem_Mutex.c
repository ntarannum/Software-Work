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

#include <altera_avalon_pio_regs.h>
#include "../Main.h"
#include "../Port.h"

#include <stdio.h>
#include <string.h>
#include "sys/alt_alarm.h"
#include "system.h"
#include "nios2.h"
#include "altera_avalon_mutex.h"
#include "altera_avalon_mutex_regs.h"

#include "SharedMem_Mutex.h"

tByte RxBuff[10];

#define MESSAGE_WAITING 1
#define NO_MESSAGE 0
#define LOCK_SUCCESS 0
#define LOCK_FAIL 1
#define MESSAGE_BUFFER_BASE MSG_BUF_RAM_BASE

// Pointer to our mutex device
alt_mutex_dev* mutex; // = NULL;

// Message buffer structure
typedef struct {
	tByte flag;
	tByte buf[10];
} message_buffer_struct;

tWord cpu_id;

message_buffer_struct *message;

/*------------------------------------------------------------------*-

  SharedMem_Init()

  - See below.

-*------------------------------------------------------------------*/
void SharedMem_Init(void)
   {

	// Get the CPU ID
	cpu_id = NIOS2_CPU_ID_VALUE;

	// Initialise the message buffer location
	message = (message_buffer_struct*)MESSAGE_BUFFER_BASE;

	// Open the real mutex to share a message buffer which is shared by TT_Core and ET_Core.
	mutex = altera_avalon_mutex_open(MSG_BUF_MUTEX_NAME);

   }

/*------------------------------------------------------------------*-

  SharedMem_Update()

  Flashes an LED (or pulses a buzzer, etc) on a specified port pin.

  Must call at twice the required flash rate: thus, for 1 Hz
  flash (on for 0.5 seconds, off for 0.5 seconds) must schedule
  at 2 Hz.

-*------------------------------------------------------------------*/
void SharedMem_Update(void)
   {

		if(message->flag == MESSAGE_WAITING)
		{
			altera_avalon_mutex_lock(mutex, cpu_id);

			RxBuff[0] = message->buf[0];
			RxBuff[1] = message->buf[1];
			RxBuff[2] = message->buf[2];
			message->flag = NO_MESSAGE;
			// Release the Mutex
			altera_avalon_mutex_unlock(mutex);
		}

		if(RxBuff[2] == 0x06) //originally RxBuff[4]
		{
			// Change the LED from OFF to ON (or vice versa)
			IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,
										IORD_ALTERA_AVALON_PIO_DATA(LED_BASE) ^ LED1_pin);
		}
   }

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
