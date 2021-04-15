devise = input("Saisissez une devise: ")
montant = float(input("Saisissez un montant: "))
if(devise == "E" or devise == "€"):
    print("Cela represente {}$".format(montant * 1.2))
elif devise == "$":
    print("Cela represente {}€".format(montant / 1.2))
else:
    print("La devise que vous avez saisi est incorrecte. Utilisez E/€ ou $")
