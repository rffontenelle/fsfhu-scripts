#!/bin/bash
wget -q -O /tmp/index.html https://l10n.gnome.org/module/

for i in `grep /module/[[:alnum:]] /tmp/index.html  | cut -d / -f3 `; do
	git ls-remote "https://git.gnome.org/browse/$i" &> /dev/null;
	if [ $? -ne 0 ]; then
		echo "*** $i module is not there ***" ;
	fi 
done
