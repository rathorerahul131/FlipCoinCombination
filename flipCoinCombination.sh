#!/bin/bash

echo "Welcome to the Flip Coin Simulation Game"

echo "Enter the no. of flips"
read flips

echo "Enter the no of coins either 1 or 2 "
read coins

noOfHead=0 #variable to store the count of Head wins
noOfTail=0 #variable to store the count of Tail wins
declare -A TossStore
if [[ $coins -eq 1 ]]
then

	for (( i=0;i<$flips;i++ ))
	do
		toss=$(( RANDOM%2 )) # toss will randomly store either 0 or 1
	
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

elif [[ $coins -eq 2 ]]
then

	echo "you choosed Two coins"
	max=0
	winCombo=""
	for (( i=0;i<$flips;i++ ))
	do 
	combo=""
		for (( j=0;j<$coins;j++ ))
		do
			toss=$(( RANDOM%2 ))
			if [[ $toss -eq 0 ]]
			then
				combo=$combo"T"
			else
				combo=$combo"H"

			fi
		done

	TossStore["$combo"]=$(( ${TossStore["$combo"]} + 1 ))
	if [[ $max -lt ${TossStore["$combo"]} ]]
	then
		max=${TossStore["$combo"]}
		winCombo="$combo"
	fi

	done

	echo ${!TossStore[@]}
	echo ${TossStore[@]}

	echo "The winning Combination is $winCombo It occurred $max times"
	
else
	echo "Enter either 1 or 2 coins only"

fi