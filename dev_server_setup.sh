#! /bin/bash
apt-get update -y
apt-get upgrade -y

bash install_ssh.sh
bash install_python.sh
bash install_nano.sh
bash install_ansible.sh
bash install_docker.sh
bash install_jdk
bash install_jenkins
