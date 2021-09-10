options(scipen = 999)
options(knggitr.kable.NA = '')

##%######################################################%##
#                                                          #
####                    load library                    ####
#                                                          #
##%######################################################%##

library(MPIThemes)
library(ggplot2)
library(readr)
library(readxl)
library(dplyr)
library(gt)
library(kableExtra)

############################################################
#                                                          #
#                    Load General Data                     #
#                                                          #
############################################################
world = readr::read_rds("data/maps/world.rds")
germany = readr::read_rds("data/maps/gadm36_DEU_1_sf.rds")


############################################################
#                                                          #
#                        Set colors                        #
#                                                          #
############################################################
prettyRed = "#ef2f4aff"
continuous_color = c("#d3f2a3","#97e196","#6cc08b","#4c9b82","#217a79","#105965","#074050")

############################################################
#                                                          #
#                          Utils                           #
#                                                          #
############################################################

pretty_number <- function(x) {
  dplyr::case_when(
    x < 1e3 ~ as.character(x),
    x < 1e6 ~ paste0(as.character(x/1e3), "K"),
    x < 1e9 ~ paste0(as.character(x/1e6), "M"),
    x < 1e12 ~ paste0(as.character(x/1e6), "G"),
    x < 1e15 ~ paste0(as.character(x/1e6), "T"),
    x < 1e18 ~ paste0(as.character(x/1e6), "P"),
    TRUE ~ "Infinity..."
  )
}
############################################################
#                                                          #
#                        Map theme                         #
#                                                          #
############################################################

map_theme = function(){
  theme_void()+
    theme(
      legend.position="bottom",
      legend.direction="horizontal",
      legend.title=element_text(size=rel(.8),vjust = 1,face = "bold"),
      legend.margin=margin(grid::unit(0,"cm")),
      legend.text=element_text(size=rel(.7)),
      legend.key.height=grid::unit(0.25,"cm"),
      legend.key.width=grid::unit(1.5,"cm")
    )
}

bottom_legend = function(){
  theme(
    legend.position="bottom",
    legend.direction="horizontal",
    legend.title=element_text(size=rel(.8),vjust = 1,face = "bold"),
    legend.text=element_text(size=rel(.7)),
    legend.key.height=grid::unit(0.25,"cm"),
    legend.key.width=grid::unit(1.5,"cm"),
    legend.box.background = element_blank()
  )
}

