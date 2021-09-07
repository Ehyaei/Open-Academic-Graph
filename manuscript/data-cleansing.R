##%######################################################%##
#                                                          #
####                   Data Cleansing                   ####
#                                                          #
##%######################################################%##

# Load Libraries

library(readr)
library(stringr)
library(dplyr)

# extract values from json

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
rl = readLines("raw-data/affiliations/mag_affiliations.txt")
cs = read_csv("raw-data/affiliations/mag_affiliations.txt")

affiliation <- readMagFiles(path = "raw-data/affiliations/mag_affiliations.txt")  
# mutate(Latitude = as.numeric(Latitude), Longitude = as.numeric(Longitude))

affiliation %>% filter(Latitude==0)
write_rds(affiliation,"data/affiliation.rds")

## Venue
venue <- readMagFiles("raw-data/venue/mag_venues.txt")




