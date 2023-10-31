# Ouverture du fichier .csv
DataFootball <- read.csv(file.choose(), header=T, sep=",")

# Données Ligue 1
DataFootball_Ligue1 <- DataFootball[DataFootball$Competition == "fr Ligue 1",]

# Description des variables 
summary(DataFootball_Ligue1)

## Boîtes à moustache
boxplot(DataFootball_Ligue1$Joueurs.utilisees)
boxplot(DataFootball_Ligue1$Age)
boxplot(DataFootball_Ligue1$Match.jouee)
boxplot(DataFootball_Ligue1$Match.gagnee)
boxplot(DataFootball_Ligue1$Match.nul)
boxplot(DataFootball_Ligue1$Match.perdu)
boxplot(DataFootball_Ligue1$But.pour)
boxplot(DataFootball_Ligue1$But.contre)
boxplot(DataFootball_Ligue1$Tire.tentee)
boxplot(DataFootball_Ligue1$Action.qui.amene.un.tir)
boxplot(DataFootball_Ligue1$Possession)
boxplot(DataFootball_Ligue1$Passe.reeussi)
boxplot(DataFootball_Ligue1$Passe.tentee)
boxplot(DataFootball_Ligue1$Ratio.passe.reussi)
boxplot(DataFootball_Ligue1$Conduite.avant)
boxplot(DataFootball_Ligue1$Passe.avant)
boxplot(DataFootball_Ligue1$Dist.passe)
boxplot(DataFootball_Ligue1$Dist.passe.avant)
boxplot(DataFootball_Ligue1$Touches.de.balle)
boxplot(DataFootball_Ligue1$Drible.tentee)
boxplot(DataFootball_Ligue1$Drible.reeussi)
boxplot(DataFootball_Ligue1$Ratio.drible)
boxplot(DataFootball_Ligue1$Tacle)
boxplot(DataFootball_Ligue1$Blocks)
boxplot(DataFootball_Ligue1$Interception)
boxplot(DataFootball_Ligue1$Carton.jaune)
boxplot(DataFootball_Ligue1$Carton.rouge)
