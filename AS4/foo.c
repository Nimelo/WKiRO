void foo(int *nin, double *x)
{
	int n = nin[0];

	int i;

	for (i = 0; i<n; i++)
		x[i] = x[i] * x[i];
}

void addOneToVector(int* n, double* vector) {
	for (int i = 0; i < *n; ++i)
		vector[i] += 1.0;
}

void addOneToMatrix(int* rows, int* cols, int* vector) {

	int matrix[*rows][*cols];
	int* b = vector;
	for (int j = 0; j < *rows; j++) {
		for (int i = 0; i < *cols; i++) {
			matrix[j][i] = *vector;
			vector++;
		}
	}

	for (int j = *rows - 1; j >= 0 ; j--) {
		for (int i = *cols - 1; i >= 0 ; i--) {
			*b = matrix[j][i];
			b++;
		}
	}
}