################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/tasks/subdir.mk
-include src/system/subdir.mk
-include src/scheduler/subdir.mk
-include src/main/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: adc_pca9532_leds.axf

# Tool invocations
adc_pca9532_leds.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment3Final\Lib_CMSISv1p30_LPC17xx\Debug" -L"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment3Final\Lib_EaBaseBoard\Debug" -L"C:\Users\NTarannum\Documents\LPCXpresso_8.2.2_650\workspace\Assignment3Final\Lib_MCU\Debug" -Xlinker --gc-sections -Xlinker -Map=adc_pca9532_leds.map -mcpu=cortex-m3 -mthumb -T "scheduler_rgb_js_Debug.ld" -o "adc_pca9532_leds.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) adc_pca9532_leds.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size adc_pca9532_leds.axf; # arm-none-eabi-objdump -h -S adc_pca9532_leds.axf >adc_pca9532_leds.lss
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
