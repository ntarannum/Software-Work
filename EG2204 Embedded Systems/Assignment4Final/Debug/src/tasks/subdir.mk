################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/tasks/led_bank.c \
../src/tasks/rgb_led.c \
../src/tasks/serial_output.c \
../src/tasks/seven_seg.c 

OBJS += \
./src/tasks/led_bank.o \
./src/tasks/rgb_led.o \
./src/tasks/serial_output.o \
./src/tasks/seven_seg.o 

C_DEPS += \
./src/tasks/led_bank.d \
./src/tasks/rgb_led.d \
./src/tasks/serial_output.d \
./src/tasks/seven_seg.d 


# Each subdirectory must supply rules for building sources it contributes
src/tasks/%.o: ../src/tasks/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_CMSIS=CMSISv1p30_LPC17xx -D__CODE_RED -D__NEWLIB__ -I"Z:\Assignment4V2\Lib_CMSISv1p30_LPC17xx\inc" -I"Z:\Assignment4V2\Lib_EaBaseBoard\inc" -I"Z:\Assignment4V2\Lib_MCU\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


