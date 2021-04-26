#!/bin/sh

# Le but de ce script est de compter de 1 jusqu'à la valeur N donnée en parametre
# Mais si le parametre n'est pas défini, on compte jusqu'a 10 
# 
help() {
	echo "Usage: compteur-unix.sh [options]"
	echo ""
	echo "Compteur entre deux valeurs (min et max)"
	echo ""
	echo "Options"
	echo "--min X        Définit le min (1 par défaut)"
	echo "--max Y        Définit le max (10 par défaut)"
	echo "--help, -h     Affiche cette aide"
	echo ""
}


## Phase 0 : les valeurs par défaut
MIN=1
MAX=10

## Phase 1 : lire les parametres

# si j'oublie de mettre un parametre, alors j'affiche l'aide et je quitte
if [ $# -lt 1 ]; then
	help
	exit 1
fi

# je prend connaissance des parametres
while [ $# -gt 0 ]; do
	ARG="$1"
	shift
	case "$ARG" in
	--min)
		MIN=$(( $1 )) # on force la conversion en chiffre pour éviter les bugs 
		shift
		;;
	--max)
		MAX=$(( $1 )) # on force la conversion en chiffre pour éviter les bugs 
		shift
		;;
	--help|-h)
		help
		exit 0
		;;
	*)
		echo "ERREUR: option inconnue: $ARG"
		exit 2
		;;
	esac
done

## Phase 2 : faire le comptage

# on corrige automatiquement parce qu'on est sympas :)
if [ $MIN -gt $MAX ]; then
	TMP=$MIN
	MIN=$MAX
	MAX=$TMP
fi

for i in $(seq $MIN $MAX) ; do
	echo $i
done

