FROM osrf/ros:humble-desktop

RUN apt-get -y update 
RUN apt install software-properties-common curl gnupg lsb-release python3-pip mc wget curl featherpad dos2unix tmux -y
RUN add-apt-repository universe

RUN apt update && apt install -y software-properties-common && add-apt-repository ppa:kisak/kisak-mesa && apt upgrade -y

ENV WORKSPACE=/root/ros2_ws
ENV SHAREDIR=/root/share
RUN mkdir -p $WORKSPACE

WORKDIR $WORKSPACE/src

RUN git clone https://github.com/AndrejOrsula/pymoveit2.git

COPY share/panda2_description $WORKSPACE/src/panda2_description
COPY share/panda2_moveit_config $WORKSPACE/src/panda2_moveit_config
COPY share/pymoveit2_demos $WORKSPACE/src/pymoveit2_demos

SHELL ["/bin/bash", "-c"]

RUN apt-get -y update && apt install ament-cmake-clang-format figlet toilet -y

RUN rosdep install -y -r -i --rosdistro ${ROS_DISTRO} --from-paths .

WORKDIR $WORKSPACE

RUN /bin/bash -c "source /opt/ros/humble/setup.bash; colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release"

WORKDIR $WORKSPACE

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source /root/ros2_ws/install/setup.bash" >> ~/.bashrc

COPY starttmux.sh /root/starttmux.sh
COPY killtmux.sh /root/killtmux.sh
COPY panda-rviz.sh /root/panda-rviz.sh
COPY panda-movejoint.sh /root/panda-movejoint.sh

RUN apt-get -y update && apt install ros-humble-rosbridge-server ros-humble-foxglove-bridge -y

COPY rosbridge.sh /root/rosbridge.sh
COPY foxglovebridge.sh /root/foxglovebridge.sh
COPY foxglove.sh /root/foxglove.sh

RUN wget https://github.com/foxglove/studio/releases/download/v1.50.0/foxglove-studio-1.50.0-linux-amd64.deb && chmod 666 ./foxglove-studio-1.50.0-linux-amd64.deb &&  apt install ./foxglove-studio-1.50.0-linux-amd64.deb -y && rm ./foxglove-studio-1.50.0-linux-amd64.deb

CMD ["/root/starttmux.sh"]



