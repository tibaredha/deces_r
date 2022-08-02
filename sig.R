#load data from shape file ----
library(sf)
w_algeria <- read_sf("shp/gadm41_DZA_1.shp",stringsAsFactors = TRUE)
#st_write(obj = w_algeria, dsn = "gpkg/w_algeria.gpkg", layer = "w_algeria", delete_layer = TRUE)


wc_algeria <- read_sf("shp/gadm41_DZA_2.shp")
#st_write(obj = wc_algeria, dsn = "gpkg/wc_algeria.gpkg", layer = "wc_algeria", delete_layer = TRUE)

#preprocessing ----
#create shp for wilaya de djelfa for simplifing trt

#library(dplyr)

#wc_algeria %>% 
  #names() 

#wc_algeria %>% 
  #select(NAME_1,NAME_2,CC_2) %>% 
  #filter(NAME_1 == "Djelfa") -> djelfa 
  #View()

#View(djelfa)

#st_write(obj = djelfa, dsn = "gpkg/djelfa.gpkg", layer = "djelfa", delete_layer = TRUE)
#st_write(obj = djelfa, "shp/djelfa.shp", delete_layer = TRUE)


#plot(djelfa["CC_2"])


#fonction ----
wilaya_x <- function(wilaya_n){

  wilaya <- wc_algeria %>% 
    filter(NAME_1==wilaya_n)#Djelfa Médéa
  
  ggplot()+
    geom_sf(data = wilaya,fill="lightgreen",color="black",size=0.25)+  ##,aes(fill=CC_2)
    theme_void()+
    coord_sf(crs = "+proj=robin")
}
