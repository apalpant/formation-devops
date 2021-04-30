#!/bin/sh

# Ce script s'execute toutes les heures

# sauvegarder le répertoire /var/www/html/
cp /usr/local/jenkins/ /usr/local/jenkins.back/

# Création d'une compression du répertoire /usr/local/jenkins/
tar zcvf serveur_web_jour_mois_annee.tar.gz /usr/local/jenkins/

# Positionner la compression sur le serveur NFS
mv serveur_ic_jour_mois_annee.tar.gz /mnt/sauvegardes/jenkins #TODO : faut récupérer jour/mois/année