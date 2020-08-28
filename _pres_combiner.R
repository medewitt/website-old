library(grid)
library(png)

img1 <- rasterGrob(as.raster(png::readPNG(here::here("figs", "ncsu-covid.png"))))
img2 <- rasterGrob(as.raster(png::readPNG(here::here("figs", "newscovid.png"))))
img3 <- rasterGrob(as.raster(readPNG("figs/michael-lecture.png")))


ggplot2::ggsave("figs/media-combined.png",width=3.5, height=.7, 
                gridExtra::marrangeGrob(grobs = list(img1, img2, img3), 
                                        nrow=1, ncol=3,top=NULL))
