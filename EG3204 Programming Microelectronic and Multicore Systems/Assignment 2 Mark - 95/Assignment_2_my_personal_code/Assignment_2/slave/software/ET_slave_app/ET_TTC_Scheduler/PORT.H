/*------------------------------------------------------------------*-

   Port.H (v1.00)

  ------------------------------------------------------------------

  'Port Header' (see Chap 10) for the project S_DELAY (see Chap 11)


   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/

// ------ LED_Flas.C -----------------------------------------------

#ifndef _PORT_H
#define _PORT_H

// Connect LED from GND to this pin, via appropriate resistor
// [see Chapter 7 for details]
#define LED_BASE1 (ET_LEDS1_BASE)
#define LED_BASE2 (ET_LEDS2_BASE)
#define LED0_pin (0x01 << 0)
#define LED1_pin (0x01 << 1)




#define KEY0_BASE (ET_PB_1_BASE)
#define KEY1_BASE (ET_PB_2_BASE)

#define TEST0_PORT PIO_0_BASE
#define TEST0_pin (0x01 << 0)

#define MCP2551_int_n (ET_SPICAN_INT_BASE)          // 1-bit Input

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
#endif


