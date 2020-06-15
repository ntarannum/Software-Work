################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cr_startup_lpc17.c \
../src/main.c \
../src/timer.c 

OBJS += \
./src/cr_startup_lpc17.o \
./src/main.o \
./src/timer.o 

C_DEPS += \
./src/cr_startup_lpc17.d \
./src/main.d \
./src/timer.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_CMSIS=CMSISv1p30_LPC17xx -D__CODE_RED -D__NEWLIB__ -I"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment1\Lib_CMSISv1p30_LPC17xx\inc" -I"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment1\Lib_EaBaseBoard\inc" -I"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment1\Lib_MCU\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


