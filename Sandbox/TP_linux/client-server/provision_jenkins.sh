#!/bin/sh

useradd -m userjob
echo -e 'password\npassword\n' | passwd userjob

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bck

sed "s/PasswordAuthentication no/PasswordAuthentication yes/" \
/etc/ssh/sshd_config.bck > /etc/ssh/sshd_config

systemctl restart sshd