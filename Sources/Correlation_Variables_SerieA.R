# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données Serie A
DataFootball_SerieA <- DataFootball[DataFootball$Competition == "it Serie A", -which(names(DataFootball) == "Competition")]

# Chargement des librairies
library(corrplot)
library(DataExplorer)

# Matrice des corrélations
corrplot(cor(DataFootball_Ligue1))
plot_correlation(DataFootball_Ligue1)
corrplot.mixed(cor(DataFootball_Ligue1),
               upper = "circle",
               lower = "number",
               addgrid.col = "black",
               tl.col = "black")
corrplot(
  cor(DataFootball_Ligue1),
  method = "circle",
  type = "upper",
  tl.col = "black",
  tl.cex = 0.75,
  col = colorRampPalette(c("red", "blue"))(200)
)
