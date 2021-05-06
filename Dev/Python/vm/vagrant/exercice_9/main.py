# import jeu.jeu as game
# import jeu.utilisateur as user
from jeu.jeu import *
from jeu.utilisateur import *
from jeu.manager import *

if __name__ == '__main__':
    # # jeu = game.Jeu("nom", "editeur", 2014, "description", "categorie", 4, 7)
    # jeu = Jeu("nom", "editeur", 2014, "description", "categorie", 4, 7)
    # print(jeu._nom)
    # # usr = user.Utilisateur("user")
    # usr = Utilisateur("user")
    # print(usr.getNom())
    
    manager = Manager()
    manager.recupereListeJeux()
    
    manager.listeJeux()
    
    manager.voirJeu()
    
    manager.supprimerJeu()
    
    manager.ajouterJeu()
    
    manager.sauvegarder()
    
