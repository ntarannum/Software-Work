/*------------------------------------------------------------------*-

  ttc_scheduler_o.c (2013-07-07)

-*------------------------------------------------------------------*/

/*------------------------------------------------------------------*-

  This code is copyright (c) 2001-2013 Michael J. Pont ("the author").

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

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS
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

// Project header
#include "../main/main.h"
// Port header
#include "../port/port.h"

#include "ttc_scheduler_o.h"

// ------ Public variable definitions ------------------------------

// Used to report errors, if required, using Heartbeat LED
// See heartbeat.c (if used) for basic error-reporting mechanism
// See ttc_scheduler.h for details of error codes
// See port.h for details of the error port
uint32_t Error_code_G;

// ------ Private variable definitions -----------------------------

// The array of tasks
// Check array size in scheduler header file
sTask SCH_tasks_G[SCH_MAX_TASKS];

// The current tick count
static uint32_t Tick_count_G = 0;

// Flag indicating whether any task is running
static uint32_t Task_running_G = 0;

// ------ Private function prototypes ------------------------------

static void SCH_Go_To_Sleep(void);

/*------------------------------------------------------------------*-

  SCH_Init()

  Scheduler initialisation function.  Prepares scheduler
  data structures and sets up timer interrupts every 1 ms.

  You must call this function before using the scheduler.  

  Note: We assume that the processor clock is 100 MHz:
  see System_Init() for details of this configuration.

-*------------------------------------------------------------------*/
void SCH_Init(void)
   {
   uint32_t i;

   for (i = 0; i < SCH_MAX_TASKS; i++) 
      {
      SCH_Delete_Task(i);
      }

   // Reset the global error variable
   // - SCH_Delete_Task() will generate an error code, 
   //   (because the task array is empty)
   Error_code_G = 0;  

   // Using CMSIS
   //
   // Must check board oscillator frequency, etc
   // - see "system_lpc17xx.c" (in linked CMSIS project)
   //
   // *If* these values have been set correctly for your hardware
   // SystemCoreClock gives the system operating frequency (in Hz)
   if (SystemCoreClock != Required_SystemCoreClock)
      {
	  // Error codes are listed in scheduler header file
	  Error_code_G = ERROR_SCH_INCORRECT_CORE_FREQUENCY;
      }

   // Now to set up SysTick timer for 1 ms "ticks"
   if (SysTick_Config(SystemCoreClock / 1000))
      {
	  // Fatal error
	  // Cannot - for some reason - set required tick rate
	  // (not much we can do if the oscillator is not running correctly)
	  //
	  // In most cases, this will force a WDT reset, followed by
	  // "fail silent" behaviour.
	  //
	  // If the WDT is not enabled, the system will simply
	  // "pause" in the reset state.
	  while(1);
      }

   // NOTE: TT design.
   // There should only be one interrupt enabled
   // - not setting interrupt priorities
   }

/*------------------------------------------------------------------*-

  SCH_Start()

  Starts the scheduler, by enabling SysTick interrupt.

  NOTE: Usually called after all regular tasks are added,
  to keep the tasks synchronised.

  NOTE: ONLY THE SCHEDULER INTERRUPT SHOULD BE ENABLED!!! 

-*------------------------------------------------------------------*/
void SCH_Start(void) 
   {
   // Enable SysTick timer
   SysTick->CTRL |= 0x01;

   // Enable SysTick exception request
   SysTick->CTRL |= 0x02;
   }


/*------------------------------------------------------------------*-

  SysTick_Handler()

  [Function name determined by CMIS standard.]

  This is the scheduler ISR.  It is called at a rate 
  determined by the timer settings in the SCH_Init() function.

-*------------------------------------------------------------------*/
void SysTick_Handler(void)
   {
   // Increment tick count (only)
   Tick_count_G++;

   // As this is a TTC scheduler, we don't usually expect
   // to have a task running when the timer ISR is called
   if (Task_running_G == 1)
      {
	  // Simple error reporting via heartbeat / error LED.
	  // (This value is *not* reset.)
	  Error_code_G = ERROR_SCH_SYSTEM_OVERLOAD;
	  }
   }  

/*------------------------------------------------------------------*-

  SCH_Dispatch_Tasks()

  This is the 'dispatcher' function.  When a task (function)
  is due to run, SCH_Dispatch_Tasks() will run it.
  This function must be called (repeatedly) from the main loop.

-*------------------------------------------------------------------*/
void SCH_Dispatch_Tasks(void) 
   {
   uint32_t Index;
   uint32_t Update_required = 0;

   // Need to check for a timer interrupt since this
   // function was last executed (in case idle mode is not being used)

   // Disable timer interrupt
   // NOTE: *all* interrupts disabled (but this is a TT design)
   __disable_irq();
   
   if (Tick_count_G > 0)
      {
      Tick_count_G--;
      Update_required = 1;
      }
 
   // Re-enable timer interrupts
   __enable_irq();

   while (Update_required)
      {
     // Go through the task array
      for (Index = 0; Index < SCH_MAX_TASKS; Index++)
         {
         // Check if there is a task at this location
         if (SCH_tasks_G[Index].pTask)
            {
            if (--SCH_tasks_G[Index].Delay == 0)
               {
               // The task is due to run

               // Set "Task_running" flag
               __disable_irq();
               Task_running_G = 1;
               __enable_irq();

               (*SCH_tasks_G[Index].pTask)();  // Run the task

               // Clear "Task_running" flag
               __disable_irq();
               Task_running_G = 0;
               __enable_irq();

               if (SCH_tasks_G[Index].Period != 0)
                  {
                  // Schedule period tasks to run again
                  SCH_tasks_G[Index].Delay = SCH_tasks_G[Index].Period;
                  }
               else
                  {
                  // Delete one-shot tasks
                  SCH_tasks_G[Index].pTask  = 0;
                  }
               }
            }         
         } 

      // Disable timer interrupt
      __disable_irq();
   
      if (Tick_count_G > 0)
         {
         Tick_count_G--;
         Update_required = 1;
         }
      else
         {
         Update_required = 0;
         }
 
     // Re-enable timer interrupts
     __enable_irq();
     }

   // The scheduler may enter idle mode at this point (if used) 
   SCH_Go_To_Sleep();        
   }

/*------------------------------------------------------------------*-

  SCH_Add_Task()

  Causes a task (function) to be executed at regular intervals 
  or after a user-defined delay

  Fn_P   - The name of the function which is to be scheduled.
           NOTE: All scheduled functions must be 'void, void' -
           that is, they must take no parameters, and have 
           a void return type. 
                   
  DELAY  - The interval (TICKS) before the task is first executed

  PERIOD - If 'PERIOD' is 0, the function is only called once,
           at the time determined by 'DELAY'.  If PERIOD is non-zero,
           then the function is called repeatedly at an interval
           determined by the value of PERIOD (see below for examples
           which should help clarify this).

  RETURN VALUE:  

  Returns the position in the task array at which the task has been 
  added.  If the return value is SCH_MAX_TASKS then the task could 
  not be added to the array (there was insufficient space).  If the
  return value is < SCH_MAX_TASKS, then the task was added 
  successfully.  

  Note: this return value may be required, if a task is
  to be subsequently deleted - see SCH_Delete_Task().

  EXAMPLES:

  Task_ID = SCH_Add_Task(Do_X,1000,0);
  Causes the function Do_X() to be executed once after 1000 sch ticks.            

  Task_ID = SCH_Add_Task(Do_X,0,1000);
  Causes the function Do_X() to be executed regularly, every 1000 sch ticks.            

  Task_ID = SCH_Add_Task(Do_X,300,1000);
  Causes the function Do_X() to be executed regularly, every 1000 ticks.
  Task will be first executed at T = 300 ticks, then 1300, 2300, etc.            
 
-*------------------------------------------------------------------*/
uint32_t SCH_Add_Task(void (* pFunction)(), 
                      const uint32_t DELAY,
                      const uint32_t PERIOD)
   {
   uint32_t Index = 0;
   
   // First find a gap in the array (if there is one)
   while ((SCH_tasks_G[Index].pTask != 0) && (Index < SCH_MAX_TASKS))
      {
      Index++;
      } 
   
   // Have we reached the end of the list?   
   if (Index == SCH_MAX_TASKS)
      {
      // Task list is full
      //
      // Set the global error variable
      Error_code_G = ERROR_SCH_TOO_MANY_TASKS;

      // Also return an error code
      return SCH_MAX_TASKS;  
      }
      
   // If we're here, there is a space in the task array
   SCH_tasks_G[Index].pTask  = pFunction;
     
   SCH_tasks_G[Index].Delay  = DELAY + 1;
   SCH_tasks_G[Index].Period = PERIOD;

   return Index; // return position of task (to allow later deletion)
   }


/*------------------------------------------------------------------*-

  SCH_Delete_Task()

  Removes a task from the scheduler.  Note that this does
  *not* delete the associated function from memory: 
  it simply means that it is no longer called by the scheduler. 
 
  TASK_INDEX - The task index.  Provided by SCH_Add_Task(). 

  RETURN VALUE:  RETURN_ERROR or RETURN_NORMAL

-*------------------------------------------------------------------*/
uint32_t SCH_Delete_Task(const uint32_t TASK_INDEX) 
   {
   uint32_t Return_code;

   if (SCH_tasks_G[TASK_INDEX].pTask == 0)
      {
      // No task at this location...
      //
      // Set the global error variable
      Error_code_G = ERROR_SCH_CANNOT_DELETE_TASK;

      // ...also return an error code
      Return_code = RETURN_ERROR;
      }
   else
      {
      Return_code = RETURN_NORMAL;
      }      
   
   SCH_tasks_G[TASK_INDEX].pTask   = 0x0000;
   SCH_tasks_G[TASK_INDEX].Delay   = 0;
   SCH_tasks_G[TASK_INDEX].Period  = 0;

   SCH_tasks_G[TASK_INDEX].RunMe   = 0;

   return Return_code;       // return status
   }


/*------------------------------------------------------------------*-

  SCH_Go_To_Sleep()

  This scheduler enters 'sleep mode' between clock ticks
  to save power.  The next clock tick will return the processor
  to the normal operating state.

  Note: a slight performance improvement is possible if this
  function is implemented as a macro, or if the code here is simply 
  pasted into the 'dispatch' function (but at the cost of code
  readability).

  *** Various power-saving options can be added
  *** (e.g. shut down unused peripherals)

-*------------------------------------------------------------------*/
void SCH_Go_To_Sleep()
   {
   // Enter sleep mode = "Wait For Interrupt"
   __WFI();
   }

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
