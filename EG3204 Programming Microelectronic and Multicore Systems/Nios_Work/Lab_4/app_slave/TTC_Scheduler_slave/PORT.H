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
#define LED_BASE 		(PIO_0_BASE)
#define LED0_pin 		(0x01 << 0)
#define LED1_pin 		(0x01 << 1)
#define LED3_pin 		(0x01 << 3)


#define MCP2551_int_n   (PIO_2_BASE)



#define KEY_0_BASE 		(PIO_4_BASE)
#define KEY0_MASK 		(0x01 << 0)
#define KEY0_pin 		(0)

#define KEY_1_BASE 		(PIO_5_BASE)
#define KEY1_MASK 		(0x01 << 0)
#define KEY1_pin 		(0)

#define TEST_1_BASE 	(PIO_1_BASE)
#define TEST1_pin 		(0x01 << 0)
#define TEST2_pin 		(0x01 << 1)
#define TEST3_pin 		(0x01 << 2)
/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
#endif


