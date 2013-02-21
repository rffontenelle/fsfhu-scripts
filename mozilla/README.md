Mik ezek a fájlok?
===

Ezek szükségesek a Mozilla honosítási munkafolyamathoz.
Kiindulási pont: a tárolók le vannak klónozva hg-ből. TODO: detektálni ezeket és szükség esetén klónozni.
Lásd:
https://developer.mozilla.org/en-US/docs/Localizing_with_Mercurial

Mindet másold át a ~/bin-be, aztán:

* moz2tx.sh: ez a fő szkript, ezt kell csak futtatni. Ez sorban frissíti a tárolókat, meghívogatja az alábbiakat, és feltölti a Transifexbe az új eredeti sztringeket.
* vars.cfg: ez a konfigfájl tartalmazza a használandó könyvtárakat. Szerkeszd és másold át ~/.config/moz2tx.cfg névre.

* txin.sh: ez frissíti a projekt transifex konfigját az új fájlokkal.
* aurmozcp.sh: ez a szkript másolja át a hg tárolókból a honosítandó fájlokat
* moz.sh: moz.sh -p alakban előkészíti a fájlokat fordításra. Ez a hívóbetűk prefixelését és a gyorsbillentyűk védelmét jelenti.
moz.sh -u alakban hívva visszaállítja a védett billentyűkódokat. Az aurmozcp meghívja.
* mozprep.pl: backend szkript, a moz.sh ezt hívja -p esetén.
* mozunprep.pl: backend szkript, a moz.sh ezt hívja -u esetén.

* checkmoz: helyesírás-ellenőrzés a properties és dtd fájlokon. Argumentumai nincsenek, a megfelelő könyvtárban kell kiadni. Független a fentiektől.

