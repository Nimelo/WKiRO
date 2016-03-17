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
	r <- bitmap$pixelMatrix$r
	g <- bitmap$pixelMatrix$g
	b <- bitmap$pixelMatrix$b

	for (i in 1:bitmap$getHeight()) {
		for(j in 1:bitmap$getWidth()){
			rgb = calculateCoefficientMatrix(bitmap$pixelMatrix, mat, i, j)
			r[i,j] = rgb[1]
			g[i,j] = rgb[2]
			b[i,j] = rgb[3]
		}
	}

	bitmap$pixelMatrix$r <<- r
	bitmap$pixelMatrix$g <<- g
	bitmap$pixelMatrix$b <<- b
}