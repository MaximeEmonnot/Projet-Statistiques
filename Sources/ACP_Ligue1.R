# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Ligue 1
DataFootball_Ligue1 <- DataFootball[DataFootball$Competition == "fr Ligue 1", -which(names(DataFootball) == "Competition")]

# Chargement des librairies
library(ggplot2)
library(FactoMineR)
library(factoextra)

# Génération de l'ACP
DataFootball_Ligue1_ACP <- PCA(DataFootball_Ligue1)

# Valeurs propres
valeursPropresLigue1 <- DataFootball_Ligue1_ACP$eig
View(valeursPropresLigue1)
fviz_eig(DataFootball_Ligue1_ACP)

# Nuage de points des individus dans le plan factoriel
fviz_pca_ind(DataFootball_Ligue1_ACP)                                                   # Tout en noir
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "contrib")                              # Contribution
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2")                                 # Qualité

# Représentation des individus dans le plan factoriel
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.50)) # Individus représentés pour cos2 >= 0.50
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.55)) # Individus représentés pour cos2 >= 0.55
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.60)) # Individus représentés pour cos2 >= 0.60
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.65)) # Individus représentés pour cos2 >= 0.65
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.70)) # Individus représentés pour cos2 >= 0.70
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.75)) # Individus représentés pour cos2 >= 0.75
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.80)) # Individus représentés pour cos2 >= 0.80
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.85)) # Individus représentés pour cos2 >= 0.85
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.90)) # Individus représentés pour cos2 >= 0.90
fviz_pca_ind(DataFootball_Ligue1_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.95)) # Individus représentés pour cos2 >= 0.95

# Représentation des contributions des variables aux axes
fviz_contrib(DataFootball_Ligue1_ACP, choice = "var", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_Ligue1_ACP, choice = "var", c(2))                             # Contribution à l'axe 2
contributionsVariablesLigue1 <- DataFootball_Ligue1_ACP$var$contrib                     # Contributions
View(contributionsVariablesLigue1)

# Représentation des contributions des individus aux axes
fviz_contrib(DataFootball_Ligue1_ACP, choice = "ind", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_Ligue1_ACP, choice = "ind", c(2))                             # Contribution à l'axe 2
contributionsIndividusLigue1 <- DataFootball_Ligue1_ACP$ind$contrib                     # Contributions
View(contributionsIndividusLigue1)

# Disque des corrélations
fviz_pca_var(DataFootball_Ligue1_ACP)                                                   # Tout en noir
fviz_pca_var(DataFootball_Ligue1_ACP, col.var = "cos2")                                 # Couleur selon la qualité
fviz_pca_var(DataFootball_Ligue1_ACP, col.var = "contrib")                              # Couleur selon la contribution
