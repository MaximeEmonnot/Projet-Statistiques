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
library(corrplot)
library(DataExplorer)

# Matrice des corrélations
corrplot(cor(DataFootball_MeilleursPires))
plot_correlation(DataFootball_MeilleursPires)
corrplot.mixed(cor(DataFootball_MeilleursPires),
               upper = "circle",
               lower = "number",
               addgrid.col = "black",
               tl.col = "black")
corrplot(
  cor(DataFootball_MeilleursPires),
  method = "circle",
  type = "upper",
  tl.col = "black",
  tl.cex = 0.75,
  col = colorRampPalette(c("red", "blue"))(200)
)
