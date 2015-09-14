#!/bin/bash

#Check for essential programs

if [ "$#" -ne 2 ]
then
  echo "Usage: [Server address] [Port Num] "
  exit 1
fi
echo "$1"
echo "$2"
if hash autossh 2>/dev/null; then
        echo "Found autossh"
	sleep 1
    else
        echo "Couldn't find autossh!"
	sleep 2
	echo "Installing it"
	sudo apt-get install autossh
fi
sleep 2
 echo "Connecting to server"
autossh -M 20000 -f -N -D 9000 "$1" -p "$2"
RESULT=$?
if [ $RESULT -eq 0 ]; then
 echo "Success! Connected to server"
else
 echo "Having problems check the server address and port"
fi
sleep 2
 echo "Firefox will start in proxy mode in 2 seconds time!"
sleep 2
setsid firefox -p "proxt" >/dev/null 2>&1 < /dev/null &
