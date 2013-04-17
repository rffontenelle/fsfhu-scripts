What are these files?
===

These scripts are required for the localization of the Mozilla (FF, TB, FF4A, Lightning products - Seamonkey is omitted for various bogus reasons) Aurora series in Transifex. Currently the process is in alpha state, as the export of Mozilla files from tx is quite prone to regression (these bugs are reported). Also it is tailored to the needs of the Hungarian Mozilla localization project, and is not designed (yet ;)) for the needs of other/many languages, so using these scripts for another language will be a bumpy ride. Sorry for that and patches welcome!

For the start, you need to have Mozilla repositories cloned from hg. 
TODO: Detect their presence and clone them if needed. 
You will also need the Transifex command line client 0.8 (transifex-client package in Ubuntu). The scripts are developed on Ubuntu and they were not tested yet on other systems - be warned.
See:
https://developer.mozilla.org/en-US/docs/Localizing_with_Mercurial

To use, copy the scripts to ~/bin, cfg files to ~/.config. 

Intended workflow is:
* Create an own Mozilla-LL project on Transifex
* Fill it up with English strings from aurora by running moz2tx.sh (this is a slow process, go have lunch)
* Fill it up with your current translation. This is a one-off operation:
	* copy the aurora repository of your language to MOZTXDIR/mozilla-LL
	* `cd MOZTXDIR/mozilla-LL ; moz.sh -p` - this prepares the file for the workflow involving moz.sh - some languages may want to omit that part, but I'd not recommend this ;)
	* `tx push -l LL` from the MOZTXDIR
* Head on to Transifex and translate! Don't worry if you see resources with > 0 untranslated strings and 0 words left - this is a reported bug: if a string already has an empty translation, it will show up like that and cannot be edited. Because of the use of moz.sh, you need to be careful to always copy the hot key ID's and change only the letter after the underscore, otherwise moz.sh will be unable to undo the change and your translation will be broken.
* After you finished translation, you need to download them into the repository directory with `tx pull -l LL` in MOZTXDIR.
* Run moz.sh -u in the repository directory
* Run hg diff and review changes. Export from Transifex messes up several characters: & <> is replaced by HTML-entities and UTF-8 escapes (\uxxxx is replaced by the respective character). Also some dtd files use ' as delimiter instead of the usual ", these are replaced by ". All these must be undone manually, or you can run ` sed -i -e 's/&amp;/\&/g' -e 's/&gt;/>/g' -e 's/&lt;/</g' `
and undo the side effects of _that_ - did I mention alpha quality process?
Still, once these are sorted out on the Transifex side, it will be a joy to use, but we are not there yet.

Explanation of the files:

* vars.cfg: This config file contains the directories to use, also the language code to be used in the Transifex project name. Edit as necessary and copy to ~/.config/moz2tx.cfg
* txin-blacklist.cfg: This config file contains some files that are not to be uploaded to Transifex, because Transifex does not handle well "empty" files. In fact these files are not empty, but contain 0 translatable strings after preprocessing.

* moz2tx.sh: The main script, you need to run only this. Updates the repositories, runs the other scripts and uploads new translatable strings to Transifex.

* txin.sh: Updates the Transifex config file with new files. TODO: Removal of deleted ones.
* aurmozcp.sh: This script copies the localizable files out of the hg repositories.
* moz.sh: With the -p option it prepares the files copied by aurmozcp.sh for translation. This means prefixing the hot keys (_File) with their ID (So that the translation memory can give them back later correctly. If two strings have the same hotkey in English but not in your language you don't want the translation memory to mix them up, don't you?) and commenting out the shortcuts (Ctrl-F), so that they are protected from translation. Hungarian team policy is to keep these unchanged compared to the English ones - yours may be different.
With the -u option it undoes the prefixing and commenting done with -p. To be used on the exported files.
* mozprep.pl: backend script used by moz.sh -p.
* mozunprep.pl: backend script used by moz.sh -u. Integration of these two into moz.sh is in progress.

* checkmoz: Spell check properties and dtd files. No arguments, run when standing in the repository with localization. Independent from the above Transifex-related files.
