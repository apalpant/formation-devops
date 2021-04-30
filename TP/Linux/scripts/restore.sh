#!/bin/sh

echo "Restauration de $1..."

CORBEILLE="/home/vagrant/corbeille"

if [ -f "$CORBEILLE/$1" ]
then
    # Restauration du fichier a partir de la corbeille
    mv $CORBEILLE/$1 $(cat $CORBEILLE$1.info)
    rm $CORBEILLE/$1.info

    echo "Restauration de $1 effectuee"
else
    echo "Fichier $1 inexistant dans la corbeille, restauration abandonnee"
fi
