source(paste0(getwd(), "/IO/Bitmap.R"))
source(paste0(getwd(), "/Common/Common.R"))
source(paste0(getwd(), "/Algorithms/Common/Common.R"))


gammaCorrection <- function(bitmap, gammaR, gammaG, gammaB){
	lutR = prepareLUTMatrix(gammaR)
	lutG = prepareLUTMatrix(gammaG)
	lutB = prepareLUTMatrix(gammaB)

	bitmap$pixelMatrix$r <<- apply(bitmap$pixelMatrix$r, c(1, 2), getLUTValue, lutVector = lutR)
	bitmap$pixelMatrix$g <<- apply(bitmap$pixelMatrix$g, c(1, 2), getLUTValue, lutVector = lutG)
	bitmap$pixelMatrix$b <<- apply(bitmap$pixelMatrix$b, c(1, 2), getLUTValue, lutVector = lutB)
}

prepareLUTMatrix <- function(gamma){
	lut = vector(length = 0)

	for(i in 0:255){
		lut = append(lut, getFromRangeOrDefault(value = as.integer(round((255 * ((i / 255) ^ (1 / gamma)))))), i)
	}

	return(lut)
}

getLUTValue <- function(value, lutVector){
	return(as.integer(lutVector[value + 1]))
}