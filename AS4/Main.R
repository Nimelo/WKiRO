this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

source("ReadWrite.R")

#print(mult(4, 2))

readFile("Untitled.bmp")

#print(readFile("1.txt"))


