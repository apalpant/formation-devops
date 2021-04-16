# Import
import random

# Methode pour imprimer le resultat du pendu


def printPendu(choix, lettresTrouvees, trouve):
    retour = ""
    for lettre in choix:
        if(lettre in lettresTrouvees):
            retour += lettre
        else:
            retour += "_"
    if not trouve:
        print(retour)

# Methode de la boucle du jeu


def boucle_du_jeu(lettresATrouver, choix):
    # On definit le nombre d'essais maximum
    nbEssaisMax = 10

    # On definit le nombre d'essais
    nbEssais = 0

    # On initialise les variables
    lettresTrouvees = set([])
    trouve = False

    # Tant qu'on n'a pas atteint le nombre d'essai max ou qu'on n'a pas trouve
    while nbEssais < nbEssaisMax and (not trouve):

        # On recupere la lettre saisie
        lettre = input("Tapez une lettre: ")

        # On incremente le nombre d'essais
        nbEssais += 1

        # Si la lettre est contenue dans le set des lettres a trouver
        if(lettre in lettresATrouver):

            # On ajoute dans le set des lettres trouvees la lettre saisie
            lettresTrouvees.add(lettre)

            # Si les 2 sets sont identiques alors on a trouve le mot
            if(len(lettresTrouvees) == len(lettresATrouver)):
                trouve = True
                print("Vous avez trouve le mot {} en {} essais. Bravo !".format(
                    choix, nbEssais))

        # On imprime le resultat du pendu
        printPendu(choix, lettresTrouvees, trouve)

    return trouve


# On ouvre le fichier
f = open("pendu.txt", "r")

# On recupere les lignes (sous forme de liste)
lines = f.readlines()

# On selectionne un mot au hasard dans la liste
choix = random.choices(lines, k=1)
# On 'nettoie' la chaine
choix = choix[0].rstrip()

# On identifie les lettres a trouver
lettresATrouver = set([])

# Pour chaque lettre contenue dans le mot choisi
for lettre in choix:
    # On ajoute la lettre dans le set car il ne peut pas contenir de doublons...
    lettresATrouver.add(lettre)

# On regarde si on a trouve le mot
trouve = boucle_du_jeu(lettresATrouver, choix)

# Si on n'a pas trouve
if(not trouve):
    # On affiche les messages d'erreurs
    print("Vous avez perdu")
    print("Le mot etait donc {}".format(choix))
