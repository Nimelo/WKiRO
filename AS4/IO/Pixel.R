# class Pixel
Pixel <- setRefClass("Pixel",
    fields = list(b = "integer", g = "integer", r = "integer", rsv = "integer"),
    methods = list(
        load = function(toread) {
    r <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    g <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    b <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
    rsv <<- readBin(toread, integer(), size = 1, 1, endian = "little", signed = FALSE)
},
        printLn = function() {
    print("Pixel")
    print(b)
    print(g)
    print(r)
    print(rsv)
}))