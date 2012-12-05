#!/bin/bash

# Print commands before running them
set -x

PREFIX=/home/gabor/src/mozilla
TPREFIX="$PREFIX"/new-aurora

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

#cp -r "$PREFIX"/comm-aurora/mail/branding/nightly/locales/en-US/* "$TPREFIX"/mail/branding/nightly/
#cp -r "$PREFIX"/comm-aurora/suite/debugQA/locales/en-US/* "$TPREFIX"/suite/debugQA/
#cp -r "$PREFIX"/comm-aurora/suite/locales/en-US/* "$TPREFIX"/suite/

mkdir -p "$TPREFIX"/browser/ ;
cp -r "$PREFIX"/mozilla-aurora/browser/locales/en-US/* "$TPREFIX"/browser/

mkdir -p "$TPREFIX"/dom/ ;
cp -r "$PREFIX"/mozilla-aurora/dom/locales/en-US/* "$TPREFIX"/dom/

mkdir -p "$TPREFIX"/embedding/android/ ;
cp -r "$PREFIX"/mozilla-aurora/embedding/android/locales/en-US/* "$TPREFIX"/embedding/android/
#cp -r "$PREFIX"/mozilla-aurora/extensions/inspector/resources/locale/en-US/* "$TPREFIX"/extensions/inspector/resources/
#cp -r "$PREFIX"/mozilla-aurora/extensions/reporter/locales/en-US/* "$TPREFIX"/extensions/reporter/
mkdir -p "$TPREFIX"/netwerk/ ;
cp -r "$PREFIX"/mozilla-aurora/netwerk/locales/en-US/* "$TPREFIX"/netwerk/
#cp -r "$PREFIX"/mozilla-aurora/other-licenses/branding/firefox/locales/en-US/* "$TPREFIX"/other-licenses/branding/firefox/

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

# We should not touch these files
find "$TPREFIX"/ -name region.properties | xargs rm

# Prepare for translation
cd "$TPREFIX"/;
moz.sh -p

#cp -r "$PREFIX"/mozilla-aurora/browser/branding/unofficial/locales/en-US/* "$TPREFIX"/browser/branding/unofficial/
#cp -r "$PREFIX"/mozilla-aurora/embedding/browser/chrome/locale/en-US/* "$TPREFIX"/embedding/browser/chrome/
#cp -r "$PREFIX"/mozilla-aurora/extensions/metrics/locale/en-US/* "$TPREFIX"/extensions/metrics/
#cp -r "$PREFIX"/mozilla-aurora/extensions/pref/autoconfig/resources/locale/en-US/* "$TPREFIX"/extensions/pref/autoconfig/
#cp -r "$PREFIX"/mozilla-aurora/extensions/spellcheck/locales/en-US/* "$TPREFIX"/extensions/spellcheck/
#cp -r "$PREFIX"/mozilla-aurora/layout/forms/resources/locale/en-US/* "$TPREFIX"/layout/forms/resources/
#cp -r "$PREFIX"/mozilla-aurora/extensions/layout-debug/ui/locale/en-US/* "$TPREFIX"/extensions/layout-debug/ui/
#cp -r "$PREFIX"/mozilla-aurora/xpfe/communicator/resources/locale/en-US/* "$TPREFIX"/xpfe/communicator/resources/
#cp -r "$PREFIX"/mozilla-aurora/xpfe/components/download-manager/resources/locale/en-US/* "$TPREFIX"/xpfe/components/download-manager/resources/
#cp -r "$PREFIX"/mozilla-aurora/xpfe/components/winhooks/locale/en-US/* "$TPREFIX"/xpfe/components/winhooks/
#cp -r "$PREFIX"/mozilla-aurora/xpfe/global/resources/locale/en-US/* "$TPREFIX"/xpfe/global/resources/
