# dependencies
source(paste0(getwd(), "/IO/Bitmap.R"))

ctxLessAlgorithmsPath = "./Algorithms/Contextless Processing/"

for (f in list.files(path = ctxLessAlgorithmsPath, pattern = "*.R")) {
	source(paste0(ctxLessAlgorithmsPath, f))
}

filePath <- paste0(getwd(), "/Files/Input/spidey.bmp")
savePath <- paste0(getwd(), "/Files/Output/spidey.bmp")
bitmap <- Bitmap$new()
x <- bitmap$readBitmap(filePath)
#bitmap$printMe()

b <- bitmap$pixelMatrix$b
g <- bitmap$pixelMatrix$g
r <- bitmap$pixelMatrix$r

bitmapMultiply(bitmap, 0)
#greyScale(bitmap, 0.3, 0.6, 0.1)
#negative(bitmap)

bitmap$saveBitmap(savePath)





#Helpfull windows compare function
#fc Input\24bit15_255_6.bmp Output\24bit15_255_6.bmp /B