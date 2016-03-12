this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#install.packages("bmp")
#install.packages("pixmap")
#install.packages("readbitmap")

library("bmp")
library("pixmap")
library("readbitmap")

iter <- 12
try(if (iter > 10) stop("too many iterations"))

simpleError("ERROR", call = TRUE)

is.bmp("16rgb4x1.bmp")
r <- read.bmp("16rgb4x1.bmp")
throw("Division by zero.")
pr <- pixmapRGB(r)

red = pr@red
green = pr@green
blue = pr@blue

macierz <- matrix(c(0, 1, 2, 3), nrow = 2, ncol = 2)
