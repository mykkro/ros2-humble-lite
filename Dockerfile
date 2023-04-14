FROM osrf/ros:humble-desktop

RUN apt-get -y update 
RUN apt install software-properties-common curl gnupg lsb-release python3-pip mc wget curl featherpad dos2unix -y
RUN add-apt-repository universe

RUN apt update && apt install -y software-properties-common && add-apt-repository ppa:kisak/kisak-mesa && apt upgrade -y

ENV WORKSPACE=/root/ros2_ws
RUN mkdir -p $WORKSPACE
WORKDIR $WORKSPACE

SHELL ["/bin/bash", "-c"]
