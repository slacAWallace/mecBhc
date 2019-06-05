TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build an ioc application
# Use PROD_IOC_RTEMS for RTEMS only
# Use PROD_IOC_Linux for Linux only
PROD_IOC = userBhc

# userBhc.dbd will be created and installed
DBD += userBhc.dbd

# userBhc.dbd will be made up from these files:
userBhc_DBD += base.dbd
userBhc_DBD += history.dbd
userBhc_DBD += iocAdmin.dbd
userBhc_DBD += autosaveSupport.dbd
userBhc_DBD += Bx9000_MBT.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
userBhc_SRCS += userBhc_registerRecordDeviceDriver.cpp
userBhc_SRCS_DEFAULT += userBhcMain.cpp

# Add locally compiled object code
#userBhc_SRCS += dbSubExample.c

userBhc_LIBS += devIocStats
userBhc_LIBS += autosave
userBhc_LIBS += Bx9000_MBT
userBhc_LIBS += history
userBhc_LIBS += ModBusTCPClnt

userBhc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

