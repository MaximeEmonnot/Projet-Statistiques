# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",")

# Données La Liga
DataFootball_La_Liga <- DataFootball[DataFootball$Competition == "es La Liga",]

# Description des variables 
summary(DataFootball_La_Liga)

## Boîtes à moustache
boxplot(DataFootball_La_Liga$Joueurs.utilisees, main="Joueurs utilisees pour La Liga")
boxplot(DataFootball_La_Liga$Age, main="Age pour La Liga")
boxplot(DataFootball_La_Liga$Match.jouee, main="Match jouee pour La Liga")
boxplot(DataFootball_La_Liga$Match.gagnee, main="Match gagnee pour La Liga")
boxplot(DataFootball_La_Liga$Match.nul, main="Match null pour La Liga")
boxplot(DataFootball_La_Liga$Match.perdu, main="Match perdu pour La Liga")
boxplot(DataFootball_La_Liga$But.pour, main="But pour pour La Liga")
boxplot(DataFootball_La_Liga$But.contre, main="But contre pour La Liga")
boxplot(DataFootball_La_Liga$Tire.tentee, main="Tire tentee pour La Liga")
boxplot(DataFootball_La_Liga$Action.qui.amene.un.tir, main="Acion qui amene un tir pour La Liga")
boxplot(DataFootball_La_Liga$Possession, main="Possession pour La Liga")
boxplot(DataFootball_La_Liga$Passe.reeussi, main="Passe reeussi pour La Liga")
boxplot(DataFootball_La_Liga$Passe.tentee, main="Passe tentee pour La Liga")
boxplot(DataFootball_La_Liga$Ratio.passe.reussi, main="Ratio passe reussi pour La Liga")
boxplot(DataFootball_La_Liga$Conduite.avant, main="Conduite avant pour La Liga")
boxplot(DataFootball_La_Liga$Passe.avant, main="Passe avant pour La Liga")
boxplot(DataFootball_La_Liga$Dist.passe, main="Dist passe pour La Liga")
boxplot(DataFootball_La_Liga$Dist.passe.avant, main="Dist passe avant pour La Liga")
boxplot(DataFootball_La_Liga$Touches.de.balle, main="Touches de balle pour La Liga")
boxplot(DataFootball_La_Liga$Drible.tentee, main="Drible tentee pour La Liga")
boxplot(DataFootball_La_Liga$Drible.reeussi, main="Drible reeussi pour La Liga")
boxplot(DataFootball_La_Liga$Ratio.drible, main="Ratio drible pour La Liga")
boxplot(DataFootball_La_Liga$Tacle, main="Tacle pour La Liga")
boxplot(DataFootball_La_Liga$Blocks, main="Blocks pour La Liga")
boxplot(DataFootball_La_Liga$Interception, main="Interception pour La Liga")
boxplot(DataFootball_La_Liga$Carton.jaune, main="Carton jaune pour La Liga")
boxplot(DataFootball_La_Liga$Carton.rouge, main="Carton rouge pour La Liga")