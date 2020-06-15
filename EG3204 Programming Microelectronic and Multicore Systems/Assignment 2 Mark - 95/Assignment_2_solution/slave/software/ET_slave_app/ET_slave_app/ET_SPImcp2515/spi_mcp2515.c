
#include <altera_avalon_pio_regs.h>

#include "system.h"
#include "../ET_TTC_Scheduler/Main.h"
#include "../ET_SPImcp2515/spi_mcp2515.h"
#include "alt_spi_master.h"
#include "altera_avalon_spi.h"
#include "../ET_TTC_Scheduler/2_50_XXg.h"

alt_u8 write_data[50],read_data[50];

/*-------------MCP2515_Init---------------------------
 * This function performs reset, setup receive buffer mask and
 * configure the filters for MCP2515.
 * --------------------------------------------------------*/
void MCP2515_Init(void)
{

	/* Snd reset instruction */
	MCP2515_Reset();

	 //Set Configuration Mode
	MCP2515_SetMode(_CANSPI_MODE_CONFIG);

	 //set bit timing, masks, and rollover mode
	MCP2515_SetBitTiming(0x01,0xB5,0x01);

	// We *don't* use Buffer 0 here.
	// We therefore set it to receive CAN messages, as follows:
	// - with Standard IDs.
	// - matching the filter settings.
	// [As all our messages have Extended IDs, this won't happen...]
	MCP2515_Write_Register(RXB0CTRL, 0x20);  //0x02);

	// --- Now set up masks and filters (BEGIN) ---
	// Buffer 0 mask
	// (all 1s - so filter must match every bit)
	// [Standard IDs]
	MCP2515_Write_Register(RXM0SIDH, 0xFF);
	MCP2515_Write_Register(RXM0SIDL, 0xE0);

	// Buffer 0 filters
	// (all 1s, and Standard messages only)
	MCP2515_Write_Register(RXF0SIDH, 0xFF);
	MCP2515_Write_Register(RXF0SIDL, 0xE0);

	MCP2515_Write_Register(RXF1SIDH, 0xFF);
	MCP2515_Write_Register(RXF1SIDL, 0xE0);

	// We set up MCP2510 Buffer 1 to receive Tick messages, as follows:
	// - with Extended IDs.
	// - matching the filter settings (see below)
	MCP2515_Write_Register(RXB1CTRL, 0x40);  //0x04);

	// Buffer 1 mask
	// (all 1s - so filter must match every bit)
	// [Extended IDs]
	MCP2515_Write_Register(RXM1SIDH, 0xFF);
	MCP2515_Write_Register(RXM1SIDL, 0xE3);
	MCP2515_Write_Register(RXM1EID8, 0xFF);
	MCP2515_Write_Register(RXM1EID0, 0xFF);

	// Buffer 1 filters
	// (only accept messages with Extended ID 0x00000000)
	// We set *ALL* relevant filters (2 - 5) to match this message
	MCP2515_Write_Register(RXF2SIDH, 0x00);
	MCP2515_Write_Register(RXF2SIDL, 0x08);  // EXIDE bit
	MCP2515_Write_Register(RXF2EID8, 0x00);
	MCP2515_Write_Register(RXF2EID0, 0x00);

	MCP2515_Write_Register(RXF3SIDH, 0x00);
	MCP2515_Write_Register(RXF3SIDL, 0x08);  // EXIDE bit
	MCP2515_Write_Register(RXF3EID8, 0x00);
	MCP2515_Write_Register(RXF3EID0, 0x00);

	MCP2515_Write_Register(RXF4SIDH, 0x00);
	MCP2515_Write_Register(RXF4SIDL, 0x08);  // EXIDE bit
	MCP2515_Write_Register(RXF4EID8, 0x00);
	MCP2515_Write_Register(RXF4EID0, 0x00);

	MCP2515_Write_Register(RXF5SIDH, 0x00);
	MCP2515_Write_Register(RXF5SIDL, 0x08);  // EXIDE bit
	MCP2515_Write_Register(RXF5EID8, 0x00);
	MCP2515_Write_Register(RXF5EID0, 0x00);

	// --- Now set up masks and filters (END) ---



	// Interrupts are required if data are in Buffer 1.
	// Clear *all* interrupt flags before enabling interrupt
	MCP2515_Write_Register(CANINTF, 0x00);

	// Enable MCP2510 interrupt generation
	// (*Rx only here - no errors, etc *)
	// Interrupts from Buffer 1 only
	MCP2515_Write_Register(CANINTE, 0x02);

	// Prepare 'Ack' message...
	// EXTENDED IDs used here
	// (ID 0x000000FF used for Ack messages - matches PTTES)
	MCP2515_Write_Register(TXB0SIDH, 0x00);
	MCP2515_Write_Register(TXB0SIDL, 0x08); // EXIDE bit
	MCP2515_Write_Register(TXB0EID8, 0x00);
	MCP2515_Write_Register(TXB0EID0, 0xFF);

	// Set Normal Mode
	MCP2515_Write_Register(CANCTRL, _CANSPI_MODE_NORMAL);
	// Number of data bytes
	// NOTE: First byte is the slave ID
	MCP2515_Write_Register(TXB0DLC, 0x02);

	// Initial values of the data bytes
	// [Generally only need to change data values and send message]
	MCP2515_Write_Register(TXBnDm(0,0), SLAVE_ID);  // Slave ID
	MCP2515_Write_Register(TXBnDm(0,1), 0x00);  // Data byte 1, etc...
	MCP2515_Write_Register(TXBnDm(0,2), 0x03);  // Data byte 2, etc...
	MCP2515_Write_Register(TXBnDm(0,3), 0x04);  // Data byte 3, etc...
	MCP2515_Write_Register(TXBnDm(0,4), 0x05);  // Data byte 4, etc...



}
/*-------------MCP2515_SetBitTiming---------------------------
 * This function setup the baud rate for the SPI-CAN module.
 * Input = rCNF1, mask for configuration register 1
 * Input = rCNF2, mask for configuration register 2
 * Inout = rCNF3, mask for configuration register 3
 * --------------------------------------------------------*/
unsigned char MCP2515_SetBitTiming(unsigned char rCNF1, unsigned char rCNF2, unsigned char rCNF3)
{
	//https://www.kvaser.com/support/calculators/bit-timing-calculator/
	// Configure to 250kbps (in case of 16 MHz CAN controller clock).
	MCP2515_Write_Register(CNF1, rCNF1);
	MCP2515_Write_Register(CNF2, rCNF2);
	MCP2515_Write_Register(CNF3, rCNF3);
	return 0;
}
/*-------------MCP2515_changeBits---------------------------
 * This function changes particular bits in the
 * specified register
 * Input = reg_address
 * Input = mask
 * Inout = specify value
 * --------------------------------------------------------*/
void MCP2515_changeBits(unsigned char reg_address,unsigned char change_bits, unsigned char change_val)
{

	unsigned char reg_val, temp;
	temp=change_bits & change_val;
	reg_val=MCP2515_Read_Register(reg_address);
	reg_val=reg_val & 0x1F;
	temp=temp|reg_val;
	MCP2515_Write_Register(reg_address,temp);

}
/*-------------MCP2515_SetMode---------------------------
 * This function set the mode of the MCP2515. The following
	modes are possible.
 *	_CANSPI_MODE_NORMAL  			 0x00
	_CANSPI_MODE_SLEEP   			 0x20
	_CANSPI_MODE_LOOP    			 0x40
	_CANSPI_MODE_LISTEN  			 0x60
	_CANSPI_MODE_CONFIG  			 0x80
 * Input = mode
 * Output =void
 * --------------------------------------------------------*/
void MCP2515_SetMode(unsigned char mode)
{

	MCP2515_changeBits(CANCTRL, (7 << REQOP0),(mode));
	while(getMode != (mode>>REQOP0)){
		MCP2515_changeBits(CANCTRL, (7 << REQOP0),(mode));
	}

}
/*-------------MCP2515_Reset---------------------------
 * This function reset SPI-CAN module.
 * Input = void
 * output = void
 * --------------------------------------------------------*/
void MCP2515_Reset()
{

	write_data[0]= RESET_INSTRUCTION;
	/* Send Reset Instruction */
	alt_avalon_spi_command((alt_u32)ALT_SPI_MASTER,
			0,1, write_data,0,
			read_data,0);

}
/*-------------MCP2515_Read_Register----------------------
 * Send reset instruction to the MCP2515. Device should
 * reinitialize yourself and go to the configuration mode
 * Input = Read Register address
 * Output = content of the register
 * --------------------------------------------------------*/
tByte MCP2515_Read_Register(const tByte Register_address)
{

	tByte Register_contents;
	/* Read Instruction */
	write_data[0]=READ_INSTRUCTION;
	write_data[1]=Register_address;

	alt_avalon_spi_command((alt_u32)ALT_SPI_MASTER,
			0,2, write_data,1,
			read_data,0);
	Register_contents=read_data[0];

	return Register_contents;
}
/*-------------MCP2515_Read_Rx_Buffer_Register-------------
 * Input = instruction
 * Output = content of the receive buffer register
 * --------------------------------------------------------*/
tByte MCP2515_Read_Rx_Buffer_Register(const tByte instruction)
{
	tByte Register_contents;
	/* Read Receive Buffer Instruction */
	write_data[0]=instruction;

	alt_avalon_spi_command((alt_u32)ALT_SPI_MASTER,
			0,1, write_data,1,
			read_data,0);
	Register_contents=read_data[0];

	return Register_contents;
}
/*-------------MCP2515_Write_Register-----------------------
 * Input = Write Register address
 * Input = Write Register contents
 * Output= void-------------------------------------------*/

void MCP2515_Write_Register(const tByte Register_address,
		const tByte Register_contents)
{

	/* Read Receive Buffer Instruction */
	write_data[0]=WRITE_BYTE_INSTRUCTION;
	write_data[1]=Register_address;
	write_data[2]=Register_contents;

	alt_avalon_spi_command((alt_u32)ALT_SPI_MASTER,
			0,3, write_data,0,
			read_data,0);


}
/*-------------MCP2515_RTS_TXB_Instruction_CMD-----------------------
 * This function sends request for the transmission of data through
 * SPI-CAN module.
 * Input = tx_buffer_to_send, Transmit Buffer to send
 * Output= void-------------------------------------------*/
void MCP2515_RTS_TXB_Instruction_CMD(const tByte tx_buffer_to_send)
{
	/* RTS Transmit Buffer Instruction */
	write_data[0]=tx_buffer_to_send;
	alt_avalon_spi_command((alt_u32)ALT_SPI_MASTER,
			0,1, write_data,0,
			read_data,0);
}
/*--------------------------------------------------------*/
