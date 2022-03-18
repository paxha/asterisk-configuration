#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install mysql-server
sudo systemctl start mysql.service
sudo mysql_secure_installation
sudo mysql
CREATE DATABASE asterisk;
CREATE USER 'asterisk'@'localhost' IDENTIFIED WITH MYSQL_NATIVE_PASSWORD BY 'password';
GRANT ALL PRIVILEGES ON asterisk.* to 'asterisk'@'localhost';
CREATE USER 'pasha'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON *.* to 'pasha'@'%';
FLUSH PRIVILEGES;
