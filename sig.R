#load data from shape file ----
#data from https://gadm.org/
library(sf)
library(ggthemes)
w_algeria <- read_sf("shp/gadm41_DZA_1.shp",stringsAsFactors = TRUE)
#st_write(obj = w_algeria, dsn = "gpkg/w_algeria.gpkg", layer = "w_algeria", delete_layer = TRUE)


wc_algeria <- read_sf("shp/gadm41_DZA_2.shp")
#st_write(obj = wc_algeria, dsn = "gpkg/wc_algeria.gpkg", layer = "wc_algeria", delete_layer = TRUE)


#preprocessing ----
#create shp for wilaya de djelfa for simplifing trt

#library(dplyr)

#wc_algeria %>% 
  #names() 

#djelfa <- wc_algeria %>% 
  #select(CC_2,NAME_2,NAME_1) %>%
  #rename(IDC="CC_2",COMMUNE="NAME_2",WILAYA="NAME_1") %>% 
  #filter(WILAYA == "Djelfa") %>%
  #mutate(IDC=as.numeric(IDC)) %>% 
  #arrange(COMMUNE) 
  
#View(djelfa)
#str(djelfa)

#dataext <- read.csv(file = "./data/djelfa.csv")
#dataext %>%
  #select(IDC,SUP,POP) %>%
  #View()

#View(dataext)
#str(dataext)
#djelfa <- merge(x = djelfa, y = dataext, by.x = "IDC", by.y = "IDC")


#djelfa <- djelfa %>% 
  #select(IDC,COMMUNE.x,WILAYA,SUP,POP) %>%
  #rename(COMMUNE="COMMUNE.x") %>% 
  #arrange(COMMUNE) 


#View(djelfa)

#st_write(obj = djelfa, dsn = "gpkg/djelfa.gpkg", layer = "djelfa", delete_layer = TRUE)
#st_write(obj = djelfa, "shp/djelfa.shp", delete_layer = TRUE)


#plot(djelfa["SUP"])
djelfa <- read_sf("shp/djelfa.shp")

#fonction ----
wilaya_x <- function(wilaya_n){

  wilaya <- wc_algeria %>% 
    filter(NAME_1==wilaya_n)#Djelfa Médéa
  
  ggplot()+
    geom_sf(data = wilaya,fill="lightgreen",color="black",size=0.25)+  ##,aes(fill=CC_2)
    theme_void()+
    coord_sf(crs = "+proj=robin")
}
