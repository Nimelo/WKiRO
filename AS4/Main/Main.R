# dependencies
source(paste0(getwd(), "/IO/Bitmap.R"))

filePath <- paste0(getwd(), "/Files/Input/24bit15_255_6.bmp")
savePath <- paste0(getwd(), "/Files/Output/24bit15_255_6.bmp")
bitmap <- Bitmap$new()
x <- bitmap$readBitmap(filePath)
#bitmap$printMe()

b <- bitmap$pixelMatrix$b
g <- bitmap$pixelMatrix$g
r <- bitmap$pixelMatrix$r

bitmap$saveBitmap(savePath)

#Helpfull windows compare function
#fc Input\24bit15_255_6.bmp Output\24bit15_255_6.bmp /B