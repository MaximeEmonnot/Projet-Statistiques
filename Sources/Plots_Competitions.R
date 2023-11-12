# Ouverture du fichier .csv
DataFootball_Ugly <- read.csv(file.choose(), header=T, sep=",")

# Données toutes les équipes
DataFootball_CompetitionsBrute <- DataFootball[, -which(names(DataFootball_Ugly) == "Name")]

DataFootball_MoyennesCompetition <- data.frame(
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "eng Premier League", -which(names(DataFootball_CompetitionsBrute) == "Competition")]),
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "fr Ligue 1", -which(names(DataFootball_CompetitionsBrute) == "Competition")]),
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "es La Liga", -which(names(DataFootball_CompetitionsBrute) == "Competition")]),
  colMeans(DataFootball_CompetitionsBrute[DataFootball_CompetitionsBrute$Competition == "it Serie A", -which(names(DataFootball_CompetitionsBrute) == "Competition")])
)

DataFootball_Competitions <- transpose(DataFootball_MoyennesCompetition)

colnames(DataFootball_Competitions)  <- row.names(DataFootball_MoyennesCompetition)
row.names(DataFootball_Competitions) <- c("Premier League", "Ligue 1", "La Liga", "Serie A")

# Chargement des librairies
library(corrplot)
library(DataExplorer)
library(foreach)

# Matrice des corrélations (Nécessaire réaliser des plots entre des valeurs corrélées)
corrplot(cor(DataFootball_Competitions), method = "circle", type = "upper") # Affichage cercles
corrplot(cor(DataFootball_Competitions), method = "number", type = "upper") # Affichage nombres

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
  dirPath <- gsub(" ", "", paste("./Diagrammes/Plots Competitions/", corr, "/"))
  dir.create(path = dirPath, recursive = TRUE)
  for(i in 1:ncol(DataFootball_Competitions))
  {
    for(j in 1:ncol(DataFootball_Competitions))
    {
      if(j != i)
      {
        filePath = gsub(" ", "", paste(gsub("\\.", "_", colnames(DataFootball_Competitions)[i]), 
                                       gsub("\\.", "_", colnames(DataFootball_Competitions)[j]),
                                       ".png"
        )
        )
        plotDataFootball(DataFootball_Competitions[,i],                                                                # Variable 1
                         DataFootball_Competitions[,j],                                                                # Variable 2
                         corr,                                                                                         # Corrélation minimum entre variables
                         paste(colnames(DataFootball_Competitions)[i], " - ", colnames(DataFootball_Competitions)[j]), # Titre
                         paste(dirPath, filePath)                                                                      # Chemin sortie plot
        )  
      }
    }
  }
}
print("Finished")