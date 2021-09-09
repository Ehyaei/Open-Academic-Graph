##%######################################################%##
#                                                          #
####                   Data Cleansing                   ####
#                                                          #
##%######################################################%##

# Load Libraries

library(readr)
library(stringr)
library(dplyr)
library(maps)


# extract values from json
# If anyone wants to read json data from R
# these functions can be find useful

valueFinder = function(x){
  stringr::str_sub(x, str_locate(x,": ")[,2]+1)
}

# find list of keys in json
nameFinder = function(path){
  readr::read_lines(path,n_max = 1) %>% 
    stringr::str_extract_all("\"\\w+\":") %>% 
    unlist() %>% 
    gsub("\"|:","",.)
}

# key-value reader

readMagFiles = function(path){
  readr::read_csv(path, col_names = F) %>% 
    mutate_all(~gsub("\"|\\{|\\}", "", .x))  %>% 
    mutate_all(valueFinder) %>% 
    rename_all(~nameFinder(path))
}


##%######################################################%##
#                                                          #
####                     Clean Data                     ####
#                                                          #
##%######################################################%##

# Affiliations

affiliation = read_csv("raw-data/spark/affiliation.csv/part-00000-ad7f2738-e5c6-4744-91b4-c58062714b86-c000.csv")

hist(affiliation$Latitude,100)
hist(affiliation$Longitude,100)

# the plot shows there are many location thats wrongly maps to 0
# we replace it by NA
affiliation = affiliation %>% 
  mutate(
    Latitude = ifelse(Latitude == 0, NA, Latitude),
    Longitude = ifelse(Longitude == 0, NA, Longitude)
         )

ind = which(!is.na(affiliation$Longitude) & !is.na(affiliation$Latitude))

affiliation$country = ""
affiliation$country[ind] <- map.where(database="world", 
                     affiliation$Longitude[ind], 
                     affiliation$Latitude[ind])


affiliation = affiliation %>% 
  mutate(country = ifelse(
    str_detect(country,":"),
    str_sub(country, 1, str_locate(country,":")[,1]-1),
    country
    )
  )
    
library(countrycode)
affiliation$iso3c = countrycode(affiliation$country, origin = 'country.name', destination = "iso3c")
write_rds(affiliation,"data/affiliation.rds")
affiliation %>% select(-NormalizedName,-WikiPage,-url) %>% 
  write_csv("data/affiliation.csv")


# venue
venue = read_csv("raw-data/spark/venue.csv/part-00000-06643dfd-2de6-4b57-928d-0f58236c4427-c000.csv")
write_rds(venue,"data/affiliation.rds")


############################################################
#                                                          #
#                        world Map                         #
#                                                          #
############################################################

library(maps)  
world = map_data("world")  
world = filter(world,region!="Antarctica")
world$iso3c = countrycode(world$region, origin = 'country.name', destination = "iso3c")
world$subregion = NULL
ggplot(world,aes(x=long,y=lat,group=group))+
  geom_polygon(color="white",fill = "lightblue")+
  theme_void()
write_rds(world,"data/world.rds")


