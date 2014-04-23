#/bin/bash
# langspell.sh - spell check .lang files used for mozilla website localization
# This software is in the public domain

# If no parameter given, check all lang files
if [ "$1" == "" ] ; then 
	files=`find . -name "*.lang"`
else
# Or check only the parameter
	files="$1"
fi

for i in ${files[@]}; do
	# Make a note of the file name, useful when batch checking
	echo "Checking file: $i"
	grep -v -e "^#" -e "^;" "$i" | hunspell -d  hu_HU -l | sort -u | pr -3at;
done

