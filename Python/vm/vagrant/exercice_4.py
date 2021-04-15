# On ouvre le fichier
f = open("loremipsum.txt", "r+")

# On recupere les lignes (sous forme de liste)
lines = f.readlines()

# On affiche le contenu
print(lines)

# On insert a la ligne 5 la nouvelle chaine
lines.insert(
    4, "Ma nouvelle chaine insérée dans mon fichier texte au milieu du lorem ipsum\n\n")

# /!\ ON REMET LE 'FILE POINTER' A 0 /!\ pour ecrire au debut du fichier
f.seek(0)

# On re-ecrit le fichier
f.writelines(lines)

# On le ferme proprement
f.close()
