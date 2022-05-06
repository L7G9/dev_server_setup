#! /bin/bash

#bash security_ufw.sh
ufw allow ssh
#port used by router to forward ssh from outside network
ufw allow 931
#port used by jenkins
ufw allow 8080
#port used by docker
ufw allow 8888
ufw enable

#bash security_ssh.sh
# disable all shh forwarding
echo "DisableForwarding yes" >> /etc/ssh/sshd_config.d/10-my-sshd-settings.conf
# disable root login over ssh
echo "PermitRootLogin no" >> /etc/ssh/sshd_config.d/10-my-sshd-settings.conf
# disable password based ssh authentication
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config.d/10-my-sshd-settings.conf
# reload
systemctl reload ssh

#bash security_rhosts.sh
# ingore malicious rhosts file
echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config.d/10-my-sshd-settings.conf

#bash security_fail2ban.sh
apt-get install fail2ban net-tools -y
# configure fail2ban to protect SSH
echo "[ssh]
enabled  = true
banaction = iptables-multiport
port     = ssh
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 5
findtime = 43200
bantime = 86400" | tee /etc/fail2ban/jail.local
