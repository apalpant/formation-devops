import unicodedata


def estPalindrome(chaine):
    # On enleve les accents pour avoir tous les cas (ex: rêver)
    ligne = unicodedata.normalize(
        'NFKD', chaine.upper()).encode('ASCII', 'ignore')

    # On renverse la ligne courante
    reverse = ligne[::-1]

    # print("Compare {} avec {}".format(ligne, reverse))

    # Si la ligne lue a l'envers est la meme que la ligne courante => c'est un palindrome
    return(ligne == reverse and len(ligne) > 1)


saisie = input("Saisissez votre chaine: ")
resultat = "est" if(estPalindrome(saisie)) else "n'est pas"
print("La chaine \"{}\" {} un palindrome".format(saisie, resultat))
