library(dplyr)
library(tidygeocoder)
library(magrittr)

data = read.csv("shinyconf-2023-991-registrants.csv", stringsAsFactors = F)

data %>%
  select(Country.1, City) %>%
  mutate(addr = paste(City, Country.1, sep = ", ")) %>%
  geocode(addr, method = 'osm', lat = latitude , long = longitude) -> coordinates

write.csv(coordinates %>% select(latitude, longitude), "coords.csv", row.names = F)
