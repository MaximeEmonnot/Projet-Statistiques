# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",")

# Données Ligue 1
DataFootball_Ligue1 <- DataFootball[DataFootball$Competition == "fr Ligue 1", -which(names(DataFootball) == "Competition")]

# Description des variables 
summary(DataFootball_Ligue1)

## Boîtes à moustache
for(i in 1:ncol(DataFootball_Ligue1))
{
  boxplot(DataFootball_Ligue1[,i])
}