#/bin/bash

for i in `find . -name "*.ui"`; do
	# from intltool-extract
	for j in "label" "title" "text" "format" "copyright" "comments" "preview_text" "tooltip" "message" ; do
		grep -s "\<property name\=\"$j\"" $i | grep -v "translatable\=\"yes" | grep -v gtk\- ;
		if [ "$?" -eq 0 ] ; 
			then echo "Source: $i^";
		fi
	done
done
