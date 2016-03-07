#!/bin/bash

# liedetector.sh - detect differences between the list of 
# translatable modules and the list of actually released ones.

# Copyright (c) 2014, 2016 Gabor Kelemen <kelemeng at ubuntu dot com>

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 2 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 
# 51 Franklin Street, Fifth Floor Boston, MA 02110-1301 USA


# Call the script with the minor GNOME version. Subtract 1 to get the minor version of the RC
let rc="$1-1";

cd /tmp

# Download the list of modules
wget -q https://l10n.gnome.org/languages/C/gnome-3-"$1"/ui/
echo "Checking the module list on https://l10n.gnome.org/languages/C/gnome-3-"$1"/ui/"

# Get the translatable module names list
grep \/module\/[a-z] index.html | cut -d "/" -f3 | sort -u > /tmp/modules.txt

# Download the versions file from the FTP server
wget -q http://ftp.acc.umu.se/pub/GNOME/teams/releng/3."$rc".91/versions
echo "Detecting lies using http://ftp.acc.umu.se/pub/GNOME/teams/releng/3."$rc".91/versions"

# Get the list of released packages
cut -d : -f2 versions | grep -v ^# | sort -u > /tmp/versions.txt 

# What is no longer part of the main GNOME release, but still listed on d-l?
echo "No longer released:"
diff -u  /tmp/modules.txt /tmp/versions.txt | grep ^-[[:alpha:]] | cut -c 2- 

# What is not listed, but contains a po directory in git?
echo "Translatable modules not listed in d-l:"
for i in `diff -u  /tmp/modules.txt /tmp/versions.txt | grep ^+[[:alpha:]] | cut -c 2- `; do
	# Check if there is a po directory in git	
	wget --spider -q https://git.gnome.org/browse/"$i"/tree/po
	# Returns 0 if the URL exists
	if [ "$?" -eq "0" ] ; then
		echo "$i : https://git.gnome.org/browse/"$i"/tree/po";
	fi
done

# Clean up
rm /tmp/index.html /tmp/modules.txt /tmp/versions.txt
