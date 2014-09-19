substrRight <- function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
}

require(sp)
library(rgeos)
require("rgdal") 
require("maptools")
require("ggplot2")
require("plyr")


oldwd <- getwd()
setwd("shapefiles/2002-2010")

theLayer <- list.files(pattern = ".shp")[substrRight(list.files(pattern = ".shp"), 4) == ".shp"]
theLayer <- gsub(".shp", "", theLayer)

akPrecincts = readOGR(dsn=".", layer= theLayer)
akPrecincts@data$id = rownames(akPrecincts@data)
##sometimes ID is lowercase sometimes it is upper case
akPrecincts.points = fortify(akPrecincts, region="id")
akPrecincts.df = join(akPrecincts.points, akPrecincts@data, by="id")
ggplot(akPrecincts.df) + 
    aes(long,lat, group = group, color = group) + geom_polygon() +
    geom_path(color="white") + coord_equal() + theme(legend.position="none")
