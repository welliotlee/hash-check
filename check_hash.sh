#!/bin/#!/usr/bin/env bash

function grab_hash(){
	TEMP=($(tail -n 1 $1))
	HASH=${TEMP[3]}
	echo $HASH
}

TARGET='./sample_log.txt'
RETURN_TAIL=$(tail -n 1 $TARGET)
arr=($RETURN_TAIL)

HASH_LIST="7dc0a97fa57c2c1518fdb2773557a51ba83e961t 7dc0a97fa57c2c1518fdb2773557a51ba83e961c"

PRIMARY_HASH=${arr[3]}

# Hash should always be the fourth element, aka 4 - 1
#echo ${arr[3]}
echo $(grab_hash ./sample_log.txt)
echo $(grab_hash ./sample_log.txt)
if [ $(grab_hash ./sample_log.txt) == "meow" ]
then
	echo Works
else
	echo Fails
fi

#echo "Using primary hash of $PRIMARY_HASH"
for host in $HASH_LIST
do
	if [ $host == $PRIMARY_HASH ]
	then
		echo "\033[1;32m$host - Hash Match\033[0m"
	else
		echo "\033[1;31m$host - Hash mismatch\033[0m"
	fi
done
