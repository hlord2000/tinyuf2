UF2_FAMILY_ID = 0x7d292022
CROSS_COMPILE = arm-none-eabi-

SDK_DIR = lib/nordic/nrfx
CMSIS_5 = lib/CMSIS_5

CPU := nrf5340_application
CPUDEFINE := NRF5340_XXAA_APPLICATION

CFLAGS += \
  -flto \
  -mthumb \
  -mabi=aapcs \
  -mcpu=cortex-m33 \
  -mfloat-abi=hard \
  -mfpu=fpv4-sp-d16 \
  -DCFG_TUSB_MCU=OPT_MCU_NRF5X \
  -DNRF5340_XXAA_APPLICATION \

#CPUDEFINE := 

SRC_S += $(SDK_DIR)/mdk/gcc_startup_$(CPU).S

LD_FILES ?= $(SDK_DIR)/mdk/nrf5340_xxaa_application.ld
LD_FILES := $(SDK_DIR)/mdk/nrf_common.ld

SRC_C += $(SDK_DIR)/mdk/system_$(CPU).c

SDK_CONFIG_FILE := nrfx_config.h

# suppress warning caused by vendor mcu driver
CFLAGS += -Wno-error=cast-align -Wno-error=unused-parameter

ifndef BUILD_NO_TINYUSB
SRC_C += lib/tinyusb/src/portable/nordic/nrf5x/dcd_nrf5x.c
endif

INC += \
 $(TOP)/$(CMSIS_5)/CMSIS/Core/Include \
 $(TOP)/lib/nordic/nrfx \
 $(TOP)/lib/nordic/nrfx/hal \
 $(TOP)/lib/nordic/nrfx/mdk \
 $(TOP)/lib/nordic/nrfx/drivers/src \
 $(TOP)/lib/nordic/nrfx/drivers/include \
 $(TOP)/lib/nordic/nrfx/soc \
 . \

