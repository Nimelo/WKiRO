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

conv2 <- function(X, A) {
    X.pad <- matrix(0, ncol = NCOL(X) + NCOL(A) - 1, nrow = NROW(X) + NROW(A) - 1);
    X.pad[1:NROW(X), 1:NCOL(X)] <- X
    A.pad <- matrix(0, ncol = NCOL(X) + NCOL(A) - 1, nrow = NROW(X) + NROW(A) - 1);
    A.pad[1:NROW(A), 1:NCOL(A)] <- A

    X.fft <- fft(X.pad);
    A.fft <- fft(A.pad);
    M <- fft(X.fft * A.fft, inverse = TRUE) / length(X.fft)

    N.row <- (floor(NROW(A) / 2) + (1:NROW(X)))
    N.col <- (floor(NCOL(A) / 2) + (1:NCOL(X)))

    XC <- M[N.row, N.col]
    return(invisible(XC))
}