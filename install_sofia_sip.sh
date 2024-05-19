#!/bin/bash

# Clone the sofia-sip repository
git clone https://github.com/freeswitch/sofia-sip.git

# Move into the cloned directory
cd sofia-sip

# Run autogen.sh if building from darcs
# sh autogen.sh

# Configure
./configure

# Build
make

# Install
sudo make install
