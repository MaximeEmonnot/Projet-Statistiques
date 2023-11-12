# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données toutes les équipes (Meilleures et Pires)
DataFootball_PremierLeague <- DataFootball[DataFootball$Competition == "eng Premier League", -which(names(DataFootball) == "Competition")]
DataFootball_Ligue1        <- DataFootball[DataFootball$Competition == "fr Ligue 1",         -which(names(DataFootball) == "Competition")]
DataFootball_LaLiga        <- DataFootball[DataFootball$Competition == "es La Liga",         -which(names(DataFootball) == "Competition")]
DataFootball_SerieA        <- DataFootball[DataFootball$Competition == "it Serie A",         -which(names(DataFootball) == "Competition")]

DataFootball_PremierLeague_Meilleurs <- DataFootball_PremierLeague[order(-DataFootball_PremierLeague$Match.gagnee),][c(1,2),]
DataFootball_PremierLeague_Pires     <- DataFootball_PremierLeague[order(DataFootball_PremierLeague$Match.gagnee),][c(1,2),]
DataFootball_Ligue1_Meilleurs        <- DataFootball_Ligue1[order(-DataFootball_Ligue1$Match.gagnee),][c(1,2),]
DataFootball_Ligue1_Pires            <- DataFootball_Ligue1[order(DataFootball_Ligue1$Match.gagnee),][c(1,2),]
DataFootball_LaLiga_Meilleurs        <- DataFootball_LaLiga[order(-DataFootball_LaLiga$Match.gagnee),][c(1,2),]
DataFootball_LaLiga_Pires            <- DataFootball_LaLiga[order(DataFootball_LaLiga$Match.gagnee),][c(1,2),]
DataFootball_SerieA_Meilleurs        <- DataFootball_SerieA[order(-DataFootball_SerieA$Match.gagnee),][c(1,2),]
DataFootball_SerieA_Pires            <- DataFootball_SerieA[order(DataFootball_SerieA$Match.gagnee),][c(1,2),]

DataFootball_MeilleursPires <- data.frame(DataFootball_PremierLeague_Meilleurs)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_PremierLeague_Pires)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_Ligue1_Meilleurs)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_Ligue1_Pires)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_LaLiga_Meilleurs)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_LaLiga_Pires)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_SerieA_Meilleurs)
DataFootball_MeilleursPires <- rbind(DataFootball_MeilleursPires, DataFootball_SerieA_Pires)

# Chargement des librairies
library(ggplot2)
library(FactoMineR)
library(factoextra)

# Génération de l'ACP
DataFootball_MeilleursPires_ACP <- PCA(DataFootball_MeilleursPires)

# Valeurs propres
valeursPropresMeilleursPires <- DataFootball_MeilleursPires_ACP$eig
View(valeursPropresMeilleursPires)
fviz_eig(DataFootball_MeilleursPires_ACP)

# Nuage de points des individus dans le plan factoriel
fviz_pca_ind(DataFootball_MeilleursPires_ACP)                                                   # Tout en noir
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "contrib")                              # Contribution
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2")                                 # Qualité

# Représentation des individus dans le plan factoriel
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.50)) # Individus représentés pour cos2 >= 0.50
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.55)) # Individus représentés pour cos2 >= 0.55
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.60)) # Individus représentés pour cos2 >= 0.60
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.65)) # Individus représentés pour cos2 >= 0.65
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.70)) # Individus représentés pour cos2 >= 0.70
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.75)) # Individus représentés pour cos2 >= 0.75
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.80)) # Individus représentés pour cos2 >= 0.80
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.85)) # Individus représentés pour cos2 >= 0.85
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.90)) # Individus représentés pour cos2 >= 0.90
fviz_pca_ind(DataFootball_MeilleursPires_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.95)) # Individus représentés pour cos2 >= 0.95

# Représentation des contributions des variables aux axes
fviz_contrib(DataFootball_MeilleursPires_ACP, choice = "var", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_MeilleursPires_ACP, choice = "var", c(2))                             # Contribution à l'axe 2
contributionsVariablesMeilleursPires <- DataFootball_MeilleursPires_ACP$var$contrib             # Contributions
View(contributionsVariablesMeilleursPires)

# Représentation des contributions des individus aux axes
fviz_contrib(DataFootball_MeilleursPires_ACP, choice = "ind", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_MeilleursPires_ACP, choice = "ind", c(2))                             # Contribution à l'axe 2
contributionsIndividusMeilleursPires <- DataFootball_MeilleursPires_ACP$ind$contrib             # Contributions
View(contributionsIndividusMeilleursPires)

# Disque des corrélations
fviz_pca_var(DataFootball_MeilleursPires_ACP)                                                   # Tout en noir
fviz_pca_var(DataFootball_MeilleursPires_ACP, col.var = "cos2")                                 # Couleur selon la qualité
fviz_pca_var(DataFootball_MeilleursPires_ACP, col.var = "contrib")                              # Couleur selon la contribution
