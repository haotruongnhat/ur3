#!/bin/bash

# Building workspace
# TODO: rosdep install
# cd ~/tada_ws && catkin_make -DCATKIN_WHITELIST_PACKAGES="" -DCATKIN_BLACKLIST_PACKAGES="carla_mpc" -DPYTHON_EXECUTABLE=/usr/bin/python3 -DCMAKE_BUILD_TYPE=Release

cd /root/ros_ws/src/ros_ur3

# tmux kill-session -t ros
tmux new -s ros -n gazebo -d
tmux send-keys -t ros:gazebo "./launch_gazebo.sh" Enter

tmux new-window -n moveit -t ros -d
tmux send-keys -t ros:moveit "./launch_moveit.sh" Enter

if [ "$1" ]
then exec "$1"
fi