# 0-getwd() ----

# 2-tidyverse bien rangé univers----
library(tidyverse)
library(labelled)
library(gtsummary)
theme_gtsummary_mean_sd()

# 1-load data from mysql ----
con <- function(){
  library("RMySQL")
  mysql = dbConnect(MySQL(),user="tibaredha",password="030570",dbname="framework",host="localhost")
  options(max.print=1000000)
  resultat = dbSendQuery(mysql,"select * from deceshosp ")
  df=fetch(resultat,n=1000000)
  return(df)
}
data <- con()

# 4-fixe varaibles
dt1 <- "2020-01-01"
dt2 <- "2021-12-31"

# 4-preprocessing ----
data <- data %>%
  select(DINS,WILAYAR,COMMUNER,LD,STRUCTURED,SERVICEHOSPIT,DUREEHOSPIT,SEX,Years,Days,Profession,CD,CODECIM0,CODECIM) %>% 
  mutate(DINS = as.Date(DINS),
         LD   = as.factor(LD),
         STRUCTURED  = as.factor(STRUCTURED),
         SERVICEHOSPIT  = as.factor(SERVICEHOSPIT),
         SEX  = as.factor(SEX),
         Profession = as.factor(Profession),
         CD = as.factor(CD)) %>% 
         set_variable_labels(DINS="Date du décès",
                             WILAYAR="Wilaya de résidence",
                             COMMUNER="Commune de résidence",
                             LD="Lieux du décès",
                             STRUCTURED="Structure sanitaire",
                             SERVICEHOSPIT="Service d'hospitalisation",
                             DUREEHOSPIT="Durée d'hospitalisation",
                             SEX="Sexe",
                             Years="Age (Année)",
                             Days="Age (Jours)",
                             Profession="Profession",
                             CD="Cause du décès",
                             CODECIM0="Capitre CIM10",
                             CODECIM="Titre CIM10"
                             ) %>% 
  filter(DINS >= dt1 & DINS <= dt2,Years >=0 & Years <=100)
  

