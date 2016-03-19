
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int** getMatrixFromVector(int* vRows, int* vCols, int* vector);
void deleteMatrix(int* rows, int** matrix);
void bitmapMatrix(int* vRows, int* vCols, int* vector, int* maskRows, int* maskCols, int* mask);
void transformMatrixToVector(int* mRows, int* mCols, int** matrix, int* vector);
int calculateCoefficientMatrix(int* vRows, int* vCols, int** matrix, int* maskRows, int* maskCols, int** mask, int x, int y);
int isInRange(int x, int max);

int main(char* args[], int argc) {
	
	int vector[] = { 1,2,3,4,5,6,7,8,9};
	int mask[] = { 1,1,1,1,1,1,1,1,1 };

	int xy = 3;
	int one = 3;

	bitmapMatrix(&xy, &xy, vector, &one, &one, mask);

}

void bitmapMatrix(int* vRows, int* vCols, int* vector, int* maskRows, int* maskCols, int* mask) {

	int** matrix = getMatrixFromVector(vRows, vCols, vector);
	int** maskMatrix = getMatrixFromVector(maskRows, maskCols, mask);

	for (int i = 0; i < *vRows; i++) {
		for (int j = 0; j < *vCols; j++) {
			matrix[i][j] = calculateCoefficientMatrix(vRows, vCols, matrix, maskRows, maskCols, maskMatrix, i, j);
		}
	}

	transformMatrixToVector(vRows, vCols, matrix, vector);
	deleteMatrix(vRows, matrix);
	deleteMatrix(maskRows, maskMatrix);
}

int calculateCoefficientMatrix(int* vRows, int* vCols, int** matrix, int* maskRows, int* maskCols, int** mask, int x, int y) {
	int coefficientSum = 0;
	int value = 0;

	int xOffset = (*maskRows - 1) / 2;
	int yOffset = (*maskCols - 1) / 2;

	int xRealOffset = xOffset - x;
	int yRealOffset = yOffset - y;

	for (int i = (x - xOffset); i <= (x + xOffset); i++) {
		for (int j = (y - yOffset); j <= (y + yOffset); j++) {
			if (isInRange(i, *vRows) && isInRange(j, *vCols)) {
				int coefficient = mask[i + xRealOffset][j + yRealOffset];
				coefficientSum += coefficient;
				value += matrix[i][j] * coefficient;
			}
		}
	}

	return  (int)round(value / (coefficientSum == 0 ? 1 : coefficientSum));
}

int isInRange(int x, int max) {
	if (x >= 0 && x < max) {
		return 1;
	}

	return 0;
}

void transformMatrixToVector(int* mRows, int* mCols, int** matrix, int* vector) {
	for (int j = 0; j < *mRows; j++) {
		for (int i = 0; i < *mCols; i++) {
			*vector++ = matrix[j][i];
		}
	}

}

int** getMatrixFromVector(int* vRows, int* vCols, int* vector) {
	int** matrix = NULL;

	matrix = malloc(*vRows * sizeof(int*));

	for (int i = 0; i < *vRows; i++) {
		matrix[i] = malloc(*vCols * sizeof(int));
	}


	for (int j = 0; j < *vRows; j++) {
		for (int i = 0; i < *vCols; i++) {
			matrix[j][i] = *vector++;
		}
	}

	return matrix;
}

void deleteMatrix(int* rows, int** matrix) {
	for (int i = 0; i < *rows; i++) {
		free(matrix[i]);
	}

	free(matrix);
}