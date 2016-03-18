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

RUN cd /tmp && git clone https://github.com/olivielpeau/dd-agent.git

RUN DD_INSTALL_ONLY=true DD_API_KEY=someapi bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)"

RUN pip install -r /tmp/dd-agent/requirements.txt

RUN curl -o /tmp/srv_launch.sh https://raw.githubusercontent.com/truthbk/dogbox/master/box/srv_launch.sh && \
    chmod +x /tmp/srv_launch.sh

# this should launch it.
ENTRYPOINT /bin/bash -l /tmp/srv_launch.sh

