# setup a develeopemnt enviroment on ubuntu server

# how to use...

# install git, clone public repo & run main script to install packages
git --version
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
git clone https://github.com/l7g9/dev_server_setup
cd dev_server_setup
sudo bash dev_server_setup.sh

# create a new sudo user
adduser username
usermod -aG sudo username
su - username

# setup git hub
git config --global user.name "githunusername"
git config --global user.email "myname@something.com"
