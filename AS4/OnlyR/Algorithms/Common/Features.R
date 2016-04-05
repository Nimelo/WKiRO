
library("mmand")
library("png")

histogram <- function(img, rgb = TRUE) {
    if (rgb == TRUE) {
        plot(0:255, histPlot(img[,, 1]), col = "red", type = "s")
        points(0:255, histPlot(img[,, 2]), col = "green", type = "s")
        points(0:255, histPlot(img[,, 3]), col = "blue", type = "s")
    } else {
        plot(0:255, histPlot(img[,, 1]), col = "grey", type = "s")
    }
}

histPlot <- function(mat) {
    tmpArray <- vector('numeric', 256)

    for (i in mat) {
        indexOfColour <- get255(i) + 1
        tmpArray[indexOfColour] = tmpArray[indexOfColour] + 1
    }

    return(tmpArray)
}

get255 <- function(value) {
    return(round(255 * value))
}