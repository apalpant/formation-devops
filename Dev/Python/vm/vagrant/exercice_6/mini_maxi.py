def mini(a, b):
    return min(a, b)


def maxi(a, b):
    return max(a, b)


a = int(input("Saisissez un nombre a: "))
b = int(input("Saisissez un nombre b: "))
print("Le minimum est {} et le maximum est {}".format(mini(a, b), maxi(a, b)))
