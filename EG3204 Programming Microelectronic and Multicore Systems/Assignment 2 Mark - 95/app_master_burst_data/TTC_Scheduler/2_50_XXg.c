/*------------------------------------------------------------------*-

   2_50_XXg.C (v1.00) 

  ------------------------------------------------------------------

   *** THIS IS A SCHEDULER FOR A NIOS II PROCESSOR ***

   *** Uses a full-featured interval timer peripheral ***
   *** 50 MHz clock -> 50 ms (precise) tick interval ***


   COPYRIGHT
   ---------

   This code is from the book:

   PATTERNS FOR TIME-TRIGGERED EMBEDDED SYSTEMS by Michael J. Pont 
   [Pearson Education, 2001; ISBN: 0-201-33138-1].

   This code is copyright (c) 2001 by Michael J. Pont.
 
   See book for copyright details and other information.

-*------------------------------------------------------------------*/

#include "Port.h"
#include "system.h"

#include "2_50_XXg.h"
#include "Sch51.h"
#include <sys/alt_irq.h>
#include <altera_avalon_timer_regs.h>

#include "../SPImcp2515/spi_mcp2515.h"

#include <altera_avalon_pio_regs.h>
#include "sys/alt_stdio.h"

// One byte of data (plus ID information) is sent to each Slave
extern tByte Tick_message_data_G[NUMBER_OF_SLAVES];
tByte Ack_message_data_G[NUMBER_OF_SLAVES];

// Slave IDs may be any non-zero tByte value (but all must be different)
tByte Current_Slave_IDs_G[NUMBER_OF_SLAVES] = {0};

extern tByte Sw_pressed_G;

// ------ Private constants ----------------------------------------

// Do not use ID 0x00 (used to start slaves)
static const tByte MAIN_SLAVE_IDs[NUMBER_OF_SLAVES] = {0x02}; //,0x03};
static const tByte BACKUP_SLAVE_IDs[NUMBER_OF_SLAVES] = {0x02}; //,0x03};

#define NO_NETWORK_ERROR (1)
#define NETWORK_ERROR (0)

tByte Slave_index_G = 0;
tByte First_ack_G = 1;

// ------ Private variables ----------------------------------------

static tWord Slave_reset_attempts_G[NUMBER_OF_SLAVES];




// ------ Public variable declarations -----------------------------

// The array of tasks (see Sch51.C)
extern sTask SCH_tasks_G[SCH_MAX_TASKS];

// Used to display the error code
// See Main.H for details of error codes
// See Port.H for details of the error port
extern tByte Error_code_G;

static void SCH_Update(void *);

/*------------------------------------------------------------------*-

  SCH_Init_T2()

  Scheduler initialisation function.  Prepares scheduler
  data structures and sets up timer interrupts at required rate.
  
  You must call this function before using the scheduler.  

-*------------------------------------------------------------------*/
void SCH_Init_T0(void)
   {
   tByte i;
   tByte Slave_index;

   // We allow any combination of ID numbers in slaves
   for (Slave_index = 0; Slave_index < NUMBER_OF_SLAVES; Slave_index++)
      {
      Slave_reset_attempts_G[Slave_index] = 0;
      Current_Slave_IDs_G[Slave_index] = MAIN_SLAVE_IDs[Slave_index];
      Tick_message_data_G[Slave_index] = 'C';
      }

   // Get ready to send first tick message
   First_ack_G = 1;
   Slave_index_G = 0;

   // ------ Set up the CAN link (begin) ------------------------
   MCP2515_Init();


   for (i = 0; i < SCH_MAX_TASKS; i++) 
      {
      SCH_Delete_Task(i);
      }

   // Reset the global error variable
   // - SCH_Delete_Task() will generate an error code, 
   //   (because the task array is empty)
   Error_code_G = 0;

   // Now set up the interval timer
   // The required overflow is 0.050 seconds (50 ms)
   //IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (((50 * (TIMER_0_FREQ) / 1000) - 1) >> 16) & 0xFFFF);
   //IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, ( (50 * (TIMER_0_FREQ) / 1000) - 1)        & 0xFFFF);

   IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (alt_u16) (((50000 - 1) >> 16) & 0xFFFF)); //for 1 ms
   IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, (alt_u16) ((50000 - 1)  & 0xFFFF));

   IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
		   (0x1 << ALTERA_AVALON_TIMER_CONTROL_START_OFST) | // Start
		   (0x1 << ALTERA_AVALON_TIMER_CONTROL_CONT_OFST ) | // Continuous
		   (0x1 << ALTERA_AVALON_TIMER_CONTROL_ITO_OFST  )); // Generate interrupts

   alt_ic_isr_register(0, TIMER_0_IRQ, SCH_Update, 0, 0);
   //alt_printf("S_init\r\n");
   }

/*------------------------------------------------------------------*-
  
  SCH_Start()

  Starts the scheduler, by enabling interrupts.

  NOTE: Usually called after all regular tasks are added,
  to keep the tasks synchronised.

  NOTE: ONLY THE SCHEDULER INTERRUPT SHOULD BE ENABLED!!! 
 
-*------------------------------------------------------------------*/
void SCH_Start(void) 
   {
	   tByte Num_active_slaves;
	   tLong i;
	   tByte Slave_replied_correctly;
	   tByte Slave_index, Slave_ID;

   	   for (i = 0; i <= 50000; i++);

	   // Currently disconnected from all slaves
	   Num_active_slaves = 0;

	   // After the initial (long) delay, all (operational) slaves will have timed out.
	   // All operational slaves will now be in the 'READY TO START' state
	   // Send them a 'slave id' message to get them started
	   Slave_index = 0;
	   do {

	      // Find the slave ID for this slave
	      Slave_ID = (tByte) Current_Slave_IDs_G[Slave_index];

	      Slave_replied_correctly = SCC_A_MASTER_Start_Slave(Slave_ID);

	      if (Slave_replied_correctly)
	         {
	         Num_active_slaves++;
	         Slave_index++;
	         }
	      else
	         {
	         // Slave did not reply correctly
	         // - try to switch to backup device (if available)
	         if (Current_Slave_IDs_G[Slave_index] != BACKUP_SLAVE_IDs[Slave_index])
	            {
	            // There is a backup available: switch to backup and try again
	            Current_Slave_IDs_G[Slave_index] = BACKUP_SLAVE_IDs[Slave_index];
	            }
	         else
	            {
	            // No backup available (or backup failed too) - have to continue
	            //Slave_index++;
	            }
	         }
	      } while (Slave_index < NUMBER_OF_SLAVES);

	   // DEAL WITH CASE OF MISSING SLAVE(S) HERE ...
	   if (Num_active_slaves < NUMBER_OF_SLAVES)
	      {
	      // User-defined error handling here...
	      // 1 or more slaves have not replied
	      // NOTE: In some circumstances you may wish to abort if slaves are missing
	      // - or reconfigure the network.

	      // Simplest solution is to display an error and carry on
	      // (this is what we do here)
	      Error_code_G = ERROR_SCH_ONE_OR_MORE_SLAVES_DID_NOT_START;
	      }
	   else
	      {
	      Error_code_G = 0;
	      }


	alt_irq_cpu_enable_interrupts();
	//alt_printf("S_start\r\n");
   }

/*------------------------------------------------------------------*-

  SCH_Update

  This is the scheduler ISR.  It is called at a rate 
  determined by the timer settings in SCH_Init().
  This version is triggered by the interval timer interrupts:
  the timer is automatically reloaded.

-*------------------------------------------------------------------*/
void SCH_Update(void * context)
   {
   tByte Index;
   tByte Previous_slave_index;
//   tByte Slave_replied_correctly;


   IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE,
		   IORD_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE) &
		   ~ALTERA_AVALON_TIMER_STATUS_TO_MSK); // Clear TO (timeout)
 

   // Keep track of the current slave
   Previous_slave_index = Slave_index_G;   // First value of prev slave is 0...

   if (++Slave_index_G >= NUMBER_OF_SLAVES)
      {
      Slave_index_G = 0;
      }
/*
   // Check that the appropriate slave responded to the previous message:
   // (if it did, store the data sent by this slave)
   if (SCC_A_MASTER_Process_Ack(Previous_slave_index) == RETURN_ERROR)
      {
      // Try to connect to the slave
      Slave_replied_correctly = SCC_A_MASTER_Start_Slave(Current_Slave_IDs_G[Slave_index_G]);

      if (Slave_replied_correctly == 0)
         {
         // No backup available (or backup failed too) - we shut down
         // OTHER BEHAVIOUR MAY BE MORE APPROPRIATE IN YOUR APPLICATION
//         SCC_A_MASTER_Shut_Down_the_Network();
         }
      }
*/

   SCC_A_MASTER_Process_Ack(Previous_slave_index);

   // Send 'tick' message to all connected slaves
   // (sends one data byte to the current slave)
   SCC_A_MASTER_Send_Tick_Message(Slave_index_G);

   // NOTE: calculations are in *TICKS* (not milliseconds)
   for (Index = 0; Index < SCH_MAX_TASKS; Index++)
      {
      // Check if there is a task at this location
      if (SCH_tasks_G[Index].pTask)
         {
         if (SCH_tasks_G[Index].Delay == 0)
            {
            // The task is due to run
            SCH_tasks_G[Index].RunMe = 1;  // Set the run flag

            if (SCH_tasks_G[Index].Period)
               {
               // Schedule periodic tasks to run again
               SCH_tasks_G[Index].Delay = SCH_tasks_G[Index].Period;
               }
            }
         else
            {
            // Not yet ready to run: just decrement the delay 
            SCH_tasks_G[Index].Delay -= 1;
            }
         }         
      }
   //alt_printf("S_update\r\n");
   }

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/


/*------------------------------------------------------------------*-

  SCC_A_MASTER_Send_Tick_Message()

  This function sends a tick message, over the CAN network.
  The receipt of this message will cause an interrupt to be generated
  in the slave(s): this invoke the scheduler 'update' function
  in the slave(s).

-*------------------------------------------------------------------*/
void SCC_A_MASTER_Send_Tick_Message(const tByte SLAVE_INDEX)
   {

	   // Find the slave ID for this slave
	   // ALL SLAVES MUST HAVE A UNIQUE (non-zero) ID
	   tByte Slave_ID = (tByte) Current_Slave_IDs_G[SLAVE_INDEX];

	   // First byte of message must be slave ID
	   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm0) , Slave_ID);

	   if(Sw_pressed_G==1)
	   {
	   // Now the data
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm1) , 0x03);
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm2) , 0x04);
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm3) , 0x05);
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm4) , 0x06);
	   }
	   else
	   {
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm1) , 0);
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm2) , 0);
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm3) , 0);
		   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm4) , 0);
	   }
	   /* Send RTS_TXB0_INSTRUCTION Instruction */
	   MCP2515_RTS_TXB_Instruction_CMD(RTS_INSTRUCTION_TXB0 );


   }

/*------------------------------------------------------------------*-

  SCC_A_MASTER_Start_Slave()

  Try to connect to a slave device.

-*------------------------------------------------------------------*/
tByte SCC_A_MASTER_Start_Slave(const tByte SLAVE_ID)
   {
   tWord i;

   tByte Slave_replied_correctly = 0;

   tByte Ack_ID, Ack_00;

   // Prepare a 'Slave ID' message
   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm0) , 0x00); // Not a valid slave ID
   MCP2515_Write_Register(TXBnDm(TXBnDm0,TXBnDm1) , SLAVE_ID);

   /* Send RTS_TXB0_INSTRUCTION Instruction */
   MCP2515_RTS_TXB_Instruction_CMD(RTS_INSTRUCTION_TXB0 );


   /*SPI_DataOut = (RTS_BUFFER0_INSTRUCTION << 8) | 0x01;
   IOWR_ALTERA_AVALON_PIO_DATA(SPI_DataOut_BASE, SPI_DataOut);
   IOWR_ALTERA_AVALON_PIO_DATA(SPI_DataOut_BASE, 0);
   while(IORD_ALTERA_AVALON_PIO_DATA(SPI_Ack_BASE) == 0);
   for (i = 0; i <= 2; i++);*/
   //---

   // Wait to give slave time to reply
    for (i = 0; i <= 3000; i++);


   // Check we had a reply
   if ((MCP2515_Read_Register(CANINTF) & 0x02) != 0)       //0x02 !=0
      {
      // An ack message was received - extract the data
      Ack_00 = MCP2515_Read_Register(RXBnDm(RXBnDm1,RXBnDm0));  // Get data byte 0
      Ack_ID = MCP2515_Read_Register(RXBnDm(RXBnDm1,RXBnDm1));  // Get data byte 1

      // Clear *ALL* flags
      MCP2515_Write_Register(CANINTF, 0x00);

      if ((Ack_00 == 0x00) && (Ack_ID == SLAVE_ID))
         {
         Slave_replied_correctly = 1;
       }
      }

   return Slave_replied_correctly;
   }


/*------------------------------------------------------------------*-

  SCC_A_MASTER_Process_Ack()

  Make sure the slave (SLAVE_ID) has acknowledged the previous
  message that was sent.  If it has, extract the message data
  from the USART hardware: if not, call the appropriate error
  handler.

  PARAMS:   The index of the slave.

  RETURNS:  RETURN_NORMAL - Ack received (data in Ack_message_data_G)
            RETURN_ERROR  - No ack received (-> no data)

-*------------------------------------------------------------------*/

tByte SCC_A_MASTER_Process_Ack(const tByte SLAVE_INDEX)
   {
	   tByte Ack_ID, Slave_ID;

	   // First time this is called there is no Ack message to check
	   // - we *assume* everything is OK
	   if (First_ack_G)
	      {
	      First_ack_G = 0;
	      return RETURN_NORMAL;
	      }

	   if ((MCP2515_Read_Register(CANINTF) & 0x02) != 0)     //&0x02 originally
	      {
	      // An ack message was received
	      //
	      // Extract the data
	      // Get data byte 0 (Slave ID)
	      Ack_ID = MCP2515_Read_Register(RXBnDm(RXBnDm1,RXBnDm0));

	      Ack_message_data_G[SLAVE_INDEX] = MCP2515_Read_Register(RXBnDm(RXBnDm1,RXBnDm1));

	      // Clear *ALL* flags ...
	      MCP2515_Write_Register(CANINTF, 0x00);

	      // Find the slave ID for this slave
	      Slave_ID = (tByte) Current_Slave_IDs_G[SLAVE_INDEX];

	      if (Ack_ID == Slave_ID)
	         {
	         return RETURN_NORMAL;
	         }
	      }

	   // No message, or ID incorrect
	   return RETURN_ERROR;
   }
