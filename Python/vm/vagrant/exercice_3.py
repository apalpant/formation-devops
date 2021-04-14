jours_semaine = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche']
print("### FOR - jours ouvres ###")
for i in range(0,5):
    print(jours_semaine[i])
    
print("### FOR - jours weekend ###")
for i in range(5,7):
    print(jours_semaine[i])
    
print("### WHILE - jours ouvres ###")
index = 0
while index < 5:
    print(jours_semaine[index])
    index = index + 1
    
print("### WHILE - jours weekend ###")
while index < 7:
    print(jours_semaine[index])
    index = index + 1

print("### RANGE ###")
print(jours_semaine[0:5])

print("### Dernier jour - methode 1 ###")
print(jours_semaine[len(jours_semaine) - 1])

print("### Dernier jour - methode 2 ###")
jours_semaine_reversee = jours_semaine
jours_semaine_reversee.reverse()
print(jours_semaine_reversee[0])

print("### Dernier jour - methode 3 ###")
print(jours_semaine[-0])

printemps = ['mars', 'avril', 'mai']
ete = ['juin', 'juillet', 'aout']
automne = ['septembre', 'octobre', 'novembre']
hiver = ['decembre', 'janvier', 'fevrier']

saisons = [printemps, ete, automne, hiver]

print("### saisons[0] ###")
print(saisons[0])

print("### saisons[1][0] ###")
print(saisons[1][0])


print("### saisons[1:2] ###")
print(saisons[1:2])

print("### saisons[:][1] ###")
print(saisons[:][1])
# Slicing fetches sections

print("### Table de 9 - range ###")
for i in range(1,10): print("{} x {} = {}".format(9, i, i*9)) 

print("### Nombres pairs - methode 1 ###")
nbNombresPairs = 0
for i in range(2,10001): 
    if(i % 2 == 0): 
        nbNombresPairs = nbNombresPairs + 1
print(nbNombresPairs)       

print("### Nombres pairs - methode 2 ###")
print(len(list(filter(lambda nb: nb % 2 == 0, list(range(2,10001))))))