from jeu.membre import *
from jeu.admin import *
from jeu.manager import *

if __name__ == '__main__':
    membre = Membre({"nom": "nom_utilisateur_1",
                     "prenom": "prenom_utilisateur1"})

    admin = Admin({"nom": "nom_utilisateur_2",
                   "prenom": "prenom_utilisateur2"})

    print(membre.nom)
    print(membre.prenom)
    print(membre.role)
    membre.mot_de_passe = "1enclaire"
    print(membre.mot_de_passe)
    print(len(membre.mot_de_passe))

    membre.modifier({"nom": "nom_utilisateur_3",
                     "prenom": "prenom_utilisateur3", "mot_de_passe": "2enclaireuh"})

    print(membre.nom)
    print(membre.prenom)
    print(membre.role)
    print(membre.mot_de_passe)
    print(len(membre.mot_de_passe))

    print(admin.nom)
    print(admin.role)
    admin.mot_de_passe = "admin"
    print("=> "+admin.mot_de_passe)

    listeUtilisateurs = [membre, admin]

    print(len(listeUtilisateurs))

    if(admin.role == "ADMIN"):
        admin.remove(listeUtilisateurs)

    print(len(listeUtilisateurs))

    print("+------------+")
    for i in range(len(listeUtilisateurs)):
        print(listeUtilisateurs[i].nom)

    # manager = Manager()
    # manager.ajouterUtilisateurs(membre)
    # manager.ajouterUtilisateurs(admin)
