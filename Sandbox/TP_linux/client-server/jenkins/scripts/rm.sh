echo "Suppression de $1..."

CORBEILLE="$(realpath ~/corbeille)"

if [ -f $(realpath $1) ]
then
    # Creation du filename.info
    echo $(realpath $1 | xargs dirname) > $(basename $1).info

    # Deplacement du fichier dans la corbeille
    mv $1 $(basename $1).info $CORBEILLE

    echo "Suppression de $1 effectuee"
else
    echo "Fichier $1 inexistant dans le repertoire, suppression abandonnee"
fi
