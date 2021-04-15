for i in range(42):
    print("Je dois refaire les exercices")

valeur = 10
while valeur != 0:
    ans = 'ans' if (valeur > 1) else 'an'
    print("C'est dans {} {} je m'en irai, j'entends le loup le renard chanter".format(
        valeur, ans))
    valeur -= 1
