#!/bin/sh

# You can modified here
VERSION=1.10.3
OS=linux
ARCH=amd64

# Get source
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz -P /tmp

# using tar cmd to extract
sudo tar -C /usr/local -xzf /tmp/go$VERSION.$OS-$ARCH.tar.gz

# export PATH
export PATH=$PATH:/usr/local/go/bin

# append into ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile 
