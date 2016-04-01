# dependencies
source(paste0(getwd(), "/IO/Bitmap.R"))

ctxLessAlgorithmsPath = "./Algorithms/Contextless Processing/"
ctxAlgorithmsPath = "./Algorithms/Context Processing/"

for (f in list.files(path = ctxLessAlgorithmsPath, pattern = "*.R")) {
	source(paste0(ctxLessAlgorithmsPath, f))
}

for (f in list.files(path = ctxAlgorithmsPath, pattern = "*.R")) {
	source(paste0(ctxAlgorithmsPath, f))
}

filePath <- paste0(getwd(), "/Files/Input/domek.bmp")
savePath <- paste0(getwd(), "/Files/Output/wall3.bmp")
bitmap <- Bitmap$new()
x <- bitmap$readBitmap(filePath)


sobel0 = matrix(c(-1, 0, 1, -2, 0, 2, -1, 0, 1), 3, 3, TRUE)
sobel90 = matrix(c(1,2,1,0,0,0,-1,-2,-1),3,3, TRUE)
upFilter = matrix(c(-1,-1,-1,-1,9,-1,-1,-1,-1), 3, 3, TRUE)
xd = matrix(c(0, 1, 1, 2, 2, 2, 1, 1, 0, 1, 2, 4, 5, 5, 5, 4, 2, 1, 1, 4, 5, 3, 0, 3, 5, 4, 1, 2, 5, 3, -12, -24, -12, 3, 5, 2, 2, 5, 0, -24, -40, -24, 0, 5, 2, 2, 5, 3, -12, -24, -12, 3, 5, 2, 1, 4, 5, 3, 0, 3, 5, 4, 1, 1, 2, 4, 5, 5, 5, 4, 2, 1, 0, 1, 1, 2, 2, 2, 1, 1, 0), 9, 9, TRUE)
mask = matrix(1, 3, 3)

bitmapMatrix(bitmap, sobel0)

	#greyScale(bitmap, 0.5, 0.3, 0.2)
bitmap$saveBitmap(savePath)

#Helpfull windows compare function
#fc Input\24bit15_255_6.bmp Output\24bit15_255_6.bmp /B

#How to compile Main.c
#R CMD SHLIB Main.c