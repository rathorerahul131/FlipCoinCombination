#!/bin/bash

echo "Welcome to the Flip Coin Simulation Game"

echo "Enter the no. of flips"
read flips

echo "Enter the no of coins"
read coins

noOfHead=0 #variable to store the count of Head wins
noOfTail=0 #variable to store the count of Tail wins

declare -A TossStore

#max is variable to store max count of combinations
max=0 

#winCombo is the varibale to store the winning Combination
winCombo=""

#loop till number of flips required

for (( i=0;i<$flips;i++ )) 
do 
#combo variable is to store the combination string 
combo=""
	for (( j=0;j<$coins;j++ )) #it will Create the combination 
	do
		toss=$(( RANDOM%2 ))
		if [[ $toss -eq 0 ]]
		then
			combo=$combo"T"
			((noOfTail++))
		else
			combo=$combo"H"
			((noOfHead++))

		fi
	done

#Increasing the count of particular Combination and storing in the dictionary

TossStore["$combo"]=$(( ${TossStore["$combo"]} + 1 ))

#condition to get the maximum occured combination

if [[ $max -lt ${TossStore["$combo"]} ]]
then
	max=${TossStore["$combo"]}
	winCombo="$combo"
fi
done

echo "The Combinations are ${!TossStore[@]}"
echo "The number of times each combination occured are ${TossStore[@]}"

#Sorting the Occurrences
echo "Sorted results in Ascending order:"
for k in "${!TossStore[@]}"
do
  echo $k ' - ' ${TossStore["$k"]}
done | sort -n -k3

#Calculating the percentage of win
winPercentage=`echo "$(( $max * 100 / $flips ))"`

echo "The winning Combination is $winCombo" 
echo "It occurred $max times ie $winPercentage percent"




