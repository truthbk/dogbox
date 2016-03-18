#!/bin/bash

: "${TOPIC:?Need to set TOPIC env var.}"
: "${SERVER:?Need to set SERVER env var.}"
: "${DEVICE:?Need to set DEVICE env var.}"

if [ ! -e /tmp/generator.py ]; then
    echo "cannot find generator script. Check yourself before you break youself."
fi

mosquitto -d -c /etc/mosquitto/mosquitto.conf
sleep 5
/tmp/generate.py $SERVER -t $TOPIC -s $DEVICE

