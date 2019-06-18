# All require need to have version number 
require julabof25hl,develop 
require stream,2.8.8
require asyn,4.33.0

#@field PORTNAME
#@type STRING
#The port name. Should be unique within an IOC.
#
#@field IPADDR
#@type STRING
#IP or hostname of the TCP endpoint.
#
#@field IPPORT
#@type INTEGER
#Port number for the TCP endpoint.
#
#@field PREFIX
#@type STRING
#Prefix for EPICS PVs.


# Set parameters when not using auto deployment
epicsEnvSet(PORTNAME, "PortA")
epicsEnvSet(IPADDR, "10.4.8.104")
epicsEnvSet(IPPORT, "4003")
epicsEnvSet(PREFIX, "test")
epicsEnvSet(STREAM_PROTOCOL_PATH, "$(julabof25hl_DIR)db")
epicsEnvSet(TEMPSCAN, "10")
epicsEnvSet(SETPNAME, "setpname")
epicsEnvSet(SETPNR, "11")

#Use for Kameleon sim
#epicsEnvSet(IPADDR, "127.0.0.1") #For use with Chameleon simulator
#epicsEnvSet(IPPORT, "9999")

#Specifying the TCP endpoint and port name
drvAsynIPPortConfigure("$(PORTNAME)", "$(IPADDR):$(IPPORT)")

#Load your database defining the EPICS records
#dbLoadTemplate(JULABOF25HL.substitutions, "P=$(PREFIX), PORT=$(PORTNAME), ADDR=$(IPPORT)")
iocshLoad("$(julabof25hl_DIR)/julabof25hl.iocsh", "P=$(PREFIX), PORT=$(PORTNAME), ADDR=$(IPPORT), TEMPSCAN=$(TEMPSCAN), SETPNAME=$(SETPNAME), SETPNR=$(SETPNR)")

iocInit()
