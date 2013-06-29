#!/bin/bash

#Developer: Raphael Klein - http://austrianmultimedia.at/
#This script checks if one of my Vatsim Friends is online and if yes, it sends me an e-mail

for line in `grep "url0=" status.txt | cut -c6-`; do
	DATA=$(curl -s $line)
	if [ -z "$DATA" ]
	then
		echo "No new server found!" >> getVatsimOnlineStatusById.log
	else
		echo $line > currentServer.txt
		break
	fi
done