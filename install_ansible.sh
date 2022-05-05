#! /bin/bash
echo '********** installing ansible **********'
apt-get install ansible -y

# needed for paswords over ssh 
apt-get install sshpass -y