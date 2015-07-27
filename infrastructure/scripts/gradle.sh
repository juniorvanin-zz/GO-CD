#!/bin/sh

echo "=====> Installing gradle"
sudo add-apt-repository --yes ppa:cwchien/gradle
sudo apt-get update
sudo apt-get --yes install gradle
