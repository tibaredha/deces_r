# 0-getwd() ----
# 1-load data from mysql ----
library("RMySQL")
mysql= dbConnect(MySQL(),user="tibaredha",password="030570",dbname="framework",host="localhost")
options(max.print=1000000)
sql="select DINS,WILAYAR,COMMUNER,LD,STRUCTURED,SERVICEHOSPIT,DUREEHOSPIT,SEX,Years,Days,Profession,CD,CODECIM0,CODECIM from deceshosp where Years <=100  and Years >=0 "
resultat = dbSendQuery(mysql,sql)
data=fetch(resultat,n=1000000)

# 2-tidyverse bien rangé univers----
library(tidyverse)
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


dt1 <- "2020-01-01"
dt2 <- "2021-12-31"

# 4-preprocessing ----
data$DINS  <- as.Date(data$DINS)

data$LD <- as.factor(data$LD)
data$STRUCTURED  <- as.factor(data$STRUCTURED)
data$SERVICEHOSPIT  <- as.factor(data$SERVICEHOSPIT)

data$SEX  <- as.factor(data$SEX)
data$Profession <- as.factor(data$Profession)

data$CD <- as.factor(data$CD)


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










