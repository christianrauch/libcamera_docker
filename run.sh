#!/usr/bin/env bash
docker run -it --rm \
  --privileged \
  --network host \
  -v /dev:/dev \
  -v /run/udev:/run/udev \
  pi-libcamera
