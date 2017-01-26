#!/bin/bash

#####			####
##{chk -f fpath | -u user}## 
####			####

### chk -f fpath ###
if [ "$1" = "-f" ]
then
	# validate that fpath was entered #
	fpath=${2:?ERROR. Please enter valid filepath (chk -f FILEPATH)}
	# Valdate that fpath exists #
	if [ -e "$fpath" ]
	then
	echo -n "$fpath - " 
		# check whether the file is a symbolic link, dir, reg file, or unknown #
		
		if [ -L "$fpath" ]
		then 
			echo "symbolic link"
		elif [ -f "$fpath" ]
		then
			echo "Regular file"
		elif [ -d "$fpath" ]
		then
			echo "This file is a directory!"
		else 
			echo "Unknown File Path! please enter a valid file path!"
		fi
		### chk the permissions of the filepath ###
		echo -n " has permissions: "
		if [ -r "$fpath" ]
		then
			echo -n "read "
		elif [ -x "$fpath" ]
		then
			echo -n "executable "
		elif [ -w "$fpath" ]
		then
			echo -n "writable "
		fi
	else 
		echo "$fpath Does not exist"
		exit 1
	fi 
elif [ "$1" = "-u" ]
then 
	# validate user input
	user=${2:?Error. Please input a username chk -u user}
	# does user exist 
	if grep "^$user:" /etc/passwd > /dev/null 
	then
		# list user info #
		echo $user home directory is: $( grep "^$user:" /etc/passwd | cut -d: -f6 )
		# chk to see if user is logged in 
		if who | grep "^$user " > /dev/null
		then 
			echo "$user is currently logged on"
		else 
			echo " was last logged on at $( last "$user" | head -1 | sed 's/  */ / g' | cut -d " " -f4- )"
		fi
	else
		echo "Could not find user named $user"
		exit 1
	fi
else 
	echo "error: enter either (chk -f) or (chk -u)"
	exit 1
fi
