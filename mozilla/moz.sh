#!/bin/bash

while getopts 'p u' OPTION
	do
	  case $OPTION in
	  p)	for i in `find . -name *.dtd`; do
			mozprep.pl <$i >$i.new;
			mv $i.new $i;
			done
		;;
	  u)	for i in `find . -name *.dtd`; do
			mozunprep.pl <$i >$i.new;
			mv $i.new $i;
			done
		;;
	  ?)	echo "Usage: moz.sh -p|-u"
		echo "-p: Comment out shortcut keys before translation"
		echo "-u: Uncomment shortcut keys after translation"
		;;
	esac
done
