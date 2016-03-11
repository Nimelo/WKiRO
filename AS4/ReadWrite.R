
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
       # return(readBin(toread, integer(), size = 1, finfo$size, endian = "little"))
    }
}

#BitmapFileHeader
BitmapFileHeader <- setRefClass("BitmapFileHeader",
    fields = list(type = "character", size = "integer", rsv1 = "integer", rsv2 = "integer", offsetBits = "integer"),
    methods = list(
        load = function(toread) {     
            type <<- readChar(toread, 2, useBytes = TRUE)
            size <<- readBin(toread, integer(), size = 4, 1, endian = "little")
            rsv1 <<- readBin(toread, integer(), size = 2, 1, endian = "little", signed = FALSE)
            rsv2 <<- readBin(toread, integer(), size = 2, 1, endian = "little", signed = FALSE)
            offsetBits <<- readBin(toread, integer(), size = 4, 1, endian = "little")
},
        printLn = function() {
            print("BitmapFileHeader")
            printWithInfo("Type: ",type)
            printWithInfo("Size: ",size)
            printWithInfo("Rsv1: ",rsv1)
            printWithInfo("Rsv2: ",rsv2)
            printWithInfo("OffsetBits: ",offsetBits)
}))


#class BitmapInfoHeader
BitmapInfoHeader <- setRefClass("BitmapInfoHeader",
    fields = list(size = "integer", width = "integer", height = "integer", planes = "integer",
                    bitCount = "integer", compression = "integer", sizeImage = "integer",
                    xPelsPermeter = "integer", yPelsPermeter = "integer",
                    colorsUsed = "integer", colorsImportant = "integer"),
    methods = list(
        load = function(toread) {
    size <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    width <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    height <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    planes <<- readBin(toread, integer(), size = 2, 1, endian = "little", signed = FALSE)
    bitCount <<- readBin(toread, integer(), size = 2, 1, endian = "little", signed = FALSE)
    compression <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    sizeImage <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    xPelsPermeter <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    yPelsPermeter <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    colorsUsed <<- readBin(toread, integer(), size = 4, 1, endian = "little")
    colorsImportant <<- readBin(toread, integer(), size = 4, 1, endian = "little")
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

ColorTable <- setRefClass("ColorTable",
    fields = list(amount = "list"),
    methods = list(
        load = function(toread, size) {
        
},
        printLn = function() {
    print("ColorTable")

}))


this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#source("ReadWrite.R")

#print(mult(4, 2))

readFile("Untitled.bmp")
print('')
readFile("24bitYELLOW.bmp")