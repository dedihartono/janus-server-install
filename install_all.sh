#!/bin/bash

# Run all installation scripts
./install_dependencies.sh
./install_libnice.sh
./install_libsrtp.sh
./install_usrsctp.sh
./install_libwebsockets.sh
./install_mqtt.sh
./install_libnanomsg.sh
./install_rabbitmqc.sh
./install_sofia_sip.sh
./install_janus.sh

# Run Janus binary help command
/opt/janus/bin/janus --help

# Copy janus.service to /etc/systemd/system
sudo cp services/janus.service /etc/systemd/system/

# Restart the systemd daemon
sudo systemctl daemon-reload

# Start the Janus service
sudo systemctl start janus

# Echo messages
echo "HTTP webserver started (port 8088)"
echo "Websocket (port 8188)"

# Config nginx
./nginx_config.sh