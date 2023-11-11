# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données toutes les équipes
DataFootball_ToutesEquipes <- DataFootball[, -which(names(DataFootball) == "Competition")]

# Description des variables 
summary(DataFootball_ToutesEquipes)

## Boîtes à moustache
for(i in 1:ncol(DataFootball_ToutesEquipes))
{
  png(file = paste("./Diagrammes/Description_Variables_ToutesEquipes/", colnames(DataFootball_ToutesEquipes)[i], ".png"),
      width = 1920,
      height = 1080)
  boxplot(DataFootball_ToutesEquipes[,i], main=colnames(DataFootball_ToutesEquipes)[i])
  dev.off()
}