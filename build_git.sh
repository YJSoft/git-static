#! /usr/bin/env bash

mkdir /output

echo ""
echo "This may take some time, please sit back and take a coffee."
echo ""

mkdir -p output
git clone --depth 1 --shallow-submodules https://github.com/git/git.git
cd git

export NO_OPENSSL=1
export NO_CURL=1
export CFLAGS="${CFLAGS} -static"

make configure
./configure prefix=/output
make -j $(nproc)
make install
chmod -R a+r /output
