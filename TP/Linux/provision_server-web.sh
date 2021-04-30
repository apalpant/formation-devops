#!/bin/sh

# Installation des paquets necessaires
apt install -y apache2
apt install ufw
apt -y install nfs-common

# On force le pare feu a se mettre en route
ufw --force enable 

# On autorise les ports ssh, http et https
ufw allow ssh
ufw allow http
ufw allow https

# On deplace le index.html partage vers le repertoire cible
mv /home/vagrant/share/index.html /var/www/html/

# On change le 'owner' sur le dossier 'html'
cd /var/www
chown -R www-data:www-data html/

# vérification de l'installation
# vérifier que le portmap attends les instructions sur le port 111
rpcinfo -p | grep portmap

# créer le dossier partagé sous le répertoire /mnt
mkdir -p /mnt/sauvegardes/web/

# Changer le groupe et le owner (passage de 'root' a 'vagrant)'
chown -R vagrant /mnt/sauvegardes/
chgrp -R vagrant /mnt/sauvegardes/

# monter le partage vers le serveur NFS
mount -t nfs 192.168.1.1:/home/vagrant/sauvegardes/web/ /mnt/sauvegardes/web/

# executer le script de sauvegarde toutes les heures
crontab -e | 00 */1 * * * /sauvegarde-web.sh