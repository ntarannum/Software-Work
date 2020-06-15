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

#include <altera_avalon_pio_regs.h>
#include "2_50_XXg.h"
#include "Sch51.h"
#include <sys/alt_irq.h>


#include "../ET_SPImcp2515/spi_mcp2515.h"
#include "system.h"
#include "../ET_TTC_Scheduler/Main.h"
#include "../ET_TTC_Scheduler/PORT.h"


// ------ Public variable declarations -----------------------------
tByte Tick_message_data_G[4];

// Data sent from this slave to the master
// - data may be sent on, by the master, to another slave
extern tByte Ack_message_data_G;

/* A variable to hold the value of the button pio edge capture register. */
int context=0;
volatile int edge_capture;

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

	//--- CAN initialisation ---//
	MCP2515_Init();

	for (i = 0; i < SCH_MAX_TASKS; i++)
	{
		SCH_Delete_Task(i);
	}

	// Reset the global error variable
	// - SCH_Delete_Task() will generate an error code,
	//   (because the task array is empty)
	Error_code_G = 0;

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(MCP2551_int_n, 1);  //PIO_2_BASE for CAN Slave Interrupt
	alt_ic_isr_register(0, ET_SPICAN_INT_IRQ, SCH_Update, (void*)&edge_capture, 0);
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

	tByte Tick_00, Tick_ID;
	tByte Start_slave;
	tByte CAN_interrupt_flag;

	// We can be at this point because:
	// 1. The network has just been powered up
	// 2. An error has occurred in the Master, and it is not generating ticks
	// 3. The network has been damaged and no ticks are being received by this slave
	//
	Start_slave = 0;
	SCH_Report_Status(); // Sch not yet running - do this manually

	// Now wait (indefinitely) for appropriate signal from the master
	do {
		// Wait for CAN message to be received
		do {
			CAN_interrupt_flag = MCP2515_Read_Register(CANINTF);
		} while ((CAN_interrupt_flag & 0x02) == 0);

		// Get the first two data bytes
		Tick_00 = MCP2515_Read_Register(RXBnDm(1,0)); // Get data byte 0, Buffer 1
		Tick_ID = MCP2515_Read_Register(RXBnDm(1,1)); // Get data byte 1, Buffer 1

		// We simply clear *ALL* flags here...
		MCP2515_Write_Register(CANINTF, 0x00);

		if ((Tick_00 == 0x00) && (Tick_ID == SLAVE_ID))
		{
			// Message is correct
			Start_slave = 1;

			// Prepare Ack message for transmission to Master
			MCP2515_Write_Register(TXBnDm(0,0) , 0x00);      // Set data byte 0 (always 0x00)
			MCP2515_Write_Register(TXBnDm(0,1) , SLAVE_ID);  // Slave ID

			/* Send RTS_TXB0_INSTRUCTION Instruction */
			MCP2515_RTS_TXB_Instruction_CMD(RTS_INSTRUCTION_TXB0 );

		}
		else
		{
			// Not yet received correct message - wait
			Start_slave = 0;
		}
	} while (!Start_slave);

	alt_irq_cpu_enable_interrupts();
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



	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(MCP2551_int_n, 0);
	/* Cast context to edge_capture's type. It is important that this be
	 * declared volatile to avoid unwanted compiler optimization.
	 */
	volatile int* edge_capture_ptr = (volatile int*) context;
	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(MCP2551_int_n);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(MCP2551_int_n,0);
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(MCP2551_int_n,1);


	// Check tick data - send ack if necessary
	// NOTE: 'START' message will only be sent after a 'time out'
	if (SCC_A_SLAVE_Process_Tick_Message() == SLAVE_ID)
	{
		SCC_A_SLAVE_Send_Ack_Message_To_Master();
	}

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

}

/*------------------------------------------------------------------*-

  SCC_A_SLAVE_Process_Tick_Message()

  The ticks messages are crucial to the operation of this shared-clock
  scheduler: the arrival of a tick message (at regular intervals)
  invokes the 'Update' ISR, that drives the scheduler.

  The tick messages themselves may contain data.  These data are
  extracted in this function.

-*------------------------------------------------------------------*/
tByte SCC_A_SLAVE_Process_Tick_Message(void)
{
	tByte Tick_ID;

	// Must have received a message (to generate the 'Tick')
	// The first byte is the ID of the slave for which the data are
	// intended
	Tick_ID = MCP2515_Read_Register(RXBnDm(1,0));   // Get data byte 0 (Slave ID)

	if (Tick_ID == SLAVE_ID)
	{
		// Only if there is a match do we need to copy these fields
		Tick_message_data_G[0] = MCP2515_Read_Register(RXBnDm(1,1));
		Tick_message_data_G[1] = MCP2515_Read_Register(RXBnDm(1,2));
		Tick_message_data_G[2] = MCP2515_Read_Register(RXBnDm(1,3));
		Tick_message_data_G[3] = MCP2515_Read_Register(RXBnDm(1,4));

	}

	// Clear *ALL* flags ...
	MCP2515_Write_Register(CANINTF, 0x00);

	return Tick_ID;
}


/*------------------------------------------------------------------*-

  SCC_A_SLAVE_Send_Ack_Message_To_Master()

  Slave must send and 'Acknowledge' message to the master, after
  tick messages are received.  NOTE: Only tick messages specifically
  addressed to this slave should be acknowledged.

  The acknowledge message serves two purposes:
  [1] It confirms to the master that this slave is alive & well.
  [2] It provides a means of sending data to the master and - hence
      - to other slaves.

  NOTE: Data transfer between slaves is NOT permitted!

-*------------------------------------------------------------------*/
void SCC_A_SLAVE_Send_Ack_Message_To_Master(void)
{


	// Prepare Ack message for transmission to Master

	// First byte of message must be slave ID
	MCP2515_Write_Register(TXBnDm(0,0), SLAVE_ID);

	// Now the data
	MCP2515_Write_Register(TXBnDm(0,1) , Ack_message_data_G);

	/* Send RTS_TXB0_INSTRUCTION Instruction */
	MCP2515_RTS_TXB_Instruction_CMD(RTS_INSTRUCTION_TXB0);

}

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
