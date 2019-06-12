#!/bin/#!/usr/bin/env bash

function grab_hash(){
	TEMP=($(tail -n 1 $1))
	HASH=${TEMP[3]}
	echo $HASH
}


HOST_LIST=$(ls sample*)
echo This is the host list $HOST_LIST

PRIMARY_HASH=$(grab_hash $HOST_LIST[0])
echo This is the primary hash $PRIMARY_HASH

# Hash should always be the fourth element, aka 4 - 1
#echo ${arr[3]}

#echo "Using primary hash of $PRIMARY_HASH"
for host in $HOST_LIST
do
	HASH=$(grab_hash $host)
	if [ $HASH == $PRIMARY_HASH ]
	then
		echo "\033[1;32m$host - $HASH - Hash Match\033[0m"
	else
		echo "\033[1;31m$host - $HASH - Hash mismatch\033[0m"
	fi
done
