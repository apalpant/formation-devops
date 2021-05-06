class Jeu:

    # Constructeur
    def __init__(self, id, nom, editeur, anneeDeSortie, description, categorie, duree, nbJoueurs):
        self._id = id
        self._nom = nom
        self._editeur = editeur
        self._anneeDeSortie = anneeDeSortie
        self._description = description
        self._categorie = categorie
        self._duree = duree
        self._nbJoueurs = nbJoueurs

    def printConsole(self):
        print("### FICHE DU JEU '{}' ###".format(self._nom))
        print("Editeur: {}".format(self._editeur))
        print("AnneeDeSortie: {}".format(self._anneeDeSortie))
        print("Description: {}".format(self._description))
        print("Categorie: {}".format(self._categorie))
        print("Duree: {}".format(self._duree))
        print("NbJoueurs: {}".format(self._nbJoueurs))

    def printFile(self):
        return "\n{}, {}, {}, {}, {}, {}, {}".format(self._nom, self._editeur, self._anneeDeSortie, self._description, self._categorie, self._duree, self._nbJoueurs)

    # Destructeur
    # def __del__(self):
