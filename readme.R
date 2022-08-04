library(sf)
library(ggthemes)
library(tidyverse)


w_algeria <- read_sf("shp/gadm41_DZA_1.shp")
str(w_algeria)
unique(sort(w_algeria$NAME_1))
cartw <- filter(w_algeria,NAME_1 %in% c("Djelfa","Laghouat","Ghardaïa"))
plot(cartw["NAME_1"])



wc_algeria <- read_sf("shp/gadm41_DZA_2.shp")
str(wc_algeria)
unique(sort(wc_algeria$NAME_1))
cartc <- filter(wc_algeria,NAME_1 %in% c("Djelfa","Laghouat","Ghardaïa"))
#cartc <- arrange(wc_algeria,NAME_1 %in% c("Djelfa","Laghouat","Ghardaïa"))
plot(cartc["NAME_1"])
plot(cartc["NAME_2"])

# nombre de communes par wilayas
delays <- wc_algeria %>%
  group_by(NAME_1) %>%
  summarize(
    count = n()#,
    #dist = mean(distance, na.rm = TRUE),
    #delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 1)
plot(delays["count"])

