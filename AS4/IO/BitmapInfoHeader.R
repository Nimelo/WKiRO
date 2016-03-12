# Dependencies
source(paste0(getwd(), "/Common/Common.R"))

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