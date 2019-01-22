#!/bin/sh

# ================================
# Copyright (C) 2018 siwind <yinqingwang@gmail.com>
# ipset shell script 
# Usage: load ipset from txt file
#        load_ipset.sh   [filename]  [ipset-name]
#
# ================================
#FILENAME=$1
#SETNAME=$2

#FILENAME=../cmcc.txt

run()
{
FILENAME=$1
SETNAME=$2

LNUM=`cat $FILENAME | wc -l`

#echo "LINE NUMBER = $LNUM"

LNUM=$(($LNUM * 4))

#echo "LINE NUMBER = $LNUM"


ipset create $SETNAME hash:net hashsize $LNUM

while read -r line
do
	SCH=${line:0:1}
	if [[ "$SCH" = "#" || -z "$line" ]]; then 
		continue
	fi
	#echo "start=$SCH, add CHINA-CMCC  $line"
	ipset add $SETNAME $line
done < $FILENAME

}

usage()
{
	echo "Usage: $0  [filename]  [ipset-name]"
}
#----------------------------------------------------#
# shell entry to exec!
#
#----------------------------------------------------#
main()
{

FILENAME=$1
SETNAME=$2


#echo "1=$1, 2=$2"

if [ -z "$SETNAME" ]; then
	usage $@
	exit
fi

if [ ! -f "$FILENAME" ]; then
	usage $@
	exit
fi

run $FILENAME  $SETNAME
}

# shell entry to start
main $@
