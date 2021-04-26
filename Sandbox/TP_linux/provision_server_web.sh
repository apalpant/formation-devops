#!/bin/sh

apt install -y apache2
apt install ufw

ufw allow 80
ufw allow 443

mkdir /var/www/tp-linux
mv /home/vagrant/tp-linux/index.html /var/www/tp-linux/
cd /var/www
chown -R www-data:www-data tp-linux/

sed "s/#ServerName www.example.com/ServerName tp-linux/;s/html/tp-linux/" \
/etc/apache2/sites-available/000-default.conf > /etc/apache2/sites-available/tp-linux.conf

a2ensite tp-linux
systemctl reload apache2

echo "127.0.0.1 tp-linux" >> /etc/hosts