
getFromRangeOrDefault <- function(value, min = 0, max = 255){
	if(value < min){
		return(as.integer(0)) 
	}else if(value > max){
		return(as.integer(255))
	}else{
		return(value)
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

calculateCoefficientMatrix <- function(origMatrix, coefficientMatrix, x, y){
	coeMSum = 0
	value = 0
	matrixHeight = nrow(origMatrix)
	matrixWidth = ncol(origMatrix)

	xOffset = (nrow(coefficientMatrix) - 1) / 2
	yOffset = (ncol(coefficientMatrix) - 1) / 2

	for(i in (x - xOffset) : (x + xOffset)){
		for(j in (y - yOffset) : (y + yOffset)){		
			if (isInRange(i, max = matrixHeight) && isInRange(j, max = matrixWidth)) {
				coeMSum = coeMSum + coefficientMatrix[i - x + xOffset + 1, j - y + yOffset + 1]
				value = value + origMatrix[i, j] * coefficientMatrix[i - x + xOffset + 1, j - y + yOffset + 1]
			}
		}
	}
	return(getFromRangeOrDefault(as.integer(round(value / coeMSum))))
}

isInRange <- function(x, min = 1, max = 100){
	if(x >= min && x <= max){
		return(TRUE)
	}

	return(FALSE)
}