FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV PATH /opt/ros/humble/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && \
    apt-get install -y \
	locales \
	curl \
	software-properties-common

RUN locale-gen en_US en_US.UTF-8

RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN add-apt-repository universe

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && \
    apt upgrade

RUN truncate -s0 /tmp/preseed.cfg; \
    echo "tzdata tzdata/Areas select America" >> /tmp/preseed.cfg; \
    echo "tzdata tzdata/Zones/America select New_York" >> /tmp/preseed.cfg; \
    debconf-set-selections /tmp/preseed.cfg && \
    rm -f /etc/timezone /etc/localtime && \
    apt-get update && \
	apt-get install -y \
	ros-humble-ros-base \
	ros-humble-desktop \
	ros-dev-tools

RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc

RUN echo 'source /workspaces/workspace1/ws1_pkg/install/setup.bash' >> ~/.bashrc

WORKDIR /workspaces

ENTRYPOINT ["/bin/bash"]
