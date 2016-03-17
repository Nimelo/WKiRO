# Bitmap
source(paste0(getwd(), "/IO/BitmapInfoHeader.R"))
source(paste0(getwd(), "/IO/BitmapFileHeader.R"))
source(paste0(getwd(), "/IO/PixelArray.R"))

Bitmap <- setRefClass("Bitmap",
fields = list(infoHeader = "BitmapInfoHeader", fileHeader = "BitmapFileHeader", pixelMatrix = "PixelArray"),
methods = list(
	readBitmap = function(filePath) {
		if (file.exists(filePath)) {
			finfo = file.info(filePath)
			toread = file(filePath, "rb")
		
			fileHeader <<- BitmapFileHeader$new()
			fileHeader$load(toread)
		
			infoHeader <<- BitmapInfoHeader$new()
			infoHeader$load(toread)

			chunk = fileHeader$size - fileHeader$offsetBits;

			if (infoHeader$bitCount <= 8) {
				stop("Cannot open file.")
			}

			rawPixels = readBin(toread, integer(), size = 1, n = chunk, endian = "little", signed = FALSE);
			pixelMatrix <<- PixelArray$new()
		
			pixelMatrix$set(rawPixels, infoHeader$width, infoHeader$height)

			close(toread)
		} else {
			stop("File not exist")
		}
	},
	saveBitmap = function(filePath) {
		fileConn <- file(filePath, open = "wb", raw = TRUE)

		fileHeader$write(fileConn)
		infoHeader$write(fileConn)
		pixelMatrix$write(fileConn)

		close(fileConn)
	},
	printMe = function() {
		infoHeader$printLn();
		fileHeader$printLn();
	},
	getWidth = function(){
		return(infoHeader$width)
	},
	getHeight = function(){
		return(infoHeader$height)
	}
))
