#!/bin/bash


if [ "$(id -u)" != "0" ]
then
	echo "Make sure you start this script with root privileges."
	exit
fi

mv runner.sh runner
cp runner /usr/bin/
chmod 755 /usr/bin/runner

