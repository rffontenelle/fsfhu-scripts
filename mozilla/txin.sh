#!/bin/bash

# Source the config file that contains the working directory names
. ~/.config/moz2tx.cfg

cd $MOZTXDIR;

for j in "dtd" "properties"; do
	case "$j" in
	 "dtd")
		TYPE="DTD";
	;;
	 "properties")
		TYPE="MOZILLAPROPERTIES";
	;;
	esac
	for i in `find mozilla-en/ -name "*$j" | grep -v -f ~/.config/txin-blacklist.cfg`; do 
		FILE=`echo $i | cut -d "/" -f "2-"`;
		RES=`echo $i | cut -d "/" --output-delimiter="_" -f "2-" | tr . _`;
		tx set --auto-local -r mozilla-"$LL"."$RES" "mozilla-<lang>/$FILE" --source-lang en -t "$TYPE" --execute;
	done
done

