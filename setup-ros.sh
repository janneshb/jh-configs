#!/bin/bash

# ROS 1 Noetic
#

# Doesn't support Ubuntu 22.04!

#sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

#sudo apt update
#sudo apt upgrade

#sudo apt install ros-noetic-desktop

#source /opt/ros/noetic/setup.bash
#echo "# ROS 1 Noetic" >> ~/.zshrc
#echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
#echo "# ROS 1 Noetic" >> ~/.bashrc
#echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

#sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
#sudo apt install python3-rosdep
#sudo rosdep init
#export ROS_OS_OVERRIDE=ubuntu
#export ROS_DISTRO=noetic
#rosdep update

#echo
#echo ROS 1 Noetic Installation DONE!


# ROS 2 Humble Hawksbill
#
sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-flake8-blind-except \
  python3-flake8-builtins \
  python3-flake8-class-newline \
  python3-flake8-comprehensions \
  python3-flake8-deprecated \
  python3-flake8-docstrings \
  python3-flake8-import-order \
  python3-flake8-quotes \
  python3-pip \
  python3-pytest \
  python3-pytest-cov \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget

sudo apt update
sudo apt upgrade

sudo apt install ros-humble-desktop-full

sudo apt upgrade
sudo rosdep init
export ROS_OS_OVERRIDE=ubuntu
rosdep update
rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"

echo "# ROS 2 Humble Hawksbill" >> ~/.zshrc
echo ". ~/ros2_humble/install/local_setup.zsh" >> ~/.zshrc
echo "source /opt/ros/humble/setup.zsh" >> ~/.zshrc
echo "# ROS 2 Humble Hawksbill" >> ~/.bashrc
echo ". ~/ros2_humble/install/local_setup.bash" >> ~/.bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

echo
echo ROS 2 Humble Hawksbill Installation DONE!
