# dependencies
source(paste0(getwd(), "/IO/Bitmap.R"))

ctxLessAlgorithmsPath = "./Algorithms/Contextless Processing/"

for (f in list.files(path = ctxLessAlgorithmsPath, pattern = "*.R")) {
	source(paste0(ctxLessAlgorithmsPath, f))
}

filePath <- paste0(getwd(), "/Files/Input/wall.bmp")
savePath <- paste0(getwd(), "/Files/Output/wall.bmp")
bitmap <- Bitmap$new()
x <- bitmap$readBitmap(filePath)

#bitmap$pixelMatrix$b[1, 1] = 2
#print(bitmap$pixelMatrix$b[1,1])

#bitmap$printMe()


#greyScale(bitmap, 0.3, 0.6, 0.1)
#negative(bitmap)
sobel0 = matrix(c(-1, 0, 1, -2, 0, 2, -1, 0, 1), 3, 3, TRUE)
sobel90 = matrix(c(1,2,1,0,0,0,-1,-2,-1),3,3,TRUE)

bitmapMatrix(bitmap, sobel90)
bitmap$saveBitmap(savePath)

#Helpfull windows compare function
#fc Input\24bit15_255_6.bmp Output\24bit15_255_6.bmp /B