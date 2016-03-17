source(paste0(getwd(), "/IO/Bitmap.R"))
source(paste0(getwd(), "/Common/Common.R"))
source(paste0(getwd(), "/Algorithms/Common/Common.R"))

greyScale = function(bitmap, coR, coG, coB) {

	bitmap$pixelMatrix$r = apply(bitmap$pixelMatrix$r, c(1, 2), multiplyByCoefficient, coefficient = coR)
	bitmap$pixelMatrix$g = apply(bitmap$pixelMatrix$g, c(1, 2), multiplyByCoefficient, coefficient = coG)
	bitmap$pixelMatrix$b = apply(bitmap$pixelMatrix$b, c(1, 2), multiplyByCoefficient, coefficient = coB)

	greyMatrix <- bitmap$pixelMatrix$r + bitmap$pixelMatrix$g + bitmap$pixelMatrix$b

	bitmap$pixelMatrix$r = greyMatrix
	bitmap$pixelMatrix$g = greyMatrix
	bitmap$pixelMatrix$b = greyMatrix
}

multiplyByCoefficient <- function(value, coefficient) {
	tmpValue <- getFromRangeOrDefault(value = as.integer(round(value * coefficient)))
}