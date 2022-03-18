#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt install wget build-essential subversion
cd /usr/src
sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-19-current.tar.gz
sudo tar zxf asterisk-19-current.tar.gz
cd asterisk-19.*/
sudo contrib/scripts/get_mp3_source.sh
sudo contrib/scripts/install_prereq install
sudo ./configure
sudo make menuselect
sudo make
sudo make install
sudo make samples
sudo make config
sudo ldconfig
sudo groupadd asterisk
sudo useradd -r -d /var/lib/asterisk -g asterisk asterisk
sudo usermod -aG audio,dialout asterisk
sudo chown -R asterisk.asterisk /etc/asterisk
sudo chown -R asterisk.asterisk /var/{lib,log,spool}/asterisk
sudo chown -R asterisk.asterisk /usr/lib/asterisk
sudo systemctl restart asterisk
sudo systemctl status asterisk
sudo asterisk -rvv
