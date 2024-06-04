#include "base.h"

void zeraMatriz(uint8_t** matriz){
	for (int i = 0; i < size; i++){
		for (int j = 0; j < size; j++){
			matriz[i][j] = 0;
		}
	}
}

int main(){
	uint8_t** A = initMatriz();
	zeraMatriz(A);
	limpaMatriz(A);
	return 0;
}
