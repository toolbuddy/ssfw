#!/bin/bash

# back to home
cd ~

# clone onos 
git clone https://gerrit.onosproject.org/onos ~/onos

echo $JAVA_HOME="/usr/lib/jvm/java-8-oracle"

# java 8
sudo apt-get install software-properties-common -y && \
sudo add-apt-repository ppa:webupd8team/java -y && \
sudo apt-get update && \
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections && \
sudo apt-get install oracle-java8-installer oracle-java8-set-default -y

# curl 
sudo apt install curl

# define root of ONOS
export ONOS_ROOT=~/onos
# go to onos
cd $ONOS_ROOT

# using buck to compile 
$ONOS_ROOT/tools/build/onos-buck build onos --show-output

# unit test
$ONOS_ROOT/tools/build/onos-buck test

# export ONOS root
source $ONOS_ROOT/tools/dev/bash_profile

# Append into bashrc
echo "export JAVA_HOME=\"/usr/lib/jvm/java-8-oracle\"" >> ~/.bashrc
echo "export ONOS_ROOT=~/onos" >> ~/.bashrc

# source your bashrc
source $ONOS_ROOT/tools/dev/bash_profile
