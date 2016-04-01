# Keep between PNG image between 0..1 and alpha channel to 1

fixRanges <- function(input) {
    thirdDimension = dim(input)[3]

    if (is.na(thirdDimension)) {
        thirdDimension = 2
    } else {
        input[,, thirdDimension] <- 1
    }

    for (i in 1:(thirdDimension - 1)) {
        input[,, i] <- fixRange(input[,, i])
    }

    return(input)
}

# Keep matrix values between 0..1
fixRange <- function(input) {
    input <- apply(input, 1:2, fixValue)
    return(input)
}

# Fix value to range 0..1
fixValue <- function(value) {
    if (value < 0) {
        return(as.numeric(0))
    } else if (value > 1) {
        return(as.numeric(1))
    } else {
        return(value)
    }
}

# Checks wheter dimension exists in input
isInDimensionRange <- function(input, value) {
    dimension = dim(input)[3]
    if (value > dimension || value < 1) {
        return(FALSE)
    } else {
        return(TRUE)
    }

}

# Exuctes function if condition is true
executeIfTrue <- function(condition, FUN) {
    if (condition) {
        return(FUN());
    }
}

