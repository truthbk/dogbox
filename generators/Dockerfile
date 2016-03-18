FROM ubuntu:latest
MAINTAINER Jaime Fullaondo @truthbk
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    curl \
    procps \
    fakeroot \
    python \
    python-pip \
    git \
    build-essential \
    python \
    python-setuptools \
    python-software-properties \
    software-properties-common

RUN apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && apt-get update && \
    apt-get install -y mosquitto mosquitto-clients

RUN curl -o /tmp/generate.py https://raw.githubusercontent.com/deterralba/mqtt-pusher/master/generate.py && \
    curl -o /tmp/gen_launch.sh https://raw.githubusercontent.com/truthbk/dogbox/master/generators/gen_launch.sh && \
    curl -o /tmp/requirements.txt https://raw.githubusercontent.com/truthbk/dogbox/master/generators/requirements.txt

RUN pip install -r /tmp/requirements.txt && \
    chmod +x /tmp/gen_launch.sh && chmod +x /tmp/generate.py

# this should launch it.
ENTRYPOINT /bin/bash -l /tmp/gen_launch.sh

