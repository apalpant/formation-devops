# Afficher le contenu du fichier /etc/hosts
cat /etc/hosts

# Dans quel ordre se fera la résolution de noms sur votre machine ? 
cat /etc/host.conf
# > multi on

# Quelle est l'adresse IP du serveur de noms DNS que le résolveur interrogera ?
cat /etc/resolv.conf
# > nameserver 8.8.8.8

# Modifier le fichier de configuration de la résolution des noms pour qu'il interroge les serveurs DNS suivants
sudo echo -e "nameserver 208.67.222.222\nnameserver 208.67.220.220" | sudo tee /etc/resolv.conf

# Déterminer l'adresse de kovalibre.com
dig kovalibre.com
# > kovalibre.com.          14400   IN      A       146.88.232.66
# > 

# Déterminer le serveur a utiliser pour obtenir une réponse "authoritative"
host -v -t ns kovalibre.com

# Quelle réponse vous donne un serveur DNS lorsqu’il ne supporte pas la récursivité et qu’il ne connaît pas la réponse à votre question ?

# Visualisez, avec l’option +trace la suite des serveurs contactés pourtrouver l’adresse IP de www.kovalibre.com

# Quels sont les domaines traversés et les serveurs de nomsinterrogés ? La requête est­ elle récursive ?

# Recherchez plusieurs fois l’adresse www.kovalibre.com Que remarquez­ vous ?

# Qui est en charge de la zone com ?

# Comment déterminer la durée de validité d’une adresse ('A') ?

# Quelle est la durée de vie de l’adresse www.dyndns.org et celle destation­-stchamas.dyndns.org ?

# Effectuez plusieurs requêtes successivement. Que remarquez ­vous ?

# Déterminez le nom de la machine d’adresse 192.0.32.7 et le serveurde noms qui gère cette résolution inverse.

# www.google.fr est ­il le nom canonique ou un alias?

# Déterminez le ou les serveur(s) d’échange de courrier pour ledomaine kovalibre.com