#!/bin/bash 
######    Usage: caesar.sh -e "encrypt" | -d "decrypt"    #######
re='^[A-Za-z]+$'

if [ "$1" = "-e" ]
then
	
	if [[ $2 =~ $re ]]
	then
		echo $2 | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'

	elif [ -z $2 ]
	then
		echo "Usage: caesar.sh -e | -d <plain/cipher Text>"

	else
		echo "Error: Text must be a valid Alphabetical Char"
		exit 1
	fi
elif [ -z "$1" ]
then
	echo "Error. Usage: caesar.sh -e <encryptText> | -d <decryptText> "

elif [ "$1" = "-d" ]
then
	if [[ $2 =~ $re ]]
	then
		echo $2 | tr '[N-ZA-Mn-za-m]' '[A-Za-z]'
	
	elif [ -z $2 ]
	then
		echo "Error! Usage: caesar.sh -e <plainText> | -d <ciphertext> "
	else
		echo "Error: Cipher text must be a valid A-z char"
		exit 1
	fi
else 
	echo "Error, Usage: Usage: caesar.sh -d | -e <plaintext> | <ciphertext>"
	exit 0
fi








#echo $2 | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
