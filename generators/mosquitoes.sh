#!/bin/bash

flavors=( "pressure" "light" "temperature" )

if [ $# -ne 3 ];
then
    echo "usage: $0 server topic n_instances"
    exit 1
fi

for flavor in ${flavors[@]}; do
    for i in $(seq 1 $3); do
        docker run -e SERVER="$1" -e TOPIC="$2" -e DEVICE="$flavor" -d mosquitoes
    done
done

