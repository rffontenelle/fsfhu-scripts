#!/bin/bash
cd /tmp
wget http://l10n.gnome.org/languages/C/gnome-3-10/ui/
grep \/module\/[a-z] index.html | cut -d "/" -f3 | sort -u > /tmp/lies.txt
wget http://ftp.acc.umu.se/pub/GNOME/teams/releng/3.9.2/versions
cut -d : -f2 versions | grep -v ^# | sort -u > /tmp/versions.txt 
diff -u  /tmp/lies.txt /tmp/versions.txt
