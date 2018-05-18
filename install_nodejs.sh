#!/bin/bash

NODE_VERSION="v10.1.0"

# install dependencies
sudo apt install curl
# using curl to download 
curl https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION.tar.gz --output /tmp/node.tar.gz
# unzip
tar -zxvf /tmp/node.tar.gz -C /tmp/ > /dev/null

cd /tmp/node-$NODE_VERSION

# configure it
./configure
# build
make -j4

# test 
make test
# test - result
./node -e "console.log('Hello from Node.js ' + process.version)"

# install 
sudo make install