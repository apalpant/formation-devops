#!/bin/sh

apt install -y apache2
apt install ufw

ufw --force enable 

ufw allow ssh
ufw allow http
ufw allow https

mv /home/vagrant/share/index.html /var/www/html/
cd /var/www
chown -R www-data:www-data html/