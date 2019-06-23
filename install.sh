#!/bin/bash
#Installs/Uninstalls 'later' program to/from /usr/local/bin

#Make sure it is run as root
if [[ $USER -ne "root" ]]; then
	echo "Must run as root!"
	exit 1

#Uninstall portion, checks if /usr/local/bin/later exists and asks
#the user if they want to delete it.
elif [[ -f "/usr/local/bin/later" ]]; then
	read -r -p "The 'later' program is already installed, uninstall? [y/n] " response
	case "$response" in
	    [yY][eE][sS]|[yY])
	        echo "Deleting /usr/local/bin/later"
			rm /usr/local/bin/later
			echo "Done"
			exit 0
	        ;;
	    *)
	        echo "If you are certain it is not installed, check /usr/local/bin for conflicting file names."
			exit 0
			;;
	esac

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
