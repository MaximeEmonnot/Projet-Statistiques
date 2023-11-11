# Ouverture du fichier .csv
DataFootball_Ugly <- read.csv(file.choose(), header=T, sep=",")

# Données toutes les équipes
DataFootball_CompetitionsBrute <- DataFootball[, -which(names(DataFootball_Ugly) == "Name")]

DataFootball_MoyennesCompetition <- data.frame(
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "eng Premier League", -which(names(DataFootball_CompetitionsBrute) == "Competition")]),
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "fr Ligue 1", -which(names(DataFootball_CompetitionsBrute) == "Competition")]),
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "es La Liga", -which(names(DataFootball_CompetitionsBrute) == "Competition")]),
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "it Serie A", -which(names(DataFootball_CompetitionsBrute) == "Competition")])
)

DataFootball_Competitions <- transpose(DataFootball_MoyennesCompetition)

colnames(DataFootball_Competitions)  <- row.names(DataFootball_MoyennesCompetition)
row.names(DataFootball_Competitions) <- c("Premier League", "Ligue 1", "La Liga", "Serie A")

# Chargement des librairies
library(ggplot2)
library(FactoMineR)
library(factoextra)

# Génération de l'ACP
DataFootball_Competitions_ACP <- PCA(DataFootball_Competitions)

# Valeurs propres
valeursPropresCompetitions <- DataFootball_Competitions_ACP$eig
View(valeursPropresCompetitions)
fviz_eig(DataFootball_Competitions_ACP)

# Nuage de points des individus dans le plan factoriel
fviz_pca_ind(DataFootball_Competitions_ACP)                                                   # Tout en noir
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "contrib")                              # Contribution
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2")                                 # Qualité

# Représentation des individus dans le plan factoriel
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.50)) # Individus représentés pour cos2 >= 0.50
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.55)) # Individus représentés pour cos2 >= 0.55
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.60)) # Individus représentés pour cos2 >= 0.60
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.65)) # Individus représentés pour cos2 >= 0.65
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.70)) # Individus représentés pour cos2 >= 0.70
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.75)) # Individus représentés pour cos2 >= 0.75
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.80)) # Individus représentés pour cos2 >= 0.80
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.85)) # Individus représentés pour cos2 >= 0.85
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.90)) # Individus représentés pour cos2 >= 0.90
fviz_pca_ind(DataFootball_Competitions_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.95)) # Individus représentés pour cos2 >= 0.95

# Représentation des contributions des variables aux axes
fviz_contrib(DataFootball_Competitions_ACP, choice = "var", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_Competitions_ACP, choice = "var", c(2))                             # Contribution à l'axe 2
contributionsVariablesCompetitions <- DataFootball_Competitions_ACP$var$contrib               # Contributions
View(contributionsVariablesCompetitions)

# Représentation des contributions des individus aux axes
fviz_contrib(DataFootball_Competitions_ACP, choice = "ind", c(1))                             # Contribution à l'axe 1
fviz_contrib(DataFootball_Competitions_ACP, choice = "ind", c(2))                             # Contribution à l'axe 2
contributionsIndividusCompetitions <- DataFootball_Competitions_ACP$ind$contrib               # Contributions
View(contributionsIndividusCompetitions)

# Disque des corrélations
fviz_pca_var(DataFootball_Competitions_ACP)                                                   # Tout en noir
fviz_pca_var(DataFootball_Competitions_ACP, col.var = "cos2")                                 # Couleur selon la qualité
fviz_pca_var(DataFootball_Competitions_ACP, col.var = "contrib")                              # Couleur selon la contribution
