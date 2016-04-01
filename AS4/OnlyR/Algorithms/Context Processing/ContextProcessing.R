library(mmand)

source(paste0(getwd(), "/OnlyR/Algorithms/Common/Common.R"))

# Averaging filter
imgAverage <- function(img, size = 3) {

    img <- meanFilter(img, matrix(1, size, size))

    if (isInDimensionRange(img, 4)) {
        img[,,4] = 1
    }

    return(img)
}

# Gaussian smooth filter
imgGaussian <- function(img, sigma = 1) {

    img <- gaussianSmooth(img, sigma)

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}


# Sobel horizontal filter
imgSobelHorizontal <- function(img, size = 3) {
    img <- sobelFilter(img, size, 1)

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}

# Sobel vertical filter
imgSobelVertical <- function(img, size = 3) {
    img <- sobelFilter(img, size, 2)

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}

# Sobel vertical and horizontal axises filter
imgSobel <- function(img, size = 3) {
    img <- sobelFilter(img, size, 0)

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}

# Median filter
imgMedian <- function(img, size = 3) {

    img <- meanFilter(img, matrix(1, size, size))

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}


# TODO Laplacian Filter
