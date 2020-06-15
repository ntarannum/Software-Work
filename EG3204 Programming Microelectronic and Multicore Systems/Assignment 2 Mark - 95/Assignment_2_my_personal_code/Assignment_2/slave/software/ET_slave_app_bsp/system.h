/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'ET_Core' in SOPC Builder design 'slave'
 * SOPC Builder design path: C:/Users/a/Documents/EG3205_Work/Assignment_2/slave/slave.sopcinfo
 *
 * Generated: Tue Dec 11 17:15:29 GMT 2018
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00008820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x10
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00000020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x10
#define ALT_CPU_NAME "ET_Core"
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00008820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x10
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00000020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x10
#define NIOS2_RESET_ADDR 0x00000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_MUTEX
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SPI
#define __ALTERA_NIOS2_QSYS


/*
 * ET_Core_Memory configuration
 *
 */

#define ALT_MODULE_CLASS_ET_Core_Memory altera_avalon_onchip_memory2
#define ET_CORE_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ET_CORE_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ET_CORE_MEMORY_BASE 0x0
#define ET_CORE_MEMORY_CONTENTS_INFO ""
#define ET_CORE_MEMORY_DUAL_PORT 0
#define ET_CORE_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define ET_CORE_MEMORY_INIT_CONTENTS_FILE "slave_ET_Core_Memory"
#define ET_CORE_MEMORY_INIT_MEM_CONTENT 1
#define ET_CORE_MEMORY_INSTANCE_ID "NONE"
#define ET_CORE_MEMORY_IRQ -1
#define ET_CORE_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ET_CORE_MEMORY_NAME "/dev/ET_Core_Memory"
#define ET_CORE_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ET_CORE_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define ET_CORE_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define ET_CORE_MEMORY_SINGLE_CLOCK_OP 0
#define ET_CORE_MEMORY_SIZE_MULTIPLE 1
#define ET_CORE_MEMORY_SIZE_VALUE 16348
#define ET_CORE_MEMORY_SPAN 16348
#define ET_CORE_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define ET_CORE_MEMORY_WRITABLE 1


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone III"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x9488
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x9488
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x9488
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "slave"


/*
 * et_leds1 configuration
 *
 */

#define ALT_MODULE_CLASS_et_leds1 altera_avalon_pio
#define ET_LEDS1_BASE 0x9470
#define ET_LEDS1_BIT_CLEARING_EDGE_REGISTER 0
#define ET_LEDS1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ET_LEDS1_CAPTURE 0
#define ET_LEDS1_DATA_WIDTH 2
#define ET_LEDS1_DO_TEST_BENCH_WIRING 0
#define ET_LEDS1_DRIVEN_SIM_VALUE 0
#define ET_LEDS1_EDGE_TYPE "NONE"
#define ET_LEDS1_FREQ 50000000
#define ET_LEDS1_HAS_IN 0
#define ET_LEDS1_HAS_OUT 1
#define ET_LEDS1_HAS_TRI 0
#define ET_LEDS1_IRQ -1
#define ET_LEDS1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ET_LEDS1_IRQ_TYPE "NONE"
#define ET_LEDS1_NAME "/dev/et_leds1"
#define ET_LEDS1_RESET_VALUE 0
#define ET_LEDS1_SPAN 16
#define ET_LEDS1_TYPE "altera_avalon_pio"


/*
 * et_leds2 configuration
 *
 */

#define ALT_MODULE_CLASS_et_leds2 altera_avalon_pio
#define ET_LEDS2_BASE 0xa000
#define ET_LEDS2_BIT_CLEARING_EDGE_REGISTER 0
#define ET_LEDS2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ET_LEDS2_CAPTURE 0
#define ET_LEDS2_DATA_WIDTH 2
#define ET_LEDS2_DO_TEST_BENCH_WIRING 0
#define ET_LEDS2_DRIVEN_SIM_VALUE 0
#define ET_LEDS2_EDGE_TYPE "NONE"
#define ET_LEDS2_FREQ 50000000
#define ET_LEDS2_HAS_IN 0
#define ET_LEDS2_HAS_OUT 1
#define ET_LEDS2_HAS_TRI 0
#define ET_LEDS2_IRQ -1
#define ET_LEDS2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ET_LEDS2_IRQ_TYPE "NONE"
#define ET_LEDS2_NAME "/dev/et_leds2"
#define ET_LEDS2_RESET_VALUE 0
#define ET_LEDS2_SPAN 16
#define ET_LEDS2_TYPE "altera_avalon_pio"


/*
 * et_pb_1 configuration
 *
 */

#define ALT_MODULE_CLASS_et_pb_1 altera_avalon_pio
#define ET_PB_1_BASE 0x9450
#define ET_PB_1_BIT_CLEARING_EDGE_REGISTER 0
#define ET_PB_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ET_PB_1_CAPTURE 0
#define ET_PB_1_DATA_WIDTH 1
#define ET_PB_1_DO_TEST_BENCH_WIRING 1
#define ET_PB_1_DRIVEN_SIM_VALUE 0
#define ET_PB_1_EDGE_TYPE "NONE"
#define ET_PB_1_FREQ 50000000
#define ET_PB_1_HAS_IN 1
#define ET_PB_1_HAS_OUT 0
#define ET_PB_1_HAS_TRI 0
#define ET_PB_1_IRQ -1
#define ET_PB_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ET_PB_1_IRQ_TYPE "NONE"
#define ET_PB_1_NAME "/dev/et_pb_1"
#define ET_PB_1_RESET_VALUE 0
#define ET_PB_1_SPAN 16
#define ET_PB_1_TYPE "altera_avalon_pio"


/*
 * et_pb_2 configuration
 *
 */

#define ALT_MODULE_CLASS_et_pb_2 altera_avalon_pio
#define ET_PB_2_BASE 0x9440
#define ET_PB_2_BIT_CLEARING_EDGE_REGISTER 0
#define ET_PB_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ET_PB_2_CAPTURE 0
#define ET_PB_2_DATA_WIDTH 1
#define ET_PB_2_DO_TEST_BENCH_WIRING 1
#define ET_PB_2_DRIVEN_SIM_VALUE 0
#define ET_PB_2_EDGE_TYPE "NONE"
#define ET_PB_2_FREQ 50000000
#define ET_PB_2_HAS_IN 1
#define ET_PB_2_HAS_OUT 0
#define ET_PB_2_HAS_TRI 0
#define ET_PB_2_IRQ -1
#define ET_PB_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ET_PB_2_IRQ_TYPE "NONE"
#define ET_PB_2_NAME "/dev/et_pb_2"
#define ET_PB_2_RESET_VALUE 0
#define ET_PB_2_SPAN 16
#define ET_PB_2_TYPE "altera_avalon_pio"


/*
 * et_spi_0 configuration
 *
 */

#define ALT_MODULE_CLASS_et_spi_0 altera_avalon_spi
#define ET_SPI_0_BASE 0x9420
#define ET_SPI_0_CLOCKMULT 1
#define ET_SPI_0_CLOCKPHASE 0
#define ET_SPI_0_CLOCKPOLARITY 0
#define ET_SPI_0_CLOCKUNITS "Hz"
#define ET_SPI_0_DATABITS 8
#define ET_SPI_0_DATAWIDTH 16
#define ET_SPI_0_DELAYMULT "1.0E-9"
#define ET_SPI_0_DELAYUNITS "ns"
#define ET_SPI_0_EXTRADELAY 0
#define ET_SPI_0_INSERT_SYNC 0
#define ET_SPI_0_IRQ 1
#define ET_SPI_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define ET_SPI_0_ISMASTER 1
#define ET_SPI_0_LSBFIRST 0
#define ET_SPI_0_NAME "/dev/et_spi_0"
#define ET_SPI_0_NUMSLAVES 1
#define ET_SPI_0_PREFIX "spi_"
#define ET_SPI_0_SPAN 32
#define ET_SPI_0_SYNC_REG_DEPTH 2
#define ET_SPI_0_TARGETCLOCK 128000u
#define ET_SPI_0_TARGETSSDELAY "0.0"
#define ET_SPI_0_TYPE "altera_avalon_spi"


/*
 * et_spican_int configuration
 *
 */

#define ALT_MODULE_CLASS_et_spican_int altera_avalon_pio
#define ET_SPICAN_INT_BASE 0x9460
#define ET_SPICAN_INT_BIT_CLEARING_EDGE_REGISTER 0
#define ET_SPICAN_INT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ET_SPICAN_INT_CAPTURE 1
#define ET_SPICAN_INT_DATA_WIDTH 1
#define ET_SPICAN_INT_DO_TEST_BENCH_WIRING 1
#define ET_SPICAN_INT_DRIVEN_SIM_VALUE 0
#define ET_SPICAN_INT_EDGE_TYPE "FALLING"
#define ET_SPICAN_INT_FREQ 50000000
#define ET_SPICAN_INT_HAS_IN 1
#define ET_SPICAN_INT_HAS_OUT 0
#define ET_SPICAN_INT_HAS_TRI 0
#define ET_SPICAN_INT_IRQ 0
#define ET_SPICAN_INT_IRQ_INTERRUPT_CONTROLLER_ID 0
#define ET_SPICAN_INT_IRQ_TYPE "EDGE"
#define ET_SPICAN_INT_NAME "/dev/et_spican_int"
#define ET_SPICAN_INT_RESET_VALUE 0
#define ET_SPICAN_INT_SPAN 16
#define ET_SPICAN_INT_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x9488
#define JTAG_UART_0_IRQ 3
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * msg_buf_mutex configuration
 *
 */

#define ALT_MODULE_CLASS_msg_buf_mutex altera_avalon_mutex
#define MSG_BUF_MUTEX_BASE 0x9480
#define MSG_BUF_MUTEX_IRQ -1
#define MSG_BUF_MUTEX_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MSG_BUF_MUTEX_NAME "/dev/msg_buf_mutex"
#define MSG_BUF_MUTEX_OWNER_INIT 0
#define MSG_BUF_MUTEX_OWNER_WIDTH 16
#define MSG_BUF_MUTEX_SPAN 8
#define MSG_BUF_MUTEX_TYPE "altera_avalon_mutex"
#define MSG_BUF_MUTEX_VALUE_INIT 0
#define MSG_BUF_MUTEX_VALUE_WIDTH 16


/*
 * msg_buf_ram configuration
 *
 */

#define ALT_MODULE_CLASS_msg_buf_ram altera_avalon_onchip_memory2
#define MSG_BUF_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define MSG_BUF_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define MSG_BUF_RAM_BASE 0x9000
#define MSG_BUF_RAM_CONTENTS_INFO ""
#define MSG_BUF_RAM_DUAL_PORT 0
#define MSG_BUF_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define MSG_BUF_RAM_INIT_CONTENTS_FILE "slave_msg_buf_ram"
#define MSG_BUF_RAM_INIT_MEM_CONTENT 1
#define MSG_BUF_RAM_INSTANCE_ID "NONE"
#define MSG_BUF_RAM_IRQ -1
#define MSG_BUF_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MSG_BUF_RAM_NAME "/dev/msg_buf_ram"
#define MSG_BUF_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define MSG_BUF_RAM_RAM_BLOCK_TYPE "AUTO"
#define MSG_BUF_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define MSG_BUF_RAM_SINGLE_CLOCK_OP 0
#define MSG_BUF_RAM_SIZE_MULTIPLE 1
#define MSG_BUF_RAM_SIZE_VALUE 1024
#define MSG_BUF_RAM_SPAN 1024
#define MSG_BUF_RAM_TYPE "altera_avalon_onchip_memory2"
#define MSG_BUF_RAM_WRITABLE 1


/*
 * pio_0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_0 altera_avalon_pio
#define PIO_0_BASE 0x94a0
#define PIO_0_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_0_CAPTURE 0
#define PIO_0_DATA_WIDTH 1
#define PIO_0_DO_TEST_BENCH_WIRING 0
#define PIO_0_DRIVEN_SIM_VALUE 0
#define PIO_0_EDGE_TYPE "NONE"
#define PIO_0_FREQ 50000000
#define PIO_0_HAS_IN 0
#define PIO_0_HAS_OUT 1
#define PIO_0_HAS_TRI 0
#define PIO_0_IRQ -1
#define PIO_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_0_IRQ_TYPE "NONE"
#define PIO_0_NAME "/dev/pio_0"
#define PIO_0_RESET_VALUE 0
#define PIO_0_SPAN 16
#define PIO_0_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
