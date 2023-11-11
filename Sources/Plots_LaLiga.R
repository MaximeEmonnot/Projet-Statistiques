# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données La Liga
DataFootball_La_Liga <- DataFootball[DataFootball$Competition == "es La Liga", -which(names(DataFootball) == "Competition")]

# Chargement des librairies
library(corrplot)
library(DataExplorer)
library(foreach)

# Matrice des corrélations (Nécessaire réaliser des plots entre des valeurs corrélées)
corrplot(cor(DataFootball_La_Liga), method = "circle", type = "upper") # Affichage cercles
corrplot(cor(DataFootball_La_Liga), method = "number", type = "upper") # Affichage nombres

#covariance <- cov(DataFootball_La_Liga$Joueurs.utilisees, DataFootball_La_Liga$Age)
#correlation <- cor(DataFootball_La_Liga$Joueurs.utilisees, DataFootball_La_Liga$Age)
#plot(DataFootball_La_Liga$Joueurs.utilisees, DataFootball_La_Liga$Age, main = "Nuage de points entre 'Joueurs utilisees' et 'age'", 
#       xlab = "Joueurs utilisees", ylab = "Age")
#regression=lm(DataFootball_La_Liga$Age~DataFootball_La_Liga$Joueurs.utilisees)

#plot(DataFootball_La_Liga$Joueurs.utilisees, DataFootball_La_Liga$Age,main="Nuage de pts", xlab="Joueurs utilisees", ylab="age")
#abline(regression, col = "red")
#segments(DataFootball_La_Liga$Joueurs.utilisees, DataFootball_La_Liga$Age, DataFootball_La_Liga$Joueurs.utilisees, fitted(regression))


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
  dirPath <- gsub(" ", "", paste("./Diagrammes/Plots La Liga/", corr, "/"))
  dir.create(path = dirPath, recursive = TRUE)
  for(i in 1:ncol(DataFootball_La_Liga))
  {
    for(j in 1:ncol(DataFootball_La_Liga))
    {
      if(j != i)
      {
        filePath = gsub(" ", "", paste(gsub("\\.", "_", colnames(DataFootball_La_Liga)[i]), 
                                       gsub("\\.", "_", colnames(DataFootball_La_Liga)[j]),
                                       ".png"
        )
        )
        plotDataFootball(DataFootball_La_Liga[,i],                                                          # Variable 1
                         DataFootball_La_Liga[,j],                                                          # Variable 2
                         corr,                                                                             # Corrélation minimum entre variables
                         paste(colnames(DataFootball_La_Liga)[i], " - ", colnames(DataFootball_La_Liga)[j]), # Titre
                         paste(dirPath, filePath)                                                          # Chemin sortie plot
        )  
      }
    }
  }
}
print("Finished")