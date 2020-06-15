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
#define TIMER_0_BASE     TT_TIMER_1_BASE
#define TIMER_0_IRQ      TT_TIMER_1_IRQ
#define TIMER_0_FREQ     TT_TIMER_1_FREQ

#define LED_BASE (TT_LEDS_BASE)
#define LED0_pin (0x01 << 0)
#define LED1_pin (0x01 << 1)
#define LED2_pin (0x01 << 2)
#define LED3_pin (0x01 << 3)



#define KEY_BASE (TT_PB_1_BASE)


/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/



