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
library(corrplot)
library(DataExplorer)

# Matrice des corrélations
corrplot(cor(DataFootball_Competitions))
plot_correlation(DataFootball_Competitions)
corrplot.mixed(cor(DataFootball_Competitions),
               upper = "circle",
               lower = "number",
               addgrid.col = "black",
               tl.col = "black")
corrplot(
  cor(DataFootball_Competitions),
  method = "circle",
  type = "upper",
  tl.col = "black",
  tl.cex = 0.75,
  col = colorRampPalette(c("red", "blue"))(200)
)
