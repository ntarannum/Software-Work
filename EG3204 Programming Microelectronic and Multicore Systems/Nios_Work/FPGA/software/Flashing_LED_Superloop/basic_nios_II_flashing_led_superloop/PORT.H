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

// Connect LED from GND to this pin, via appropriate resistor
// [see Chapter 7 for details]
#define LED_BASE (PIO_0_BASE)
#define LED_pin (0x01 << 3)

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/



