# On «ping» un site hébergé par free.fr, donc en Europe, pourobtenir son adresse IP
ping -c 1 tvaira.free.fr
# > PING perso112-g5.free.fr (212.27.63.112) 56(84) bytes of data.

# On interroge RIPE (pour l'Europe) pour en savoir plus sur cette adresse
whois -h whois.ripe.net 212.27.63.112 | grep -E -e "inetnum|route"
# > inetnum:        212.27.60.0 - 212.27.63.255
# > route:          212.27.32.0/19

# On obtient l'adresse CIDR donné à l'ISP Free SA par RIPE soit 212.27.32.0/19. On peut vérifier
whois -h whois.ripe.net 212.27.32.0/19 | grep -E -e "inetnum|route|descr"
# > inetnum:        212.27.32.0 - 212.27.63.255
# > mnt-routes:     PROXAD-MNT
# > route:          212.27.32.0/19
# > descr:          ProXad network / Free SA
# > descr:          Paris, France

# On "trace" la route pour atteindre l'adresse IP du site
sudo traceroute -nI 212.27.63.132
# > traceroute to 212.27.63.132 (212.27.63.132), 30 hops max, 60 byte packets
# >  1  10.0.2.2  0.192 ms  0.191 ms  0.187 ms
# >  2  192.168.1.254  3.685 ms  3.781 ms  3.927 ms
# >  3  194.149.169.212  19.800 ms  20.030 ms  20.392 ms
# >  4  78.254.254.166  20.419 ms  20.506 ms  20.674 ms
# >  5  194.149.161.246  21.064 ms  21.061 ms  21.146 ms
# >  6  212.27.63.132  20.978 ms  20.784 ms  20.774 ms

# On recherche les serveurs DNS de free.fr en interrogeant NIC
whois -h whois.nic.fr free.fr | grep -E -e "domain|address|nserver"
# > domain:      free.fr
# > nserver:     freens1-g20.free.fr [212.27.60.19]
# > nserver:     freens2-g20.free.fr [212.27.60.20]
# > address:     8 Rue de la Ville l'Evêque
# > address:     75008 PARIS
# > website:     https://www.bookmyname.com/nom_de_domaine/tarif_nom_de_domaine.html
# > address:     16 rue de la ville l'Eveque
# > address:     75008 Paris
# > address:     16 rue de la ville l'Eveque
# > address:     75008 Paris
# > address:     16 rue de la ville l'Eveque
# > address:     75008 Paris

# On interroge maintenant le premier serveur DNS pour savoir s'il connaît le site xxx (si oui on obtiendra son adresse IP)
host -v -a tvaira.free.fr 212.27.60.19
# > tvaira.free.fr.         3600    IN      CNAME   perso112-g5.free.fr.
# > perso112-g5.free.fr.    86400   IN      A       212.27.63.112


