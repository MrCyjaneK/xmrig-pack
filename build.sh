#!/bin/bash
set -e
BRANCH=$1
BUILDDIR=$(pwd)
# Fetch the source code
echo " * Cloning the repo"
git clone https://github.com/xmrig/xmrig.git -b $BRANCH --depth=1 || sh -c "cd xmrig && git pull && git reset --hard && git checkout git clone $BRANCH"
echo " * Preparing build directory"
mkdir xmrig/build || true
cd xmrig/scripts
echo " * Building dependencies"
./build_deps.sh
cd ../build
echo " * Patching src/donate.h"
cp $BUILDDIR/patch/src/donate.h $BUILDDIR/xmrig/src/donate.h
echo " * Building xmrig (cmake)"
cmake .. -DXMRIG_DEPS=scripts/deps
echo " * Building xmrig (make)"
make -j$(nproc)
cd $BUILDDIR/xmrig/build
VERSION=$(./xmrig --version | tr ' ' "\n" | head -2 | tail -1)
cp xmrig xmrig-$VERSION
echo " * Building .deb"
cp $BUILDDIR/patch/Makefile Makefile
mkdir -p $BUILDDIR/deb || true
checkinstall \
    --type=debian \
    --install=no \
	--default \
	--pkgname=xmrig-donationless \
	--pkgversion=$VERSION \
	--arch=amd64 \
	--pakdir="$BUILDDIR/deb" \
	--maintainer=cyjan@mrcyjanek.net \
	--provides=xmrig \
	--strip=no \
	--stripso=no
