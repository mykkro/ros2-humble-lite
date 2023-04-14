#!/bin/bash

docker run \
  --rm \
  --network=host \
  -e DISPLAY \
  -e XAUTHORITY=/tmp/.Xauthority \
  -v ~/.Xauthority:/tmp/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v `pwd`/share:/root/share \
  -p 9090:9090 \
  -p 8765:8765 \
  -it ros2-humble-lite 
