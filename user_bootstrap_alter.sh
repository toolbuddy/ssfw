#!/bin/bash

# Print script commands.
set -x
# Exit on errors.
set -e

BMV2_COMMIT="39abe290b4143e829b8f983965fcdc711e3c450c"
PI_COMMIT="afd5831393824228246ea01b26da2f93d38fd20c"
P4C_COMMIT="80f8970b5ec8e57c4a3611da343461b5b0a8dda3"
PROTOBUF_COMMIT="v3.2.0"
GRPC_COMMIT="v1.3.2"

NUM_CORES=`grep -c ^processor /proc/cpuinfo`

# Mininet
git clone git://github.com/mininet/mininet mininet
cd mininet
./util/install.sh -nwv
cd ..

# Protobuf
git clone https://github.com/google/protobuf.git
cd protobuf
git checkout ${PROTOBUF_COMMIT}
export CFLAGS="-Os"
export CXXFLAGS="-Os"
export LDFLAGS="-Wl,-s"
./autogen.sh
./configure --prefix=/usr
make -j${NUM_CORES}
make install
ldconfig
unset CFLAGS CXXFLAGS LDFLAGS
cd ..

# gRPC
git clone https://github.com/grpc/grpc.git
cd grpc
git checkout ${GRPC_COMMIT}
git submodule update --init --recursive
export LDFLAGS="-Wl,-s"
make -j${NUM_CORES}
make install
ldconfig
unset LDFLAGS
cd ..
# Install gRPC Python Package
pip install grpcio

# BMv2 deps (needed by PI)
git clone https://github.com/p4lang/behavioral-model.git
cd behavioral-model
git checkout ${BMV2_COMMIT}
# From bmv2's install_deps.sh, we can skip apt-get install.
# Nanomsg is required by p4runtime, p4runtime is needed by BMv2...
tmpdir=`mktemp -d -p .`
cd ${tmpdir}
bash ../travis/install-thrift.sh
bash ../travis/install-nanomsg.sh
ldconfig
bash ../travis/install-nnpy.sh
cd ..
rm -rf $tmpdir
cd ..

# PI/P4Runtime
git clone https://github.com/p4lang/PI.git
cd PI
git checkout ${PI_COMMIT}
git submodule update --init --recursive
./autogen.sh
./configure --with-proto
make -j${NUM_CORES}
make install
ldconfig
cd ..

# Bmv2
cd behavioral-model
./autogen.sh
./configure --enable-debugger --with-pi
make -j${NUM_CORES}
make install
ldconfig
# Simple_switch_grpc target
cd targets/simple_switch_grpc
./autogen.sh
./configure
make -j${NUM_CORES}
make install
ldconfig
cd ..
cd ..
cd ..

# P4C
git clone https://github.com/p4lang/p4c
cd p4c
git checkout ${P4C_COMMIT}
git submodule update --init --recursive
mkdir -p build
cd build
cmake ..
make -j${NUM_CORES}
make -j${NUM_CORES} check
make install
ldconfig
cd ..
cd ..
