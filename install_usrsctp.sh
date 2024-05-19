#!/bin/bash

# install_usrsctp.sh
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr && make && sudo make install