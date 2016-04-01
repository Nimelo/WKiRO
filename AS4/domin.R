library(mmand)
library(png)

fan <- readPNG(paste0(getwd(), "/Files/Input/wall.png"))

fan2 = fan
for (i in 1:100) {
    fan2 <- meanFilter(fan2, matrix(1, 3, 3))
    fan2[,,4] = 1
}
    
   display(fan2) 