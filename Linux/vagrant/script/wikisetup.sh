#!/bin/sh

# Par simplicite le reste des commandes seront effectues par le super utilisateur

sudo su-
echo "Droits super utilisateur mis en place..."

# Telechargement du dokuwiki

wget -O /usr/src/dokuwiki.tgz \
https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
echo "Téléchargement du docuwiki termine..."

# Extraction et deplacement du docuwiki

cd /usr/src
tar xavf dokuwiki.tgz
if [ -d "dokuwiki" ]; then
        rm -r dokuwiki
fi
mv dokuwiki-2020-07-29 dokuwiki

echo "Manipulation du dokuwiki terminee..."

while [ $# -gt 0 ]; do

        WIKI="$1"

        echo "Debut de l'installation de $WIKI"
        shift

        mkdir -p /var/www/$WIKI/
        rsync -av /usr/src/dokuwiki/ /var/www/$WIKI/
        cd /var/www
        chown -R www-data:www-data $WIKI/

        sed "s/#ServerName www.example.com/ServerName $WIKI/;s/html/$WIKI/" \
        /etc/apache2/sites-available/000-default.conf > /etc/apache2/sites-available/$WIKI.conf

        a2ensite $WIKI
        systemctl reload apache2

        echo "127.0.0.1 $WIKI" >> /etc/hosts

        echo "Installation de $WIKI terminee"
done

echo "Installation globale terminée"

