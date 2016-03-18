#!/bin/bash

: "${SERVER:?Need to set SERVER env var.}"
: "${TOPIC:?Need to set TOPIC env var.}"


mosquitto -d -c /etc/mosquitto/mosquitto.conf
sleep 5
mosquitto_sub -h $SERVER -t $TOPIC

