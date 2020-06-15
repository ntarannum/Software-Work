/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'TT_Core' in SOPC Builder design 'Lab5'
 * SOPC Builder design path: C:/Users/a/Documents/EG3205_Work/Nios_Work/FPGA_Lab5/Lab5/Lab5.sopcinfo
 *
 * Generated: Thu Nov 22 18:37:28 GMT 2018
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
#define ALT_CPU_CPU_ID_VALUE 0x00000001
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
#define ALT_CPU_NAME "TT_Core"
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00008820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000001
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

#define __ALTERA_AVALON_MUTEX
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_QSYS


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
#define ALT_STDERR "/dev/null"
#define ALT_STDERR_BASE 0x0
#define ALT_STDERR_DEV null
#define ALT_STDERR_TYPE ""
#define ALT_STDIN "/dev/null"
#define ALT_STDIN_BASE 0x0
#define ALT_STDIN_DEV null
#define ALT_STDIN_TYPE ""
#define ALT_STDOUT "/dev/null"
#define ALT_STDOUT_BASE 0x0
#define ALT_STDOUT_DEV null
#define ALT_STDOUT_TYPE ""
#define ALT_SYSTEM_NAME "Lab5"


/*
 * TT_core_memory configuration
 *
 */

#define ALT_MODULE_CLASS_TT_core_memory altera_avalon_onchip_memory2
#define TT_CORE_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define TT_CORE_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define TT_CORE_MEMORY_BASE 0x0
#define TT_CORE_MEMORY_CONTENTS_INFO ""
#define TT_CORE_MEMORY_DUAL_PORT 0
#define TT_CORE_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define TT_CORE_MEMORY_INIT_CONTENTS_FILE "Lab5_TT_core_memory"
#define TT_CORE_MEMORY_INIT_MEM_CONTENT 1
#define TT_CORE_MEMORY_INSTANCE_ID "NONE"
#define TT_CORE_MEMORY_IRQ -1
#define TT_CORE_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TT_CORE_MEMORY_NAME "/dev/TT_core_memory"
#define TT_CORE_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define TT_CORE_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define TT_CORE_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define TT_CORE_MEMORY_SINGLE_CLOCK_OP 0
#define TT_CORE_MEMORY_SIZE_MULTIPLE 1
#define TT_CORE_MEMORY_SIZE_VALUE 16384
#define TT_CORE_MEMORY_SPAN 16384
#define TT_CORE_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define TT_CORE_MEMORY_WRITABLE 1


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TT_TIMER_1
#define ALT_TIMESTAMP_CLK none


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
#define MSG_BUF_RAM_INIT_CONTENTS_FILE "Lab5_msg_buf_ram"
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
 * tt_leds configuration
 *
 */

#define ALT_MODULE_CLASS_tt_leds altera_avalon_pio
#define TT_LEDS_BASE 0x9430
#define TT_LEDS_BIT_CLEARING_EDGE_REGISTER 0
#define TT_LEDS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TT_LEDS_CAPTURE 0
#define TT_LEDS_DATA_WIDTH 4
#define TT_LEDS_DO_TEST_BENCH_WIRING 0
#define TT_LEDS_DRIVEN_SIM_VALUE 0
#define TT_LEDS_EDGE_TYPE "NONE"
#define TT_LEDS_FREQ 50000000
#define TT_LEDS_HAS_IN 0
#define TT_LEDS_HAS_OUT 1
#define TT_LEDS_HAS_TRI 0
#define TT_LEDS_IRQ -1
#define TT_LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TT_LEDS_IRQ_TYPE "NONE"
#define TT_LEDS_NAME "/dev/tt_leds"
#define TT_LEDS_RESET_VALUE 0
#define TT_LEDS_SPAN 16
#define TT_LEDS_TYPE "altera_avalon_pio"


/*
 * tt_pb_1 configuration
 *
 */

#define ALT_MODULE_CLASS_tt_pb_1 altera_avalon_pio
#define TT_PB_1_BASE 0x9420
#define TT_PB_1_BIT_CLEARING_EDGE_REGISTER 0
#define TT_PB_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TT_PB_1_CAPTURE 0
#define TT_PB_1_DATA_WIDTH 1
#define TT_PB_1_DO_TEST_BENCH_WIRING 1
#define TT_PB_1_DRIVEN_SIM_VALUE 0
#define TT_PB_1_EDGE_TYPE "NONE"
#define TT_PB_1_FREQ 50000000
#define TT_PB_1_HAS_IN 1
#define TT_PB_1_HAS_OUT 0
#define TT_PB_1_HAS_TRI 0
#define TT_PB_1_IRQ -1
#define TT_PB_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TT_PB_1_IRQ_TYPE "NONE"
#define TT_PB_1_NAME "/dev/tt_pb_1"
#define TT_PB_1_RESET_VALUE 0
#define TT_PB_1_SPAN 16
#define TT_PB_1_TYPE "altera_avalon_pio"


/*
 * tt_timer_1 configuration
 *
 */

#define ALT_MODULE_CLASS_tt_timer_1 altera_avalon_timer
#define TT_TIMER_1_ALWAYS_RUN 0
#define TT_TIMER_1_BASE 0x9400
#define TT_TIMER_1_COUNTER_SIZE 32
#define TT_TIMER_1_FIXED_PERIOD 0
#define TT_TIMER_1_FREQ 50000000
#define TT_TIMER_1_IRQ 0
#define TT_TIMER_1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TT_TIMER_1_LOAD_VALUE 49999
#define TT_TIMER_1_MULT 0.0010
#define TT_TIMER_1_NAME "/dev/tt_timer_1"
#define TT_TIMER_1_PERIOD 1
#define TT_TIMER_1_PERIOD_UNITS "ms"
#define TT_TIMER_1_RESET_OUTPUT 0
#define TT_TIMER_1_SNAPSHOT 1
#define TT_TIMER_1_SPAN 32
#define TT_TIMER_1_TICKS_PER_SEC 1000.0
#define TT_TIMER_1_TIMEOUT_PULSE_OUTPUT 0
#define TT_TIMER_1_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
