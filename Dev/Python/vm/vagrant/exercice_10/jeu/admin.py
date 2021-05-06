from jeu.utilisateur import *


class Admin(Utilisateur):

    def __init__(self, dictionnaire):
        super().__init__(dictionnaire)
        self._role = "ADMIN"

    def remove(self, liste):
        liste.pop()