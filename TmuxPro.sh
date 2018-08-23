#!/bin/bash

if [ "$TERM" = "screen" ];
then
	echo " tyep Controle B then D to exit session "
#	tmux ls
	echo " "
#	echo $TERM
	exit
else

while(true)
do

clear

echo " "
echo " "
echo " /// === TMUX PRO === \\\ "
echo " "
tmux ls
echo " "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " --- c = creat session --- k = kill session --- 0-9 attach session --- X = exit "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

#echo $INPUT
#echo $NUMber
# input

read -p  "input selection: " INPUT NUMber iniy

case "$INPUT" in

	c) # creat new session
		if [ -z $NUMber ]	# creat a session with a name if provided one
			then
				tmux new-session -d
			else
				tmux new-session -d -s $NUMber
			fi

#		if [ -z $iniy ]	# if anything after session name, attach to that one.
#			then
#
				echo "oops"
#			else
				tmux a -t $NUMber
#			fi
		;;

	k) # kill session
		if [ -z $NUMber ]	# if session name provided, kill that one, else ask witch one to kill
			then
				read -p "witch terminal to kill? : " session
				tmux kill-session -t  $session
			else
				tmux kill-session -t $NUMber
			fi
		;;
	x) # exit loop
		break
		;;

	*) # join session
		 tmux a -t $INPUT
		;;
esac

done

fi
