# Import
import random

# Creation de la liste de carte de base
liste_carte = list(range(2, 11))
liste_carte.extend(['Valet', 'Dame', 'Roi', 'As'])

print("liste carte: {}".format(liste_carte))

# On construit le premier jeu
premier_jeu = []
for couleur in ['pique', 'carreau', 'trefle', 'coeur']:
    for carte in liste_carte:
        premier_jeu.append(str(carte)+"_"+couleur)

print("premier jeu {}".format(premier_jeu))

# On effecte le deuxieme jeu
deuxieme_jeu = premier_jeu
print("deuxieme jeu {}".format(deuxieme_jeu))

# On effectue le tirage du premier jeu
tirage_premier_jeu = random.choices(premier_jeu, k=10)
print("tirage premier jeu {}".format(tirage_premier_jeu))

# On effectue le tirage du deuxieme jeu
tirage_deuxieme_jeu = random.choices(deuxieme_jeu, k=10)
print("tirage deuxieme jeu {}".format(tirage_deuxieme_jeu))

# On recherche les cartes identiques dans les 2 tirages
cartes_identiques = []
for index in range(10):
    if(tirage_premier_jeu[index] in tirage_deuxieme_jeu):
        cartes_identiques.append(tirage_premier_jeu[index])

print(cartes_identiques)
