#!/bin/bash
#Installs 'later' program to /usr/local/bin

#Make sure it is run as root
if [[ $USER -ne "root" ]]; then
	echo "Must run as root!"
	exit 1

#If it is being run as root, check to make sure
#the user understands what is happening.
else
	echo "The program 'later' will be installed to /usr/local/bin/"
	read -r -p "Are you okay with that? [y/n] " response
	case "$response" in
		[yY][eE][sS]|[yY])
			echo "Copying later.sh to /usr/local/bin/later"
			cp later.sh /usr/local/bin/later
			echo "Making executable"
			chmod +x /usr/local/bin/later
			echo "Done!"
			echo " "
			later -v
			exit 0
			;;
		*)
			echo "Cancelling install..."\
			exit 0
			;;
	esac
fi
