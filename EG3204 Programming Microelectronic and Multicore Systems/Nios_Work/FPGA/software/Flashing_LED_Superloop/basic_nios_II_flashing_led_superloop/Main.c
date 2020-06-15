/*------------------------------------------------------------------*-

   Main.C (v1.00)

  ------------------------------------------------------------------

   Simple test program for SOFTWARE DELAY pattern.

     
   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/


#include "Main.h"
#include "Loop_Del.h"
#include "LED_Flas.h"

int main(void)
   {
   LED_Flash_Init();

   while (1)
      {
      LED_Flash_Update();
      Loop_Delay(1000);
      }

   return 0;
   }

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
