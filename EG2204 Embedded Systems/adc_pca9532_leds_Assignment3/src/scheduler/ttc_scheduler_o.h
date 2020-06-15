/*------------------------------------------------------------------*-
  
   ttc_scheduler_o.h (2013-07-07)

  ------------------------------------------------------------------

   See ttc_scheduler_o.c for details.

-*------------------------------------------------------------------*/

/*------------------------------------------------------------------*-

  This code is intended SOLELY for use in training courses (during
  which participants examine and complete the code presented here).
  The projects is not complete and the code is not suitable for use
  in production or prototype systems.

  Subject to the above conditions, redistribution and use of this
  software - in source or binary form, with or without modification
  - is permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright 
     notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above 
     copyright notice, this list of conditions and the following 
     disclaimer in the documentation and/or other materials provided 
     with the distribution.
  3. The name of the author may not be used to endorse or promote 
     products derived from this software without specific prior 
     written permission.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR �AS IS� AND ANY EXPRESS 
  OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
  ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY 
  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-*------------------------------------------------------------------*/

#ifndef _TTC_SCHEDULER_H
#define _TTC_SCHEDULER_H 1

#include "../main/main.h"

// ------ Public data type declarations ----------------------------

// User-define type to store required data for each task
typedef struct 
   {
   // Pointer to the task (must be a 'void (void)' function)
   void (*pTask) (void);  

   // Delay (ticks) until the task will (next) be run
   // - see SCH_Add_Task() for further details
   uint32_t Delay;       

   // Interval (ticks) between subsequent runs.
   // - see SCH_Add_Task() for further details
   uint32_t Period;       

   // Incremented (by scheduler) when task is due to execute
   uint32_t RunMe;
   } sTask; 

// ------ Public function prototypes -------------------------------

void     SCH_Init(void);
void     SCH_Start(void);
void     SCH_Dispatch_Tasks(void);
uint32_t SCH_Add_Task(void (*) (void), const uint32_t, const uint32_t);
uint32_t SCH_Delete_Task(const uint32_t);

// ------ Public constants -----------------------------------------

// The maximum number of tasks required at any one time
// during the execution of the program
//
// MUST BE ADJUSTED FOR EACH NEW PROJECT
#define SCH_MAX_TASKS   (10)


//------------------------------------------------------------------
// Error codes for scheduler
//------------------------------------------------------------------

#define ERROR_SCH_TOO_MANY_TASKS (1)
#define ERROR_SCH_CANNOT_DELETE_TASK (2)
#define ERROR_SCH_INCORRECT_CORE_FREQUENCY (3)
#define ERROR_SCH_SYSTEM_OVERLOAD (4)
 
#endif

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
