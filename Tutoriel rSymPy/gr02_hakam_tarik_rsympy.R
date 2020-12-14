library(rSymPy)

# Définition des variables x et y
sympy("var('x')")
sympy("y = x*x")
sympy("y")

# Création de la matrice A en fonction de x et y précédemment définis
cat(sympy("A = Matrix([[1,x], [y,1]])"), "\n")

# Carré de la matrice A
cat(sympy("A**2"), "\n")

# Limite de racine de x pour x allant vers l'infini
sympy("limit(sqrt(x), x, oo)")


