# Import
import random

# On definit le nombre d'essais maximum
NB_ESSAI_MAX = 10

# On definit les lettres a trouver
lettresATrouver = set([])

# On choisit le mot a deviner


def choisitMotADeviner():

    # On ouvre le fichier
    f = open("pendu.txt", "r")

    # On recupere les lignes (sous forme de liste)
    lines = f.readlines()

    # On selectionne un mot au hasard dans la liste
    mot = random.choices(lines, k=1)
    # On 'nettoie' la chaine
    return mot[0].rstrip()

# Methode pour imprimer le resultat du pendu


def printPendu(motADeviner, lettresTrouvees, trouve):
    retour = ""
    for lettre in motADeviner:
        if(lettre in lettresTrouvees):
            retour += lettre
        else:
            retour += "_"
    if not trouve:
        print(retour)

# Methode de la boucle du jeu


def boucle_du_jeu(motADeviner):

    # On definit le nombre d'essais
    nbEssais = 0

    # On initialise les variables
    lettresTrouvees = set([])
    trouve = False

    # Tant qu'on n'a pas atteint le nombre d'essai max ou qu'on n'a pas trouve
    while nbEssais < NB_ESSAI_MAX and (not trouve):

        # On recupere la lettre saisie
        lettre = input("Tapez une lettre: ")[0:1].lower()

        # On incremente le nombre d'essais
        nbEssais += 1

        # Si la lettre est contenue dans le set des lettres a trouver
        if(lettre in lettresATrouver):

            # On ajoute dans le set des lettres trouvees la lettre saisie
            lettresTrouvees.add(lettre)

            # Si les 2 sets sont identiques alors on a trouve le mot
            if(len(lettresTrouvees) == len(lettresATrouver)):
                trouve = True
                print("Vous avez trouve le mot \"{}\" en {} essais. Bravo !".format(
                    motADeviner, nbEssais))

        # On imprime le resultat du pendu
        printPendu(motADeviner, lettresTrouvees, trouve)

    return trouve


# On choisit le mot a deviner
motADeviner = choisitMotADeviner()

# Pour chaque lettre contenue dans le mot a deviner
for lettre in motADeviner:
    # On ajoute la lettre dans le set car il ne peut pas contenir de doublons...
    lettresATrouver.add(lettre)

# On regarde si on a trouve le mot
trouve = boucle_du_jeu(motADeviner)

# Si on n'a pas trouve
if(not trouve):
    # On affiche les messages d'erreurs
    print("Vous avez perdu")
    print("Le mot etait donc {}".format(motADeviner))
