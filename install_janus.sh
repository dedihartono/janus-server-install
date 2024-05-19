#!/bin/bash

# Clone the Janus Gateway repository
git clone https://github.com/meetecho/janus-gateway.git

# Move into the cloned directory
cd janus-gateway

# Run autogen.sh
sh autogen.sh

# Configure Janus Gateway
./configure --prefix=/opt/janus --enable-docs

# Build Janus Gateway
make

# Install Janus Gateway
sudo make install

# Generate configuration files
make configs
