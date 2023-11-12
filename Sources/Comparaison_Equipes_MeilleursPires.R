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

# Barplots
for(i in 1:ncol(DataFootball_MeilleursPires))
{
  png(file = gsub(" ", "", paste("./Diagrammes/Comparaison_Equipes_MeilleursPires/", colnames(DataFootball_MeilleursPires)[i], ".png")), 
      width = 1920, 
      height = 1080)
  barplot(DataFootball_MeilleursPires[,i], names = row.names(DataFootball_MeilleursPires), horiz=T, las=1, col = "#69b3a2", main = colnames(DataFootball_MeilleursPires)[i])
  dev.off()
}

