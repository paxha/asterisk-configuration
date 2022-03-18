#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install unixodbc odbc-mariadb python3-dev python3-pip python3-mysqldb -y
cd /usr/src/asterisk-19.*/contrib/ast-db-manage/

sudo nano config.ini.sample
#sqlalchemy.url = mysql://asterisk:password@localhost/asterisk
sudo cp config.ini.sample config.ini

alembic -c config.ini upgrade head
