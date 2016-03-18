#!/bin/bash

: "${TOPIC:?Need to set TOPIC env var.}"


mosquitto -d -c /etc/mosquitto/mosquitto.conf
sleep 3
cd ~/.datadog-agent/agent
../venv/bin/python dogstatsd.py --broker="127.0.0.1" --topic="$TOPIC"

#mosquitto_sub -h 127.0.0.1 -t $TOPIC

