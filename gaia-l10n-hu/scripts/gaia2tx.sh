#!/bin/bash

# Print commands before running them
set -x

# Source the config file that contains the working directory names
. ~/.config/moz2tx.cfg
#GAIA_PREFIX="/home/gabor/src/fsfhu-scripts"

# TODO: check out repos if the dirs are not present
# TODO: make it possible to switch between aurora/beta

# update repos
cd $GAIA_PREFIX/gaia-l10n-en-US;
hg pull && hg update --check

# search for new files
gaia_tx_update.sh

# upload updated original files to transifex
tx push -s
# Upload existing translations, needed only once per language
#tx push -t -f -l hu --no-interactive --skip 
