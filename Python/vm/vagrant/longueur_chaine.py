chaine_a = input("Saisissez une chaine: ")
chaine_b = input("Saisissez une autre chaine: ")
max = chaine_a if(len(chaine_a) > len(chaine_b)) else chaine_b
print("Le plus grande des deux chaine est {}".format(max))
