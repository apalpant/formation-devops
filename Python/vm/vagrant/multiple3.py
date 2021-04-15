nombre = int(input("Saisissez un nombre: "))
if (nombre % 2 == 0):
    print("Ce nombre est pair")
elif (nombre % 3 == 0):
    print("Ce nombre est impair, mais est multiple de 3")
else:
    print("Ce nombre n’est ni pair ni multiple de 3")
