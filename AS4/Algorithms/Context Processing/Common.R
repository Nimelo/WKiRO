source(paste0(getwd(), "/IO/Bitmap.R"))
source(paste0(getwd(), "/Algorithms/Common/Common.R"))


bitmapMatrix <- function(bitmap, mat) {
	dyn.load(paste0(getwd(), "C/Main.so"))

	r <- bitmap$pixelMatrix$r
	g <- bitmap$pixelMatrix$g
	b <- bitmap$pixelMatrix$b

	bitmap$pixelMatrix$r <<- matrix(.C("bitmapMatrix", vRows = as.integer(nrow(r)), vCols = as.integer(ncol(r)), vector = as.integer(r), maskRows = as.integer(nrow(mat)), maskCols = as.integer(ncol(mat)), mask = as.integer(mat))$vector, bitmap$getHeight(), bitmap$getWidth(), TRUE)
	bitmap$pixelMatrix$g <<- matrix(.C("bitmapMatrix", vRows = as.integer(nrow(g)), vCols = as.integer(ncol(g)), vector = as.integer(g), maskRows = as.integer(nrow(mat)), maskCols = as.integer(ncol(mat)), mask = as.integer(mat))$vector, bitmap$getHeight(), bitmap$getWidth(), TRUE)
	bitmap$pixelMatrix$b <<- matrix(.C("bitmapMatrix", vRows = as.integer(nrow(b)), vCols = as.integer(ncol(b)), vector = as.integer(b), maskRows = as.integer(nrow(mat)), maskCols = as.integer(ncol(mat)), mask = as.integer(mat))$vector, bitmap$getHeight(), bitmap$getWidth(), TRUE)
}