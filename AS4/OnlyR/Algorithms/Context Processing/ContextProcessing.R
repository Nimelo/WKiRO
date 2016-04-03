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
    img_t <- sobelFilter(img[,,1], axis = 0)

    img[,, 1] = img_t
    img[,, 2] = img_t
    img[,, 3] = img_t

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}

# Median filter
imgMedian <- function(img, size = 3) {

    img <- medianFilter(img, matrix(1, size, size))

    if (isInDimensionRange(img, 4)) {
        img[,, 4] = 1
    }

    return(img)
}

# Threshold from top
imgThresholdTop <- function(img, threshold) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixThresholdTop(img[,, 1], threshold)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixThresholdTop(img[,, 2], threshold)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixThresholdTop(img[,, 3], threshold)
    }

    return(img)
}

matrixThresholdTop <- function(mat, threshold) {
    mat <- replace(mat, mat > threshold, 1)
    return(mat)
}

# Threshold from bottom
imgThresholdBottom <- function(img, threshold) {

    channels <- dim(img)[3]

    if (isInDimensionRange(img, 1)) {
        img[,, 1] <- matrixThresholdBottom(img[,, 1], threshold)
    }

    if (isInDimensionRange(img, 2)) {
        img[,, 2] <- matrixThresholdBottom(img[,, 2], threshold)
    }

    if (isInDimensionRange(img, 3)) {
        img[,, 3] <- matrixThresholdBottom(img[,, 3], threshold)
    }

    return(img)
}

matrixThresholdBottom <- function(mat, threshold) {
    mat <- replace(mat, mat < threshold, 0)
    return(mat)
}

# Thresholds image from top, bottom or two sides with specific threshold.
imgThreshold <- function(img, threshold = c(0.5, 0.5), from = c("top", "bottom", "twoside")) {
    operation = from[1]

    if (operation == "top") {
        img <- imgThresholdTop(img, threshold[1])
    } else if (operation == "bottom") {
        img <- imgThresholdBottom(img, threshold[1])
    } else if (operation == "twoside") {
        img <- imgThresholdTop(img, threshold[1])
        img <- imgThresholdBottom(img, threshold[2])
    }

    return(img)
}

# Prewitt mask
imgPrewitt <- function(img, threshold = 0.08995) {

    img <- imgGreyScale(img)

    b = matrix(c(-1, -1, -1, 0, 0, 0, 1, 1, 1), 3, 3, byrow = TRUE) / 6
    c = matrix(c(-1, 0, 1, -1, 0, 1, -1, 0, 1), 3, 3, byrow = TRUE) / 6
    Gx = abs(conv2(img[,, 1], c))
    Gy = abs(conv2(img[,, 1], b))
    G = sqrt(Gx ^ 2 + Gy ^ 2)

    img[,, 1] = G
    img[,, 2] = G
    img[,,3] = G

    img <- imgThresholdBottom(img, threshold)
    return(img)
}

# Erodation
imgErode <- function(img, kernel = matrix(1, 3, 3), iter = 1) {

    for(i in 1:iter)
        img <- erode(img, kernel)
    return(img)
}

# Dilatation
imgDilate <- function(img, kernel = matrix(1, 3, 3), iter = 1) {

    for (i in 1:iter)
        img <- dilate(img, kernel)
    return(img)
}

# Opening
imgOpening <- function(img, kernel = matrix(1, 3, 3)) {

    img <- opening(img, kernel)
    return(img)
}

# Closening
imgClosing <- function(img, kernel = matrix(1, 3, 3)) {

    img <- closing(img, kernel)
    return(img)
}


# TODO Laplacian Filter
# TODO Detector Canny
# TODO Przekszta?cenia morfologiczne