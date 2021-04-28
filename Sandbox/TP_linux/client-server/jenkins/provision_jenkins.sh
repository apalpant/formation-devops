#!/bin/sh

# On met a jour la base de donnees des paquets
# sudo apt-get update
sudo apt install ufw

sudo ufw --force enable 

sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 8080

# On creer la partion pour le disque
echo 'type=83, Size=5G' | sudo sfdisk /dev/sdb

# On formate la partion ainsi creee
sudo mkfs.ext4 /dev/sdb1

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
sudo useradd -m userjob

# On sauvegarde le fichier avant modification
sudo cp /etc/sudoers /etc/sudoers.old

# On mets les droits sur la commande apt pour l'utilisateur userjob
echo "userjob ALL=(ALL) /usr/bin/apt" | sudo tee -a /etc/sudoers

# On affiche le mot de passe de jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# On sauvegarde le fichier sshd_config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bck

# On change l'option PasswordAuthentication de no à yes dans le fichier sshd_config
sudo sed "s/PasswordAuthentication no/PasswordAuthentication yes/" \
/etc/ssh/sshd_config.bck > /etc/ssh/sshd_config

# On restart le service
sudo systemctl restart sshd