#!/bin/sh

echo "Installation reussie"

https://www.digitalocean.com/community/questions/ssh-copy-id-not-working-permission-denied-publickey

Edit ssh config:
sudo nano /etc/ssh/sshd_config

Change this line:
PasswordAuthentication no

to
PasswordAuthentication yes

Restart daemon:
sudo systemctl restart sshd