#!/bin/bash

# Print commands before running them
set -x

# Source the config file that contains the working directory names
. ~/.config/moz2tx.cfg

# TODO: check out repos if the dirs are not present
# TODO: make it possible to switch between aurora/beta

# update repos
cd $PREFIX/comm-aurora;
#hg pull && hg update --check
cd ../mozilla-aurora
#hg pull && hg update --check
cd ../

# copy translatable strings and prepare them
aurmozcp.sh

# search for new files
cd $MOZTXDIR;
./txin.sh

# upload updated original files to transifex
tx push -s
