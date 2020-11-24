#!/bin/bash

echo "Welcome to the Flip Coin Simulation Game"

noOfHead=0 #variable to store the count of Head wins
noOfTail=0 #variable to store the count of Tail wins
declare -A TossStore
for ((i=0;i<20;i++))
do
	toss=$((RANDOM%2)) # toss will randomly store either 0 or 1
	
	if [[ $toss -eq 0 ]]
	then	
		TossStore[$i]="T"
		((noOfTail++)) 
	else
		TossStore[$i]="H"
		((noOfHead++))
	fi	
done

echo "Head has won $noOfHead times"
echo "Tail has won $noOfTail times"

echo ${TossStore[@]}

HeadAvg=`awk 'BEGIN{print ('$noOfHead'/21) }'`
TailAvg=`awk 'BEGIN{print ('$noOfTail'/21) }'`

HeadPercent=`awk 'BEGIN{print ('$HeadAvg' * 100)}'`
TailPercent=`awk 'BEGIN{print ('$TailAvg' * 100)}'`

echo "Head Percetage is $HeadPercent"
echo "Tail Percetage is $TailPercent"