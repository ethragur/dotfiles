#!/usr/bin/bash


if [ "$(pidof $1)" ]
then
	pkill $1
else
	$1
fi

