#!/bin/sh

# On installe l'utilitaire sshpass
apt install sshpass

# On genere une cle avec une passphrase a vide
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa

# On copie la cle sur le serveur avec le compte userjob
sshpass -p userjob ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no userjob@192.168.1.42

# Installation des logiciels demandes
apt install -y python3 python-pip python3-dev git 

# Debut installation de Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

apt install -y apt-transport-https
apt update
apt install -y code
# Fin installation de Visual Studio Code

# Installation de vagrant
apt install -y vagrant

# Clone du depot de vanessa
git clone https://github.com/vanessakovalsky/example-python.git

# On execute l'exemple
python3 example-python/vagrant/main.py
# TODO expect
# Bien joué votre VM avec python fonctionne

