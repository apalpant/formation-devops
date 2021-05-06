from jeu.jeu import *


class Manager:

    _listeJeux = []
    _lignes = []

    # Destructeur
    def __del__(self):
        self._listeJeux.clear()

    def recupereListeJeux(self):
        # On ouvre le fichier
        f = open("jeux.txt", "r")
        self._lignes = f.readlines()
        for ligne in self._lignes:
            parametres = ligne.split(',')
            self._listeJeux.append(Jeu(len(self._listeJeux), parametres[0], parametres[1], parametres[2],
                                       parametres[3], parametres[4], parametres[5], parametres[6]))
        f.close()

    def listeJeux(self):
        for jeu in self._listeJeux:
            print(jeu._nom)

    def ajouterJeu(self):
        print("+----- Ajout d'un jeu ----+")
        nom = input("Quel est son nom ? ")
        editeur = input("Quel est son editeur ? ")
        anneeDeSortie = input("Quel est son annee de sortie ? ")
        description = input("Quel est sa description ? ")
        categorie = input("Quel est son categorie ? ")
        duree = input("Quel est son duree ? ")
        nbJoueurs = input("Quel est son nbJoueurs ? ")
        nouveauJeu = Jeu(len(self._listeJeux), nom, editeur,
                         anneeDeSortie, description, categorie, duree, nbJoueurs)
        self._listeJeux.append(nouveauJeu)
        self._lignes.append(nouveauJeu.printFile())
        print("+----- Ajout d'un jeu termine ----+")

    def supprimerJeu(self):
        print("+----- Suppression d'un jeu ----+")
        id = int(input("Quel est son identifiant ? "))
        self._listeJeux.pop(id)
        self._lignes.pop(id)
        print("+----- Suppression d'un jeu termine ----+")

    def voirJeu(self):
        print("+----- Consultation d'un jeu ----+")
        id = int(input("Quel est son identifiant ? "))
        self._listeJeux[id].printConsole()
        print("+----- Consultation d'un jeu termine ----+")
        
    def sauvegarder(self):
        f = open("jeux.txt", "w")
        f.writelines(self._lignes)
        f.close()
