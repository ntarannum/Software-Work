/*
 *  serial_output.h
 *
 *  Created on: 19 March 2018
 *  Author: nt161
 */

#ifndef TASKS_SERIAL_OUTPUT_HEADER_
#define TASKS_SERIAL_OUTPUT_HEADER_

#include "lpc_types.h"
#include "../lpcusb/include/usbapi.h"
#include "../lpcusb/include/USBVcom.h"
#include "../adc/adc.h"

// ------ Public function prototypes -------------------------------


void serial_output_init(void);
void serial_output_update(void);


#endif /* TASKS_SERIAL_OUTPUT_HEADER_ */
