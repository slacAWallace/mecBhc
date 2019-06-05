TOP = ../..
include $(TOP)/configure/CONFIG
ARCH = linux-x86_64
TARGETS = envPaths

# Make sure these archive files are fully expanded
USR_ARCHIVEFLAGS += -V

#----------------------------------------------------
# Create and install AI history db file for this IOC
#
DB += ioc-mec-userBhc-hist.db

#----------------------------------------------------
# Create and install IOC archive file
#
ARCHIVE += ioc-mec-userBhc.archive

#----------------------------------------------------
# Create and install IOC autosave file
#
REQ += ioc-mec-userBhc.req

include $(TOP)/configure/RULES
include $(TOP)/configure/RULES.ioc-targets
