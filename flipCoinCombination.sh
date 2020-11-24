#!/bin/bash

echo "Welcome to the Flip Coin Simulation Game"

toss=$((RANDOM%2)) # toss will randomly store either 0 or 1

#condition to check who wins
if [[ $toss -eq 0 ]]
then
	echo "Tail Wins" 
else
	echo "Head Wins"
fi