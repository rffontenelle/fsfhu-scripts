#!/bin/bash

for j in "dtd" "properties" "xhtml"; do
#	echo "ma épp: $j";
	case "$j" in
	 "dtd")
		TYPE="DTD";
	;;
	 "properties")
		TYPE="MOZILLAPROPERTIES";
	;;
	 "xhtml")
		TYPE="XHTML";
	;;
	esac
	for i in `find mozilla-en/ -name "*$j" | grep -v -f blacklist.txt`; do 
#		echo "kezd" ;
		FILE=`echo $i | cut -d "/" -f "2-"`;
		RES=`echo $i | cut -d "/" --output-delimiter="_" -f "2-" | tr . _`;
		tx set --auto-local -r mozilla-hu."$RES" "mozilla-<lang>/$FILE" --source-lang en -t "$TYPE" --execute;
#		echo "ez kész: $RES - $FILE"
	done
#	echo "ez kész: $TYPE";
done

