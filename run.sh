#!/bin/bash

docker run \
  --rm \
  --network=host \
  -e DISPLAY \
  -e XAUTHORITY=/tmp/.Xauthority \
  -v ~/.Xauthority:/tmp/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v `pwd`/ros2_ws/src:/root/ros2_ws/src \
  -it ros2-humble-lite \
  bash
