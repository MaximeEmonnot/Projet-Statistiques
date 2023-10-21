# Projet-Statistiques
Projet dans le cadre du Master 1 BDMA à Blois.  
Réalisé par Manon LACOMBE et Maxime EMONNOT.

## Table des matières

- [Conventions](#conventions)
    * [Casse des variables](#casse-des-variables)
    * [Langue des fichiers](#langue-des-fichiers)
    * [Initialisation des variables](#initialisation-des-variables)
    * [Alignements](#alignements)
    * [Commentaires](#commentaires)
- [Rappels de R](#rappels)
    * [Charger un package](#charger-un-package)
    * [Lister les jeux de données](#lister-les-jeux-de-données)
    * [Afficher une vue vers un jeu de données](#afficher-une-vue-vers-un-jeu-de-données)
    * [Afficher une page wiki d'un jeu de données ou d'une fonction](#afficher-une-page-wiki-dun-jeu-de-données-ou-dune-fonction)
    * [Afficher une courte description du jeu de données](#afficher-une-courte-description-du-jeu-de-données-nombre-de-lignes-de-colonnes-nom-des-variables-type-des-variables-quelques-exemples)
    * [Filtrer les données](#filtrer-les-données)

## Conventions

Quelques conventions ont été définies au préalable. 

### Casse des variables

Le nommage des variables suit le schéma suivant, en partant du moins précis au plus précis : 
1. Si la variable est une variable classique, elle est définie en `camelCase`.
2. Si la variable est un jeu de données, elle est définie en `PascalCase`
3. Si la variable est un jeu de données tratié, un suffixe explicitant le traitement est ajouté (*Exemple : jeuDeDonnee_CentreReduit*)

### Langue des fichiers

La rédaction du code doit se réaliser en **Anglais**.   
La rédaction des commentaires doit se réaliser en **Français** pour faciliter la compréhension de notre travail.   
Voir [Commentaires](#commentaires) pour voir les autres indications pour les commentaires.

### Initialisation des variables

Les variables doivent être initialisées de préférence avec l'opérateur `<-`.  
Bien que l'opérateur `=` puisse également réaliser cette fonction, il est préférable d'éviter de l'utiliser, sachant que cet opérateur est utilisé aussi pour définir des paramètres internes aux fonctions.

### Alignements

Si un alignement doit avoir lieu, il est préférable de réaliser cet alignement avec des **espaces** et non des **tabulations**.

Le problème des tabulations est le caractère personnalisé. Un développeur peut modifier la taille de ses tabulations, ce qui fait qu'une tabulation dans un environnement n'aura pas nécessairement le même rendu dans un autre environnement.

Pour remédier à cela, **utiliser uniquement les espaces pour les alignements et les indentations**.

### Commentaires

Un commentaire commence forcément avec un `#` en R. Il est donc préférable de les écrire de cette manière : 
```R
# Ceci est un commentaire dans une seule ligne. Un espace est mis entre le # et le premier caractère

# Ceci est un commentaire en 
# plusieurs lignes. Même consigne que pour la ligne simple

# Ceci est un commentaire avec une liste à puce : 
# - Premier point
#   * Penser à changer de caractère pour la puce
#     + Afin de mieux lire les instructions
# - Deuxième point
#   * Aligner les puces avec le premier caractère du niveau précédent
#     + Pour que ce soit plus propre et plus agréable à lire 

# Ceci est un commentaire avec une liste chiffrée : 
# 1.  Ces commentaires sont 
# 2.  un peu plus difficiles
# 3.  à écrire en raison
# 4.  de l'alignement qui
# 5.  doit intervenir 
# 6.  lorsque le nombre
# 7.  de points abordés
# 8.  dépasse 10. Pas
# 9.  sûr que cela arrive
# 10. à un moment donné,
# 11. mais cette règle est
# 12. quand même définie.
```

## Rappels

Petits rappels car nous sommes humains, ça arrive d'oublier des trucs...

### Charger un package
```R
library(nomDuPaquet)
```

### Lister les jeux de données
```R
data()
```

### Afficher une vue vers un jeu de données
```R
View(jeuDeDonnee)
```

### Afficher une page wiki d'un jeu de données ou d'une fonction
```R
?jeuDeDonnee
```

### Afficher une courte description du jeu de données (Nombre de lignes, de colonnes, nom des variables, type des variables, quelques exemples...)
```R
glimpse(jeuDeDonnee)
```

### Filtrer les données
```R
filter(jeuDeDonnee, condition)
```

### Ajouter une ligne à un jeu de donnée
```R
mutate(jeuDeDonnee, nouvelleLigne = valeur)
```