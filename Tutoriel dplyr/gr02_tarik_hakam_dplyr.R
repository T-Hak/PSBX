library("dplyr")
### Select columns -----------------------
select(iris, Petal.Length, Petal.Width, Species)

### Select columns by range
select(iris, Petal.Length:Species)

### Exclude variables from selection
### - avec espace : en fonction de ; - sans espace : drop
select(iris, -Sepal.Length, -Sepal.Width)

### Use pattern to select
select(iris, contains('Petal'))
select(iris, starts_with('Petal'))
select(iris, ends_with('Length'))

### Select rows ---------------------------
### Select iris from virginica species
filter(iris, Species == 'virginica')

### Select iris from setosa or virginica species
filter(iris, Species != 'setosa' & Species != 'versicolor')

### Select iris from setosa with sepal length smaller than 5 mm 
filter(iris, Species == 'virginica', Petal.Length < 6)

### Affichage de new variables
iris %>%
  mutate(Petal.Area = Petal.Width * Petal.Length,
         Sepal.Area = Sepal.Width * Sepal.Length) %>% 
  select(Species, Petal.Area, Sepal.Area)

### Create et ajout de new variables a la dataframe iris
iris$Petal.Area <- iris$Petal.Width * iris$Petal.Length
iris$Sepal.Area <- iris$Sepal.Width * iris$Sepal.Length

### Use of group_by and summarize ------------------
iris %>% 
  group_by(Species) %>% 
  summarise(Median.Petal.Length = median(Petal.Length)) %>%
arrange(Median.Petal.Length)

### Order observations -------------- avec - => DESC


