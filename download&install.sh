#!/bin/bash
clear

#Checks if user is root got install.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

mkdir -p /tmp/plexmediaserver
wget -p /tmp/plexmediaserver/ https://downloads.plex.tv/plex-media-server/1.2.6.2975-9394c87/plexmediaserver_1.2.6.2975-9394c87_amd64.deb

dpkg -i /tmp/plexmediaserver/
