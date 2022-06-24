#!/bin/bash


if [ "$(id -u)" != "0" ]
then
	echo "Make sure you start this script with root privileges."
	exit
fi

cp runner.sh /usr/bin/runner
chmod 755 /usr/bin/runner

