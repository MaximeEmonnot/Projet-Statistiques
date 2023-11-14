# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données compétitions
DataFootball_PremierLeague <- DataFootball[DataFootball$Competition == "eng Premier League", -which(names(DataFootball) == "Competition")]
DataFootball_Ligue1        <- DataFootball[DataFootball$Competition == "fr Ligue 1",         -which(names(DataFootball) == "Competition")]
DataFootball_LaLiga        <- DataFootball[DataFootball$Competition == "es La Liga",         -which(names(DataFootball) == "Competition")]
DataFootball_SerieA        <- DataFootball[DataFootball$Competition == "it Serie A",         -which(names(DataFootball) == "Competition")]

# Description des variables
summary(DataFootball_Ligue1)

## Boîtes à moustache
for(i in 1:ncol(DataFootball_Ligue1))
{
  png(file = paste("./Diagrammes/Description_Variables_Tous/", colnames(DataFootball_Ligue1)[i], ".png"),
      width = 1920,
      height = 1080)
  boxplot(
    DataFootball_PremierLeague[,i], DataFootball_Ligue1[,i], DataFootball_LaLiga[,i], DataFootball_SerieA[,i],
    main=colnames(DataFootball_Ligue1)[i],
    at = c(1, 3, 5, 7),
    names = c("Premier League", "Ligue 1", "La Liga", "Serie A"),
    las = 2,
    col = c("red","blue", "gold", "green"),
    border = "black",
    horizontal = TRUE,
    notch = TRUE
    )
  dev.off()
}
