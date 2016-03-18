#!/bin/bash

: "${TOPIC:?Need to set TOPIC env var.}"


mosquitto -d -c /etc/mosquitto/mosquitto.conf
sleep 5
mosquitto_sub -h 127.0.0.1 -t $TOPIC

