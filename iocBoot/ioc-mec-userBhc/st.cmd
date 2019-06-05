#!../../bin/linux-x86_64/userBhc

epicsEnvSet( "ENGINEER", "Alex Wallace (awallace)" )
epicsEnvSet( "LOCATION", "MEC:R62:DRL:02B" )
epicsEnvSet( "IOC_PV", "MEC:USR:IOC:BHC")
epicsEnvSet( "IOCSH_PS1", "ioc-mec-userBhc> " )
epicsEnvSet( "BHC", "bhc-mec-03")
< envPaths
cd( "../.." )

# Run common startup commands for linux soft IOC's
< /reg/d/iocCommon/All/pre_linux.cmd

# Add coupler
# Bx9000_Coupler_Add( UINT8 * cplrname, UINT8 * ipaddr, UINT8 * init_string)
Bx9000_Coupler_Add( "$(BHC)", "172.21.45.130", 0 )

# Add terminals to the coupler
# Bx9000_Terminal_Add( UINT8 * cplrname, UINT16 slot, UINT8 * btname, UINT8 * init_string)
Bx9000_Terminal_Add("$(BHC)",  1, "KL2512", 0)
Bx9000_Terminal_Add("$(BHC)",  2, "KL2512", 0)
Bx9000_Terminal_Add("$(BHC)",  3, "KL2808", 0)
Bx9000_Terminal_Add("$(BHC)",  4, "KL3162", 0)
Bx9000_Terminal_Add("$(BHC)",  5, "KL3162", 0)

Bx9000_Terminal_Add("$(BHC)",  6, "KL4132", 0)
Bx9000_Terminal_Add("$(BHC)",  7, "KL4132", 0)
Bx9000_Terminal_Add("$(BHC)",  8, "KL4132", 0)
Bx9000_Terminal_Add("$(BHC)",  9, "KL4132", 0)

Bx9000_Terminal_Add("$(BHC)",  10, "KL3404", 0)
Bx9000_Terminal_Add("$(BHC)", 11, "KL3404", 0)

Bx9000_Terminal_Add("$(BHC)", 12, "KL3312", 0)
Bx9000_Terminal_Add("$(BHC)", 13, "KL3312", 0)

Bx9000_Terminal_Add("$(BHC)", 14, "KL3204", 0)
Bx9000_Terminal_Add("$(BHC)", 15, "KL3204", 0)
Bx9000_Terminal_Add("$(BHC)", 16, "KL2124", 0)

Bx9000_Terminal_Add("$(BHC)", 17, "KL9010", 0)

# Register all support components
dbLoadDatabase("dbd/userBhc.dbd")
userBhc_registerRecordDeviceDriver(pdbbase)

# Load record instances
dbLoadRecords( "db/iocAdmin.db",			"IOC=$(IOC_PV)" )
dbLoadRecords( "db/save_restoreStatus.db",	"IOC=$(IOC_PV)" )
dbLoadRecords( "db/Bx9000.db", "COUPLER=$(BHC),COUPLER_LOC=MEC:R62:BHC:02B")

dbLoadRecords("db/mecKL2512.db", "COUPLER=$(BHC),SLOT=1,SIG1=MEC:USR:CIL:1,SIG2=MEC:USR:CIL:2" )
dbLoadRecords("db/mecKL2512.db", "COUPLER=$(BHC),SLOT=2,SIG1=MEC:USR:CIL:3,SIG2=MEC:USR:CIL:4" )
dbLoadRecords("db/mecKL2808.db", "COUPLER=$(BHC),SLOT=3,SIG1=MEC:USR:DOUT:1,SIG2=MEC:USR:DOUT:2,SIG3=MEC:USR:DOUT:3,SIG4=MEC:USR:DOUT:4,SIG1=MEC:USR:DOUT:5,SIG1=MEC:USR:DOUT:6,SIG1=MEC:USR:DOUT:7,SIG1=MEC:USR:DOUT:8" )
dbLoadRecords("db/mecKL3162.db", "COUPLER=$(BHC),SLOT=4,SIG1=MEC:USR:AIN:1,SIG2=MEC:USR:AIN:2" )
dbLoadRecords("db/mecKL3162.db", "COUPLER=$(BHC),SLOT=5,SIG1=MEC:USR:AIN:3,SIG2=MEC:USR:AIN:4" )

dbLoadRecords("db/mecKL4132.db", "COUPLER=$(BHC),SLOT=6,SIG1=MEC:USR:AOUT:1,SIG2=MEC:USR:AOUT:2" )
dbLoadRecords("db/mecKL4132.db", "COUPLER=$(BHC),SLOT=7,SIG1=MEC:USR:AOUT:3,SIG2=MEC:USR:AOUT:4" )
dbLoadRecords("db/mecKL4132.db", "COUPLER=$(BHC),SLOT=8,SIG1=MEC:USR:AOUT:5,SIG2=MEC:USR:AOUT:6" )
dbLoadRecords("db/mecKL4132_MMV.db", "COUPLER=$(BHC),SLOT=9,SIG1=MEC:VS2:MMV:01,SIG2=MEC:VS2:MMV:02" )

dbLoadRecords("db/mecKL3404.db", "COUPLER=$(BHC),SLOT=10,SIG1=MEC:USR:AIN:5,SIG2=MEC:USR:AIN:6,SIG3=MEC:USR:AIN:7,SIG4=MEC:USR:AIN:8" )
dbLoadRecords("db/mecKL3404.db", "COUPLER=$(BHC),SLOT=11,SIG1=MEC:USR:AIN:9,SIG2=MEC:USR:AIN:10,SIG3=MEC:USR:AIN:11,SIG4=MEC:USR:AIN:12" )

dbLoadRecords("db/mecKL3312.db", "COUPLER=$(BHC),SLOT=12,SIG1=MEC:USR:TC:1,SIG2=MEC:USR:TC:2" )
dbLoadRecords("db/mecKL3312.db", "COUPLER=$(BHC),SLOT=13,SIG1=MEC:USR:TC:3,SIG2=MEC:USR:TC:4" )

dbLoadRecords("db/mecKL3204.db", "COUPLER=$(BHC),SLOT=14,SIG1=MEC:TC1:MMS:10:RAW_TEMP,SIG2=MEC:TC1:MMS:11:RAW_TEMP,SIG3=MEC:TC1:MMS:12:RAW_TEMP,SIG4=MEC:TC1:MMS:13:RAW_TEMP" )
dbLoadRecords("db/mecKL3204.db", "COUPLER=$(BHC),SLOT=15,SIG1=MEC:USR:STC:5,SIG2=MEC:USR:STC:6,SIG3=MEC:USR:STC:7,SIG4=MEC:USR:STC:8" )
dbLoadRecords("db/mecKL2124.db", "COUPLER=$(BHC),SLOT=16,SIG1=MEC:USR:DOT:1,SIG2=MEC:USR:DOT:2,SIG3=MEC:USR:DOT:3,SIG4=MEC:USR:DOT:4" )


dbLoadRecords("db/XRTS_motor_stage_temp.db")
dbLoadRecords( "db/$(IOC)-hist.db" )

# Setup autosave
set_savefile_path( "$(IOC_DATA)/$(IOC)/autosave" )
set_requestfile_path( "$(TOP)/autosave" )
save_restoreSet_status_prefix( "$(IOC_PV):" )
save_restoreSet_IncompleteSetsOk( 1 )
save_restoreSet_DatedBackupFiles( 1 )
set_pass0_restoreFile( "$(IOC).sav" )
set_pass1_restoreFile( "$(IOC).sav" )

# Initialize the IOC and start processing records
iocInit()

# Start autosave backups
create_monitor_set( "$(IOC).req", 5, "IOC=$(IOC_PV)" )

# All IOCs should dump some common info after initial startup.
< /reg/d/iocCommon/All/post_linux.cmd
