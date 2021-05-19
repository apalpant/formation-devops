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

apt install git

# install python
apt-get install python3 python3-dev python3-pip -q -y
apt remove -y python 

cp /usr/bin/python3 /usr/bin/python

apt install -y openjdk-8-jdk
apt install -y unzip

## Récupération de la dernière version de GRADLE

VERSION=7.0
wget https://downloads.gradle-dn.com/distributions/gradle-${VERSION}-bin.zip -P /tmp

unzip -d /opt/gradle /tmp/gradle-${VERSION}-bin.zip

# Faire pointer le lien vers la dernière version de gradle

ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest

# Ajout de gradle au PATH

touch /etc/profile.d/gradle.sh

echo "export PATH=/opt/gradle/latest/bin:${PATH}" > /etc/profile.d/gradle.sh

chmod +x /etc/profile.d/gradle.sh

source /etc/profile.d/gradle.sh