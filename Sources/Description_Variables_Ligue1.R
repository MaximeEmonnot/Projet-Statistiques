# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Ligue 1
DataFootball_Ligue1 <- DataFootball[DataFootball$Competition == "fr Ligue 1", -which(names(DataFootball) == "Competition")]

# Description des variables 
summary(DataFootball_Ligue1)

## Boîtes à moustache
for(i in 1:ncol(DataFootball_Ligue1))
{
  png(file = paste("./Diagrammes/Description_Variables_Ligue1/", colnames(DataFootball_Ligue1)[i], ".png"),
      width = 1920,
      height = 1080)
  boxplot(DataFootball_Ligue1[,i], main=colnames(DataFootball_Ligue1)[i])
  dev.off()
}
