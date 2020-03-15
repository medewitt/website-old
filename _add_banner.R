# Purpose Put Images Where I want them

add_banner <- function(page_name, banner_name, text_col = "#FFFFFF"){
  in_about <- xfun::read_utf8(page_name)
  
  loc <- which(grepl('<div class="fluid-row" id="header">', in_about))
  
  in_about[loc+1] <- paste(in_about[loc+1], 
  glue::glue('<div id="[[banner_name]]"><br> <style type="text/css">h1 {color: [[text_col]];font-size = 42 px;} </style>', 
             .open = "[[", .close = "]]"), collapse = "\n")
  
  xfun::write_utf8(in_about, page_name)
}

# Index
add_banner("index.html", "graphs", text_col = "F000000")
# About Me
add_banner("about.html", "winston")

# Presentations
add_banner("presentations.html", "prez", text_col = "F000000")

library(grid)
library(png)
img1 <- rasterGrob(as.raster(readPNG("figs/approval.png")))
img2 <- rasterGrob(as.raster(readPNG("figs/ward-travel.png")))
img3 <- rasterGrob(as.raster(readPNG("figs/mrp.png")))

ggplot2::ggsave("figs/index-page.png",width=4, height=.7, 
       gridExtra::marrangeGrob(grobs = list(img2, img1, img3), nrow=1, ncol=3,top=NULL))

img4 <- rasterGrob(as.raster(readPNG("figs/michael-lecture.png")))
#img5 <- rasterGrob(as.raster(readPNG("figs/joss.png")))

ggplot2::ggsave("figs/michael-lecture-small.png",width=4, height=.75, 
                gridExtra::marrangeGrob(grobs = list(img4), nrow=1, ncol=1,top=NULL))


