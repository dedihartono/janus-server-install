#!/bin/bash

# install_mqtt.sh
git clone https://github.com/eclipse/paho.mqtt.c.git
cd paho.mqtt.c
sudo prefix=/usr make install