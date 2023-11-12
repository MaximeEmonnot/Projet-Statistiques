# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Serie A
DataFootball_SerieA <- DataFootball[DataFootball$Competition == "it Serie A", -which(names(DataFootball) == "Competition")]

# Barplots
for(i in 1:ncol(DataFootball_SerieA))
{
  png(file = gsub(" ", "", paste("./Diagrammes/Comparaison_Equipes_SerieA/", colnames(DataFootball_SerieA)[i], ".png")), 
      width = 1920, 
      height = 1080)
  barplot(DataFootball_SerieA[,i], names = row.names(DataFootball_SerieA), horiz=T, las=1, col = "#69b3a2", main = colnames(DataFootball_SerieA)[i])
  dev.off()
}

