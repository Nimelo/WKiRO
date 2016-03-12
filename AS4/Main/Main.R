# dependencies
source(paste0(getwd(), "/IO/Bitmap.R"))
source(paste0(getwd(), "/Algorithms/Negative.R"))
filePath <- paste0(getwd(), "/Files/Input/spidey.bmp")
savePath <- paste0(getwd(), "/Files/Output/spidey.bmp")
bitmap <- Bitmap$new()
x <- bitmap$readBitmap(filePath)
#bitmap$printMe()

b <- bitmap$pixelMatrix$b
g <- bitmap$pixelMatrix$g
r <- bitmap$pixelMatrix$r

negative(bitmap)

bitmap$saveBitmap(savePath)

#Helpfull windows compare function
#fc Input\24bit15_255_6.bmp Output\24bit15_255_6.bmp /B