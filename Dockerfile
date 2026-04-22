ARG VER="trixie"

FROM debian:${VER}

ENV DEBIAN_FRONTEND=noninteractive

ARG VER

# tools
RUN apt update && apt install -y \
    curl \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# set up Raspberry Pi OS repo
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://github.com/raspberrypi/rpi-image-gen/raw/refs/heads/master/keydir/raspberrypi-archive-keyring.gpg | \
    gpg --dearmor -o /etc/apt/keyrings/raspberrypi.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/raspberrypi.gpg] http://archive.raspberrypi.com/debian/ ${VER} main" \
    > /etc/apt/sources.list.d/raspberrypi.list

# install libcamera stack
RUN apt update && apt install -y \
    libcamera-tools \
    rpicam-apps \
    && rm -rf /var/lib/apt/lists/*
