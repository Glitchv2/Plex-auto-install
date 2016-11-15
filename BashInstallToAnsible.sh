#!/bin/bash

#This is a script to install Plex on an ansible CentOS 7 server.
#Also creates a client to prove that it's working.

#Check if user is root, if not exits.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#Install ansible on host operating system.
rpm -iUvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
yum -y update

#Make directory to install two boxes.
mkdir -p /home/vagrant/two-boxes
cd /home/vagrant/two-boxes

#allows forwarding
echo 'net.ipv4.ip_forward = 1' | sudo tee /usr/lib/sysctl.d/50-default.conf
/sbin/sysctl -p


cd home/.ssh
wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant
chmod 400 vagrant
ssh-add vagrant

#Git boxes
git clone

