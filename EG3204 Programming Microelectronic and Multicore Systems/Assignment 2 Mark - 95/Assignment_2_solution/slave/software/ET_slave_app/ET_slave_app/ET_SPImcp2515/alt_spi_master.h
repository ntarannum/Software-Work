/*
 * alt_spi_master.h
 *
 *  Created on: 14 Feb 2016
 *      Author: Dr. Fayyaz
 */

#ifndef ALT_SPI_MASTER_H_
#define ALT_SPI_MASTER_H_

#define ALT_SPI_MASTER (ET_SPI_0_BASE)

#define alt_spi_rx_data_reg 	(ALT_SPI_MASTER+0)
#define alt_spi_tx_data_reg 	(ALT_SPI_MASTER+1)
#define alt_spi_status_reg 		(ALT_SPI_MASTER+2)
#define alt_spi_ctrl_reg 		(ALT_SPI_MASTER+3)
#define alt_spi_slave_sel_reg 	(ALT_SPI_MASTER+5)


#endif /* ALT_SPI_MASTER_H_ */
