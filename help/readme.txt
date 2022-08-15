# Jeu de données de départ
adm3_pop_2009 %>% 
  # Création d'une nouvelle variable
  mutate(total = homme + femme) %>% 
  # Spécification du niveau d'agrégation
  group_by(admin1_nom) %>% 
  # Opération d'agrégation 
  summarize(
    # Population totale par région
    population = sum(total),
    # Nombre de communes par région
    nombre_communes = n()
    ) %>% 
  # Tri: décroissant
  arrange(desc(population))



Hide source code     :```{r, echo=FALSE}
Hide text output     :```{r, results='hide'}
Hide messages        :```{r, message=FALSE}
Hide warning messages:```{r, warning=FALSE}
Hide plots           :```{r, fig.show='hide'}
Hide everything      :```{r, include=FALSE}
Remove hashes        :```{r, comment=""}
Child documents      :```{r, child=c('one.Rmd', 'two.Rmd')}


Note that the plot will be generated in the above chunk. It is
just not displayed in the output.
 
\newpage
---
title: "An analysis of `r nrow(mtcars)` cars"
---

output:
  html_document:
    number_sections: true
  pdf_document:
    number_sections: true
bibliography: references.bib 
@Manual{R-base,
  title = {R: A Language and Environment for Statistical
           Computing},
  author = {{R Core Team}},
  organization = {R Foundation for Statistical Computing},
  address = {Vienna, Austria},
  year = {2019},
  url = {https://www.R-project.org},
}
	
# This section is unnumbered {-}	

 
################################## 
  
#install.packages("tidyverse", dep = TRUE)
#update.packages("tidyverse")
#remove.packages("tidyverse")
#est que ces extensions travaillent avec des tableaux de données au format tibble
#qui est une évolution plus moderne du classique data frame du R de base.
#La plupart des fonctions des extensions du tidyverse acceptent des data frames en entrée,
#mais retournent un objet de classe tibble sans colone rownames
#On peut ainsi facilement convertir un data frame en tibble avec as_tibble
#Si le data frame d’origine a des rownames, on peut d’abord les convertir en colonnes avec rownames_to_columns
#À l’inverse, on peut à tout moment convertir un tibble en data frame avec as.data.frame
#Là encore, on peut convertir la colonne rowname en “vrais” rownames avec column_to_rownames : column_to_rownames(as.data.frame(d))
# library(tidyverse):
# haven, readr readxl      pour l’import de données,
# dplyr, tidyr ou reshape2 pour la manipulation de données
# ggplot2                  pour les graphiques,
# lubridate                pour la gestion des dates,
# forcats                  pour la manipulation des facteurs
# stringr                  pour la manipulation de chaînes de caractères.


# 3-varaibles ----
# vecteur c()  matrice ()
# list()       data.frame()


#data$DINS  <- as.Date(data$DINS)
#data$LD <- as.factor(data$LD)
#data$STRUCTURED  <- as.factor(data$STRUCTURED)
#data$SERVICEHOSPIT  <- as.factor(data$SERVICEHOSPIT)
#data$SEX  <- as.factor(data$SEX)
#data$Profession <- as.factor(data$Profession)
#data$CD <- as.factor(data$CD)


# 5-help ----
## dplyr 
# slice
# filter
# arrange
# select
# rename 
# mutate
# groupe_by
# summarize
# left_join

## data visualisation

# data
# mapping aes(x=,y=)
# geom_: point/ bar/   histogram/ 
# stats
# scales
# facets
# coordination system
# position ajustement
# theme



#save(data, file = "export.RData")
#load("export.RData")










