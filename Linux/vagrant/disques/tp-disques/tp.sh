#!/bin/sh

# On met a jour la base de donnees des paquets
sudo apt-get update

# On cree les partions pour les disques
echo 'type=83, Size=5G' | sudo sfdisk /dev/sdb
echo 'type=83, Size=3G' | sudo sfdisk /dev/sdc

# On formate les partions ainsi crees
sudo mkfs.ext4 /dev/sdb1
sudo mkfs.ext4 /dev/sdc1

# On prepare l'installation de jenkins
sudo apt-get install -y gnupg
sudo apt-get install -y openjdk-11-jdk

# On installe jenkins suivant les preconisations du site
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
	
# On met a jour la base de donnees des paquets
sudo apt-get update
	
# On installe le paquet jenkins
sudo apt-get install -y jenkins

# On demarre le service
sudo service jenkins start

# On ajoute le nouvel utilisateur userjob
sudo useradd userjob

# On sauvegarde le fichier avant modification
sudo cp /etc/sudoers /etc/sudoers.old

# On mets les droits sur la commande apt pour l'utilisateur userjob
echo "userjob ALL=(ALL) /usr/bin/apt" | sudo tee -a /etc/sudoers

# On affiche le mot de passe de jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

 