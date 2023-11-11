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

# Barplots
for(i in 1:ncol(DataFootball_Competitions))
{
  png(file = gsub(" ", "", paste("./Diagrammes/Comparaison_Competitions/", colnames(DataFootball_Competitions)[i], ".png")), 
      width = 1920, 
      height = 1080)
  barplot(DataFootball_Competitions[,i], names = row.names(DataFootball_Competitions), horiz=T, las=1, col = "#69b3a2", main = colnames(DataFootball_Competitions)[i])
  dev.off()
}

