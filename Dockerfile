FROM osrf/ros:humble-desktop

RUN apt-get -y update 
RUN apt install software-properties-common curl gnupg lsb-release python3-pip -y
RUN add-apt-repository universe

RUN apt update && apt install -y software-properties-common && add-apt-repository ppa:kisak/kisak-mesa && apt upgrade -y

RUN mkdir -p /root/ros2_ws
WORKDIR /root/ros2_ws

SHELL ["/bin/bash", "-c"]
