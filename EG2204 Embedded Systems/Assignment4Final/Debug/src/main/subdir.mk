################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/main/main.c 

OBJS += \
./src/main/main.o 

C_DEPS += \
./src/main/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/main/%.o: ../src/main/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_CMSIS=CMSISv1p30_LPC17xx -D__CODE_RED -D__NEWLIB__ -I"Z:\Assignment4V2\Lib_CMSISv1p30_LPC17xx\inc" -I"Z:\Assignment4V2\Lib_EaBaseBoard\inc" -I"Z:\Assignment4V2\Lib_MCU\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -mcpu=cortex-m3 -mthumb -D__NEWLIB__ -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


