FROM debian:jessie
MAINTAINER Jaime Fullaondo @truthbk
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    curl \
    procps \
    fakeroot \
    python \
    git

RUN curl -o /tmp/generator.py https://raw.githubusercontent.com/truthbk/dogbox/master/generators/generator.py && \
    curl -o /tmp/gen_launch.sh https://raw.githubusercontent.com/truthbk/dogbox/master/generators/gen_launch.sh && \
    curl -o /tmp/requirements.txt https://raw.githubusercontent.com/truthbk/dogbox/master/generators/requirements.txt

RUN pip install -e /tmp/requirements.txt

# this should launch it.
RUN /tmp/gen_launch.sh

