#!/bin/bash
#check session#
dpkg -l | grep net-tools > /dev/null
if [[ -z $? ]]
then 
	apt update && apt install net-tools
fi

netstat -tunlp | grep $1 > /dev/null
main=$(echo $?)
if [[ -z $1 ]]
then	
	netstat -tunlp | awk '{print $4,">>>>>>",$7}'
elif [[ $main != 0 ]]
    then
	echo "Port $1 Not Found !!"
    else
	echo "Port $1 Berjalan Normal !!"
	
fi

