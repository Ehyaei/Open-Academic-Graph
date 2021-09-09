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
