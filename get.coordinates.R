library(dplyr)
library(tidygeocoder)
library(magrittr)

data = read.csv("shinyconf-2023-991-registrants-cleaned.csv", stringsAsFactors = F)

data %>%
  select(Country, City) %>%
  mutate(addr = paste(City, Country, sep = ", ")) %>% 
  distinct(addr) %>%
  geocode(addr, method = 'osm', lat = latitude , long = longitude) -> coordinates

write.csv(coordinates %>% select(latitude, longitude), "coords.csv", row.names = F)
