# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Ligue 1
DataFootball_Ligue1 <- DataFootball[DataFootball$Competition == "fr Ligue 1", -which(names(DataFootball) == "Competition")]

# Chargement des librairies
library(corrplot)
library(DataExplorer)
library(foreach)

# Matrice des corrélations (Nécessaire réaliser des plots entre des valeurs corrélées)
corrplot(cor(DataFootball_Ligue1), method = "circle", type = "upper") # Affichage cercles
corrplot(cor(DataFootball_Ligue1), method = "number", type = "upper") # Affichage nombres

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
  dirPath <- gsub(" ", "", paste("./Diagrammes/Plots Ligue1/", corr, "/"))
  dir.create(path = dirPath, recursive = TRUE)
  for(i in 1:ncol(DataFootball_Ligue1))
  {
    for(j in 1:ncol(DataFootball_Ligue1))
    {
      if(j > i)
      {
        filePath = gsub(" ", "", paste(gsub("\\.", "_", colnames(DataFootball_Ligue1)[i]), 
                                       gsub("\\.", "_", colnames(DataFootball_Ligue1)[j]),
                                       ".png"
                                       )
                       )
        plotDataFootball(DataFootball_Ligue1[,i],                                                          # Variable 1
                         DataFootball_Ligue1[,j],                                                          # Variable 2
                         corr,                                                                             # Corrélation minimum entre variables
                         paste(colnames(DataFootball_Ligue1)[i], " - ", colnames(DataFootball_Ligue1)[j]), # Titre
                         paste(dirPath, filePath)                                                          # Chemin sortie plot
                         )  
      }
    }
  }
}
print("Finished")