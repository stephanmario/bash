#!/bin/bash
########### This is a bash counting program #########

echo "Hello, Please enter a number between 1-100: "
read myNum
echo "What would you like to count by: "
read counter

if [ $myNum -ge 1 -a $myNum -le 100 ]
	then
		for i in $(seq $myNum $counter 100)
			do
				echo $i
			done
fi
