import unicodedata

# On declare le fichier
filepath = 'dico.txt'

# On ouvre le fichier
with open(filepath) as fp:
    
    # On lit la premiere ligne
    line = fp.readline()
    
    # Tant que line est non vide
    while line:

        # On manipule la ligne courante en uppercase et sans retour chariot (rstrip())
        entree = line.rstrip()

        # On enleve aussi les accents pour avoir tous les cas (ex: rêver)
        ligne = unicodedata.normalize(
            'NFKD', entree.upper()).encode('ASCII', 'ignore')

        # On renverse la ligne courante
        reverse = ligne[::-1]

        # print("Compare {} avec {}".format(ligne, reverse))

        # Si la ligne lue a l'envers est la meme que la ligne courante => c'est un palindrome
        if(ligne == reverse and len(ligne) > 1):
            print("{} est un palindrome".format(entree))

        # On recupere la ligne suivante
        line = fp.readline()

# On le ferme proprement le fichier
fp.close()
