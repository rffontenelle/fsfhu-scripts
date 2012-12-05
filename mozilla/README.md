Mik ezek a fájlok?
===

Ezek szükségesek a Mozilla honosítási munkafolyamathoz.
Kiindulási pont: a tárolók le vannak klónozva hg-ből.
Lásd:
https://developer.mozilla.org/en-US/docs/Localizing_with_Mercurial

Mindet másold át a ~/bin-be, aztán:
(ide jön némi workflow leírás, később)

* aurmozcp.sh: ez a szkript másolja át a hg tárolókból a honosítandó fájlokat
Az elején módosítani kell a könyvtár elérési útját!
* moz.sh: moz.sh -p alakban előkészíti a fájlokat fordításra. Ez a hívübetűk prefixelését és a gyorsbillentyűk védelmét jelenti.
moz.sh -u alakban hívva visszaállítja a védett billentyűkódokat.
* checkmoz: helyesírás-ellenőrzés a properties és dtd fájlokon. Argumentumai nincsenek.
* mozprep.pl: backend szkript, a moz.sh ezt hívja -p esetén.
* mozunprep.pl: backend szkript, a moz.sh ezt hívja -u esetén.
