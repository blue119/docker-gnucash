# The docker is based on https://github.com/mbessler/docker-gnucash

FROM ubuntu:18.04
MAINTAINER blue119@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get install -y gnucash dbus-x11
RUN apt-get -y install fonts-wqy-zenhei && fc-cache -fv
RUN apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*
RUN adduser -q --uid 1000 --disabled-password --gecos "" user && \
        echo 'user  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user
WORKDIR /work
ENTRYPOINT ["/usr/bin/gnucash", "--logto", "stderr"]

LABEL \
      org.label-schema.name="gnucash" \
      org.label-schema.description="Docker container for GnuCash" \
      org.label-schema.version="unknown" \
      org.label-schema.vcs-url="https://github.com/blue119/docker-gnucash" \
      org.label-schema.schema-version="1.0"

