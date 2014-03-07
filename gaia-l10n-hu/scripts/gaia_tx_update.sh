#!/bin/bash
set -x

# Source the config file that contains the working directory names
. ~/.config/moz2tx.cfg

cd $GAIA_PREFIX;

for i in `find gaia-l10n-en-US/ -name "*.properties"`; do 
	FILE=`echo $i | cut -d "/" -f "2-"`;
	RES=`echo $i | cut -d "/" --output-delimiter="_" -f "2-" | tr . _`;
	tx set --auto-local -r gaia-l10n-hu."$RES" "gaia-l10n-<lang>/$FILE" --source-lang en-US -t MOZILLAPROPERTIES --execute;
done

# Remove obsolete resources, i.e. files no longer present in mozilla-en
for i in `grep source_file $GAIA_PREFIX/.tx/config | cut -d " " -f 3 `; do
	if [ ! -f $i ]; then 
		RES=`echo $i | cut -d "/" --output-delimiter="_" -f "2-" | tr . _`;
		# Delete resources ruthlessly, i.e. with all existing translations
		tx delete -f -r gaia-l10n-"$LL"."$RES" ;
	fi
done
