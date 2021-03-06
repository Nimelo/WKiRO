# Dependencies
source(paste0(getwd(), "/Common/Common.R"))

# BitmapFileHeader
BitmapFileHeader <- setRefClass("BitmapFileHeader",
	fields = list(type = "character", size = "integer", rsv1 = "integer", rsv2 = "integer", offsetBits = "integer"),
	methods = list(
		load = function(toread) {
			type <<- readChar(toread, 2, useBytes = TRUE)
			size <<- read4BytesInteger(toread)
			rsv1 <<- read2BytesInteger(toread)
			rsv2 <<- read2BytesInteger(toread)
			offsetBits <<- read4BytesInteger(toread)
		}, 
		write = function(conn) {
			writeBin(strtoi(charToRaw(type), 16L), conn, size = 1, endian = "little")
			writeBin(size, conn)
			writeBin(rsv1, conn, size = 2)
			writeBin(rsv2, conn, size = 2)
			writeBin(offsetBits, conn)
		},
		printLn = function() {
			print("BitmapFileHeader")
			printWithInfo("Type: ", type)
			printWithInfo("Size: ", size)
			printWithInfo("Rsv1: ", rsv1)
			printWithInfo("Rsv2: ", rsv2)
			printWithInfo("OffsetBits: ", offsetBits)
		}
	)
)