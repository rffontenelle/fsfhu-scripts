#!/bin/bash

cp -r /home/gabor/src/mozilla/comm-aurora/mail/locales/en-US/* /home/gabor/src/mozilla/new-aurora/mail/ ;
cp -r /home/gabor/src/mozilla/comm-aurora/other-licenses/branding/thunderbird/locales/en-US/* /home/gabor/src/mozilla/new-aurora/other-licenses/branding/thunderbird/ ;
cp -r /home/gabor/src/mozilla/comm-aurora/editor/ui/locales/en-US/* /home/gabor/src/mozilla/new-aurora/editor/ui/ ;
cp -r /home/gabor/src/mozilla/comm-aurora/calendar/locales/en-US/* /home/gabor/src/mozilla/new-aurora/calendar/ ;
cp -r /home/gabor/src/mozilla/comm-aurora/chat/locales/en-US/* /home/gabor/src/mozilla/new-aurora/chat/ ;

#cp -r /home/gabor/src/mozilla/comm-aurora/mail/branding/nightly/locales/en-US/* /home/gabor/src/mozilla/new-aurora/mail/branding/nightly/
#cp -r /home/gabor/src/mozilla/comm-aurora/suite/debugQA/locales/en-US/* /home/gabor/src/mozilla/new-aurora/suite/debugQA/
#cp -r /home/gabor/src/mozilla/comm-aurora/suite/locales/en-US/* /home/gabor/src/mozilla/new-aurora/suite/

cp -r /home/gabor/src/mozilla/mozilla-aurora/browser/locales/en-US/* /home/gabor/src/mozilla/new-aurora/browser/
cp -r /home/gabor/src/mozilla/mozilla-aurora/dom/locales/en-US/* /home/gabor/src/mozilla/new-aurora/dom/
cp -r /home/gabor/src/mozilla/mozilla-aurora/embedding/android/locales/en-US/* /home/gabor/src/mozilla/new-aurora/embedding/android/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/extensions/inspector/resources/locale/en-US/* /home/gabor/src/mozilla/new-aurora/extensions/inspector/resources/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/extensions/reporter/locales/en-US/* /home/gabor/src/mozilla/new-aurora/extensions/reporter/
cp -r /home/gabor/src/mozilla/mozilla-aurora/netwerk/locales/en-US/* /home/gabor/src/mozilla/new-aurora/netwerk/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/other-licenses/branding/firefox/locales/en-US/* /home/gabor/src/mozilla/new-aurora/other-licenses/branding/firefox/
cp -r /home/gabor/src/mozilla/mozilla-aurora/security/manager/locales/en-US/* /home/gabor/src/mozilla/new-aurora/security/manager/
cp -r /home/gabor/src/mozilla/mozilla-aurora/services/sync/locales/en-US/* /home/gabor/src/mozilla/new-aurora/services/sync/
cp -r /home/gabor/src/mozilla/mozilla-aurora/toolkit/locales/en-US/* /home/gabor/src/mozilla/new-aurora/toolkit/
cp -r /home/gabor/src/mozilla/mozilla-aurora/mobile/locales/en-US/* /home/gabor/src/mozilla/new-aurora/mobile/
cp -r /home/gabor/src/mozilla/mozilla-aurora/mobile/xul/locales/en-US/* /home/gabor/src/mozilla/new-aurora/mobile/xul/
cp -r /home/gabor/src/mozilla/mozilla-aurora/mobile/android/locales/en-US/* /home/gabor/src/mozilla/new-aurora/mobile/android/
cp -r /home/gabor/src/mozilla/mozilla-aurora/mobile/android/base/locales/en-US/* /home/gabor/src/mozilla/new-aurora/mobile/android/base/

find /home/gabor/src/mozilla/new-aurora/ -name region.properties | xargs rm

#cp -r /home/gabor/src/mozilla/mozilla-aurora/browser/branding/unofficial/locales/en-US/* /home/gabor/src/mozilla/new-aurora/browser/branding/unofficial/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/embedding/browser/chrome/locale/en-US/* /home/gabor/src/mozilla/new-aurora/embedding/browser/chrome/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/extensions/metrics/locale/en-US/* /home/gabor/src/mozilla/new-aurora/extensions/metrics/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/extensions/pref/autoconfig/resources/locale/en-US/* /home/gabor/src/mozilla/new-aurora/extensions/pref/autoconfig/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/extensions/spellcheck/locales/en-US/* /home/gabor/src/mozilla/new-aurora/extensions/spellcheck/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/layout/forms/resources/locale/en-US/* /home/gabor/src/mozilla/new-aurora/layout/forms/resources/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/extensions/layout-debug/ui/locale/en-US/* /home/gabor/src/mozilla/new-aurora/extensions/layout-debug/ui/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/xpfe/communicator/resources/locale/en-US/* /home/gabor/src/mozilla/new-aurora/xpfe/communicator/resources/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/xpfe/components/download-manager/resources/locale/en-US/* /home/gabor/src/mozilla/new-aurora/xpfe/components/download-manager/resources/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/xpfe/components/winhooks/locale/en-US/* /home/gabor/src/mozilla/new-aurora/xpfe/components/winhooks/
#cp -r /home/gabor/src/mozilla/mozilla-aurora/xpfe/global/resources/locale/en-US/* /home/gabor/src/mozilla/new-aurora/xpfe/global/resources/
