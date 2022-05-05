#! /bin/bash

echo '********** installing docker **********'

# remove old docker packages
apt-get remove docker docker-engine docker.io containerd runc -y

# install packages to allow apt to use a repo over https
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    Lsb-release -y


# add docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# set up the stable repo
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable test" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
#install docker engine
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#test
docker run hello-world