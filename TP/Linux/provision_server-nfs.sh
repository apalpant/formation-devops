#!/bin/sh

apt -y install nfs-kernel-server

# commandes de vérification de l'installation
# confirmer que le serveur est lancé, et accepte les requêtes sur le port 2049 (UDP et TCP)
rpcinfo -p | grep nfs
# vérifier que le système supporte NFS et qu'il est chargé
cat /proc/filesystems | grep nfs
# vérifier que portmap attend les instructions sur le port 111
rpcinfo -p | grep portmap

#créer les répertoires de sauvegardes pour les deux clients web et jenkins
mkdir -p /home/vagrant/sauvegardes/web/
mkdir -p /home/vagrant/sauvegardes/jenkins/
mkdir -p /home/vagrant/packages/

# Changer le groupe et le owner (passage de 'root' a 'vagrant)'
sudo chown -R vagrant sauvegardes/
sudo chgrp -R vagrant sauvegardes/

sudo chown -R vagrant packages/
sudo chgrp -R vagrant packages/

# définir les droits et le répertoire partagé
echo "/home/vagrant/sauvegardes/web 192.168.1.2(rw,sync)" | sudo tee -a /etc/exports
echo "/home/vagrant/sauvegardes/jenkins 192.168.1.3(rw,sync)" | sudo tee -a /etc/exports
echo "/home/vagrant/packages/ 192.168.1.0/24(ro,sync)" | sudo tee -a /etc/exports

#donner la permission aux clients
echo "ALL:192.168.1.0/24" | sudo tee -a /etc/hosts.allow

#restart NFS
service nfs-kernel-server restart

# On installe un utilitaire
apt install dos2unix

# Definition du home des scripts
SCRIPTS_HOME=/home/vagrant/scripts

# On rends les scripts executables
chmod +x $SCRIPTS_HOME/preinst
chmod +x $SCRIPTS_HOME/restore.sh
chmod +x $SCRIPTS_HOME/rm.sh

# On les encode correctement
dos2unix $SCRIPTS_HOME/preinst
dos2unix $SCRIPTS_HOME/restore.sh
dos2unix $SCRIPTS_HOME/rm.sh

##### CONSTRUCTION DU PACKAGE .deb #####

DEB_HOME=/home/vagrant/tp

mkdir -p $DEB_HOME/DEBIAN/

# Changer le groupe et le owner (passage de 'root' a 'vagrant)'
sudo chown -R vagrant $DEB_HOME/
sudo chgrp -R vagrant $DEB_HOME/

cp $SCRIPTS_HOME/preinst $DEB_HOME/DEBIAN/
cp $SCRIPTS_HOME/control $DEB_HOME/DEBIAN/

mkdir -p /home/vagrant/tp/usr/bin/

cp $SCRIPTS_HOME/rm.sh $DEB_HOME/usr/bin/
cp $SCRIPTS_HOME/restore.sh $DEB_HOME/usr/bin/

# On package
dpkg-deb --build --root-owner-group $DEB_HOME

# On le place sur le nfs
cp /home/vagrant/tp.deb /home/vagrant/packages/