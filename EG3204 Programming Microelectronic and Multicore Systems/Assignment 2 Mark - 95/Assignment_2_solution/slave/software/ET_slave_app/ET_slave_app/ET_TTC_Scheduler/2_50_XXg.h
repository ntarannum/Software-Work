/*------------------------------------------------------------------*-
  
   2_50_XXg.h (v1.00) 

  ------------------------------------------------------------------

   - see 2_50_XXg.C for details


   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/

#include "Main.h"
#include "SCH51.H"

// Each slave (and backup) must have a unique (non-zero) ID
#define SLAVE_ID 0x02

// ------ Public function prototypes -------------------------------

void SCH_Init_T0(void);
void SCH_Start(void);

tByte SCC_A_SLAVE_Process_Tick_Message();
void SCC_A_SLAVE_Send_Ack_Message_To_Master();
/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/

