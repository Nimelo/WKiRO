source(paste0(getwd(), "/OnlyR/Algorithms/Common/Common.R"))

# Simply salt & pepper distortions.
imgSaltPepper <- function(img, salt = 200, pepper = 200) {
    saltX = runif(salt, 0, dim(img)[1])
    saltY = runif(salt, 0, dim(img)[2])

    pepperX = runif(pepper, 0, dim(img)[1])
    pepperY = runif(pepper, 0, dim(img)[2])

    if (isInDimensionRange(img, 1) && isInDimensionRange(img, 2) && isInDimensionRange(img, 3)) {
        for (i in 1:salt) {
            img[saltX[i], saltY[i], 1] = 1
            img[saltX[i], saltY[i], 2] = 1
            img[saltX[i], saltY[i], 3] = 1
        }
        for (i in 1:pepper) {
            img[pepperX[i], pepperY[i], 1] = 0
            img[pepperX[i], pepperY[i], 2] = 0
            img[pepperX[i], pepperY[i], 3] = 0
        }
    }

    return(img)
}