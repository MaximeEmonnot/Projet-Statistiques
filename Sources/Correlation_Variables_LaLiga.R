# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",", row.names=1)

# Données La Liga
DataFootball_La_Liga <- DataFootball[DataFootball$Competition == "es La Liga", -which(names(DataFootball) == "Competition")]

# Chargement des librairies
library(corrplot)
library(DataExplorer)

# Matrice des corrélations
#corrplot(cor(DataFootball_La_Liga))

# Création de la matrice de corrélation avec corrplot
corrplot(cor(DataFootball_La_Liga), method = "color", tl.cex = 0.7)

plot_correlation(DataFootball_La_Liga)
#corrplot.mixed(cor(DataFootball_La_Liga),
#               upper = "circle",
#               lower = "number",
#               addgrid.col = "black",
#               tl.col = "black")
corrplot(
  cor(DataFootball_La_Liga),
  method = "circle",
  type = "upper",
  tl.col = "black",
  tl.cex = 0.75,
  col = colorRampPalette(c("red", "blue"))(200)
)
