mult <- function(x, y) {
    x * y
}

readFile <- function(name) {
    if (file.exists(name)) {
        finfo = file.info(name)
        toread = file(name, "rb")

        fileHeader <- BitmapFileHeader$new()
        fileHeader$load(toread)
        fileHeader$printLn()

        infoHeader <- BitmapInfoHeader$new()
        infoHeader$load(toread)
        infoHeader$printLn()

        if (infoHeader$bitCount <= 8) {
            print(infoHeader$calculatePixelArraySize())
        }

        pixel <- Pixel$new()
        pixel$load(toread)
        pixel$printLn()

        #return(readBin(toread, integer(), size = 1, finfo$size, endian = "little"))
    }
}

#BitmapFileHeader
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
        printLn = function() {
    print("BitmapFileHeader")
    printWithInfo("Type: ", type)
    printWithInfo("Size: ", size)
    printWithInfo("Rsv1: ", rsv1)
    printWithInfo("Rsv2: ", rsv2)
    printWithInfo("OffsetBits: ", offsetBits)
}))


#class BitmapInfoHeader
BitmapInfoHeader <- setRefClass("BitmapInfoHeader",
    fields = list(size = "integer", width = "integer", height = "integer", planes = "integer",
                    bitCount = "integer", compression = "integer", sizeImage = "integer",
                    xPelsPermeter = "integer", yPelsPermeter = "integer",
                    colorsUsed = "integer", colorsImportant = "integer"),
    methods = list(
        load = function(toread) {
    size <<- read4BytesInteger(toread)
    width <<- read4BytesInteger(toread)
    height <<- read4BytesInteger(toread)
    planes <<- read2BytesInteger(toread)
    bitCount <<- read2BytesInteger(toread)
    compression <<- read4BytesInteger(toread)
    sizeImage <<- read4BytesInteger(toread)
    xPelsPermeter <<- read4BytesInteger(toread)
    yPelsPermeter <<- read4BytesInteger(toread)
    colorsUsed <<- read4BytesInteger(toread)
    colorsImportant <<- read4BytesInteger(toread)
},
        calculateRowSize = function() {
            return(floor((bitCount * width + 31) / 32) * 4)
},
        calculatePixelArraySize = function() {
            return(calculateRowSize() * abs(height))
        },
        printLn = function() {
    print("BitmapInfoHeader")
    printWithInfo("Size: ", size)
    printWithInfo("Width: ", width)
    printWithInfo("Height: ", height)
    printWithInfo("BitCount: ", bitCount)
    printWithInfo("Compression: ", compression)
    printWithInfo("SizeImage: ", sizeImage)
    printWithInfo("XPelspermeter: ", xPelsPermeter)
    printWithInfo("YPelsPerMeter: ", yPelsPermeter)
    printWithInfo("Colorsused: ", colorsUsed)
    printWithInfo("ColorsImportant: ", colorsImportant)
}))

printWithInfo = function(info, value) {
    print(paste(info, value))
}

read4BytesInteger = function(toread) {
    return(readBin(toread, integer(), size = 4, 1, endian = "little"))
}

read2BytesInteger = function(toread) {
    return(readBin(toread, integer(), size = 2, 1, endian = "little", signed = FALSE))
}


#class Win3ColorTable
Win3ColorTable <- setRefClass("Win3ColorTable",
    fields = list(b = "integer", g = "integer", r = "integer", rsv = "integer"),
    methods = list(
        load = function(toread) {
    r <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    g <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    b <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    rsv <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
},
        printLn = function() {
    print("Win3ColorTable")
    print(b)
    print(g)
    print(r)
    print(rsv)
}))

#rgb
Pixel <- setRefClass("Pixel",
    fields = list(b = "integer", g = "integer", r = "integer"),
    methods = list(
        load = function(toread) {
    r <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    g <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    b <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
},
        printLn = function() {
    print("Pixel")
    print(r)
    print(g)
    print(b)
}))


this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#source("ReadWrite.R")

#print(mult(4, 2))
readFile("16rgb4x1.bmp")
print('')
#readFile("Untitled.bmp")
print('')
#readFile("24bitYELLOW.bmp")
print('')
#readFile("24bit15_255_6.bmp")