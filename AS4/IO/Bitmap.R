# Bitmap
source(paste0(getwd(), "/IO/BitmapInfoHeader.R"))
source(paste0(getwd(), "/IO/BitmapFileHeader.R"))

Bitmap <- setRefClass("Bitmap",
fields = list(infoHeader = "BitmapInfoHeader", fileHeader = "BitmapFileHeader", pixelMatrix = "matrix"),
methods = list(
	load = function(toread) {
	#  type <<- readChar(toread, 2, useBytes = TRUE)
	#  size <<- read4BytesInteger(toread)
	#  rsv1 <<- read2BytesInteger(toread)
	#  rsv2 <<- read2BytesInteger(toread)
	#  offsetBits <<- read4BytesInteger(toread)
},
	readBitmap = function(filePath) {
	if (file.exists(filePath)) {
		finfo = file.info(filePath)
		toread = file(filePath, "rb")

		fileHeader <<- BitmapFileHeader$new()
		fileHeader$load(toread)
		fileHeader$printLn()

		infoHeader <<- BitmapInfoHeader$new()
		infoHeader$load(toread)
		infoHeader$printLn()

		if (infoHeader$bitCount <= 8) {
			stop("Cannot open file.")
		}
	} else {
		stop("File not exist")
	}
},
saveBitmap = function(filePath) {

},
	print = function() {
	infoHeader$printLn();
	fileHeader$printLn();
}))


bitmap <- Bitmap$new()

filePath <- paste0(getwd(), "/Files/Input/24bitYELLOW.bmp")

bitmap$readBitmap(filePath)


bitmap$print()