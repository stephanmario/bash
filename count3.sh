#!/bin/bash
########### This is a bash counting program #########

read -p "Enter a number to start at: "  myNum

read -p "Enter a number to count by: " counter

while [ $myNum -le 100 -a $myNum -ge 0 ]
	do
		let myNum+=$counter
		echo $(( $myNum - $counter ))
	done
