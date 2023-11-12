# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Serie A
DataFootball_SerieA <- DataFootball[DataFootball$Competition == "it Serie A", -which(names(DataFootball) == "Competition")]

# Chargement des librairies
library(ggplot2)
library(FactoMineR)
library(factoextra)

# Génération de l'ACP
DataFootball_SerieA_ACP <- PCA(DataFootball_SerieA)

# Valeurs propres
valeursPropresLigue1 <- DataFootball_SerieA_ACP$eig
View(valeursPropresLigue1)
fviz_eig(DataFootball_SerieA_ACP)

# Nuage de points des individus dans le plan factoriel
fviz_pca_ind(DataFootball_SerieA_ACP)                                                   # Tout en noir
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "contrib")                              # Contribution
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2")                                 # Qualité

# Représentation des individus dans le plan factoriel
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.50)) # Individus représentés pour cos2 >= 0.50
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.55)) # Individus représentés pour cos2 >= 0.55
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.60)) # Individus représentés pour cos2 >= 0.60
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.65)) # Individus représentés pour cos2 >= 0.65
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.70)) # Individus représentés pour cos2 >= 0.70
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.75)) # Individus représentés pour cos2 >= 0.75
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.80)) # Individus représentés pour cos2 >= 0.80
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.85)) # Individus représentés pour cos2 >= 0.85
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.90)) # Individus représentés pour cos2 >= 0.90
fviz_pca_ind(DataFootball_SerieA_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.95)) # Individus représentés pour cos2 >= 0.95

# Représentation des contributions des variables aux axes
fviz_contrib(DataFootball_SerieA_ACP, choice = "var", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_SerieA_ACP, choice = "var", c(2))                             # Contribution à l'axe 2
contributionsVariablesSerieA <- DataFootball_SerieA_ACP$var$contrib                     # Contributions
View(contributionsVariablesSerieA)

# Représentation des contributions des individus aux axes
fviz_contrib(DataFootball_SerieA_ACP, choice = "ind", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_SerieA_ACP, choice = "ind", c(2))                             # Contribution à l'axe 2
contributionsIndividusSerieA <- DataFootball_SerieA_ACP$ind$contrib                     # Contributions
View(contributionsIndividusSerieA)

# Disque des corrélations
fviz_pca_var(DataFootball_SerieA_ACP)                                                   # Tout en noir
fviz_pca_var(DataFootball_SerieA_ACP, col.var = "cos2")                                 # Couleur selon la qualité
fviz_pca_var(DataFootball_SerieA_ACP, col.var = "contrib")                              # Couleur selon la contribution
