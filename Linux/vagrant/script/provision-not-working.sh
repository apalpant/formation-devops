#!/bin/sh

sudo su -

apt-get update

apt-get install -y vim
apt-get install -y tldr
apt-get install -y shellcheck
apt-get install -y apache2
#apt-get install -y php7.3
#apt-get install -y libapache2-mod-php7.3
apt-get install -y kde-plasma-desktop

echo "Debut de l'installation de cours-linux"

unzip /vagrant/cours-linux.zip
mv docs /var/www/cours-linux/
cd /var/www
chown -R www-data:www-data cours-linux/

sed "s/#ServerName www.example.com/ServerName cours-linux/;s/html/cours-linux/" \
/etc/apache2/sites-available/000-default.conf > /etc/apache2/sites-available/cours-linux.conf

a2ensite cours-linux
systemctl reload apache2

echo "127.0.0.1 cours-linux" >> /etc/hosts

echo "Installation de cours-linux terminee

echo "Installation globale terminée"

