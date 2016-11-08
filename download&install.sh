#!/bin/bash
clear
set +x 
#Greps the host OS name
cat /etc/*-release | grep -ie "centos" -ie "ubuntu" -ie "fedora" | awk '{print $1}'

shopt -s nocasematch

OSNAME='cat /etc/*-release | awk '{print $1}'


#Checks if user is root got install.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

cat /etc/*-release | grep -ie "centos" -ie "ubuntu" -ie "fedora" | awk '{print $1}'

if [ ['echo $1 | tr [:lower:]' = 'echo "centos" | tr [:lower]' ]; then

#if OS is Centos then install proper RPM
OSNAME="CentOS"
yum install https://downloads.plex.tv/plex-media-server/1.2.6.2975-9394c87/plexmediaserver-1.2.6.2975-9394c87.x86_64.rpm -y
continue

elif [ ['echo $1 | tr [:lower:]' = 'echo "ubuntu" | tr [:lower]' ]; then

OSNAME="Ubuntu"
dpkg -i https://downloads.plex.tv/plex-media-server/1.2.6.2975-9394c87/plexmediaserver_1.2.6.2975-9394c87_amd64.deb
continue

elif [ ['echo $1 | tr [:lower:]' = 'echo "fedora" | tr [:lower]' ]; then

OSNAME="Fedora"
yum install https://downloads.plex.tv/plex-media-server/1.2.6.2975-9394c87/plexmediaserver-1.2.6.2975-9394c87.x86_64.rpm
continue

elif [ ['echo $1 | tr [:lower:]' = 'echo "Unknown" | tr [:lower]' ]; then
echo "OS UNKNOWN! Ending my life!" 2>&1
fi


shopt -u nocasematch
