################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/lpcusb/source/USBVcom.c \
../src/lpcusb/source/lpc17xx_libcfg_default.c \
../src/lpcusb/source/serial_fifo.c \
../src/lpcusb/source/usbcontrol.c \
../src/lpcusb/source/usbhw_lpc.c \
../src/lpcusb/source/usbinit.c \
../src/lpcusb/source/usbstdreq.c 

OBJS += \
./src/lpcusb/source/USBVcom.o \
./src/lpcusb/source/lpc17xx_libcfg_default.o \
./src/lpcusb/source/serial_fifo.o \
./src/lpcusb/source/usbcontrol.o \
./src/lpcusb/source/usbhw_lpc.o \
./src/lpcusb/source/usbinit.o \
./src/lpcusb/source/usbstdreq.o 

C_DEPS += \
./src/lpcusb/source/USBVcom.d \
./src/lpcusb/source/lpc17xx_libcfg_default.d \
./src/lpcusb/source/serial_fifo.d \
./src/lpcusb/source/usbcontrol.d \
./src/lpcusb/source/usbhw_lpc.d \
./src/lpcusb/source/usbinit.d \
./src/lpcusb/source/usbstdreq.d 


# Each subdirectory must supply rules for building sources it contributes
src/lpcusb/source/%.o: ../src/lpcusb/source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_CMSIS=CMSISv1p30_LPC17xx -D__CODE_RED -D__NEWLIB__ -I"Z:\Assignment4V2\Lib_CMSISv1p30_LPC17xx\inc" -I"Z:\Assignment4V2\Lib_EaBaseBoard\inc" -I"Z:\Assignment4V2\Lib_MCU\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


