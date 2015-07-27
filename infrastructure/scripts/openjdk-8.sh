#!/bin/sh

echo "=====> Installing openjdk-8"
sudo apt-get update
sudo apt-get --yes install software-properties-common python-software-properties
sudo add-apt-repository --yes ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get --yes install openjdk-7-jdk
echo "export JAVA_HOME=/usr/lib/jvm/java-7" >> /etc/environment
