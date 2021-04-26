#!/bin/sh

# Installation du desktop
#apt-get install -y libapache2-mod-php7.3
#apt-get install -y kde-plasma-desktop
	
# Installation des logiciels demandes
apt-get install -y python3 python-pip python3-dev git 

# Debut installation de Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

apt-get install -y apt-transport-https
apt-get update
apt-get install -y code
# Fin installation de Visual Studio Code

# Installation de vagrant
apt-get install -y vagrant
