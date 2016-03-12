this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#install.packages("bmp")
#install.packages("pixmap")
#install.packages("readbitmap")

library("bmp")
library("pixmap")
library("readbitmap")


#is.bmp("16rgb4x1.bmp")
r <- read.bmp(paste0(getwd(), "/Files/Input/24bit15_255_6.bmp"), Verbose = TRUE)

pr <- pixmapRGB(r)

red = pr@red
green = pr@green
blue = pr@blue

a <- 1:120
b <- a[seq(1, length(a), 6)]
c <- a[seq(2, length(a), 6)]