#! /bin/bash

echo '********** installing ssh **********'
apt-get install openssh-server -y
apt-get install openssh-client -y

# enable ssh on startup & start
systemctl enable ssh
systemctl start ssh
