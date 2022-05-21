#! /bin/bash
echo '********** installing nano **********'
apt-get install nano -y

echo # set as default text editor >> ~/.bashrc
echo EDITOR=nano >> ~/.bashrc
source .bashrc
