# Prints text to output in format: info+value
printWithInfo = function(info, value) {
    print(paste(info, value))
}

# Reades 4 bytes from connection and returining integer. (Little endian format)
read4BytesInteger = function(toread) {
    return(readBin(toread, integer(), size = 4, 1, endian = "little"))
}

# Reades 2 bytes from conntection and returning integer. (Little endian, not signed format)
read2BytesInteger = function(toread) {
    return(readBin(toread, integer(), size = 2, 1, endian = "little", signed = FALSE))
}