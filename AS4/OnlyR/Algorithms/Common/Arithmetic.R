source(paste0(getwd(), "/Common/Common.R"))

# Adds specific value to channel R,G,B and then rounds between 0..1
imgAdd <- function(img, r = 0, g = 0, b = 0) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixAdd(img[,, 1], r)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixAdd(img[,, 2], g)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixAdd(img[,, 3], b)
    }
        return(img)
}

# Adds specific value to elements in matrix. Then rounds between 0..1
matrixAdd <- function(mat, value) {
    mat <- mat + value;
    return(fixRange(mat))
}

# Subtracts specific value from channel R,G,B and then rounds between 0..1
imgSubtract <- function(img, r = 0, g = 0, b = 0) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixSub(img[,, 1], r)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixSub(img[,, 2], g)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixSub(img[,, 3], b)
    }
    return(img)
}

# Subtracts specific value from elements in matrix. Then rounds between 0..1
matrixSub <- function(mat, value) {
    mat <- mat - value;
    return(fixRange(mat))
}

# Multiplies channel R,G,B by specific value. then rounds between 0..1
imgMultiply <- function(img, r = 1, g = 1, b = 1) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixMultiply(img[,, 1], r)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixMultiply(img[,, 2], g)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixMultiply(img[,, 3], b)
    }
    return(img)
}

# Multiplies elements in matrix by specific values. Then rounds between 0..1
matrixMultiply <- function(mat, value) {
    mat <- mat * value;
    return(fixRange(mat))
}

# Divides channel R,G,B by specific value. then rounds between 0..1
imgDivide <- function(img, r = 1, g = 1, b = 1) {

    if (r == 0 || g == 0 || b == 0) {
        warning("Cannot divide by 0")
    }

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixDivide(img[,, 1], r)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixDivide(img[,, 2], g)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixDivide(img[,, 3], b)
    }
    return(img)
}

# Divides elements in matrix by specific values. Then rounds between 0..1
matrixDivide <- function(mat, value) {
    mat <- mat / value;
    return(fixRange(mat))
}

# Powers channel R,G,B by specific value. then rounds between 0..1
imgPower<- function(img, r = 1, g = 1, b = 1) {

    if (r == 0 || g == 0 || b == 0) {
        warning("Cannot divide by 0")
    }

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixPower(img[,, 1], r)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixPower(img[,, 2], g)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixPower(img[,, 3], b)
    }
    return(img)
}

# Powers elements in matrix by specific values. Then rounds between 0..1
matrixPower <- function(mat, value) {
    mat <- mat ^ value;
    return(fixRange(mat))
}