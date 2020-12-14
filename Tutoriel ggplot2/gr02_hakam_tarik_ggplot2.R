# Chargement du dataset "iris"
data("iris")

# Visualisation des 6 premières du dataset
head(iris)

# Affichage du nom des colonnes
attr(iris,"names")

# Affichage de l'état des données
summary(iris)

# Chargement de la library ggplot2
library("ggplot2")

# Simple plot sans ggplot2 : longueur de la pétale en fonction de la longueur du sépale
plot(x=iris$Sepal.Length, y=iris$Petal.Length, 
     xlab="Sepal Length", ylab="Petal Length",  main="Sepal-Petal Length Comparaison")

# Simple plot avec ggplot2, avec couleur en fonction de l'espèce
scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Petal.Length)) 
scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +  ylab("Petal Length") +
  ggtitle("Sepal-Petal Length Comparaison")

# Histogramme : Nombre d'individus en fonction de la longueur des pétales
hist_p <- ggplot(iris, aes(Petal.Length)) + geom_histogram() +
  xlab("Longueur des pétales") +  ylab("Nombre d'individus") +
  ggtitle("Nombre d'individus en fonction de la longueur des pétales")
hist_p

# Fonction de densité de la longueur des pétales
ggplot(iris, aes(Petal.Length)) + geom_density() +
  xlab("Longueur des pétales") +  ylab("Densité d'individus") +
  ggtitle("Fonction de densité de la longueur des pétales")

# Fonction de densité de la longueur des pétales en fonction des espèces
ggplot(iris, aes(Petal.Length, color = Species)) + geom_density() +
  xlab("Longueur des pétales") +  ylab("Densité d'individus") +
  ggtitle("Fonction de densité de la longueur des pétales par espèce")

# Boite à moustache de la longueur des pétales par espèces
ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_boxplot() +
  xlab("Espèces") +  ylab("Longueur des pétales") +
  ggtitle("Boite à moustache de la longueur des pétales par espèce")

# Fonctions de densité de la longueur des pétales par espèces
ggplot(iris, aes(x = Petal.Length, color = Species)) + geom_density() + facet_wrap(~ Species) +
  xlab("Longueur des pétales pour chaque espèce") +  ylab("Densité d'individus") +
  ggtitle("Fonction de densité de la longueur des pétales par espèce")

# Diagramme en batons de la variable espèce
b <- ggplot(iris, aes(x=Species))
b + geom_bar(aes(fill = Species)) + 
  xlab("Espèces") +  ylab("Nombre d'individus") +
  ggtitle("Nombre d'individus en fonction des espèces")
