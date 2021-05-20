#!/bin/bash
CONTAINER=$1
DB=exo3
DEST=$HOME/exo4-correction/backups
TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`

docker exec -it $CONTAINER mysqldump -ppassword $DB >  $DEST/backup-$DB-$TIMESTAMP.sql
