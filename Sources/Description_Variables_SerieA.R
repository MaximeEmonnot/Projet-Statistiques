# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Ligue 1
DataFootball_SerieA <- DataFootball[DataFootball$Competition == "it Serie A", -which(names(DataFootball) == "Competition")]

# Description des variables 
summary(DataFootball_SerieA)

## Boîtes à moustache
for(i in 1:ncol(DataFootball_SerieA))
{
  png(file = paste("./Diagrammes/Description_Variables_SerieA/", colnames(DataFootball_SerieA)[i], ".png"),
      width = 1920,
      height = 1080)
  boxplot(DataFootball_SerieA[,i], main=colnames(DataFootball_SerieA)[i])
  dev.off()
}