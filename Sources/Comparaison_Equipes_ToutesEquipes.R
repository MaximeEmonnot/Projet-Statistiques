# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données toutes les équipes
DataFootball_ToutesEquipes <- DataFootball[,-which(names(DataFootball) == "Competition")]

# Barplots
for(i in 1:ncol(DataFootball_ToutesEquipes))
{
  png(file = gsub(" ", "", paste("./Diagrammes/Comparaison_Equipes_ToutesEquipes/", colnames(DataFootball_ToutesEquipes)[i], ".png")), 
      width = 1920, 
      height = 1080)
  barplot(DataFootball_ToutesEquipes[,i], names = row.names(DataFootball_ToutesEquipes), horiz=T, las=1, col = "#69b3a2", main = colnames(DataFootball_ToutesEquipes)[i])
  dev.off()
}

