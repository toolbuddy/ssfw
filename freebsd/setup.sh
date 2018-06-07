#!/bin/sh
# all using "root"
# using for setting up the freebsd machine to the latest version
# ========= update source =========
freebsd-update fetch && freebsd-update install
# ========= build world =========
make -sC /usr/src buildworld
# ========= build kernel =========
# kernel configure file location: /usr/src/sys/<architecture>/conf/GENERIC
# using `uname -m` to see the architecture of your machine
# cp GENERIC MYKERNEL
# make -sC /usr/src kernel KERNCONF=MYKERNEL
# ========= install world =========
mount -u /
make -sC /usr/src installworld
# check freebsd version : `uname -a`
# check kernel ident : `uname -i`