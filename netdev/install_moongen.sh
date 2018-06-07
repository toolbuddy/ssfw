#!/bin/bash

# install dependencies
sudo apt-get install -y build-essential cmake linux-headers-`uname -r` pciutils libnuma-dev

# get source code 
git clone https://github.com/emmericp/MoonGen.git
cd MoonGen/

# build 
./build.sh

# bind 
sudo ./bind-interfaces.sh
sudo ./setup-hugetlbfs.sh

# test
sudo ./build/MoonGen examples/l3-load-latency.lua 0 1

cd ..