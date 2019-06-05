#!/bin/bash

# Set the IOC name
export IOC="ioc-mec-userBhc"

# Setup the IOC user environment
source /reg/d/iocCommon/All/mec_env.sh

# Make sure the IOC's data directories are ready for use
$RUNUSER "mkdir -p $IOC_DATA/$IOC/autosave"
$RUNUSER "mkdir -p $IOC_DATA/$IOC/archive"
$RUNUSER "mkdir -p $IOC_DATA/$IOC/iocInfo"

# Make sure permissions are correct
$RUNUSER "chmod ug+w -R $IOC_DATA/$IOC"

# For release
#cd $EPICS_SITE_TOP/ioc/xxx/userBhc/R0.1.0/iocBoot/ioc-mec-userBhc

# Copy the archive file to iocData
$RUNUSER "cp ../../archive/$IOC.archive $IOC_DATA/$IOC/archive"

# Launch the IOC
$RUNUSER "$PROCSERV --logfile $IOC_DATA/$IOC/iocInfo/ioc.log --name $IOC 39001 ../../bin/linux-x86_64/userBhc st.cmd"
