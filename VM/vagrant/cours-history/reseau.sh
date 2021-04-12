# Rechercher l’adresse IP de son interface réseau
sudo ifconfig

# L’adresse IP de votre interface est-elle privée ou publique
# Elle est privee elle appartient a la classe A des ip privees reservees par IANNA (10.0.2.15)
# Source https://www.ionos.fr/assistance/serveurs-et-cloud/reseau-prive/plages-dadresse-ip-privees/

# Vérifier en utilisant la commande whois
whois 10.0.2.15
# > NetName:        PRIVATE-ADDRESS-ABLK-RFC1918-IANA-RESERVED

# L’adresse IP de votre interface est-elle statique ou dynamique
cat /etc/network/interfaces | grep eth0 | grep iface
# > iface eth0 inet dhcp
# L'ip est donc dynamique (dhcp sinon elle aurait ete static)

# Rechercher son adresse IP publique
wget -O - http://www.monip.org | grep -Eo "([0-9]+\.){3}[0-9]+"
# > 88.162.50.165

# wget -O - http://www.monip.org | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"#lynx --source www.monip.org | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"90.29.215.198

# Vérifier l’état de connexion vers votre adresse publique
ping 88.162.50.165

# A-t-elle un nom de domaine associé ?
nslookup 10.0.2.15
# > ** server can't find 15.2.0.10.in-addr.arpa: NXDOMAIN

