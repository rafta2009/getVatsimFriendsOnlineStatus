#!/bin/bash

#Developer: Raphael Klein - http://austrianmultimedia.at/
#This script checks if one of my Vatsim Friends is online and if yes, it sends me an e-mail

cd
cd bin
cd gvosbi

#get Data-File
DATA=$(curl -s http://data.vattastic.com/vatsim-data.txt)
# DATA=`cat vatsim-data.txt`
MYDATE="$(date)"
#get data from config file 
CONFIG_FILE=config
if [[ -f $CONFIG_FILE ]]; then
	. $CONFIG_FILE
fi

if [ -z "$DATA" ]
then
	echo "$MYDATE: ###### DATEFILE not found" >> getVatsimOnlineStatusById.log
	mail -s "gvosbi:: No Data File Content found!!!" raph@austrianmultimedia.at
else
	MYUSERDATA=` echo "$DATA" | grep "$MYUSER" `
	if [ -z "$MYUSERDATA" ] 
	then
		echo "$MYDATE: $MYUSER is not online" >> getVatsimOnlineStatusById.log
	else
		echo "$MYUSERDATA" > mailBody.txt
		mail -s "gvosbi:: One of my vatsim friends is online now!" raph@austrianmultimedia.at < mailBody.txt
		echo "$MYDATE: $MYUSER is online: $MYUSERDATA" >> getVatsimOnlineStatusById.log
	fi
fi

