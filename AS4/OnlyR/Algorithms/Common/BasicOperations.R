source(paste0(getwd(), "/OnlyR/Algorithms/Common/Common.R"))
source(paste0(getwd(), "/OnlyR/Algorithms/Common/Arithmetic.R"))

# Basic negative filter for img
imgNegative <- function(img) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixNegative(img[,, 1])
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixNegative(img[,, 2])
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixNegative(img[,, 3])
    }

    return(img)
}

matrixNegative <- function(mat) {
    mat <- 1 - mat
    return(mat)
}

# Basic greyscale filter for img
imgGreyScale <- function(img, r = 0.21, g = 0.71, b = 0.08) {
    img <- imgMultiply(img, r, g, b)

    if (isInDimensionRange(img, 1) && isInDimensionRange(img, 2) && isInDimensionRange(img, 3)) {
        greyScale <- fixRange(img[,, 1] + img[,, 2] + img[,, 3])
        img[,, 1] <- greyScale
        img[,, 2] <- greyScale
        img[,, 3] <- greyScale
    }

    return(img)
}

# Pixels normalization

imgPixelNormalization <- function(img) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixPixelNormalize(img[,, 1])
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixPixelNormalize(img[,, 2])
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixPixelNormalize(img[,, 3])
    }


    return(img) 
}

matrixPixelNormalize <- function(mat) {
    min <- min(mat)
    max <- max(mat)

    mat <- apply(mat, 1:2, function(value)(value - min) / (max - min))

    return(mat)
}

# Gamma correction

imgGammaCorrection <- function(img, gamma) {

    img <- imgPower(img, r = 1 / gamma, g = 1 / gamma, b = 1 / gamma)
    return(img)
}



