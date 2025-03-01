rm(list = ls())
library(sf)
## Warning: package 'sf' was built under R version 4.4.1
## Linking to GEOS 3.11.0, GDAL 3.5.3, PROJ 9.1.0; sf_use_s2() is TRUE
mainLink='https://github.com/DACSS-CSSmeths/Spatial-Exploring/raw/refs/heads/main/'
mapLink=paste0(mainLink,'maps/countriesCIA.gpkg')


countriesCIA=read_sf(mapLink, layer='cia')
worldBorders=read_sf(mapLink, layer='border')

library(ggplot2)
library(sf)
library(dplyr)

# Assuming 'countriesCIA' is the dataframe containing the relevant data

# Filter datasets based on conditions
best_obesity <- countriesCIA %>% filter(obesityAdults_rate == 0)
best_alcohol <- countriesCIA %>% filter(alcohol_levels == "1.very low")
best_tobacco <- countriesCIA %>% filter(tobacco_levels == "1.very low")

# Merge the filtered datasets
best_countries <- best_obesity %>%
  inner_join(best_alcohol, by = "COUNTRY") %>%
  inner_join(best_tobacco, by = "COUNTRY")

# Print selected columns
print(countriesCIA %>% select(COUNTRY, obesityAdults_rate, alcohol_levels, tobacco_levels) %>% head())
