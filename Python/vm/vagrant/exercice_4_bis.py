# importing functools for reduce()
import functools

# On declare le fichier
filepath = 'notes.txt'

# On ouvre le fichier de resultats
resultat = open("notes2.txt", "w+")

# On declare les lignes de resultat
lignes_resultat = []

# On declare la somme des notes
somme_notes = 0

# On declare le tableau de notes
notes = []

with open(filepath) as fp:
    # On lit la premiere ligne
    line = fp.readline()
    # On declare le nombre de notes
    nombre_notes = 0
    # Tant que line est non vide
    while line:
        # try:
        #    note = float(line)
        # except:
        #    print("la ligne {} ne contient pas un nombre".format(nombre_notes))

        # On recupere la note en float
        note = float(line)

        # On fait la somme des notes avec la nouvelle note
        somme_notes += note

        # On ajoute a la liste de notes la nouvelle note
        notes.append(note)

        # On regarde si la note permet d'etre admis (sinon recale)
        admis = 'admis' if(note >= 10) else 'recale'

        # On mets en forme la ligne de resultat
        ligne_resultat = "{:.1f} {}\n".format(note, admis)

        # On ajoute la ligne de resultat a la liste
        lignes_resultat.append(ligne_resultat)

        # On incremente le nombre de notes
        nombre_notes += 1

        # On recupere la ligne suivante
        line = fp.readline()

# On ecrit dans le fichier les lignes contenant les resultats
resultat.writelines(lignes_resultat)

# On le ferme proprement le fichier des notes
fp.close()

# On le ferme proprement le fichier de resultat
resultat.close()

# On calcule la somme des notes
sum = functools.reduce(lambda x, y: x+y, notes)

# On affiche la moyenne (somme)
print("Moyenne (somme) {:.2f}".format(somme_notes / nombre_notes))

# On affiche la moyenne (reduce)
print("Moyenne (reduce) {:.2f}".format(sum / len(notes)))
