#!/bin/sh

# On installe le pare-feu
apt install ufw

# On le met en route
ufw --force enable 

# On lui fixe de nouvelles regles
ufw allow ssh
ufw allow http
ufw allow https
ufw allow 8080

# On creer la partion pour le disque
echo 'type=83, Size=5G' | sfdisk /dev/sdb

# On formate la partion ainsi creee
mkfs.ext4 /dev/sdb1

# On prepare l'installation de jenkins
apt-get install -y gnupg
apt-get install -y openjdk-11-jre

# On installe jenkins suivant les preconisations du site
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
	
# On met a jour la base de donnees des paquets
apt-get update
	
# On installe le paquet jenkins
apt-get install -y jenkins

# On demarre le service
service jenkins start

# On ajoute le nouvel utilisateur userjob
useradd -m userjob

# On lui donne un mot de passe
echo "userjob:userjob" | chpasswd

# On sauvegarde le fichier avant modification
cp /etc/sudoers /etc/sudoers.old

# On mets les droits sur la commande apt pour l'utilisateur userjob
echo "userjob ALL=(ALL) /usr/bin/apt" | tee -a /etc/sudoers

# On affiche le mot de passe de jenkins
echo "initialAdminPassword Jenkins: "
cat /var/lib/jenkins/secrets/initialAdminPassword | xargs echo

# On sauvegarde le fichier sshd_config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bck

# On change l'option PasswordAuthentication de no à yes dans le fichier sshd_config
sed "s/PasswordAuthentication no/PasswordAuthentication yes/" \
/etc/ssh/sshd_config.bck > /etc/ssh/sshd_config

# On restart le service
systemctl restart sshd