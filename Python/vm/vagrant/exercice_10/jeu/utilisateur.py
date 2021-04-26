import re


class Utilisateur():

    _role = ""

    def __init__(self, dictionnaire):
        for cle, valeur in dictionnaire.items():
            setattr(self, cle, valeur)

    def setNom(self, nom):
        self._nom = nom

    def getNom(self):
        return self._nom

    def setPrenom(self, prenom):
        self._prenom = prenom

    def getPrenom(self):
        return self._prenom

    def setRole(self, role):
        self._role = role

    def getRole(self):
        return self._role

    def setMotDePasse(self, mot_de_passe):
        x = re.search("[0-9]+[a-z]{8,}", mot_de_passe)
        print(x)
        self._mot_de_passe = mot_de_passe

    def getMotDePasse(self):
        return "*" * len(self._mot_de_passe)

    nom = property(getNom, setNom)
    prenom = property(getPrenom, setPrenom)
    role = property(getRole, setRole)
    mot_de_passe = property(getMotDePasse, setMotDePasse)
