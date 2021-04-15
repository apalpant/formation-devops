nbLignes = int(input("Nombre de lignes: "))

for i in reversed(range(nbLignes)):
    chapeau = "^" * ((nbLignes * 2) - ((2 * i) + 1))
    espace = " " * (i)
    print("{}{}{}".format(espace, chapeau, espace))
