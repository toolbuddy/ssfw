#!/bin/bash

# Linux / X11
sudo apt-get build-dep qt5-default tar
sudo apt-get install -y libxcb-xinerama0-dev

# build essential
sudo apt-get install -y build-essential perl python git
sudo apt-get install -y "^libxcb.*" libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
sudo apt-get install -y flex bison gperf libicu-dev libxslt-dev ruby

# Qt webkit
sudo apt-get install -y libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libnss3-dev libasound2-d    ev libxss-dev libeql1-mesa-dev gperf bison
# Additional dependencies on Ubuntu 14.04
sudo apt-get install -y libbz2-dev libgcrypt11-dev libdrm-dev libcups2-dev libatkmm-1.6-dev

# Qt multimedia
sudo apt-get install -y libasound2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
