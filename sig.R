library(sf)
w_algeria <- read_sf("../gadm41_DZA_shp/gadm41_DZA_1.shp",stringsAsFactors = TRUE)
wc_algeria <- read_sf("../gadm41_DZA_shp/gadm41_DZA_2.shp")

wilaya_x <- function(wilaya_n){

  wilaya <- wc_algeria %>% 
    filter(NAME_1==wilaya_n)#Djelfa Médéa
  
  ggplot()+
    geom_sf(data = wilaya,fill="green",color="black",size=0.25)+  ##,aes(fill=CC_2)
    theme_void()+
    coord_sf(crs = "+proj=robin")
}