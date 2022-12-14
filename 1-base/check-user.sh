#!/bin/bash
if [ $UID -ne 0 ]; then
	echo "Non root user"
else
	echo root user
fi

if test $UID -ne 0:1
then
	echo Non root user, Plaease run as root.
else
	echo Root user
fi
