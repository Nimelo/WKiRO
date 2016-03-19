source(paste0(getwd(), "/IO/Bitmap.R"))
source(paste0(getwd(), "/Algorithms/Common/Common.R"))

bitmapAdd <- function(bitmap, coR = 0, coG = 0, coB = 0){
	bitmap$pixelMatrix$r = apply(bitmap$pixelMatrix$r, c(1, 2), addToPixel, coefficient = coR)
	bitmap$pixelMatrix$g = apply(bitmap$pixelMatrix$g, c(1, 2), addToPixel, coefficient = coG)
	bitmap$pixelMatrix$b = apply(bitmap$pixelMatrix$b, c(1, 2), addToPixel, coefficient = coB)
}

bitmapSubtract <- function(bitmap, coR = 0, coG = 0, coB = 0) {
	bitmap$pixelMatrix$r = apply(bitmap$pixelMatrix$r, c(1, 2), subtractFromPixel, coefficient = coR)
	bitmap$pixelMatrix$g = apply(bitmap$pixelMatrix$g, c(1, 2), subtractFromPixel, coefficient = coG)
	bitmap$pixelMatrix$b = apply(bitmap$pixelMatrix$b, c(1, 2), subtractFromPixel, coefficient = coB)
}

bitmapMultiply <- function(bitmap, coR = 1, coG = 1, coB = 1) {
	bitmap$pixelMatrix$r = apply(bitmap$pixelMatrix$r, c(1, 2), multiplyPixel, coefficient = coR)
	bitmap$pixelMatrix$g = apply(bitmap$pixelMatrix$g, c(1, 2), multiplyPixel, coefficient = coG)
	bitmap$pixelMatrix$b = apply(bitmap$pixelMatrix$b, c(1, 2), multiplyPixel, coefficient = coB)
}

bitmapDivide <- function(bitmap, coR = 1, coG = 1, coB = 1) {
	bitmap$pixelMatrix$r = apply(bitmap$pixelMatrix$r, c(1, 2), dividePixel, coefficient = coR)
	bitmap$pixelMatrix$g = apply(bitmap$pixelMatrix$g, c(1, 2), dividePixel, coefficient = coG)
	bitmap$pixelMatrix$b = apply(bitmap$pixelMatrix$b, c(1, 2), dividePixel, coefficient = coB)
}

bitmapPower <- function(bitmap, gamma) {
	bitmap$pixelMatrix$r = apply(bitmap$pixelMatrix$r, c(1, 2), powerPixel, coefficient = gamma)
	bitmap$pixelMatrix$g = apply(bitmap$pixelMatrix$g, c(1, 2), powerPixel, coefficient = gamma)
	bitmap$pixelMatrix$b = apply(bitmap$pixelMatrix$b, c(1, 2), powerPixel, coefficient = gamma)
}

bitmapMatrix <- function(bitmap, mat){
	dyn.load(paste0(getwd(), "C/Main.dll"))

	r <- bitmap$pixelMatrix$r
	g <- bitmap$pixelMatrix$g
	b <- bitmap$pixelMatrix$b

	bitmap$pixelMatrix$r <<- matrix(.C("bitmapMatrix", vRows = as.integer(nrow(r)), vCols = as.integer(ncol(r)), vector = as.integer(r), maskRows = as.integer(nrow(mat)), maskCols = as.integer(ncol(mat)), mask = as.integer(mat))$vector, bitmap$getHeight(), bitmap$getWidth(), TRUE)
	bitmap$pixelMatrix$g <<- matrix(.C("bitmapMatrix", vRows = as.integer(nrow(g)), vCols = as.integer(ncol(g)), vector = as.integer(g), maskRows = as.integer(nrow(mat)), maskCols = as.integer(ncol(mat)), mask = as.integer(mat))$vector, bitmap$getHeight(), bitmap$getWidth(), TRUE)
	bitmap$pixelMatrix$b <<- matrix(.C("bitmapMatrix", vRows = as.integer(nrow(b)), vCols = as.integer(ncol(b)), vector = as.integer(b), maskRows = as.integer(nrow(mat)), maskCols = as.integer(ncol(mat)), mask = as.integer(mat))$vector, bitmap$getHeight(), bitmap$getWidth(), TRUE)
}