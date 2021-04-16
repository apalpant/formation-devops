nombre_a = int(input("Saisissez un nombre: "))
nombre_b = int(input("Saisissez un autre nombre: "))
min = nombre_a if(nombre_a < nombre_b) else nombre_b
print("Le plus petit des deux nombres est {}".format(min))
