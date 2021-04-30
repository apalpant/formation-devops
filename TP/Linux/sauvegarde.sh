#!/bin/sh

# Ce script s'execute toutes les heures

# sauvegarder le répertoire /var/www/html/
cp /var/www/html/ /var/www/html.back/

# Création d'une compression du répertoire /var/www/html/
tar zcvf serveur_web_jour_mois_annee.tar.gz /var/www/html/

# Positionner la compression sur le serveur NFS
mv serveur_web_jour_mois_annee.tar.gz /mnt/sauvegardes/web #TODO : faut récupérer jour/mois/année