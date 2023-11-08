# chargment des données
eng_Premier_League = read.csv(file.choose(),header=T,sep=",",row.names = 1)

# évaluation des données

summary_df <-summary(eng_Premier_League)
write.csv(summary_df, file = "summary-eng_Premier_League.csv", row.names = TRUE)

# étude des variables 

library(ggplot2)

library(FactoMineR)
library(factoextra)

boxplot(eng_Premier_League$Joueurs_utilisees, main="Joueurs_utilises")
boxplot(eng_Premier_League$Age, main="")
boxplot(eng_Premier_League$Match_jouee, main="")
boxplot(eng_Premier_League$Match_gagnee, main="")
boxplot(eng_Premier_League$Match_nul, main="")
boxplot(eng_Premier_League$Match_perdu, main="")
boxplot(eng_Premier_League$But_pour, main="")
boxplot(eng_Premier_League$But_contre, main="")
boxplot(eng_Premier_League$Tire_tentee, main="")

boxplot(eng_Premier_League$Action_qui_amene_un_tir, main="Action_qui_amene_un_tir")
boxplot(eng_Premier_League$Possession, main="Possession")
boxplot(eng_Premier_League$Passe_reeussi, main="Passe_reeussi")
boxplot(eng_Premier_League$Passe_tentee, main="Passe_tentee")
boxplot(eng_Premier_League$Ratio_passe_reussi, main="Ratio_passe_reussi")
boxplot(eng_Premier_League$Conduite_avant, main="Conduite_avant")
boxplot(eng_Premier_League$Passe_avant, main="Passe_avant")
boxplot(eng_Premier_League$Dist_passe, main="Dist_passe")
boxplot(eng_Premier_League$Dist_passe_avant, main="Dist_passe_avant")
boxplot(eng_Premier_League$Touches_de_balle, main="Touches_de_balle")
boxplot(eng_Premier_League$Drible_tentee, main="Drible_tentee")
boxplot(eng_Premier_League$Drible_reeussi, main="Drible_reeussi")
boxplot(eng_Premier_League$Blocks, main="Blocks")
boxplot(eng_Premier_League$Interception, main="Interception")
boxplot(eng_Premier_League$Carton_jaune, main="Carton_jaune")
boxplot(eng_Premier_League$Carton_rouge, main="Carton_rouge")
boxplot(eng_Premier_League$Competition, main="Competition")
