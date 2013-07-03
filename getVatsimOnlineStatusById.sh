#!/bin/bash

#Developer: Raphael Klein - http://austrianmultimedia.at/
#This script checks if one of my Vatsim Friends is online and if yes, it sends me an e-mail

cd
cd bin
cd gvosbi

MYDATE="$(date)"
#get data from config file 
CONFIG_FILE=config
if [[ -f $CONFIG_FILE ]]; then
	. $CONFIG_FILE
fi

SERVER=` cat currentServer.txt `
DATA=` curl -s $SERVER `
MYUSERDATA=` echo "$DATA" | grep "$MYUSER" `

if [ -z "$MYUSERDATA" ] 
then
	echo "$MYDATE: $MYUSER is not online" >> getVatsimOnlineStatusById.log
	echo "no" > .onlineStatus.temp
else
<<<<<<< HEAD
	STATUS=` cat .onlineStatus.temp `
	while [ "$STATUS" == "no" ]
	do
		echo "$MYUSERDATA" > mailBody.txt
		mail -s "gvosbi:: One of my vatsim friends is online now!" YOUR EMAIL ADRESS HERE! < mailBody.txt
		echo "yes" > .onlineStatus.temp
	done
=======
	echo "$MYUSERDATA" > mailBody.txt
	mail -s "gvosbi:: One of my vatsim friends is online now!" YOUREMAIL < mailBody.txt
>>>>>>> 42fc587e0a387a1c6b5c454cdcee1d8b6653c216
	echo "$MYDATE: $MYUSER is online: $MYUSERDATA" >> getVatsimOnlineStatusById.log
fi	


