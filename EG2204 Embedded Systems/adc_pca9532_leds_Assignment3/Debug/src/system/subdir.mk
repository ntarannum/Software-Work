################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/system/cr_startup_lpc17.c 

OBJS += \
./src/system/cr_startup_lpc17.o 

C_DEPS += \
./src/system/cr_startup_lpc17.d 


# Each subdirectory must supply rules for building sources it contributes
src/system/%.o: ../src/system/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_CMSIS=CMSISv1p30_LPC17xx -D__CODE_RED -D__NEWLIB__ -I"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment3Final\Lib_CMSISv1p30_LPC17xx\inc" -I"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment3Final\Lib_EaBaseBoard\inc" -I"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment3Final\Lib_MCU\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


