#!/bin/bash

: "${TOPIC:?Need to set TOPIC env var.}"
: "${SERVER:?Need to set SERVER env var.}"
: "${DEVICE:?Need to set DEVICE env var.}"

curl -o /tmp/generate.py https://raw.githubusercontent.com/deterralba/mqtt-pusher/master/generate.py

if [ ! -e /tmp/generate.py ]; then
    echo "cannot find generator script. Check yourself before you break youself."
    exit 1
fi

chmod +x /tmp/generate.py

mosquitto -d -c /etc/mosquitto/mosquitto.conf
sleep 5
/tmp/generate.py $SERVER -t $TOPIC -s $DEVICE

