# Dependencies
source(paste0(getwd(), "/Common/Common.R"))

# class PixelArray
PixelArray <- setRefClass("PixelArray",
	fields = list(b = "matrix", g = "matrix", r = "matrix"),
	methods = list(
		set = function(v, width, height) {
			r <<- matrix(v[seq(1, length(v), 3)], nrow = height, ncol = width)
			g <<- matrix(v[seq(2, length(v), 3)], nrow = height, ncol = width)
			b <<- matrix(v[seq(3, length(v), 3)], nrow = height, ncol = width)
		},
		write = function(conn) {
			for (i in 1:nrow(r)) {
				for (j in 1:ncol(r)) {
					writeBin(r[i, j], conn, size = 1)
					writeBin(g[i, j], conn, size = 1)
					writeBin(b[i, j], conn, size = 1)
				}
			}
		},
		printLn = function() {
			print("Pixel")
			printWithInfo("R: ", r)
			printWithInfo("G: ", g)
			printWithInfo("B: ", b)
		}
	)
)