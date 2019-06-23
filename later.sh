#!/bin/bash
#`later` command version 2019.6.23
#Proper usage is:
#late [options] <time> command to execute
#Example:
#late 1h ./start.py

#Checks the options
#The options currently are:
#-b or --background = Background mode, where you can continue use of your console until your script runs
#-q or --nohangup = Nohup mode (Can be used with or without -b) will send the command through nohup <command>, but will not put the wait itself in nohup
#-h or --help = Hmm, what could it possibly be??????? I need help!
#-v or --version = List version

#Init arg variables
backgroundSel="False"
nohupSel="False"
helpSel="False"
versionSel="False"

#Evaluate the options
while [ -n "$1" ]; do
	case "$1" in
	-b|--background) backgroundSel="True" ;;
	-q|--nohangup) nohupSel="True" ;;
	-h|--help) helpSel="True" ;;
	-v|--version) versionSel="True" ;;
	*) break ;;
	esac
	shift
done

#Help page
if [[ "$helpSel" = "True" ]]; then
	printf "Usage: late [-bqhv] <time> <commands>\n\n-b or --background will puts the command in the background\n-q or -nohangup puts the command (but not the wait itself) in a nohup command ('man nohup' for info)\n-h or --help displays this page\n\nThe time to wait is passed as a standard 'sleep' command, so whatever would or would not work there will behave the same here ('man sleep' for info)\nThe general way to go about it is <number><s,m,h,d>.\nFor example: 10s will wait for 10 seconds,2m will wait for two minutes, 3h will wait for three hours, and 23d will wait for 23 days.\n"
	exit 0
fi

#Print version
if [[ "$versionSel" = "True" ]]; then
	echo "later version 2019.6.23"
	exit 0
fi

#Check for minimum parameters
if [[ "$#" -lt 2 ]]; then
	echo "Illegal parameters (Too few)"
	exit 1
fi

#Assigns the sleep time to a variable and then remove it from the args
sleeptime=$1
shift

#Sets the time variable and prints it to the console and logs
timedate=`date`
exectime="'$*' will start in "$sleeptime" beginning at "$timedate""
echo $exectime
echo $exectime >> ""$HOME"/.late.log"

#The actual sleep and execution, with options for nohup or regular use.
if [[ $backgroundSel = "False" ]]; then
	while true
	do
		sleep $sleeptime
		if [[ $nohupSel = "True" ]]; then
			nohup $*
		else
			$*
		fi
		break
	done
fi
if [[ $backgroundSel = "True" ]]; then
	while true
	do
		sleep $sleeptime
		if [[$nohupSel = "True" ]]; then
			nohup $*
		else
			$*
		fi
		break
	done &
fi
exit 0;

