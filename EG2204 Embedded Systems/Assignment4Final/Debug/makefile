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
-include src/lpcusb/source/subdir.mk
-include src/adc/subdir.mk
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
all: Assignment4Final.axf

# Tool invocations
Assignment4Final.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"Z:\Assignment4V2\Lib_CMSISv1p30_LPC17xx\Debug" -L"Z:\Assignment4V2\Lib_EaBaseBoard\Debug" -L"Z:\Assignment4V2\Lib_MCU\Debug" -Xlinker --gc-sections -Xlinker -Map=Assignment4Final.map -mcpu=cortex-m3 -mthumb -T "Assignment4Final_Debug.ld" -o "Assignment4Final.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) Assignment4Final.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size Assignment4Final.axf; # arm-none-eabi-objdump -h -S Assignment4Final.axf >Assignment4Final.lss
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
