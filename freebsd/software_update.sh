#!/bin/sh
# ======= port update =======
portsnap fetch extract
portsnap fetch update
# ======= portmaster =======
make -sC /usr/ports/ports-mgmt/portmaster install clean
# ======= install vim-lite for edit =======
portmaster -dG editors/vim-lite