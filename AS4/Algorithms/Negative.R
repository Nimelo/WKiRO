source(paste0(getwd(), "/IO/Bitmap.R"))

negative = function(bitmap) {
	bitmap$pixelMatrix$r = as.integer(255) - bitmap$pixelMatrix$r
	bitmap$pixelMatrix$g = as.integer(255) - bitmap$pixelMatrix$g
	bitmap$pixelMatrix$b = as.integer(255) - bitmap$pixelMatrix$b
}