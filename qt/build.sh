# Step 1: Get the source code
git clone https://code.qt.io/qt/qt5.git

# Step 2: Checkout to the target version
cd qt5/
git checkout v5.11.0
git submodule update --init

export LLVM_INSTALL_DIR=/usr/llvm

# Step 3: Configure and build
./configure -developer-build -opensource -nomake examples -nomake tests
NUM_CORES=`grep -c ^processor /proc/cpuinfo`
make -j{NUM_CORES}

# Step 4: Install Qt 
sudo make install