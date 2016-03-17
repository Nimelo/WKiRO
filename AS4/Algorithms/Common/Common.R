
getFromRangeOrDefault <- function(value, min = 0, max = 255){
	if(value < min){
		return(as.integer(0)) 
	}else if(value > max){
		return(as.integer(255))
	}else{
		return(as.integer(value))
	}	
}

addToPixel <- function(value, coefficient) {
	return(as.integer(getFromRangeOrDefault(value = value + coefficient)))
}

subtractFromPixel <- function(value, coefficient) {
	return(as.integer(getFromRangeOrDefault(value = value - coefficient)))
}

multiplyPixel <- function(value, coefficient) {
	return(as.integer(getFromRangeOrDefault(value = value * coefficient)))
}

dividePixel <- function(value, coefficient) {
	return(as.integer(getFromRangeOrDefault(value = value / coefficient)))
}

powerPixel <- function(value, coefficient) {
	return(as.integer(getFromRangeOrDefault(value = value ^ coefficient)))
}

calculateCoefficientMatrix <- function(origMatrix, coefficientMatrix, x, y){
	coeMSum = 0
	value = 0
	matrixHeight = nrow(origMatrix$r)
	matrixWidth = ncol(origMatrix$r)

	xOffset = (nrow(coefficientMatrix) - 1) / 2
	yOffset = (ncol(coefficientMatrix) - 1) / 2

	xRealOffset = xOffset + 1 - x
	yRealOffset = yOffset + 1 - y

	r = 0
	g = 0
	b = 0
	for(i in (x - xOffset) : (x + xOffset)){
		for(j in (y - yOffset) : (y + yOffset)){		
			if (isInRange(i, max = matrixHeight) && isInRange(j, max = matrixWidth)) {
				coof = coefficientMatrix[i + xRealOffset, j + yRealOffset]
				coeMSum = coeMSum + coof
				r = r + origMatrix$r[i, j] * coof
				g = g + origMatrix$g[i, j] * coof
				b = b + origMatrix$b[i, j] * coof
			}
		}
	}
	
	if (coeMSum == 0) {
		coeMSum = 1
	}

	return(c(getFromRangeOrDefault(as.integer(round(r / coeMSum))), getFromRangeOrDefault(as.integer(round(g / coeMSum))), getFromRangeOrDefault(as.integer(round(b / coeMSum)))))
}

isInRange <- function(x, min = 1, max = 100){
	if(x >= min && x <= max){
		return(TRUE)
	}

	return(FALSE)
}