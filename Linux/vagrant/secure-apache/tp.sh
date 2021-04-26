# Pour installer le serveur web, commençons par installer Apache
sudo apt install apache2

# Démarrer le service
sudo service apache2 start

# Vérifier sur l'adresse locale
wget localhost 

# Installation de iptables
sudo apt install -y iptables

# Activation des règles pour autoriser le trafic entrant sur le port 80 (HTTP) et le port 22 (SSH)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Bidouille pour voir les log des paquets qui ont ete refuses
sudo iptables -N LOGGING
sudo iptables -A INPUT -j LOGGING
sudo iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
sudo iptables -A LOGGING -j DROP

# Verification
sudo iptables -L

# Installation de ifconfig
sudo apt-get install net-tools

# Installation de fail2ban
sudo apt install -y fail2ban

# Démarrage automatique du service
sudo systemctl enable fail2ban