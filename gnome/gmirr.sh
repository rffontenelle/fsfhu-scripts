#!/bin/bash

# Copyright (c) 2008 Istvan Nyitrai <sianis@gmail.com>
# Copyright (c) 2008 Gabor Kelemen <kelemeng@gnome.hu>
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
#
# gmirr.sh - download all po/pot templates from l10n.gnome.org

# Current version
DEVVERSION=3-12

# What to download by default?
VERSIONS=$DEVVERSION

# Array of previous versions, good if you want to build compendium
OLDVERSIONS=(3-0 3-2 3-4 3-6 3-8 3-10)

# Other projects
OTHERS=(gnome-extras gnome-infrastructure gnome-office external-deps gnome-gimp gnome-extras-stable freedesktop-org)

# More helpful defaults welcome :)
TARGET=~/gnome-translations

# Default invocation of wget
WGET="wget -m -P ./.tarballs/ --cut-dirs=2 -nH -q"

# tarballs are timestamped
DATE="`date -u +%Y-%m-%d`"

while getopts 'd:l:f' OPTION
	do
	  case $OPTION in
	  d)	if [ -w "$OPTARG" ] ; then
			TARGET="$OPTARG"
		else
			# trying to create target dir
			if `mkdir -p $OPTARG`; then
				# great success! :)
				TARGET="$OPTARG"
			else
				echo "Cannot write or create directory"
				exit 1
			fi
		fi
			;;
	  l)	LINGUA="$OPTARG"
		wget --spider -q https://l10n.gnome.org/languages/$LINGUA
		if [ "$?" -ne 0 ] ; then
			echo "Seems that there is no team for this language on https://l10n.gnome.org/languages"
		exit 1
		fi
		if [ $TARGET = ~/gnome-translations ] ; then
			# don't put the files to the default dir
			TARGET="$TARGET-$LINGUA"
		fi
	;;
	  f)	VERSIONS=("${OLDVERSIONS[@]}" "$DEVVERSION")
			;;
	  ?)		echo "Usage: gmirr.sh -f -l LANG -d DIR"
			echo "Download all po/pot files from l10n.gnome.org"
			echo "DIR: the target directory of the download, default: ~/gnome-translations"
			echo "LANG: the code of the language. The default is taken from \$LANG"
			echo "-f: Use this if you want to download old releases too (3.0 - 3.LASTRELEASE)"
			exit 2
			;;
	  esac
done
	shift $(($OPTIND - 1))

# No language code given in argument
# Let's guess which language you want
if [ -z "$LINGUA" ]; then 
	# First let's search for the language code containing the country code, e.g. pt_BR
	LINGUA=`echo $LANG | cut -d . -f1`
	wget --spider https://l10n.gnome.org/languages/$LINGUA
	# If it failed to find the language_country code, then search for the short version most languages use, e.g. pt
	if [ "$?" -ne 0 ] ; then
		LINGUA=`echo $LANG | cut -d _ -f1`
		wget --spider https://l10n.gnome.org/languages/$LINGUA
		# No luck with guessing, bailing out
		if [ "$?" -ne 0 ] ; then
			echo "Failed to guess a correct language code based on \$LANG."
			echo "Use -l to specify a valid code, see"
			echo "https://l10n.gnome.org/languages/ for the team list"
		exit 1
		fi
	fi
fi

# create some default dirs, if not exist
if [ ! -d "$TARGET"/development/docs ] ; then 
	mkdir -p "$TARGET"/development/docs;
fi

if [ ! -d "$TARGET"/templates ] ; then 
	mkdir -p "$TARGET"/templates;
fi

# And the actual fun starts...
cd "$TARGET"
for VER in ${VERSIONS[@]}
do
	# where to put your files?
	if [ "$VER" = "$DEVVERSION" ]; then 
		OUT=development
	else
		OUT=old/$VER
		if [ ! -d $OUT ] ; then
			mkdir -p $OUT/docs
		fi
	fi

	echo "Downloading po archive of Gnome $VER"
	$WGET https://l10n.gnome.org/languages/$LINGUA/gnome-$VER/ui.tar.gz
	echo "extracting..."
	tar -xzf ./.tarballs/gnome-$VER/ui.tar.gz -C $OUT

	echo "Downloading doc archive of Gnome $VER"
	$WGET https://l10n.gnome.org/languages/$LINGUA/gnome-$VER/doc.tar.gz
	echo "extracting..."
	tar -xzf ./.tarballs/gnome-$VER/doc.tar.gz -C $OUT/docs

	if [ "$VER" = "$DEVVERSION" ]; then 
		# move ui templates to a separate directory
		if [ -n "`find development/ -maxdepth 1 -name *pot`" ] ; then
			mv ./development/*pot templates/
		fi

		# and move doc templates to the separate directory's subdirectory
		if [ ! -d templates/gnome-$DEVVERSION-docs ] ; then 
			mkdir templates/gnome-$DEVVERSION-docs;
		fi
		if [ -n "`find development/docs/ -maxdepth 1 -name *pot`" ] ; then
			mv ./development/docs/*pot templates/gnome-$DEVVERSION-docs
		fi
	else
		# we don't really want to bother with old pot files
		if [ -n "`find $OUT -maxdepth 1 -name *pot`" ] ; then
			rm $OUT/*pot
		fi
	fi
done

#Download other projects
for ITEM in ${OTHERS[@]}
do
	echo "Downloading po archive of $ITEM"
	$WGET https://l10n.gnome.org/languages/$LINGUA/$ITEM/ui.tar.gz

	# Create a dir for this and for the existing docs
	if [ ! -d $ITEM ] ; then 
		mkdir -p $ITEM/docs;
	fi

	echo "extracting..."
	tar -xzf ./.tarballs/$ITEM/ui.tar.gz -C $ITEM

	# Move ui templates to a separate directory
	if [ -n "`find $ITEM -maxdepth 1 -name *pot`" ] ; then
		mv ./$ITEM/*pot templates/
	fi

	echo "Downloading doc archive of $ITEM"
	$WGET https://l10n.gnome.org/languages/$LINGUA/$ITEM/doc.tar.gz

	echo "extracting..."
	tar -xzf ./.tarballs/$ITEM/doc.tar.gz -C $ITEM/docs

	# Create dir for the pot files
	if [ ! -d templates/$ITEM-docs ] ; then 
		mkdir templates/$ITEM-docs;
	fi

	# Move these too
	if [ -n "`find $ITEM/docs -maxdepth 1 -name *pot`" ] ; then
		mv ./$ITEM/docs/*pot templates/$ITEM-docs
	fi

	# do not create several dirs with the gnome-* names
	OLDNAME=$ITEM
	SHORTNAME=`echo $ITEM | sed -e 's/gnome-//'`
	rm -rf $SHORTNAME
	mv $OLDNAME $SHORTNAME;
done

