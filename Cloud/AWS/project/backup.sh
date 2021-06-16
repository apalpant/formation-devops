#!/bin/bash

# configuration de la connexion a AWS
aws configure

# nom du compartiment
bucketname=myawsbucket-tp

# date du jour
backupdate=$(date +%Y-%m-%d)

# repertoire de backup
dirbackup=/home/vagrant/backup/backup-$backupdate

# création du répertoire de backup
mkdir -p $dirbackup

# nom du fichier d'archive
filebackup=$dirbackup/home-$backupdate.tar.bz2

# tar -cjf /destination/fichier.tar.bz2 /source1 /source2 /sourceN
# créé une archive bz2
# sauvegarde de /home
tar -cjf $filebackup -P /home/project/folder2backup

# sauvegarde mysql
# /usr/bin/mysqldump --user=xxxx --password=xxxx --all-databases | /usr/bin/gzip > $dirbackup/mysqldump-$backupdate.sql.gz

# copie du fichier de backup vers le compartiment s3 AWS
aws s3 cp $filebackup s3://$bucketname

# suppression de fichiers suivant une date
aws s3 ls --recursive s3://$bucketname | awk '$1 < "2021-06-16" {print $4}' | xargs -n1 -t -I 'KEY' aws s3 rm s3://$bucketname/'KEY'

# deplacement d'un fichier dans un autre type d'enregistrement
aws s3 mv $filebackup s3://$bucketname --storage-class STANDARD_IA