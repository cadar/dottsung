#!/bin/bash

# sh load.sh 4 100 second 100 100 > lfe_load.xml

STEPS=$1
DUR=$2
UNIT=$3
RATE=$4
INC=$5
COUNT=1
echo \<load\> 

let STEPS=STEPS+1 
while [ $COUNT -lt $STEPS ]; do 
  printf "   <arrivalphase phase=\"$COUNT\" duration=\"$DUR\" unit=\"$UNIT\">\n "
  INT=`echo 1/${RATE} | bc -l `
  let RATE=$RATE+$INC
  printf "     <users interarrival=\"%1.5f\" unit=\"$UNIT\"></users>\n" $INT
  printf "   </arrivalphase>\n"
  let COUNT=COUNT+1 
done

echo \</load\> 
