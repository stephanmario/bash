#!/bin/bash
########### This is a bash counting program #########

read -p "Enter a number to start at: "  myNum

read -p "Enter a number to count by: " counter

if [ $myNum -ge 0 -a $myNum -le 100 ] || [ $counter -ge 1 -a $counter -le 5 ]
	then
	i=0
	while [ $i -lt 100 ]
		do
			let i+=counter
			echo $
		done
elif [ $myNum -lt 0 -o $myNum -gt 100 ]
then
	echo "Number must be between 0-100, Quitting."
	exit 1
elif [ $counter -lt 1 -o $counter -gt 5 ]
then
	echo "CountBy number must be 1-5. Quitting!"
	exit 1
fi
