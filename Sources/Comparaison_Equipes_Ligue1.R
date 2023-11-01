# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Ligue 1
DataFootball_Ligue1 <- DataFootball[DataFootball$Competition == "fr Ligue 1", -which(names(DataFootball) == "Competition")]

# Barplots
for(i in 1:ncol(DataFootball_Ligue1))
{
  png(file = gsub(" ", "", paste("./Diagrammes/Comparaison_Equipes_Ligue_1/", colnames(DataFootball_Ligue1)[i], ".png")), 
      width = 1920, 
      height = 1080)
  barplot(DataFootball_Ligue1[,i], names = row.names(DataFootball_Ligue1), horiz=T, las=1, col = "#69b3a2", main = colnames(DataFootball_Ligue1)[i])
  dev.off()
}

