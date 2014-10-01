#!/bin/bash

doInit=1

while [ 1 -lt 2 ]
do
	make thesis
	delta=1
	if [ -f thesis.pdf ] && [ -f main.pdf ]
	then
		modsecs1=$(date --utc --reference=thesis.pdf +%s)
		modsecs2=$(date --utc --reference=main.pdf +%s)
		delta=$(($modsecs2-$modsecs1))
	fi
	if [ $delta -gt 0 ]; then
		cp main.pdf thesis.pdf
		created=1
	fi
	if [ $doInit -gt 0 ]; then
		okular thesis.pdf &
		doInit=0
	fi
	sleep 1
done
