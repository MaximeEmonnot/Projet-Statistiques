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

# Chargement des librairies
library(corrplot)
library(DataExplorer)
library(foreach)

# Matrice des corrélations (Nécessaire réaliser des plots entre des valeurs corrélées)
corrplot(cor(DataFootball_MeilleursPires), method = "circle", type = "upper") # Affichage cercles
corrplot(cor(DataFootball_MeilleursPires), method = "number", type = "upper") # Affichage nombres

# Plots (Plot avec droite de régression et segments, pour chaque couple de variables corrélées)
plotDataFootball <- function(X, Y, minCorr, title, path)
{
  corr <- cor(X, Y)
  cov <- var(X, Y)
  if(!is.na(corr) && abs(corr) >= minCorr)
  {
    png(file = path, width = 1920, height = 1080)
    plot(X, Y, main = title)
    regression <- lm(formula = Y ~ X)
    abline(regression, col = "red")
    segments(X, Y, X, fitted(regression), col = "blue")
    dev.off()
  }
}

minCorr <- c(0.5, 0.6, 0.7, 0.8, 0.9, 1.0)
for(corr in minCorr)
{
  dirPath <- gsub(" ", "", paste("./Diagrammes/Plots Meilleurs Pires/", corr, "/"))
  dir.create(path = dirPath, recursive = TRUE)
  for(i in 1:ncol(DataFootball_MeilleursPires))
  {
    for(j in 1:ncol(DataFootball_MeilleursPires))
    {
      if(j != i)
      {
        filePath = gsub(" ", "", paste(gsub("\\.", "_", colnames(DataFootball_MeilleursPires)[i]), 
                                       gsub("\\.", "_", colnames(DataFootball_MeilleursPires)[j]),
                                       ".png"
        )
        )
        plotDataFootball(DataFootball_MeilleursPires[,i],                                                                  # Variable 1
                         DataFootball_MeilleursPires[,j],                                                                  # Variable 2
                         corr,                                                                                             # Corrélation minimum entre variables
                         paste(colnames(DataFootball_MeilleursPires)[i], " - ", colnames(DataFootball_MeilleursPires)[j]), # Titre
                         paste(dirPath, filePath)                                                                          # Chemin sortie plot
        )  
      }
    }
  }
}
print("Finished")