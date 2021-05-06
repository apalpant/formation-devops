from jeu.utilisateur import *


class Membre(Utilisateur):

    def __init__(self, dictionnaire):
        super().__init__(dictionnaire)
        self._role = "MEMBRE"

    def modifier(self, dictionnaire):
        for cle, valeur in dictionnaire.items():
            setattr(self, cle, valeur)
