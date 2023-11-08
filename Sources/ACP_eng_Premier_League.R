# chargment des données
eng_Premier_League = read.csv(file.choose(),header=T,sep=",",row.names = 1)

# évaluation des données

summary_df <-summary(eng_Premier_League)
write.csv(summary_df, file = "summary-eng_Premier_League.csv", row.names = TRUE)

# étude des variables 

library(ggplot2)

library(FactoMineR)
library(factoextra)


#ACP


# pourcentage de variance expliquée





plot(donnee.pca, choix = "ind")


donnee.pca
donnee.pca <-PCA(eng_Premier_League)

valeur_propre <- get_eigenvalue(donnee.pca)
fviz_pca_ind(donnee.pca)
write.csv(valeur_propre, file = "get_eigenvalue.csv", row.names = TRUE)
plot(valeur_propre)


donnee.pca$eig 
write.csv(donnee.pca$eig, file = "eig.csv", row.names = TRUE)
plot(donnee.pca$eig)



donnee.pca$var$coord    
write.csv(donnee.pca$var$coord, file = "var_coord.csv", row.names = TRUE)
fviz_pca_ind(donnee.pca$var$coord)

donnee.pca$var$cor
write.csv(donnee.pca$var$cor, file = "var_cor.csv", row.names = TRUE)
donnee.pca$var$cos2  
write.csv(donnee.pca$var$cos2, file = "var_cos2.csv", row.names = TRUE)
donnee.pca$var$contrib 
write.csv(donnee.pca$var$contrib , file = "var_contrib.csv", row.names = TRUE)
donnee.pca$ind 
write.csv(donnee.pca$ind, file = "ind.csv", row.names = TRUE)

donnee.pca$ind$coord 
write.csv(donnee.pca$ind$coord , file = "ind_coord.csv", row.names = TRUE)
donnee.pca$ind$cos2
plot(donnee.pca$ind$coord)

write.csv(donnee.pca$ind$cos2, file = "ind_cos2.csv", row.names = TRUE)
donnee.pca$ind$contrib  
write.csv(donnee.pca$ind$contrib, file = "var.csv", row.names = TRUE)
donnee.pca$call 
write.csv(donnee.pca$call, file = "call.csv", row.names = TRUE)
donnee.pca$call$centre 
write.csv(donnee.pca$call$centre, file = "call_centre.csv", row.names = TRUE)
donnee.pca$call$ecart.type  
write.csv(donnee.pca$call$ecart.type , file = "ecart-type.csv", row.names = TRUE)

fviz_pca_ind()



# Valeurs propres
eng_Premier_League_ACP <- eng_Premier_League_ACP$eig
#View(valeursPropresLaLiga)
fviz_eig(eng_Premier_League_ACP)

# Nuage de points des individus dans le plan factoriel
fviz_pca_ind(eng_Premier_League_ACP)                                                   # Tout en noir
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "contrib")                              # Contribution
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2")                                 # Qualité

# Représentation des individus dans le plan factoriel
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.50)) # Individus représentés pour cos2 >= 0.50
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.55)) # Individus représentés pour cos2 >= 0.55
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.60)) # Individus représentés pour cos2 >= 0.60
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.65)) # Individus représentés pour cos2 >= 0.65
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.70)) # Individus représentés pour cos2 >= 0.70
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.75)) # Individus représentés pour cos2 >= 0.75
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.80)) # Individus représentés pour cos2 >= 0.80
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.85)) # Individus représentés pour cos2 >= 0.85
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.90)) # Individus représentés pour cos2 >= 0.90
fviz_pca_ind(eng_Premier_League_ACP, col.ind = "cos2", select.ind = list(cos2 = 0.95)) # Individus représentés pour cos2 >= 0.95

# Représentation des contributions des variables aux axes
fviz_contrib(eng_Premier_League_ACP, choice = "var", c(1))                             # Contribution à l'axe 1
fviz_contrib(eng_Premier_League_ACP, choice = "var", c(2))                             # Contribution à l'axe 2
contributionsVariablesLaLiga <- eng_Premier_League_ACP$var$contrib                     # Contributions
#View(contributionsVariablesLaLiga)

# Représentation des contributions des individus aux axes
fviz_contrib(eng_Premier_League_ACP, choice = "ind", c(1))                             # Contribution à l'axe 1
fviz_contrib(eng_Premier_League_ACP, choice = "ind", c(2))                             # Contribution à l'axe 2
contributionsIndividusEng <- eng_Premier_League_ACP$ind$contrib                     # Contributions

#View(contributionsIndividus)

# Disque des corrélations
fviz_pca_var(eng_Premier_League_ACP)                                                   # Tout en noir
fviz_pca_var(eng_Premier_League_ACP, col.var = "cos2")                                 # Couleur selon la qualité
fviz_pca_var(eng_Premier_League_ACP, col.var = "contrib")                              # Couleur selon la contribution
