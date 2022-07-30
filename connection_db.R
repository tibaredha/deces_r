library("RMySQL")
mysql= dbConnect(MySQL(),user="tibaredha",password="030570",dbname="framework",host="localhost")
options(max.print=1000000)
sql="select DINS,WILAYAR,COMMUNER,LD,STRUCTURED,SERVICEHOSPIT,SEX,Years,Profession,CD from deceshosp where Years <=100  and Years >=0 "
resultat = dbSendQuery(mysql,sql)
data=fetch(resultat,n=1000000)
# tydyverse
library(tidyverse)

#varaibles
dt1 <- "2020-01-01"
dt2 <- "2020-12-31"

#preprocessing
data$DINS  <- as.Date(data$DINS)

data$LD <- as.factor(data$LD)
data$STRUCTURED  <- as.factor(data$STRUCTURED)
data$SERVICEHOSPIT  <- as.factor(data$SERVICEHOSPIT)

data$SEX  <- as.factor(data$SEX)
data$Profession <- as.factor(data$Profession)

data$CD <- as.factor(data$CD)


