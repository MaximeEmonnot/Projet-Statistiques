# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données La Liga
DataFootball_La_Liga <- DataFootball[DataFootball$Competition == "es La Liga", -which(names(DataFootball) == "Competition")]

# Barplots
barplot(DataFootball_La_Liga$Joueurs.utilisees, 
        names = row.names(DataFootball_La_Liga), horiz=T, las=1, col = "#69b3a2", main = "Joueurs utilisees", cex.names = 0.5)


# Barplots
for(i in 1:ncol(DataFootball_La_Liga))
{
  png(file = gsub(" ", "", paste("./Diagrammes/Comparaison_Equipes_La_Liga/", colnames(DataFootball_La_Liga)[i], ".png")), 
      width = 1920, 
      height = 1080)
  barplot(DataFootball_La_Liga[,i], names = row.names(DataFootball_La_Liga), horiz=T, las=1, col = "#69b3a2", main = colnames(DataFootball_La_Liga)[i])
  dev.off()
}