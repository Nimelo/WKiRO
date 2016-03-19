# dependencies
source(paste0(getwd(), "/IO/Bitmap.R"))

ctxLessAlgorithmsPath = "./Algorithms/Contextless Processing/"

for (f in list.files(path = ctxLessAlgorithmsPath, pattern = "*.R")) {
	source(paste0(ctxLessAlgorithmsPath, f))
}

filePath <- paste0(getwd(), "/Files/Input/spidey.bmp")
savePath <- paste0(getwd(), "/Files/Output/wall.bmp")
bitmap <- Bitmap$new()
x <- bitmap$readBitmap(filePath)


sobel0 = matrix(c(-1, 0, 1, -2, 0, 2, -1, 0, 1), 3, 3, TRUE)
sobel90 = matrix(c(1,2,1,0,0,0,-1,-2,-1),3,3, TRUE)
upFilter = matrix(c(-1,-1,-1,-1,9,-1,-1,-1,-1), 3, 3, TRUE)

mask = matrix(1, 3, 3)
bitmapMatrix(bitmap, mask)

bitmap$saveBitmap(savePath)

#Helpfull windows compare function
#fc Input\24bit15_255_6.bmp Output\24bit15_255_6.bmp /B

#How to compile Main.c
#R CMD SHLIB Main.c