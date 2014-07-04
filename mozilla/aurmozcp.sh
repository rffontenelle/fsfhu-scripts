#!/bin/bash

# Print commands before running them
set -x

# Source the config file that contains the working directory names
. ~/.config/moz2tx.cfg

# Copy translatable files from the repos to this dir
TPREFIX=$MOZTXDIR/mozilla-en

# Remove all the previous files, this is needed for detecting the obsolete files in txin.sh
rm -r $TPREFIX;

mkdir -p "$TPREFIX"/mail/ ;
cp -r "$PREFIX"/comm-aurora/mail/locales/en-US/* "$TPREFIX"/mail/ ;

mkdir -p "$TPREFIX"/other-licenses/branding/thunderbird/ ;
cp -r "$PREFIX"/comm-aurora/other-licenses/branding/thunderbird/locales/en-US/* "$TPREFIX"/other-licenses/branding/thunderbird/ ;

mkdir -p "$TPREFIX"/editor/ui/ ;
cp -r "$PREFIX"/comm-aurora/editor/ui/locales/en-US/* "$TPREFIX"/editor/ui/ ;

mkdir -p "$TPREFIX"/calendar/ ;
cp -r "$PREFIX"/comm-aurora/calendar/locales/en-US/* "$TPREFIX"/calendar/ ;

mkdir -p "$TPREFIX"/chat/ ;
cp -r "$PREFIX"/comm-aurora/chat/locales/en-US/* "$TPREFIX"/chat/ ;

mkdir -p "$TPREFIX"/browser/ ;
cp -r "$PREFIX"/mozilla-aurora/browser/locales/en-US/* "$TPREFIX"/browser/

mkdir -p "$TPREFIX"/dom/ ;
cp -r "$PREFIX"/mozilla-aurora/dom/locales/en-US/* "$TPREFIX"/dom/

mkdir -p "$TPREFIX"/embedding/android/ ;
cp -r "$PREFIX"/mozilla-aurora/embedding/android/locales/en-US/* "$TPREFIX"/embedding/android/

mkdir -p "$TPREFIX"/netwerk/ ;
cp -r "$PREFIX"/mozilla-aurora/netwerk/locales/en-US/* "$TPREFIX"/netwerk/

mkdir -p "$TPREFIX"/security/manager/ ;
cp -r "$PREFIX"/mozilla-aurora/security/manager/locales/en-US/* "$TPREFIX"/security/manager/

mkdir -p "$TPREFIX"/services/sync/ ;
cp -r "$PREFIX"/mozilla-aurora/services/sync/locales/en-US/* "$TPREFIX"/services/sync/

mkdir -p "$TPREFIX"/toolkit/ ;
cp -r "$PREFIX"/mozilla-aurora/toolkit/locales/en-US/* "$TPREFIX"/toolkit/

mkdir -p "$TPREFIX"/mobile/xul/ ;
cp -r "$PREFIX"/mozilla-aurora/mobile/xul/locales/en-US/* "$TPREFIX"/mobile/xul/
cp -r "$PREFIX"/mozilla-aurora/mobile/locales/en-US/* "$TPREFIX"/mobile/

mkdir -p "$TPREFIX"/mobile/android/base/ ;
cp -r "$PREFIX"/mozilla-aurora/mobile/android/base/locales/en-US/* "$TPREFIX"/mobile/android/base/
cp -r "$PREFIX"/mozilla-aurora/mobile/android/locales/en-US/* "$TPREFIX"/mobile/android/

mkdir -p "$TPREFIX"/webapprt/;
cp -r "$PREFIX"/mozilla-aurora/webapprt/locales/en-US/* "$TPREFIX"/webapprt/

# We should not touch these files
find "$TPREFIX"/ -name region.properties | xargs rm

# Prepare for translation
cd "$TPREFIX"/;
moz.sh -p
